import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sqflite/sqflite.dart';

import 'menstrual_cycle_widget.dart';
import 'ui/model/body_temperature_data.dart';
import 'ui/model/meditation_data.dart';
import 'ui/model/sleep_data.dart';
import 'ui/model/symptoms_count.dart';
import 'ui/model/symptoms_pattern.dart';
import 'ui/model/user_symptoms_logs.dart';
import 'ui/model/water_data.dart';
import 'ui/model/weight_data.dart';
import 'widget_languages/languages.dart';

class MenstrualCycleWidget {
  // AES secret key  for data encryption
  static String _aesSecretKey = "";

  // AES Iv key for data encryption
  static String _aesIvKey = "";

  // Total cycle length of menstrual cycle
  static int _cycleLength = defaultCycleLength; // Default 28 days

  // Total period duration of menstrual cycle
  static int _periodDuration = defaultPeriodDuration; // Default 5 days

  // last period date
  String _lastPeriodDate = "";

  // font family
  static String defaultFontFamily = "";

  // all past periods date
  List<String> pastAllPeriodDays = [];

  // customer id for storing date
  String _customerId = "0"; // Default is Zero

  // current Date format
  DateFormats _currentDateFormat = DateFormats.dmy;

  // Current language
  static Languages currentLanguage = Languages.english;

  // instance of  MenstrualCycleWidget object
  static MenstrualCycleWidget? instance;

  // Return previous period day into string
  String getPreviousPeriodDay() => _lastPeriodDate;

  String getSecretKey() => _aesSecretKey;

  int getPeriodDuration() => _periodDuration;

  int getCycleLength() => _cycleLength;

  String getIvKey() => _aesIvKey;

  DateFormats getCurrentDateFormat() => _currentDateFormat;

  MenstrualCycleWidget._();

  /// Initialize MenstrualCycleWidget
  static MenstrualCycleWidget init({
    required String? secretKey,
    required String? ivKey,
  }) {
    assert(secretKey!.isNotEmpty, WidgetBaseLanguage.secretKeyLabel);
    assert(ivKey!.isNotEmpty, WidgetBaseLanguage.ivKeyLabel);
    MenstrualCycleWidget.instance ??= MenstrualCycleWidget._();
    MenstrualCycleWidget.instance!
        .initialize(secretKey: secretKey!, ivKey: ivKey!);
    return MenstrualCycleWidget.instance!;
  }

  /// Initialize MenstrualCycleWidget
  void initialize({
    required String secretKey,
    required String ivKey,
  }) {
    _aesSecretKey = secretKey;
    _aesIvKey = ivKey;
    // get current user details
    MenstrualCycleDbHelper.instance.setCurrentUserDetail();
  }

  /// Update language of menstrual cycle
  void updateLanguageConfiguration(
      {Languages defaultLanguage = Languages.english}) async {
    currentLanguage = defaultLanguage;
  }

  /// Update configuration of MenstrualCycleWidget
  void updateConfiguration(
      {required int? cycleLength,
      required int? periodDuration,
      String? customerId = "0",
      DateTime? lastPeriodDate,
      bool isClearData = false,
      String fontFamily = "",
      DateFormats dateFormat = DateFormats.dmy,
      Languages defaultLanguage = Languages.english}) async {
    assert(cycleLength! > 0, WidgetBaseLanguage.totalCycleDaysLabel);
    assert(periodDuration! > 0, WidgetBaseLanguage.totalPeriodDaysLabel);
    // printLogs("userId $userId");
    if (customerId!.isNotEmpty) {
      _customerId = customerId;
    }

    initializeDateFormatting();

    if (fontFamily.isNotEmpty) {
      defaultFontFamily = fontFamily;
    }

    currentLanguage = defaultLanguage;
    _currentDateFormat = dateFormat;
    _cycleLength = cycleLength!;
    _periodDuration = periodDuration!;
    final dbHelper = MenstrualCycleDbHelper.instance;

    // Clear Past log data
    if (isClearData) {
      String customerId = getCustomerId();
      await dbHelper.clearPeriodLog(customerId);
    }
    // insert current user details
    await dbHelper.insertCurrentUserDetails(
        customerId: Encryption.instance.encrypt(_customerId),
        cycleLength: _cycleLength,
        periodDuration: _periodDuration);

    // Generate periods days based on last selected period date
    if (lastPeriodDate != null) {
      bool isFoundDate = await dbHelper.isPeriodDateFound(lastPeriodDate);
      if (!isFoundDate) {
        List<DateTime> selectedPeriodsDate = [];
        DateTime lastPeriodDateTime = lastPeriodDate;
        selectedPeriodsDate.add(lastPeriodDateTime);
        for (int i = 1; i < periodDuration; i++) {
          lastPeriodDateTime = lastPeriodDateTime.add(const Duration(days: 1));
          selectedPeriodsDate.add(lastPeriodDateTime);
        }
        await dbHelper.insertPeriodLog(selectedPeriodsDate);
      }
    }
    calculateLastPeriodDate();
  }

  setCurrentUserData(String customerId, int cycleLength, int periodDuration) {
    _customerId = Encryption.instance.decrypt(customerId);
    _cycleLength = cycleLength;
    _periodDuration = periodDuration;
    calculateLastPeriodDate();
  }

  /// get last period and all past period date from database based on configuration
  Future<List<String>> calculateLastPeriodDate() async {
    final dbHelper = MenstrualCycleDbHelper.instance;
    _lastPeriodDate = await dbHelper.getLastPeriodDate();
    // get all past periods date
    if (_lastPeriodDate.isNotEmpty) {
      final dbHelper = MenstrualCycleDbHelper.instance;
      pastAllPeriodDays = await dbHelper.getPastPeriodDates();
    } else {
      pastAllPeriodDays.clear();
    }
    //printMenstrualCycleLogs("Last Period Date ${pastAllPeriodDays.toString()}");
    return pastAllPeriodDays;
  }

  String getCustomerId() {
    return Encryption.instance.encrypt(_customerId);
  }

  /// ----------------------- Custom Functions -----------------------///

  /// insert user's period data on userId and log date
  saveSymptomsLogs({
    required List<SymptomsData>? userSymptomsData,
    required Function? onSuccess,
    required Function? onError,
    DateTime? symptomsLogDate,
    String meditationTime = "0",
    TimeOfDay? sleepWakeUpTime,
    TimeOfDay? sleepBedTime,
    int cycleDay = 0,
    String waterValue = "0",
    WaterUnits waterUnit = WaterUnits.liters,
    String customNotes = "",
    String weight = "0",
    WeightUnits weightUnit = WeightUnits.kg,
    String bodyTemperature = "0",
    BodyTemperatureUnits bodyTemperatureUnit = BodyTemperatureUnits.celsius,
    bool isCustomLogs = true,
  }) async {
    String currentDate = "";
    String logDate = "";
    String sleepTime = "0";
    customNotes = "N/A";

    if (symptomsLogDate == null) {
      var now = DateTime.now();
      logDate = defaultDateFormat.format(now);
    } else {
      try {
        logDate = defaultDateFormat.format(symptomsLogDate);
      } catch (e) {
        throw WidgetBaseLanguage.errorInvalidSymptomsLogDate;
      }
    }

    if (sleepBedTime != null && sleepWakeUpTime != null) {
      sleepTime =
          "${sleepBedTime.hour}:${sleepBedTime.minute}T${sleepWakeUpTime.hour}:${sleepWakeUpTime.minute}";
    }

    final dbHelper = MenstrualCycleDbHelper.instance;

    currentDate = currentDateFormat.format(DateTime.now());
    final encryption = Encryption.instance;
    String encryptedData = encryption.encrypt(json.encode(userSymptomsData));

    Map<String, dynamic> userData = {
      MenstrualCycleDbHelper.columnCustomerId: getCustomerId(),
      MenstrualCycleDbHelper.columnUserEncryptData: encryptedData,
      MenstrualCycleDbHelper.columnMeditationTime:
          encryption.encrypt(meditationTime),
      MenstrualCycleDbHelper.columnSleepTime: encryption.encrypt(sleepTime),
      MenstrualCycleDbHelper.columnWater: encryption.encrypt(waterValue),
      MenstrualCycleDbHelper.columnWaterUnit:
          encryption.encrypt(waterUnit.toString()),
      MenstrualCycleDbHelper.columnBodyTemperatureUnit:
          encryption.encrypt(bodyTemperatureUnit.toString()),
      MenstrualCycleDbHelper.columnWeightUnit:
          encryption.encrypt(weightUnit.toString()),
      MenstrualCycleDbHelper.columnNotes: encryption.encrypt(customNotes),
      MenstrualCycleDbHelper.columnWeight: encryption.encrypt(weight),
      MenstrualCycleDbHelper.columnBodyTemperature:
          encryption.encrypt(bodyTemperature),
      MenstrualCycleDbHelper.columnLogDate: logDate,
      MenstrualCycleDbHelper.columnCycleDay: cycleDay,
      MenstrualCycleDbHelper.columnCreatedDateTime: currentDate,
      MenstrualCycleDbHelper.columnIsCustomLog: (isCustomLogs) ? "1" : "0"
    };

    int id = await dbHelper.insertDailyLog(userData, logDate, getCustomerId());
    //printLogs(("Save Id: $id");
    if (id > 0) {
      //printLogs(("Save Data");
      if (onSuccess != null) {
        onSuccess.call(id);
      }
    } else {
      //printLogs(("False to save Data");
      if (onError != null) {
        onError.call();
      }
    }
  }

  /// get symptoms name
  getSymptomsName(int symptomsId) {
    List<SymptomsData> listSymptomsData = defaultSymptomsData
        .expand((category) => category.symptomsData ?? <SymptomsData>[])
        .where((symptomsData) => symptomsData.symptomId! == symptomsId)
        .toList();

    //printMenstrualCycleLogs("listSymptomsData size ${listSymptomsData.length}");
    if (listSymptomsData.isNotEmpty) {
      /*printMenstrualCycleLogs(
          "symptomName Name ${listSymptomsData[0].symptomName}");*/
      return listSymptomsData[0].symptomName;
    }

    return "";
  }

  /// Return UserSymptomsLogs based on log date
  Future<UserSymptomsLogs> getSymptomsData(DateTime? symptomsLogDate) async {
    String logDate = "";
    if (symptomsLogDate != null) {
      try {
        logDate = defaultDateFormat.format(symptomsLogDate);
      } catch (e) {
        throw WidgetBaseLanguage.errorInvalidSymptomsLogDate;
      }
    } else {
      throw WidgetBaseLanguage.errorInvalidSymptomsLogDate;
    }

    UserSymptomsLogs userSymptomsLogs = UserSymptomsLogs(symptomData: []);
    final mInstance = MenstrualCycleWidget.instance!;
    final dbHelper = MenstrualCycleDbHelper.instance;
    Database? db = await dbHelper.database;
    String customerId = mInstance.getCustomerId();
    List<SymptomsData> symptomsDataList = [];
    final encryption = Encryption.instance;
    final List<Map<String, dynamic>> queryResponse = await db!.rawQuery(
        "Select * from ${MenstrualCycleDbHelper.tableDailyUserSymptomsLogsData} WHERE ${MenstrualCycleDbHelper.columnLogDate}='$logDate' AND ${MenstrualCycleDbHelper.columnCustomerId}='$customerId'");
    List.generate(queryResponse.length, (i) {
      String userDecryptData = encryption.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnUserEncryptData]);

      List<dynamic> jsonData = json.decode(userDecryptData.trim());
      //printMenstrualCycleLogs("jsonData ${jsonData}");
      symptomsDataList.addAll(
          jsonData.map((symptom) => SymptomsData.fromMap(symptom)).toList());

      userSymptomsLogs.meditationTime = encryption.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnMeditationTime]);

      userSymptomsLogs.bodyTemperature = encryption.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnBodyTemperature]);
      userSymptomsLogs.waterValue = encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWater]);
      userSymptomsLogs.weight = encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWeight]);
      userSymptomsLogs.weightUnit = encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWeightUnit]);
      userSymptomsLogs.sleepTime = encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnSleepTime]);
      userSymptomsLogs.waterUnit = encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWaterUnit]);
      userSymptomsLogs.bodyTemperatureUnit = encryption.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnBodyTemperatureUnit]);
      userSymptomsLogs.notes = encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnNotes]);
    });

    userSymptomsLogs.logDate = logDate;

    userSymptomsLogs.symptomData!.addAll(symptomsDataList);
    return userSymptomsLogs;
  }

  /// get Today's symptoms ids
  Future<List<int>> getSymptomsId(DateTime? symptomsLogDate) async {
    if (symptomsLogDate == null) {
      throw WidgetBaseLanguage.errorInvalidSymptomsLogDate;
    }

    List<int> symptomsIds = [];
    UserSymptomsLogs userSymptomsLogs = await getSymptomsData(symptomsLogDate);
    for (int i = 0; i < userSymptomsLogs.symptomData!.length; i++) {
      symptomsIds.add(userSymptomsLogs.symptomData![i].symptomId!);
    }
    return symptomsIds;
  }

  /// get Today's symptoms logs
  Future<List<UserLogReportData>> getTodaySymptomsLog() async {
    List<UserLogReportData> usersLogDataList = await getSymptomsLogReport(
        startDate: DateTime.now(), endDate: DateTime.now());
    return usersLogDataList;
  }

  /// Get min and max wight of current user
  Future<Map<String, double>> getMinMaxWeightLog(
      {WeightUnits? weightUnits = WeightUnits.kg}) async {
    final dbHelper = MenstrualCycleDbHelper.instance;
    Database? db = await dbHelper.database;
    double minValue = 0;
    double maxValue = 0;
    final mInstance = MenstrualCycleWidget.instance!;
    String customerId = mInstance.getCustomerId();

    final List<Map<String, dynamic>> queryResponse = await db!.rawQuery(
        "Select * from ${MenstrualCycleDbHelper.tableDailyUserSymptomsLogsData} WHERE ${MenstrualCycleDbHelper.columnCustomerId}='$customerId'");
    final encryption = Encryption.instance;
    List.generate(queryResponse.length, (i) {
      String weightUnit = encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWeightUnit]);
      double weightValue = double.parse(encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWeight]));
      double weight = 0.0;
      if (weightValue > 0) {
        if (weightUnit == weightUnits.toString()) {
          weight = weightValue;
        } else {
          if (weightUnit == WeightUnits.kg.toString()) {
            weight = convertLbToKg(weightValue);
          } else if (weightUnit == WeightUnits.lb.toString()) {
            weight = convertKgToLb(weightValue);
          }
        }
      }
      if (minValue == 0) {
        minValue = weight;
      }
      if (weight > 0) {
        if (minValue >= weight) {
          minValue = weight;
        }
        if (maxValue <= weight) {
          maxValue = weight;
        }
      }
    });

    return {
      'min_value': minValue,
      'max_value': maxValue,
    };
  }

  /// get user's wight logs
  Future<List<WeightData>> getWeightLog(
      {required DateTime? startDate,
      required DateTime? endDate,
      WeightUnits? weightUnits = WeightUnits.kg,
      int pageNumber = 1,
      int itemsPerPage = 7}) async {
    List<WeightData> weightDataListData = [];

    List<UserLogReportData> usersLogDataList = await getSymptomsLogReport(
        startDate: startDate,
        endDate: endDate,
        isRequiredPagination: true,
        itemsPerPage: itemsPerPage,
        pageNumber: pageNumber);
    for (int i = 0; i < usersLogDataList.length; i++) {
      WeightData weightData = WeightData();
      UserLogReportData logReportData = usersLogDataList[i];
      double weightValue = double.parse(logReportData.weight!);
      if (logReportData.weightUnit!.isNotEmpty && weightValue > 0) {
        //printMenstrualCycleLogs(
        //    "logReportData.waterValue ${logReportData.waterValue}");

        double weightValue = double.parse(logReportData.weight!);

        // printLogs("logReportData.waterUnit ${logReportData.waterUnit}");
        double weight = 0.0;
        if (logReportData.weightUnit == weightUnits.toString()) {
          weight = weightValue;
        } else {
          if (logReportData.weightUnit == WeightUnits.kg.toString()) {
            weight = convertLbToKg(weightValue);
          } else if (logReportData.weightUnit == WeightUnits.lb.toString()) {
            weight = convertKgToLb(weightValue);
          }
        }
        //printLogs("weight =====$weight");
        weightData.weightValue = weight;
        weightData.dateTime =
            CalenderDateUtils.graphDateFormat(logReportData.logDate!);
        weightData.weightUnit = weightUnits.toString();

        weightDataListData.add(weightData);
      }
    }
    //  printLogs("waterDataListData ${waterDataListData.length}");
    return weightDataListData;
  }

  /// Get meditation time current user
  Future<Map<String, double>> getMinMaxMeditationTime() async {
    final dbHelper = MenstrualCycleDbHelper.instance;
    Database? db = await dbHelper.database;
    double minValue = 0;
    double maxValue = 0;
    final mInstance = MenstrualCycleWidget.instance!;
    String customerId = mInstance.getCustomerId();

    final List<Map<String, dynamic>> queryResponse = await db!.rawQuery(
        "Select * from ${MenstrualCycleDbHelper.tableDailyUserSymptomsLogsData} WHERE ${MenstrualCycleDbHelper.columnCustomerId}='$customerId'");
    final encryption = Encryption.instance;

    List.generate(queryResponse.length, (i) {
      double meditationTime = double.parse(encryption.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnMeditationTime]));
      if (meditationTime > 0) {
        if (minValue == 0) {
          minValue = meditationTime;
        }
        if (meditationTime > 0) {
          if (minValue >= meditationTime) {
            minValue = meditationTime;
          }
          if (maxValue <= meditationTime) {
            maxValue = meditationTime;
          }
        }
      }
    });

    return {
      'min_value': minValue,
      'max_value': maxValue,
    };
  }

  /// get user's meditation logs
  Future<List<MeditationData>> getMeditationLog(
      {required DateTime? startDate,
      required DateTime? endDate,
      int pageNumber = 1,
      int itemsPerPage = 7}) async {
    List<MeditationData> meditationDataListData = [];

    List<UserLogReportData> usersLogDataList = await getSymptomsLogReport(
        startDate: startDate,
        endDate: endDate,
        isRequiredPagination: true,
        itemsPerPage: itemsPerPage,
        pageNumber: pageNumber);
    for (int i = 0; i < usersLogDataList.length; i++) {
      MeditationData meditationData = MeditationData();
      UserLogReportData logReportData = usersLogDataList[i];
      int meditationValue = int.parse(logReportData.meditationTime!);
      if (meditationValue > 0) {
        meditationData.dateTime =
            CalenderDateUtils.graphDateFormat(logReportData.logDate!);
        meditationData.meditationMin = meditationValue;
        meditationDataListData.add(meditationData);
      }
    }
    //  printLogs("waterDataListData ${waterDataListData.length}");
    return meditationDataListData;
  }

  /// Get min and max drink water of current user
  Future<Map<String, double>> getMinMaxDrinkWater(
      {WaterUnits? waterUnits = WaterUnits.ml}) async {
    final dbHelper = MenstrualCycleDbHelper.instance;
    Database? db = await dbHelper.database;
    double minValue = 0;
    double maxValue = 0;
    final mInstance = MenstrualCycleWidget.instance!;
    String customerId = mInstance.getCustomerId();

    final List<Map<String, dynamic>> queryResponse = await db!.rawQuery(
        "Select * from ${MenstrualCycleDbHelper.tableDailyUserSymptomsLogsData} WHERE ${MenstrualCycleDbHelper.columnCustomerId}='$customerId'");
    final encryption = Encryption.instance;
    List.generate(queryResponse.length, (i) {
      String waterUnit = encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWaterUnit]);
      double drinkWaterValue = double.parse(encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWater]));
      double drinkWater = 0.0;
      if (drinkWaterValue > 0) {
        if (waterUnit == waterUnits.toString()) {
          drinkWater = drinkWaterValue;
        } else {
          if (waterUnits == WaterUnits.liters) {
            drinkWater = millilitersToLiters(drinkWaterValue);
          } else if (waterUnits == WaterUnits.cups) {
            drinkWater = millilitersToUSCups(drinkWaterValue);
          } else if (waterUnits == WaterUnits.flOz) {
            drinkWater = millilitersToUSFluidOunces(drinkWaterValue);
          } else if (waterUnits == WaterUnits.imperialGallons) {
            drinkWater = millilitersToImperialGallons(drinkWaterValue);
          } else if (waterUnits == WaterUnits.usGallon) {
            drinkWater = millilitersToUSGallons(drinkWaterValue);
          }
        }
      }
      if (minValue == 0) {
        minValue = drinkWater;
      }
      if (drinkWater > 0) {
        if (minValue >= drinkWater) {
          minValue = drinkWater;
        }
        if (maxValue <= drinkWater) {
          maxValue = drinkWater;
        }
      }
    });

    return {
      'min_value': minValue,
      'max_value': maxValue,
    };
  }

  /// get user's drink water logs
  Future<List<WaterData>> getDrinkWaterLog(
      {required DateTime? startDate,
      required DateTime? endDate,
      WaterUnits? waterUnits = WaterUnits.ml,
      int pageNumber = 1,
      int itemsPerPage = 7}) async {
    List<WaterData> waterDataListData = [];

    List<UserLogReportData> usersLogDataList = await getSymptomsLogReport(
        startDate: startDate,
        endDate: endDate,
        isRequiredPagination: true,
        itemsPerPage: itemsPerPage,
        pageNumber: pageNumber);
    for (int i = 0; i < usersLogDataList.length; i++) {
      WaterData waterData = WaterData();
      UserLogReportData logReportData = usersLogDataList[i];
      int waterValue = int.parse(logReportData.waterValue!);
      if (logReportData.waterUnit!.isNotEmpty && waterValue > 0) {
        //printMenstrualCycleLogs(
        //    "logReportData.waterValue ${logReportData.waterValue}");

        double drinkWaterValue = double.parse(logReportData.waterValue!);

        // printLogs("logReportData.waterUnit ${logReportData.waterUnit}");
        double drinkWater = 0.0;
        if (logReportData.waterUnit == waterUnits.toString()) {
          drinkWater = drinkWaterValue;
        } else {
          if (waterUnits == WaterUnits.liters) {
            drinkWater = millilitersToLiters(drinkWaterValue);
          } else if (waterUnits == WaterUnits.cups) {
            drinkWater = millilitersToUSCups(drinkWaterValue);
          } else if (waterUnits == WaterUnits.flOz) {
            drinkWater = millilitersToUSFluidOunces(drinkWaterValue);
          } else if (waterUnits == WaterUnits.imperialGallons) {
            drinkWater = millilitersToImperialGallons(drinkWaterValue);
          } else if (waterUnits == WaterUnits.usGallon) {
            drinkWater = millilitersToUSGallons(drinkWaterValue);
          }
        }
        //printLogs("drinkWater =====$drinkWater");
        waterData.waterValue = drinkWater;
        waterData.dateTime =
            CalenderDateUtils.graphDateFormat(logReportData.logDate!);
        waterData.waterUnit = waterUnits.toString();

        waterDataListData.add(waterData);
      }
    }
    //  printLogs("waterDataListData ${waterDataListData.length}");
    return waterDataListData;
  }

  /// Get min and max sleep time log of current user
  Future<Map<String, int>> getMinMaxSleepTimeLog() async {
    final dbHelper = MenstrualCycleDbHelper.instance;
    Database? db = await dbHelper.database;
    int minValue = 0;
    int maxValue = 0;
    final mInstance = MenstrualCycleWidget.instance!;
    String customerId = mInstance.getCustomerId();

    final List<Map<String, dynamic>> queryResponse = await db!.rawQuery(
        "Select * from ${MenstrualCycleDbHelper.tableDailyUserSymptomsLogsData} WHERE ${MenstrualCycleDbHelper.columnCustomerId}='$customerId'");
    final encryption = Encryption.instance;

    List.generate(queryResponse.length, (i) {
      String sleepTime = encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnSleepTime]);
      List<String> time = sleepTime.split("T");
      List<String> sleepBedTime = time[0].split(":");
      List<String> sleepWakeUpTime = time[1].split(":");

      int sleepBedTimeHrs = int.parse(sleepBedTime[0]);
      int sleepWakeUpTimeHrs = int.parse(sleepWakeUpTime[0]);

      if (sleepBedTimeHrs > sleepWakeUpTimeHrs) {
        sleepWakeUpTimeHrs =
            sleepBedTimeHrs + (23 - sleepBedTimeHrs) + sleepWakeUpTimeHrs;
      }
      // printLogs("sleepWakeUpTimeHrs $sleepWakeUpTimeHrs");

      if (minValue >= sleepBedTimeHrs) {
        minValue = sleepBedTimeHrs;
      }
      if (maxValue <= sleepWakeUpTimeHrs) {
        maxValue = sleepWakeUpTimeHrs;
      }
    });

    //printMenstrualCycleLogs("min_temp $minValue");
    //printMenstrualCycleLogs("max_temp $maxValue");

    return {
      'min_temp': minValue,
      'max_temp': maxValue,
    };
  }

  /// get user's sleep data
  Future<List<SleepData>> getSleepLog(
      {required DateTime? startDate,
      required DateTime? endDate,
      int pageNumber = 1,
      int itemsPerPage = 7}) async {
    List<SleepData> sleepListData = [];

    List<UserLogReportData> usersLogDataList = await getSymptomsLogReport(
        startDate: startDate,
        endDate: endDate,
        isRequiredPagination: true,
        itemsPerPage: itemsPerPage,
        pageNumber: pageNumber);
    for (int i = 0; i < usersLogDataList.length; i++) {
      SleepData sleepData = SleepData();
      UserLogReportData logReportData = usersLogDataList[i];

      List<String> time = logReportData.sleepTime!.split("T");
      List<String> sleepBedTime = time[0].split(":");
      List<String> sleepWakeUpTime = time[1].split(":");

      int sleepBedTimeHrs = int.parse(sleepBedTime[0]);
      int sleepBedTimeMin = int.parse(sleepBedTime[1]);
      int sleepWakeUpTimeHrs = int.parse(sleepWakeUpTime[0]);
      int sleepWakeUpTimeMin = int.parse(sleepWakeUpTime[1]);

      if (sleepBedTimeHrs > sleepWakeUpTimeHrs) {
        sleepWakeUpTimeHrs =
            sleepBedTimeHrs + (23 - sleepBedTimeHrs) + sleepWakeUpTimeHrs;
      }

      sleepData.sleepBedTime =
          double.parse("$sleepBedTimeHrs.$sleepBedTimeMin");
      sleepData.wakeUpTime =
          double.parse("$sleepWakeUpTimeHrs.$sleepWakeUpTimeMin");

      /*printLogs("sleepBedTime ${sleepData.sleepBedTime}");
       printLogs("wakeUpTime ${sleepData.wakeUpTime}");*/

      sleepData.dateTime =
          CalenderDateUtils.graphDateFormat(logReportData.logDate!);

      if (sleepData.sleepBedTime! > 0) {
        sleepListData.add(sleepData);
      }
    }

    return sleepListData;
  }

  /// Get min and max body temperature of current user
  Future<Map<String, int>> getMinMaxBodyTemperature(
      {BodyTemperatureUnits? bodyTemperatureUnits =
          BodyTemperatureUnits.celsius}) async {
    final dbHelper = MenstrualCycleDbHelper.instance;
    Database? db = await dbHelper.database;
    int minValue = 0;
    int maxValue = 0;
    final mInstance = MenstrualCycleWidget.instance!;
    String customerId = mInstance.getCustomerId();

    final List<Map<String, dynamic>> queryResponse = await db!.rawQuery(
        "Select * from ${MenstrualCycleDbHelper.tableDailyUserSymptomsLogsData} WHERE ${MenstrualCycleDbHelper.columnCustomerId}='$customerId'");
    final encryption = Encryption.instance;

    List.generate(queryResponse.length, (i) {
      String tempUnit = encryption.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnBodyTemperatureUnit]);
      double tempValue = double.parse(encryption.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnBodyTemperature]));
      double temp = 0.0;
      if (tempValue > 0) {
        if (tempUnit == bodyTemperatureUnits.toString()) {
          temp = tempValue;
        } else {
          if (bodyTemperatureUnits == BodyTemperatureUnits.fahrenheit) {
            temp = celsiusToFahrenheit(tempValue);
          } else {
            temp = fahrenheitToCelsius(tempValue);
          }
        }
      }

      if (minValue == 0) {
        minValue = temp.toInt();
      }
      if (temp > 0) {
        if (minValue >= temp) {
          minValue = temp.toInt();
        }
        if (maxValue <= temp) {
          maxValue = temp.toInt();
        }
      }
    });

    return {
      'min_temp': minValue,
      'max_temp': maxValue,
    };
  }

  /// get user's temperature data
  Future<List<BodyTemperatureData>> getTemperatureLog(
      {required DateTime? startDate,
      required DateTime? endDate,
      BodyTemperatureUnits? bodyTemperatureUnits = BodyTemperatureUnits.celsius,
      int pageNumber = 1,
      int itemsPerPage = 7}) async {
    List<BodyTemperatureData> bodyTemperatureListData = [];

    List<UserLogReportData> usersLogDataList = await getSymptomsLogReport(
        startDate: startDate,
        endDate: endDate,
        isRequiredPagination: true,
        itemsPerPage: itemsPerPage,
        pageNumber: pageNumber);
    for (int i = 0; i < usersLogDataList.length; i++) {
      BodyTemperatureData bodyTemperatureData = BodyTemperatureData();
      UserLogReportData logReportData = usersLogDataList[i];
      double bodyTemp = double.parse(logReportData.bodyTemperature!);
      if (bodyTemp > 0) {
        double bodyTemperature = 0.0;
        if (logReportData.bodyTemperatureUnit ==
            bodyTemperatureUnits.toString()) {
          bodyTemperature = double.parse(logReportData.bodyTemperature!);
        } else {
          if (bodyTemperatureUnits == BodyTemperatureUnits.fahrenheit) {
            bodyTemperature = celsiusToFahrenheit(
                double.parse(logReportData.bodyTemperature!));
          } else {
            bodyTemperature = fahrenheitToCelsius(
                double.parse(logReportData.bodyTemperature!));
          }
        }
        bodyTemperatureData.bodyTemperature = bodyTemperature;
        bodyTemperatureData.dateTime =
            CalenderDateUtils.graphDateFormat(logReportData.logDate!);
        bodyTemperatureData.bodyTemperatureUnit =
            bodyTemperatureUnits.toString();

        bodyTemperatureListData.add(bodyTemperatureData);
      }
    }
    return bodyTemperatureListData;
  }

  /// get symptoms log report BETWEEN start & end date based on userId
  Future<List<UserLogReportData>> getSymptomsLogReport(
      {required DateTime? startDate,
      required DateTime? endDate,
      int pageNumber = 1,
      int itemsPerPage = 7,
      bool isRequiredPagination = false}) async {
    // TODO Add validation for start and end date like not null, end date after start date or equal etc

    String logStartDate = defaultDateFormat.format(startDate!);
    String logEndDate = defaultDateFormat.format(endDate!);
    List<UserLogReportData> usersLogDataList = [];
    final dbHelper = MenstrualCycleDbHelper.instance;
    int offset = (pageNumber - 1) * itemsPerPage;
    String customerId = getCustomerId();
    printMenstrualCycleLogs("customerId $customerId");
    Database? db = await dbHelper.database;
    final List<Map<String, dynamic>> queryResponse;
    if (isRequiredPagination) {
      queryResponse = await db!.rawQuery(
          "Select * from ${MenstrualCycleDbHelper.tableDailyUserSymptomsLogsData} WHERE ${MenstrualCycleDbHelper.columnCustomerId}='$customerId' AND ${MenstrualCycleDbHelper.columnLogDate} BETWEEN '$logStartDate' AND '$logEndDate' ORDER BY ${MenstrualCycleDbHelper.columnLogDate} DESC LIMIT $itemsPerPage OFFSET $offset");
    } else {
      queryResponse = await db!.rawQuery(
          "Select * from ${MenstrualCycleDbHelper.tableDailyUserSymptomsLogsData} WHERE ${MenstrualCycleDbHelper.columnCustomerId}='$customerId' AND ${MenstrualCycleDbHelper.columnLogDate} BETWEEN '$logStartDate' AND '$logEndDate'");
    }
    final encryption = Encryption.instance;

    List.generate(queryResponse.length, (i) {
      UserLogReportData userLogsData = UserLogReportData();
      userLogsData.id = queryResponse[i][MenstrualCycleDbHelper.columnID];
      userLogsData.customerId =
          queryResponse[i][MenstrualCycleDbHelper.columnCustomerId];
      String symptomsData = encryption.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnUserEncryptData]);
      List<dynamic> jsonData = json.decode(symptomsData.trim());
      userLogsData.symptomsData =
          jsonData.map((symptom) => SymptomsData.fromMap(symptom)).toList();

      List<SymptomsData> newSymptomsDataList = [];

      for (int index = 0; index < userLogsData.symptomsData!.length; index++) {
        SymptomsData symptomsData = userLogsData.symptomsData![index];
        //   printMenstrualCycleLogs("Oringal Name ${symptomsData.symptomName}");
        symptomsData.symptomName = getSymptomsName(symptomsData.symptomId!);
        newSymptomsDataList.add(symptomsData);
      }

      userLogsData.symptomsData!.clear();
      userLogsData.symptomsData!.addAll(newSymptomsDataList);

      userLogsData.bodyTemperature = encryption.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnBodyTemperature]);
      userLogsData.bodyTemperatureUnit = encryption.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnBodyTemperatureUnit]);
      userLogsData.weightUnit = encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWeightUnit]);
      userLogsData.weight = encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWeight]);
      userLogsData.waterUnit = encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWaterUnit]);
      userLogsData.waterValue = encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWater]);
      userLogsData.sleepTime = encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnSleepTime]);
      userLogsData.notes = encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnNotes]);
      userLogsData.meditationTime = encryption.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnMeditationTime]);
      userLogsData.logDate = DateTime.parse(
          queryResponse[i][MenstrualCycleDbHelper.columnLogDate]);
      userLogsData.cycleDay =
          queryResponse[i][MenstrualCycleDbHelper.columnCycleDay];
      userLogsData.createdAt =
          queryResponse[i][MenstrualCycleDbHelper.columnCreatedDateTime];
      usersLogDataList.add(userLogsData);
    });

    usersLogDataList.sort((a, b) {
      DateTime aDate = a.logDate!;
      DateTime bDate = b.logDate!;
      return bDate.compareTo(aDate);
    });
    return usersLogDataList;
  }

  /// Clear user's log details
  clearPeriodLog() async {
    final dbHelper = MenstrualCycleDbHelper.instance;
    String encryptedUserid = getCustomerId();
    await dbHelper.clearPeriodLog(encryptedUserid);
  }

  /// get last period date. Default is 1971-01-01
  Future<DateTime> getPreviousPeriodDate() async {
    String defaultDate = "1971-01-01";
    DateTime returnDateTime = DateTime.parse(defaultDate);
    if (_lastPeriodDate.isNotEmpty) {
      returnDateTime = DateTime.parse(_lastPeriodDate);
    }
    return returnDateTime;
  }

  /// get encrypt text
  Future<String> encryptText(String normalText) async {
    return Encryption.instance.encrypt(normalText);
  }

  /// get encrypt text
  Future<String> decryptText(String encryptedText) async {
    return Encryption.instance.decrypt(encryptedText);
  }

  /// get average period duration. Default is 0
  Future<int> getAvgPeriodDuration() async {
    List<PeriodsDateRange> allPeriodRange = await getAllPeriodsDetails();
    int avgPeriodDuration = 0;
    if (allPeriodRange.isNotEmpty) {
      int totalPeriodDuration = 0;
      for (int i = 0; i < allPeriodRange.length; i++) {
        totalPeriodDuration =
            totalPeriodDuration + allPeriodRange[i].periodDuration!;
      }
      avgPeriodDuration = totalPeriodDuration ~/ allPeriodRange.length;
    }
    return avgPeriodDuration;
  }

  /// get average cycle length. Default is 0
  Future<int> getAvgCycleLength() async {
    List<PeriodsDateRange> allPeriodRange = await getAllPeriodsDetails();
    int avgCycleLength = 0;
    if (allPeriodRange.isNotEmpty) {
      int totalCycleLength = 0;
      for (int i = 0; i < allPeriodRange.length; i++) {
        totalCycleLength = totalCycleLength + allPeriodRange[i].cycleLength!;
      }
      avgCycleLength = totalCycleLength ~/ allPeriodRange.length;
    }
    return avgCycleLength;
  }

  /// get last period duration. Default is 0
  Future<int> getPreviousPeriodDuration() async {
    List<PeriodsDateRange> allPeriodRange = await getAllPeriodsDetails();
    int lastPeriodDuration = 0;
    if (allPeriodRange.isNotEmpty) {
      if (allPeriodRange.length > 1) {
        lastPeriodDuration = allPeriodRange[1].allPeriodDates!.length;
      }
    }
    return lastPeriodDuration;
  }

  /// get last cycle length. Default is 0
  Future<int> getPreviousCycleLength() async {
    List<PeriodsDateRange> allPeriodRange = await getAllPeriodsDetails();
    int lastCycleLength = 0;
    if (allPeriodRange.isNotEmpty) {
      if (allPeriodRange.length > 1) {
        lastCycleLength = allPeriodRange[1].cycleLength!;
      }
    }
    return lastCycleLength;
  }

  /// get last period date. Default is object of PeriodsDateRange
  Future<PeriodsDateRange> getPreviousPeriodDateRange() async {
    PeriodsDateRange periodsDateRange = PeriodsDateRange(allPeriodDates: []);
    List<PeriodsDateRange> allPeriodRange = await getAllPeriodsDetails();
    if (allPeriodRange.isNotEmpty) {
      periodsDateRange = allPeriodRange[0];
    }
    return periodsDateRange;
  }

  /// get all period details like period start date, period end date, period duration and all period dates.
  /// Default is object of PeriodsDateRange
  Future<List<PeriodsDateRange>> getAllPeriodsDetails() async {
    List<PeriodsDateRange> listPeriodsDateRange = [];
    final dbHelper = MenstrualCycleDbHelper.instance;
    List<DateTime> periodDateRange = [];
    List<String> lastPeriodRange = await dbHelper.getPastPeriodDates();
    if (lastPeriodRange.isNotEmpty) {
      for (int i = 0; i < lastPeriodRange.length; i++) {
        periodDateRange.add(DateTime.parse(lastPeriodRange[i]));
      }
      periodDateRange.sort((a, b) => a.compareTo(b));
      int indexId = 1;
      int periodDuration = 0;
      List<String>? periodDates = [];

      PeriodsDateRange periodsDateRange = PeriodsDateRange(allPeriodDates: []);
      if (periodDateRange.length > 1) {
        for (int i = 0; i < periodDateRange.length; i++) {
          periodDuration = periodDuration + 1;
          if (i == 0) {
            periodsDateRange.id = indexId;
            periodsDateRange.periodStartDate =
                CalenderDateUtils.dateDayFormat(periodDateRange[i]);
            periodsDateRange.cycleStartDate =
                CalenderDateUtils.dateDayFormat(periodDateRange[i]);
            periodDates!
                .add(CalenderDateUtils.dateDayFormat(periodDateRange[i]));
          } else {
            DateTime previousDate = periodDateRange[i - 1];
            DateTime currentDate = periodDateRange[i];
            int inDays = currentDate.difference(previousDate).inDays - 1;

            if (inDays > 1) {
              periodDates = [];
              periodDuration = 1;
              periodsDateRange.cycleLength = currentDate
                  .difference(DateTime.parse(periodsDateRange.cycleStartDate!))
                  .inDays;
              periodsDateRange.cycleEndDate = CalenderDateUtils.dateDayFormat(
                  currentDate.add(const Duration(days: -1)));
              listPeriodsDateRange.add(periodsDateRange);

              indexId = indexId + 1;
              periodsDateRange = PeriodsDateRange(allPeriodDates: []);
              periodsDateRange.id = indexId;
              periodsDateRange.periodStartDate =
                  CalenderDateUtils.dateDayFormat(currentDate);
              periodsDateRange.cycleStartDate =
                  CalenderDateUtils.dateDayFormat(currentDate);
              periodsDateRange.cycleLength = inDays;
              periodDates
                  .add(CalenderDateUtils.dateDayFormat(periodDateRange[i]));
            } else {
              periodDates!
                  .add(CalenderDateUtils.dateDayFormat(periodDateRange[i]));
              periodsDateRange.periodEndDate =
                  CalenderDateUtils.dateDayFormat(currentDate);
              periodsDateRange.periodDuration = periodDuration;
              periodsDateRange.allPeriodDates = periodDates;
            }
          }
        }
        periodsDateRange.cycleLength = DateTime.now()
            .difference(DateTime.parse(periodsDateRange.cycleStartDate!))
            .inDays;
        listPeriodsDateRange.add(periodsDateRange);
      } else {
        periodsDateRange.id = indexId;
        periodsDateRange.periodStartDate =
            CalenderDateUtils.dateDayFormat(periodDateRange[0]);
        periodsDateRange.cycleStartDate =
            CalenderDateUtils.dateDayFormat(periodDateRange[0]);
        periodsDateRange.cycleEndDate =
            CalenderDateUtils.dateDayFormat(periodDateRange[0]);
        periodsDateRange.periodEndDate =
            CalenderDateUtils.dateDayFormat(periodDateRange[0]);
        periodsDateRange.periodDuration = periodDuration;
        periodsDateRange.cycleLength = 1;
        periodsDateRange.allPeriodDates!
            .add(CalenderDateUtils.dateDayFormat(periodDateRange[0]));
        listPeriodsDateRange.add(periodsDateRange);
      }
    }
    listPeriodsDateRange = listPeriodsDateRange.reversed.toList();
    return listPeriodsDateRange;
  }

  /// get Current day of cycle
  Future<int> getCurrentCycleDay() async {
    final dbHelper = MenstrualCycleDbHelper.instance;
    int currentDayCycle = 0;
    String lastPeriodDate = await dbHelper.getLastPeriodDate();
    if (lastPeriodDate.isNotEmpty) {
      currentDayCycle =
          DateTime.now().difference(DateTime.parse(lastPeriodDate)).inDays + 1;
    }
    return currentDayCycle;
  }

  /// check if period started
  Future<bool> isPeriodStarted() async {
    bool periodStart = false;
    DateTime lastPeriodDate = await getPreviousPeriodDate();
    DateTime expEndPeriodDate =
        lastPeriodDate.add(Duration(days: getPeriodDuration()));
    DateTime today = DateTime.now();

    if (today.isAfter(lastPeriodDate) && today.isBefore(expEndPeriodDate)) {
      periodStart = true;
    } else if (today.isAtSameMomentAs(lastPeriodDate) ||
        today.isAtSameMomentAs(expEndPeriodDate)) {
      periodStart = true;
    }

    return periodStart;
  }

  /// Get follicular day count
  int getFollicularDayCounts() {
    int follicularDay = defaultFollicularDay;
    int ovulationDay = getCycleLength() - 14;
    follicularDay =
        (ovulationDay - getPeriodDuration() - defaultOvulationDay ~/ 2).toInt();
    //printMenstrualCycleLogs("follicularDay: $follicularDay");
    return follicularDay - 1;
  }

  /// check if today is ovulation day
  Future<bool> isOvulationDay() async {
    bool ovulationDay = false;
    DateTime lastPeriodDate = await getPreviousPeriodDate();
    int totalDiffCurrentLastPeriod =
        DateTime.now().difference(lastPeriodDate).inDays;
    int getOvulationDay = getPeriodDuration() +
        getFollicularDayCounts() +
        defaultOvulationDay ~/ 2;
    if (getOvulationDay == totalDiffCurrentLastPeriod) {
      ovulationDay = true;
    }
    return ovulationDay;
  }

  /// get current period day
  Future<int> getCurrentPeriodDay() async {
    int currentPeriodDay = 0;
    DateTime lastPeriodDate = await getPreviousPeriodDate();
    DateTime expEndPeriodDate =
        lastPeriodDate.add(Duration(days: getPeriodDuration()));
    DateTime today = DateTime.now();

    if (today.isAfter(lastPeriodDate) && today.isBefore(expEndPeriodDate)) {
      currentPeriodDay = DateTime.now().difference(lastPeriodDate).inDays + 1;
    } else if (today.isAtSameMomentAs(lastPeriodDate) ||
        today.isAtSameMomentAs(expEndPeriodDate)) {
      currentPeriodDay = (DateTime.now().difference(lastPeriodDate).inDays) + 1;
    }

    return currentPeriodDay;
  }

  /// Calculate cycle regularity score
  Future<double> getCycleRegularityScore() async {
    List<int> cycleLengths = [];
    List<PeriodsDateRange> allPeriodRange = await getAllPeriodsDetails();

    if (allPeriodRange.length > 1) {
      for (int i = 1; i < allPeriodRange.length; i++) {
        // printMenstrualCycleLogs("Len: ${allPeriodRange[i].cycleLength!}");
        cycleLengths.add(allPeriodRange[i].cycleLength!);
      }
    }

    if (cycleLengths.isNotEmpty) {
      //Calculate Average Cycle Length (ACL)
      double avgCycleLength = _average(cycleLengths);
      //  Calculate Standard Deviation (SD)
      double standardDeviation = _stdDev(cycleLengths, avgCycleLength);
      //  Calculate Cycle Regularity Score (CRS)
      double crs = 100 - ((standardDeviation / avgCycleLength) * 100);
      // Ensure CRS is in the range of 0 to 100
      return crs.clamp(0, 100);
    }
    return 0.0;
  }

  /// Calculate cycle regularity score status
  Future<String> getCycleRegularityScoreStatus() async {
    double cycleCRS = await getCycleRegularityScore();
    String cycleCRSStatus = "";
    if (cycleCRS > 89) {
      cycleCRSStatus = WidgetBaseLanguage.regularTitle;
    } else if (cycleCRS > 74) {
      cycleCRSStatus = WidgetBaseLanguage.normalTitle;
    } else if (cycleCRS > 0) {
      cycleCRSStatus = WidgetBaseLanguage.irregularTitle;
    }
    return cycleCRSStatus;
  }

  /// Calculate period regularity score
  Future<double> getPeriodRegularityScore() async {
    List<int> periodLengths = [];
    List<PeriodsDateRange> allPeriodRange = await getAllPeriodsDetails();

    if (allPeriodRange.length > 1) {
      for (int i = 1; i < allPeriodRange.length; i++) {
        //printMenstrualCycleLogs("Len: ${allPeriodRange[i].periodDuration!}");
        periodLengths.add(allPeriodRange[i].periodDuration!);
      }
    }

    if (periodLengths.isNotEmpty) {
      //Calculate Average period duration (APL)
      double avgPeriodLength = _average(periodLengths);
      //  Calculate Standard Deviation (SD)
      double standardDeviation = _stdDev(periodLengths, avgPeriodLength);
      //  Calculate Cycle Regularity Score (CRS)
      double crs = 100 - ((standardDeviation / avgPeriodLength) * 100);
      // Ensure CRS is in the range of 0 to 100
      return crs.clamp(0, 100);
    }
    return 0.0;
  }

  /// Calculate period regularity score status
  Future<String> getPeriodRegularityScoreStatus() async {
    double periodPRS = await getPeriodRegularityScore();
    String periodCRSStatus = "";
    if (periodPRS > 89) {
      periodCRSStatus = WidgetBaseLanguage.regularTitle;
    } else if (periodPRS > 74) {
      periodCRSStatus = WidgetBaseLanguage.normalTitle;
    } else if (periodPRS > 0) {
      periodCRSStatus = WidgetBaseLanguage.irregularTitle;
    }
    return periodCRSStatus;
  }

  double _average(List<int> data) {
    return data.reduce((a, b) => a + b) / data.length;
  }

  double _stdDev(List<int> data, double mean) {
    double variance =
        data.map((x) => pow(x - mean, 2)).reduce((a, b) => a + b) / data.length;
    return sqrt(variance);
  }

  /// get Next Predicted Period Date
  Future<String> getNextPredictedPeriodDate() async {
    // TODO Check if period date is less then current day then return blank
    if (_lastPeriodDate.isNotEmpty) {
      int cycleLength = getCycleLength();
      DateTime nextPeriodDate = CalenderDateUtils.dateFormat
          .parse(getPreviousPeriodDay())
          .add(Duration(days: cycleLength));

      return CalenderDateUtils.dateDayFormat(nextPeriodDate);
    }
    return "";
  }

  /// to check today is period day
  Future<bool> isPeriodStartFromToday() async {
    String nextPeriodDate = await getNextPredictedPeriodDate();
    if (nextPeriodDate.isNotEmpty) {
      DateTime today = DateTime.now();
      String formattedToday = CalenderDateUtils.dateFormat.format(today);
      String formattedInput =
          CalenderDateUtils.dateFormat.format(DateTime.parse(nextPeriodDate));
      if (formattedInput == formattedToday) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  /// to check tomorrow is period day
  Future<bool> isPeriodStartFromTomorrow() async {
    String nextPeriodDate = await getNextPredictedPeriodDate();
    if (nextPeriodDate.isNotEmpty) {
      DateTime tomorrowDate = DateTime.now().add(Duration(days: 1));
      String formattedTomorrow =
          CalenderDateUtils.dateFormat.format(tomorrowDate);
      String formattedInput =
          CalenderDateUtils.dateFormat.format(DateTime.parse(nextPeriodDate));
      if (formattedInput == formattedTomorrow) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  /// get Next Predicted Period Date
  Future<String> getNextOvulationDate() async {
    if (_lastPeriodDate.isNotEmpty) {
      int cycleLength = getCycleLength();
      DateTime nextPeriodDate =
          CalenderDateUtils.dateFormat.parse(getPreviousPeriodDay());

      DateTime ovulationDate = nextPeriodDate
          .add(Duration(days: cycleLength))
          .add(const Duration(days: -14));

      if (DateTime.now().isAfter(ovulationDate)) {
        DateTime nextPeriodDate = CalenderDateUtils.dateFormat
            .parse(getPreviousPeriodDay())
            .add(Duration(days: cycleLength));
        DateTime ovulationDate = nextPeriodDate
            .add(Duration(days: cycleLength))
            .add(const Duration(days: -14));

        return CalenderDateUtils.dateDayFormat(ovulationDate);
      } else {
        return CalenderDateUtils.dateDayFormat(ovulationDate);
      }
      // TODO Check if ovulation date is less then current day then return blank
    }
    return "";
  }

  /// Get symptoms patter for today or tomorrow
  Future<List<SymptomsCount>> getSymptomsPattern(
      {bool isForTomorrow = false}) async {
    int currentCycleDay = 0;
    List<SymptomsCount> symptomAnalysisData = [];
    // Find current cycle day
    final dbHelper = MenstrualCycleDbHelper.instance;
    String lastPeriodDate = await dbHelper.getLastPeriodDate();

    if (lastPeriodDate.isNotEmpty) {
      final difference =
          DateTime.now().difference(DateTime.parse(lastPeriodDate)).inDays;
      currentCycleDay = difference + 1;
      // Check past cycle length
      // if not same as current then calculate current cycle day based on past cycle
      int pastCycleLength = await getPreviousCycleLength();

      if (pastCycleLength > 0) {
        if (pastCycleLength != getCycleLength()) {
          currentCycleDay =
              ((currentCycleDay / getCycleLength()) * pastCycleLength).round();
        }
      }

      if (isForTomorrow) {
        // Check if period start from tomorrow then set currentCycleDay is 1
        if (currentCycleDay >= getCycleLength()) {
          currentCycleDay = 1;
        } else {
          currentCycleDay = currentCycleDay + 1;
        }
      }
    }

    if (currentCycleDay > 0) {
      final dbHelper = MenstrualCycleDbHelper.instance;
      String customerId = getCustomerId();
      Database? db = await dbHelper.database;
      final List<Map<String, dynamic>> queryResponse;
      queryResponse = await db!.rawQuery(
          "Select * from ${MenstrualCycleDbHelper.tableDailyUserSymptomsLogsData} WHERE ${MenstrualCycleDbHelper.columnCustomerId}='$customerId' AND ${MenstrualCycleDbHelper.columnCycleDay}=$currentCycleDay AND ${MenstrualCycleDbHelper.columnLogDate} < '$lastPeriodDate'");

      List<SymptomsData> pastSymptomsData = [];
      final encryption = Encryption.instance;

      // printMenstrualCycleLogs("Count: ${queryResponse.length}");
      List.generate(queryResponse.length, (i) {
        String symptomsData = encryption.decrypt(
            queryResponse[i][MenstrualCycleDbHelper.columnUserEncryptData]);
        List<dynamic> jsonData = json.decode(symptomsData.trim());
        pastSymptomsData.addAll(
            jsonData.map((symptom) => SymptomsData.fromMap(symptom)).toList());
      });

      for (var symptomsData in pastSymptomsData) {
        String symptomName = symptomsData.symptomName!;
        bool containsSymptom = symptomAnalysisData.any((symptom) =>
            symptom.name!.toLowerCase() == symptomName.toLowerCase());
        if (containsSymptom) {
          int index = symptomAnalysisData.indexWhere((symptom) =>
              symptom.name!.toLowerCase() == symptomName.toLowerCase());
          SymptomsCount oldSymptomsData = symptomAnalysisData[index];
          oldSymptomsData.occurrences = oldSymptomsData.occurrences! + 1;
          oldSymptomsData.accuracy =
              ((oldSymptomsData.occurrences! * 100) / queryResponse.length)
                  .toStringAsFixed(2);
          symptomAnalysisData.removeAt(index);
          symptomAnalysisData.add(oldSymptomsData);
        } else {
          symptomAnalysisData
              .add(SymptomsCount(name: symptomName, occurrences: 1));
        }
      }
    }
    // only those data which come more then 2  times
    List<SymptomsCount> newSymptomAnalysisData = [];
    for (var symptomsData in symptomAnalysisData) {
      if (symptomsData.occurrences! > 2) {
        newSymptomAnalysisData.add(symptomsData);
      }
    }
    symptomAnalysisData.clear();
    symptomAnalysisData.addAll(newSymptomAnalysisData);
    return symptomAnalysisData;
  }

  /// get current phase name based on cycle day
  Future<String> getCurrentPhaseName() async {
    int currentCycleDay = await getCurrentCycleDay();
    int cycleLength = getCycleLength();
    int menstruationDayCount = getPeriodDuration();

    int follicularEnd = menstruationDayCount + defaultFollicularDay;
    int ovulationEnd = follicularEnd + defaultOvulationDay;

    if (currentCycleDay <= 0) return "";
    if (currentCycleDay <= menstruationDayCount) {
      return WidgetBaseLanguage.menstruationLabel;
    }
    if (currentCycleDay <= follicularEnd) {
      return WidgetBaseLanguage.follicularPhaseLabel;
    }
    if (currentCycleDay <= ovulationEnd) {
      return WidgetBaseLanguage.ovulationLabel;
    }
    if (currentCycleDay <= cycleLength) {
      return WidgetBaseLanguage.lutealPhaseLabel;
    }

    return WidgetBaseLanguage.latePeriodLabel;
  }

  /// Return All UserSymptomsLogs for backup
  Future<List<UserSymptomsLogs>> getAllSymptomsData() async {
    List<UserSymptomsLogs> allUserSymptomsLogs = [];
    final mInstance = MenstrualCycleWidget.instance!;
    final dbHelper = MenstrualCycleDbHelper.instance;
    Database? db = await dbHelper.database;
    String customerId = mInstance.getCustomerId();

    final encryption = Encryption.instance;
    final List<Map<String, dynamic>> queryResponse = await db!.rawQuery(
        "Select * from ${MenstrualCycleDbHelper.tableDailyUserSymptomsLogsData} WHERE ${MenstrualCycleDbHelper.columnCustomerId}='$customerId'");
    List.generate(queryResponse.length, (i) {
      UserSymptomsLogs userSymptomsLogs = UserSymptomsLogs(symptomData: []);
      List<SymptomsData> symptomsDataList = [];
      String userDecryptData = encryption.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnUserEncryptData]);

      List<dynamic> jsonData = json.decode(userDecryptData.trim());
      //printMenstrualCycleLogs("jsonData ${jsonData}");
      symptomsDataList.addAll(
          jsonData.map((symptom) => SymptomsData.fromMap(symptom)).toList());

      userSymptomsLogs.meditationTime = encryption.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnMeditationTime]);

      userSymptomsLogs.bodyTemperature = encryption.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnBodyTemperature]);
      userSymptomsLogs.waterValue = encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWater]);
      userSymptomsLogs.weight = encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWeight]);
      userSymptomsLogs.weightUnit = encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWeightUnit]);
      userSymptomsLogs.sleepTime = encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnSleepTime]);
      userSymptomsLogs.waterUnit = encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWaterUnit]);
      userSymptomsLogs.bodyTemperatureUnit = encryption.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnBodyTemperatureUnit]);
      userSymptomsLogs.notes = encryption
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnNotes]);
      userSymptomsLogs.logDate =
          queryResponse[i][MenstrualCycleDbHelper.columnLogDate];
      userSymptomsLogs.cycleDay =
          queryResponse[i][MenstrualCycleDbHelper.columnLogDate];

      userSymptomsLogs.symptomData!.addAll(symptomsDataList);

      allUserSymptomsLogs.add(userSymptomsLogs);
    });

    return allUserSymptomsLogs;
  }

  /// Get All Menstrual cycle data for backup
  Future<Map<String, dynamic>> getBackupOfMenstrualCycleData(
      {bool isEncryptData = true}) async {
    List<UserSymptomsLogs> userSymptomsLogsData = await getAllSymptomsData();
    List<String> allPeriodsLogs = [];
    if (_lastPeriodDate.isNotEmpty) {
      final dbHelper = MenstrualCycleDbHelper.instance;
      allPeriodsLogs = await dbHelper.getPastPeriodDates();
    }

    Map<String, dynamic> allSummaryData = {
      "allTableData": {
        MenstrualCycleDbHelper.tableDailyUserSymptomsLogsData:
            userSymptomsLogsData.map((e) => e.toJson()).toList(),
        MenstrualCycleDbHelper.tableUserPeriodsLogsData: allPeriodsLogs,
      },
      "cycleLength": getCycleLength(),
      "periodDuration": getPeriodDuration(),
      "backupDate": "${currentDateFormat.format(DateTime.now())}"
    };

    if (isEncryptData) {
      return {
        "encryptedData":
            Encryption.instance.encrypt((jsonEncode(allSummaryData))),
      };
    }

    return allSummaryData;
  }

  /// Restore backup of user's data
  Future<bool> restoreBackupOfMenstrualCycleData(
      {bool isDecryptData = true,
      required Map<String, dynamic> backupData,
      required String customerId}) async {
    if (backupData.isEmpty) return false;

    final dbHelper = MenstrualCycleDbHelper.instance;

    Map<String, dynamic> decryptData = {};
    if (isDecryptData) {
      if (backupData.containsKey("encryptedData")) {
        try {
          decryptData = jsonDecode(
              Encryption.instance.decrypt(backupData["encryptedData"]));
        } catch (e) {
          throw "Error decrypting data: $e";
        }
      } else {
        throw "Encrypted data with 'encryptedData' key is required";
      }
    } else {
      decryptData = backupData;
    }
    // Restore Symptom Logs Data
    List<dynamic> symptomsLogsData = decryptData["allTableData"]
            [MenstrualCycleDbHelper.tableDailyUserSymptomsLogsData] ??
        [];
    final encryption = Encryption.instance;

    if (symptomsLogsData.isNotEmpty) {
      dbHelper.clearSymptomsLog(customerId);
      for (var log in symptomsLogsData) {
        UserSymptomsLogs userSymptomLog = UserSymptomsLogs.fromJson(log);
        String encryptedData =
            encryption.encrypt(json.encode(userSymptomLog.symptomData!));

        Map<String, dynamic> userData = {
          MenstrualCycleDbHelper.columnCustomerId:
              encryption.encrypt(customerId),
          MenstrualCycleDbHelper.columnUserEncryptData: encryptedData,
          MenstrualCycleDbHelper.columnMeditationTime:
              encryption.encrypt(userSymptomLog.meditationTime ?? ""),
          MenstrualCycleDbHelper.columnSleepTime:
              encryption.encrypt(userSymptomLog.sleepTime ?? ""),
          MenstrualCycleDbHelper.columnWater:
              encryption.encrypt(userSymptomLog.waterValue ?? ""),
          MenstrualCycleDbHelper.columnWaterUnit:
              encryption.encrypt(userSymptomLog.waterUnit ?? ""),
          MenstrualCycleDbHelper.columnBodyTemperatureUnit:
              encryption.encrypt(userSymptomLog.bodyTemperatureUnit ?? ""),
          MenstrualCycleDbHelper.columnWeightUnit:
              encryption.encrypt(userSymptomLog.weightUnit ?? ""),
          MenstrualCycleDbHelper.columnNotes:
              encryption.encrypt(userSymptomLog.notes ?? ""),
          MenstrualCycleDbHelper.columnWeight:
              encryption.encrypt(userSymptomLog.weight ?? ""),
          MenstrualCycleDbHelper.columnBodyTemperature:
              encryption.encrypt(userSymptomLog.bodyTemperature ?? ""),
          MenstrualCycleDbHelper.columnLogDate: userSymptomLog.logDate,
          MenstrualCycleDbHelper.columnCycleDay: userSymptomLog.cycleDay,
          MenstrualCycleDbHelper.columnCreatedDateTime:
              userSymptomLog.createdDate,
          MenstrualCycleDbHelper.columnIsCustomLog: userSymptomLog.isCustomLog
        };
        await dbHelper.insertDailyLog(
            userData, userSymptomLog.logDate ?? "", customerId);
      }
    }

    // Restore Period Logs Data
    List<dynamic> periodLogsData = decryptData["allTableData"]
            [MenstrualCycleDbHelper.tableUserPeriodsLogsData] ??
        [];
    if (periodLogsData.isNotEmpty) {
      dbHelper.clearPeriodLog(customerId);
      await dbHelper.insertOrUpdatePeriodLog(periodLogsData);
    }

    // Restore Cycle Length and Period Duration
    int cycleLength = decryptData["cycleLength"] ?? 28;
    int periodDuration = decryptData["periodDuration"] ?? 5;

    // Update cycle and period details
    await dbHelper.insertCurrentUserDetails(
        cycleLength: cycleLength,
        periodDuration: periodDuration,
        customerId: customerId);

    return false;
  }

  /// get matrix summary data btn two date
  Future<Map<String, dynamic>> getMenstrualCycleSummary(
      {DateTime? summaryStartDate,
      DateTime? summaryEndDate,
      bool fetchAllData = false}) async {
    int currentDayCycle = await getCurrentCycleDay();
    int avgPeriodDuration = await getAvgPeriodDuration();
    int avgCycleLength = await getAvgCycleLength();
    bool isPeriodStart = await isPeriodStarted();
    int periodDay = await getCurrentPeriodDay();
    bool ovulationDay = await isOvulationDay();
    int prevPeriodDuration = await getPreviousPeriodDuration();
    int prevCycleLength = await getPreviousCycleLength();
    double cycleCRS = await getCycleRegularityScore();
    String cycleCRSStatus = await getCycleRegularityScoreStatus();
    double periodPRS = await getPeriodRegularityScore();
    String periodPRSStatus = await getPeriodRegularityScoreStatus();
    String nextPeriodDay = await getNextPredictedPeriodDate();
    String nextOvulationDate = await getNextOvulationDate();
    bool periodStartFromToday = await isPeriodStartFromToday();
    bool periodStartFromTomorrow = await isPeriodStartFromTomorrow();
    List<SymptomsCount> todaySymptomsData = await getSymptomsPattern();
    List<SymptomsCount> tomorrowSymptomsData =
        await getSymptomsPattern(isForTomorrow: true);

    String currentPhase = await getCurrentPhaseName();

    Map<String, dynamic> summaryData = {
      "key_matrix": {
        "current_day_cycle": currentDayCycle,
        "current_phase": currentPhase,
        "avg_cycle_length": avgCycleLength,
        "avg_period_duration": avgPeriodDuration,
        "is_period_start": isPeriodStart,
        "period_day": periodDay,
        "is_ovulation_day": ovulationDay,
        "prev_cycle_length": prevCycleLength,
        "prev_period_duration": prevPeriodDuration,
        "cycle_regularity_score_status": cycleCRSStatus,
        "cycle_regularity_score": cycleCRS,
        "period_regularity_score_status": periodPRSStatus,
        "period_regularity_score": periodPRS,
      },
      "prediction_matrix": {
        "next_period_day": nextPeriodDay,
        "next_ovulation_day": nextOvulationDate,
        "is_period_start_from_today": periodStartFromToday,
        "is_period_start_from_tomorrow": periodStartFromTomorrow,
        "chances_of_pregnancy": getPregnancyChances(),
        "expected_pregnancy_test_date": getExpectedPregnancyTestDate(),
      },
      "pregnancy_matrix": {
        "current_day": getCurrentPregnancyDay(),
        "current_week": getCurrentPregnancyWeek(),
        "current_month": getCurrentPregnancyMonth(),
        "current_trimester": getCurrentTrimester(),
        "expected_due_date": getExpectedDueDate(),
      },
      "predicted_symptoms_pattern_today":
          todaySymptomsData.map((e) => e.toJson()).toList(),
      "predicted_symptoms_pattern_tomorrow":
          tomorrowSymptomsData.map((e) => e.toJson()).toList()
    };
    return summaryData;
  }

  /// get Current day of pregnancy
  Future<int> getCurrentPregnancyDay() async {
    final dbHelper = MenstrualCycleDbHelper.instance;
    int currentPregnancyDay = 0;
    String lastPeriodDate = await dbHelper.getLastPeriodDate();
    if (lastPeriodDate.isNotEmpty) {
      currentPregnancyDay =
          DateTime.now().difference(DateTime.parse(lastPeriodDate)).inDays + 1;
    }
    return currentPregnancyDay;
  }

  /// get Current week of pregnancy
  Future<int> getCurrentPregnancyWeek() async {
    final dbHelper = MenstrualCycleDbHelper.instance;
    int currentPregnancyWeek = 0;
    String lastPeriodDate = await dbHelper.getLastPeriodDate();
    if (lastPeriodDate.isNotEmpty) {
      final difference =
          DateTime.now().difference(DateTime.parse(lastPeriodDate)).inDays + 1;
      currentPregnancyWeek = (difference / 7).floor() + 1;
    }
    return currentPregnancyWeek;
  }

  /// get Current month of pregnancy
  Future<int> getCurrentPregnancyMonth() async {
    final dbHelper = MenstrualCycleDbHelper.instance;
    int currentPregnancyMonth = 0;
    String lastPeriodDate = await dbHelper.getLastPeriodDate();
    if (lastPeriodDate.isNotEmpty) {
      final difference =
          DateTime.now().difference(DateTime.parse(lastPeriodDate)).inDays + 1;
      currentPregnancyMonth = (difference / 30).ceil();
    }
    return currentPregnancyMonth;
  }

  /// get Current trimester of pregnancy
  Future<int> getCurrentTrimester() async {
    final dbHelper = MenstrualCycleDbHelper.instance;
    String lastPeriodDate = await dbHelper.getLastPeriodDate();
    if (lastPeriodDate.isNotEmpty) {
      final difference =
          DateTime.now().difference(DateTime.parse(lastPeriodDate)).inDays + 1;
      int gestationalWeeks = (difference / 7).floor() + 1;
      if (gestationalWeeks <= 12) {
        return 1;
      } else if (gestationalWeeks <= 27) {
        return 2;
      } else if (gestationalWeeks <= 40) {
        return 3;
      } else {
        return 4;
      }
    }
    return 0;
  }

  /// get expected pregnancy test date
  Future<String> getPregnancyChances() async {
    final dbHelper = MenstrualCycleDbHelper.instance;
    String pregnancyChancesStatus = "Low";
    String lastPeriodDate = await dbHelper.getLastPeriodDate();
    if (lastPeriodDate.isNotEmpty) {
      int totalDayBeforeOvulationStart =
          getFollicularDayCounts() + getPeriodDuration();
      int totalDayBeforeOvulationEnd =
          totalDayBeforeOvulationStart + defaultOvulationDay;

      final totalDiffCurrentLastPeriod =
          DateTime.now().difference(DateTime.parse(lastPeriodDate)).inDays + 1;
      if (totalDiffCurrentLastPeriod >= getPeriodDuration() &&
          totalDiffCurrentLastPeriod < totalDayBeforeOvulationStart) {
        pregnancyChancesStatus = "Medium";
      } else if (totalDiffCurrentLastPeriod >= totalDayBeforeOvulationStart &&
          totalDiffCurrentLastPeriod < totalDayBeforeOvulationEnd) {
        pregnancyChancesStatus = "High";
      } else if (totalDiffCurrentLastPeriod >= totalDayBeforeOvulationEnd &&
          totalDiffCurrentLastPeriod <= getCycleLength()) {
        pregnancyChancesStatus = "Low";
      }
    }
    return pregnancyChancesStatus;
  }

  /// get expected pregnancy test date
  Future<String> getExpectedPregnancyTestDate() async {
    final dbHelper = MenstrualCycleDbHelper.instance;
    String expectedTestDate = "";
    String lastPeriodDate = await dbHelper.getLastPeriodDate();
    if (lastPeriodDate.isNotEmpty) {
      expectedTestDate = CalenderDateUtils.dateWithYear(
          DateTime.parse(lastPeriodDate).add(Duration(days: getCycleLength())));
    }
    return expectedTestDate;
  }

  /// get Expected Due Date for baby
  Future<String> getExpectedDueDate() async {
    final dbHelper = MenstrualCycleDbHelper.instance;
    String expectedDueDate = "";
    String lastPeriodDate = await dbHelper.getLastPeriodDate();
    if (lastPeriodDate.isNotEmpty) {
      expectedDueDate = CalenderDateUtils.dateWithYear(
          DateTime.parse(lastPeriodDate).add(Duration(days: 280)));
    }
    return expectedDueDate;
  }

  /// get Symptoms Pattern based on cycle
  Future<List<SymptomsPattern>> getSymptomsPatternBasedOnCycleOld(
      {int numberOfCycle = 5}) async {
    List<SymptomsPattern> symptomsPatternList = [];
    // Fetch logged symptoms data
    List<UserLogReportData> loggedData = await getSymptomsLogReport(
        startDate: DateTime.now().add(const Duration(days: -10000)),
        endDate: DateTime.now());

    if (loggedData.isEmpty) return symptomsPatternList;
    List<SymptomsData> symptomsDataList = [];

    Set<String> uniqueSymptoms = {}; // Using Set to prevent duplicates
    // printMenstrualCycleLogs("loggedData count ${loggedData.length}");
    if (loggedData.isNotEmpty) {
      // generate logged symptoms list

      for (var report in loggedData) {
        for (var symptom in report.symptomsData ?? []) {
          String symptomName = symptom.symptomName?.toLowerCase() ?? '';
          if (symptomName.isNotEmpty && uniqueSymptoms.add(symptomName)) {
            symptomsDataList.add(SymptomsData(
                symptomId: symptom.symptomId,
                symptomName: symptom.symptomName));
          }
        }
      }
      // printMenstrualCycleLogs("symptomsDataList count ${symptomsDataList.length}");
      if (symptomsDataList.isNotEmpty) {
        // get symptoms data based on cycle
        List<PeriodsDateRange> periodRange = await getAllPeriodsDetails();
        for (var symptoms in symptomsDataList) {
          // printMenstrualCycleLogs("symptomName ${symptoms.symptomName}");
          SymptomsPattern symptomsPattern = SymptomsPattern(cycleData: []);
          int symptomsCount = 0;
          symptomsPattern.symptomsName = symptoms.symptomName;
          // printMenstrualCycleLogs("symptomsName ${symptoms.symptomName}");
          for (var periodRangeItem in periodRange) {
            // generate cycle data
            CycleData cycleData = CycleData(cycleDates: []);
            // generate symptoms data
            List<CycleDates> cycleDatesList = [];
            for (int i = 0; i <= (periodRangeItem.cycleLength ?? 0); i++) {
              CycleDates cycleDates = CycleDates();
              cycleDates.cycleDate = CalenderDateUtils.dateDayFormat(
                  DateTime.parse(periodRangeItem.cycleStartDate!)
                      .add(Duration(days: i)));
              //printMenstrualCycleLogs("cycleDate ${ cycleDates.cycleDate}");
              cycleDates.isFoundSymptoms = false;

              UserLogReportData? selectedObject = loggedData.firstWhere(
                (obj) => obj.logDate == DateTime.parse(cycleDates.cycleDate!),
                orElse: () => UserLogReportData(symptomsData: []),
              );

              if (selectedObject.symptomsData!.isNotEmpty) {
                for (SymptomsData symptom
                    in selectedObject.symptomsData ?? []) {
                  bool exists = symptom.symptomName!.toLowerCase() ==
                      symptoms.symptomName!.toLowerCase();
                  if (exists) {
                    symptomsCount = symptomsCount + 1;
                    cycleDates.isFoundSymptoms = true;
                  }
                }
              }
              cycleDatesList.add(cycleDates);
            }
            cycleData.cycleDates!.addAll(cycleDatesList);
            cycleData.cycleStartDate = periodRangeItem.cycleStartDate;
            cycleData.cycleEndDate = periodRangeItem.cycleEndDate;
            cycleData.isCurrentCycle = (periodRangeItem.cycleEndDate != null &&
                    periodRangeItem.cycleEndDate!.isNotEmpty)
                ? false
                : true;
            symptomsPattern.cycleData!.add(cycleData);
          }
          symptomsPattern.numberOfCount = symptomsCount;
          symptomsPatternList.add(symptomsPattern);
        }
      }
    }
    return symptomsPatternList;
  }

  Future<int> getPhaseId() async {
    final dbHelper = MenstrualCycleDbHelper.instance;
    final now = DateTime.now();
    final logDate = defaultDateFormat.format(now);

    final lastPeriodDate = await dbHelper.getLastPeriodDate();
    if (lastPeriodDate.isEmpty) {
      return 5; // Default phase if no data is available
    }
    final lastPeriodDay =
        await dbHelper.getLastPeriodDateFromInputDate(logDate);
    if (lastPeriodDay.isEmpty) return 5;

    final difference = DateTime.parse(logDate)
        .difference(DateTime.parse(lastPeriodDay))
        .inDays;
    final intCycleDay = difference < 0 ? 0 : difference + 1;

    if (intCycleDay > 0 && intCycleDay < 6) return 1;
    if (intCycleDay < 13) return 2;
    if (intCycleDay < 16) return 3;
    if (intCycleDay < 30) return 4;
    return 5;
  }

  Future<List<SymptomsPattern>> getSymptomsPatternBasedOnCycle(
      {int numberOfCycle = 5}) async {
    if (numberOfCycle < 1) {
      throw "Required valid number of cycle day";
    }

    List<SymptomsPattern> symptomsPatternList = [];
    // Fetch logged symptoms data
    List<UserLogReportData> loggedData = await getSymptomsLogReport(
        startDate: DateTime.now().add(const Duration(days: -10000)),
        endDate: DateTime.now());

    if (loggedData.isEmpty) return symptomsPatternList;

    int phaseId = await getPhaseId();
    List<SymptomsData> listSymptomsDataBasedOnPhase = defaultSymptomsData
        .expand((category) => category.symptomsData ?? <SymptomsData>[])
        .where(
            (symptomsData) => symptomsData.phaseIds?.contains(phaseId) ?? false)
        .toList();

    Map<String, SymptomsData> symptomsMap = {};
    Set<String> phaseSymptomsSet = {
      for (var phaseSymptom in listSymptomsDataBasedOnPhase)
        phaseSymptom.symptomName?.toLowerCase() ?? ''
    };

    for (var report in loggedData) {
      for (var symptom in report.symptomsData ?? []) {
        String symptomNameLower = symptom.symptomName?.toLowerCase() ?? '';
        if (phaseSymptomsSet.contains(symptomNameLower)) {
          symptomsMap[symptomNameLower] = symptom;
        }
      }
    }

    if (symptomsMap.isEmpty) return symptomsPatternList;

    // Create a map of log data for quick lookup
    Map<String, List<SymptomsData>> logDataMap = {
      for (var log in loggedData)
        CalenderDateUtils.dateDayFormat(log.logDate!): log.symptomsData ?? []
    };

    // get symptoms data based on cycle
    List<PeriodsDateRange> periodRange = await getAllPeriodsDetails();
    for (var symptoms in symptomsMap.values) {
      SymptomsPattern symptomsPattern = SymptomsPattern(cycleData: []);
      int symptomsCount = 0;
      symptomsPattern.symptomsName = symptoms.symptomName;
      int cycleCount = 1;
      x:
      for (var periodRangeItem in periodRange) {
        // generate cycle data
        if (cycleCount > numberOfCycle) {
          break x;
        }
        CycleData cycleData = CycleData(cycleDates: []);
        // generate symptoms data
        List<CycleDates> cycleDatesList = [];
        for (int i = 0; i < (periodRangeItem.cycleLength ?? 0); i++) {
          CycleDates cycleDates = CycleDates();
          cycleDates.cycleDate = CalenderDateUtils.dateDayFormat(
              DateTime.parse(periodRangeItem.cycleStartDate!)
                  .add(Duration(days: i)));
          cycleDates.isFoundSymptoms = false;

          String cycleDate = CalenderDateUtils.dateDayFormat(
              DateTime.parse(periodRangeItem.cycleStartDate!)
                  .add(Duration(days: i)));

          bool isFound = logDataMap[cycleDate]?.any((s) =>
                  s.symptomName!.toLowerCase() ==
                  symptoms.symptomName!.toLowerCase()) ??
              false;

          if (isFound) {
            symptomsCount = symptomsCount + 1;
            cycleDates.isFoundSymptoms = true;
          }

          cycleDatesList.add(cycleDates);
        }
        cycleData.cycleDates!.addAll(cycleDatesList);
        cycleData.cycleStartDate = periodRangeItem.cycleStartDate;
        cycleData.cycleEndDate = periodRangeItem.cycleEndDate;
        cycleData.isCurrentCycle = (periodRangeItem.cycleEndDate != null &&
                periodRangeItem.cycleEndDate!.isNotEmpty)
            ? false
            : true;
        symptomsPattern.cycleData!.add(cycleData);
        cycleCount = cycleCount + 1;
      }
      symptomsPattern.numberOfCount = symptomsCount;
      symptomsPatternList.add(symptomsPattern);
    }

    return symptomsPatternList;
  }

  /// Clear all logs data
  Future<void> clearAllData() async {
    // clear data
    final dbHelper = MenstrualCycleDbHelper.instance;
    String encryptedUserid = getCustomerId();
    // Clear period data
    await dbHelper.clearPeriodLog(encryptedUserid);
    // Clear symptoms data
    await dbHelper.clearSymptomsLog(encryptedUserid);
  }

  Future<void> addDummyData(
      {int numberOfDay = 365,
      Function? onSuccess,
      Function? onError,
      List<SymptomsData>? symptomsData}) async {
    if (numberOfDay < 1) {
      throw "Required valid day";
    }

    // clear data
    final dbHelper = MenstrualCycleDbHelper.instance;
    String encryptedUserid = getCustomerId();
    // Clear period data
    await dbHelper.clearPeriodLog(encryptedUserid);
    // Clear symptoms data
    await dbHelper.clearSymptomsLog(encryptedUserid);

    final random = Random();
    int randomPeriodLength = 4 + random.nextInt(1);
    int randomCycleLength = 25 + random.nextInt(5);
    //printMenstrualCycleLogs("-------- Start Process --------");
    try {
      // Start period data

      for (int i = numberOfDay; i > 0; i--) {
        DateTime periodStartDate = DateTime.now().add(Duration(days: -i));
        /*printMenstrualCycleLogs(
            "-------- Period Day (${CalenderDateUtils.dateDayFormat(periodStartDate)}) -------- $i");
        printMenstrualCycleLogs(
            "-------- randomCycleLength $randomCycleLength --------");*/
        List<DateTime> selectedPeriodsDate = [];
        selectedPeriodsDate.add(periodStartDate);
        for (int index = 1; index <= randomPeriodLength; index++) {
          DateTime nextPeriodDate = periodStartDate.add(Duration(days: index));
          /* printMenstrualCycleLogs(
              "-------- Next Period Day (${CalenderDateUtils.dateDayFormat(nextPeriodDate)}) --------");*/
          selectedPeriodsDate.add(nextPeriodDate);
        }

        await dbHelper.insertPeriodLog(selectedPeriodsDate);
        // Start Symptoms data
        for (int cycleIndex = 0; cycleIndex < randomCycleLength; cycleIndex++) {
          await saveSymptomsLogs(
            userSymptomsData: getRandomSymptomsData(symptomsData),
            onError: () {},
            waterValue: "${random.nextInt(20)}",
            weight: "${20 + random.nextInt(60)}.0",
            bodyTemperature: "${35 + random.nextInt(40)}.${random.nextInt(99)}",
            meditationTime: "${random.nextInt(120)}",
            sleepBedTime: TimeOfDay(
                minute: 0 + random.nextInt(55), hour: 19 + random.nextInt(3)),
            sleepWakeUpTime: TimeOfDay(
                minute: 0 + random.nextInt(55), hour: 4 + random.nextInt(3)),
            cycleDay: cycleIndex + 1,
            symptomsLogDate: periodStartDate.add(Duration(days: cycleIndex)),
            onSuccess: (id) {},
          );
        }

        i = i - randomCycleLength + 1; // length of cycle
        randomPeriodLength = 4 + random.nextInt(2);
        randomCycleLength = 25 + random.nextInt(5);
      }
    } catch (e) {
      onError!.call();
    }
    calculateLastPeriodDate();
    onSuccess!.call();
    //printMenstrualCycleLogs("-------- End Process --------");
  }

  List<SymptomsData> getRandomSymptomsData(List<SymptomsData>? symptomsData) {
    List<SymptomsData> generatedData = [];
    List<SymptomsData> randomData = [];

    if (symptomsData != null) {
      generatedData.addAll(symptomsData);
    } else {
      for (int i = 0; i < defaultSymptomsData.length; i++) {
        generatedData.addAll(defaultSymptomsData[i].symptomsData!);
      }
    }

    randomData.addAll(getRandomItems(generatedData, 20));

    return randomData;
  }

  List<SymptomsData> getRandomItems(List<SymptomsData> list, int count) {
    final random = Random();
    final Set<int> selectedIndexes = {};

    while (selectedIndexes.length < count) {
      selectedIndexes.add(random.nextInt(list.length));
    }

    return selectedIndexes.map((index) => list[index]).toList();
  }

  /// Check if have period graph data
  Future<bool> hasPeriodGraphData() async {
    return (await getAllPeriodsDetails()).isNotEmpty;
  }

  /// Check if have cycle history graph data
  Future<bool> hasCycleHistoryGraphData() async {
    return (await getAllPeriodsDetails()).isNotEmpty;
  }

  /// Check if have cycle trends graph data
  Future<bool> hasCycleTrendsGraphData() async {
    return (await getAllPeriodsDetails()).isNotEmpty;
  }

  /// Check if have body temperature graph data
  Future<bool> hasBodyTemperatureGraphData() async {
    return (await getTemperatureLog(
            startDate: DateTime.now().add(const Duration(days: -1000)),
            endDate: DateTime.now()))
        .isNotEmpty;
  }

  /// Check if have meditation graph data
  Future<bool> hasMeditationGraphData() async {
    return (await getMeditationLog(
            startDate: DateTime.now().add(const Duration(days: -1000)),
            endDate: DateTime.now()))
        .isNotEmpty;
  }

  /// Check if have sleep graph data
  Future<bool> hasSleepGraphData() async {
    return (await getSleepLog(
            startDate: DateTime.now().add(const Duration(days: -1000)),
            endDate: DateTime.now()))
        .isNotEmpty;
  }

  /// Check if have water graph data
  Future<bool> hasWaterGraphData() async {
    return (await getDrinkWaterLog(
            startDate: DateTime.now().add(const Duration(days: -1000)),
            endDate: DateTime.now()))
        .isNotEmpty;
  }

  /// Check if have weight graph data
  Future<bool> hasWeightGraphData() async {
    return (await getWeightLog(
            startDate: DateTime.now().add(const Duration(days: -1000)),
            endDate: DateTime.now()))
        .isNotEmpty;
  }

/* DateTime getCustomOvulationDate({DateTime? lastPeriodDate, int cycleLength = 28}) {
    DateTime ovulationDay = lastPeriodDate!;
    ovulationDay.add(Duration(days: cycleLength));
    ovulationDay.add(const Duration(days: -16));
    return ovulationDay;
  }

  DateTime getCustomFertileWindow() {
    DateTime currentDay = DateTime.now();
    return currentDay;
  }

  DateTime getCustomPregnancyDueDate() {
    DateTime currentDay = DateTime.now();
    return currentDay;
  }

  List<DateTime> getNextPeriodRange() {
   // DateTime currentDay = DateTime.now();
    return [];
  }

  DateTime getCustomNextPeriodDate() {
    DateTime currentDay = DateTime.now();
    return currentDay;
  }

  DateTime getCustomImplementationDate() {
    DateTime currentDay = DateTime.now();
    return currentDay;
  }*/
}
