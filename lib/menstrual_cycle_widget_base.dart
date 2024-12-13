import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import 'menstrual_cycle_widget.dart';
import 'ui/model/body_temperature_data.dart';
import 'ui/model/meditation_data.dart';
import 'ui/model/sleep_data.dart';
import 'ui/model/symptoms_count.dart';
import 'ui/model/user_symptoms_logs.dart';
import 'ui/model/water_data.dart';
import 'ui/model/weight_data.dart';

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

  // all past periods date
  List<String> pastAllPeriodDays = [];

  // customer id for storing date
  String _customerId = "0"; // Default is Zero

  // Current language
  static Languages currentLanguage = Languages.english;

  static MenstrualCycleWidget? instance;

  // Return previous period day into string
  String getPreviousPeriodDay() => _lastPeriodDate;

  String getSecretKey() => _aesSecretKey;

  int getPeriodDuration() => _periodDuration;

  int getCycleLength() => _cycleLength;

  String getIvKey() => _aesIvKey;

  MenstrualCycleWidget._();

  /// Initialize MenstrualCycleWidget
  static MenstrualCycleWidget init({
    required String? secretKey,
    required String? ivKey,
  }) {
    assert(secretKey!.isNotEmpty, Strings.secretKeyLabel);
    assert(ivKey!.isNotEmpty, Strings.ivKeyLabel);
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

  /// Update configuration of MenstrualCycleWidget
  void updateConfiguration(
      {required int? cycleLength,
      required int? periodDuration,
      String? customerId = "0",
      DateTime? lastPeriodDate,
      bool isClearData = false,
      Languages defaultLanguage = Languages.english}) async {
    assert(_cycleLength > 0, Strings.totalCycleDaysLabel);
    assert(_periodDuration > 0, Strings.totalPeriodDaysLabel);
    // printLogs("userId $userId");
    if (customerId!.isNotEmpty) {
      _customerId = customerId;
    }
    currentLanguage = defaultLanguage;
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
        throw Strings.errorInvalidSymptomsLogDate;
      }
    }

    if (sleepBedTime != null && sleepWakeUpTime != null) {
      sleepTime =
          "${sleepBedTime.hour}:${sleepBedTime.minute}T${sleepWakeUpTime.hour}:${sleepWakeUpTime.minute}";
    }

    final dbHelper = MenstrualCycleDbHelper.instance;

    currentDate = currentDateFormat.format(DateTime.now());

    String encryptedData =
        Encryption.instance.encrypt(json.encode(userSymptomsData));

    Map<String, dynamic> userData = {
      MenstrualCycleDbHelper.columnCustomerId: getCustomerId(),
      MenstrualCycleDbHelper.columnUserEncryptData: encryptedData,
      MenstrualCycleDbHelper.columnMeditationTime:
          Encryption.instance.encrypt(meditationTime),
      MenstrualCycleDbHelper.columnSleepTime:
          Encryption.instance.encrypt(sleepTime),
      MenstrualCycleDbHelper.columnWater:
          Encryption.instance.encrypt(waterValue),
      MenstrualCycleDbHelper.columnWaterUnit:
          Encryption.instance.encrypt(waterUnit.toString()),
      MenstrualCycleDbHelper.columnBodyTemperatureUnit:
          Encryption.instance.encrypt(bodyTemperatureUnit.toString()),
      MenstrualCycleDbHelper.columnWeightUnit:
          Encryption.instance.encrypt(weightUnit.toString()),
      MenstrualCycleDbHelper.columnNotes:
          Encryption.instance.encrypt(customNotes),
      MenstrualCycleDbHelper.columnWeight: Encryption.instance.encrypt(weight),
      MenstrualCycleDbHelper.columnBodyTemperature:
          Encryption.instance.encrypt(bodyTemperature),
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

  /// Return UserSymptomsLogs based on log date
  Future<UserSymptomsLogs> getSymptomsData(DateTime? symptomsLogDate) async {
    String logDate = "";
    if (symptomsLogDate != null) {
      try {
        logDate = defaultDateFormat.format(symptomsLogDate);
      } catch (e) {
        throw Strings.errorInvalidSymptomsLogDate;
      }
    } else {
      throw Strings.errorInvalidSymptomsLogDate;
    }

    UserSymptomsLogs userSymptomsLogs = UserSymptomsLogs(symptomData: []);
    final mInstance = MenstrualCycleWidget.instance!;
    final dbHelper = MenstrualCycleDbHelper.instance;
    Database? db = await dbHelper.database;
    String customerId = mInstance.getCustomerId();
    List<SymptomsData> symptomsDataList = [];

    final List<Map<String, dynamic>> queryResponse = await db!.rawQuery(
        "Select * from ${MenstrualCycleDbHelper.tableDailyUserSymptomsLogsData} WHERE ${MenstrualCycleDbHelper.columnLogDate}='$logDate' AND ${MenstrualCycleDbHelper.columnCustomerId}='$customerId'");
    List.generate(queryResponse.length, (i) {
      String userDecryptData = Encryption.instance.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnUserEncryptData]);

      List<dynamic> jsonData = json.decode(userDecryptData.trim());
      //printMenstrualCycleLogs("jsonData ${jsonData}");
      symptomsDataList.addAll(
          jsonData.map((symptom) => SymptomsData.fromMap(symptom)).toList());

      userSymptomsLogs.meditationTime = Encryption.instance.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnMeditationTime]);

      userSymptomsLogs.bodyTemperature = Encryption.instance.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnBodyTemperature]);
      userSymptomsLogs.waterValue = Encryption.instance
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWater]);
      userSymptomsLogs.weight = Encryption.instance
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWeight]);
      userSymptomsLogs.weightUnit = Encryption.instance
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWeightUnit]);
      userSymptomsLogs.sleepTime = Encryption.instance
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnSleepTime]);
      userSymptomsLogs.waterUnit = Encryption.instance
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWaterUnit]);
      userSymptomsLogs.bodyTemperatureUnit = Encryption.instance.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnBodyTemperatureUnit]);
      userSymptomsLogs.notes = Encryption.instance
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnNotes]);
    });

    userSymptomsLogs.logDate = logDate;

    userSymptomsLogs.symptomData!.addAll(symptomsDataList);
    return userSymptomsLogs;
  }

  /// get Today's symptoms ids
  Future<List<int>> getSymptomsId(DateTime? symptomsLogDate) async {
    if (symptomsLogDate == null) {
      throw Strings.errorInvalidSymptomsLogDate;
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

    List.generate(queryResponse.length, (i) {
      String weightUnit = Encryption.instance
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWeightUnit]);
      double weightValue = double.parse(Encryption.instance
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

    List.generate(queryResponse.length, (i) {
      double meditationTime = double.parse(Encryption.instance.decrypt(
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

    List.generate(queryResponse.length, (i) {
      String waterUnit = Encryption.instance
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWaterUnit]);
      double drinkWaterValue = double.parse(Encryption.instance
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

    List.generate(queryResponse.length, (i) {
      String sleepTime = Encryption.instance
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

    List.generate(queryResponse.length, (i) {
      String tempUnit = Encryption.instance.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnBodyTemperatureUnit]);
      double tempValue = double.parse(Encryption.instance.decrypt(
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
    Database? db = await dbHelper.database;
    final List<Map<String, dynamic>> queryResponse;
    if (isRequiredPagination) {
      queryResponse = await db!.rawQuery(
          "Select * from ${MenstrualCycleDbHelper.tableDailyUserSymptomsLogsData} WHERE ${MenstrualCycleDbHelper.columnCustomerId}='$customerId' AND ${MenstrualCycleDbHelper.columnLogDate} BETWEEN '$logStartDate' AND '$logEndDate' ORDER BY ${MenstrualCycleDbHelper.columnLogDate} DESC LIMIT $itemsPerPage OFFSET $offset");
    } else {
      queryResponse = await db!.rawQuery(
          "Select * from ${MenstrualCycleDbHelper.tableDailyUserSymptomsLogsData} WHERE ${MenstrualCycleDbHelper.columnCustomerId}='$customerId' AND ${MenstrualCycleDbHelper.columnLogDate} BETWEEN '$logStartDate' AND '$logEndDate'");
    }
    List.generate(queryResponse.length, (i) {
      UserLogReportData userLogsData = UserLogReportData();
      userLogsData.id = queryResponse[i][MenstrualCycleDbHelper.columnID];
      userLogsData.customerId =
          queryResponse[i][MenstrualCycleDbHelper.columnCustomerId];
      String symptomsData = Encryption.instance.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnUserEncryptData]);
      List<dynamic> jsonData = json.decode(symptomsData.trim());
      userLogsData.symptomsData =
          jsonData.map((symptom) => SymptomsData.fromMap(symptom)).toList();
      userLogsData.bodyTemperature = Encryption.instance.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnBodyTemperature]);
      userLogsData.bodyTemperatureUnit = Encryption.instance.decrypt(
          queryResponse[i][MenstrualCycleDbHelper.columnBodyTemperatureUnit]);
      userLogsData.weightUnit = Encryption.instance
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWeightUnit]);
      userLogsData.weight = Encryption.instance
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWeight]);
      userLogsData.waterUnit = Encryption.instance
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWaterUnit]);
      userLogsData.waterValue = Encryption.instance
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnWater]);
      userLogsData.sleepTime = Encryption.instance
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnSleepTime]);
      userLogsData.notes = Encryption.instance
          .decrypt(queryResponse[i][MenstrualCycleDbHelper.columnNotes]);
      userLogsData.meditationTime = Encryption.instance.decrypt(
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
              periodsDateRange.cycleLength = inDays;
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
      cycleCRSStatus = "Regular";
    } else if (cycleCRS > 74) {
      cycleCRSStatus = "Normal";
    } else if (cycleCRS > 0) {
      cycleCRSStatus = "Irregular";
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
      periodCRSStatus = "Regular";
    } else if (periodPRS > 74) {
      periodCRSStatus = "Normal";
    } else if (periodPRS > 0) {
      periodCRSStatus = "Irregular";
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
    if (_lastPeriodDate.isNotEmpty) {
      int cycleLength = getCycleLength();
      DateTime nextPeriodDate = DateFormat("yyyy-MM-dd")
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
      String formattedToday = DateFormat('yyyy-MM-dd').format(today);
      String formattedInput =
          DateFormat('yyyy-MM-dd').format(DateTime.parse(nextPeriodDate));
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
      String formattedTomorrow = DateFormat('yyyy-MM-dd').format(tomorrowDate);
      String formattedInput =
          DateFormat('yyyy-MM-dd').format(DateTime.parse(nextPeriodDate));
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
          DateFormat("yyyy-MM-dd").parse(getPreviousPeriodDay());

      DateTime ovulationDate = nextPeriodDate
          .add(Duration(days: cycleLength))
          .add(const Duration(days: -14));

      if (DateTime.now().isAfter(ovulationDate)) {
        DateTime nextPeriodDate = DateFormat("yyyy-MM-dd")
            .parse(getPreviousPeriodDay())
            .add(Duration(days: cycleLength));
        DateTime ovulationDate = nextPeriodDate
            .add(Duration(days: cycleLength))
            .add(const Duration(days: -14));

        return CalenderDateUtils.dateDayFormat(ovulationDate);
      } else {
        return CalenderDateUtils.dateDayFormat(ovulationDate);
      }
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
        currentCycleDay = currentCycleDay + 1;
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

      List.generate(queryResponse.length, (i) {
        String symptomsData = Encryption.instance.decrypt(
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
          symptomAnalysisData.removeAt(index);
          symptomAnalysisData.add(oldSymptomsData);
        } else {
          symptomAnalysisData
              .add(SymptomsCount(name: symptomName, occurrences: 1));
        }
      }
    }
    List<SymptomsCount> newSymptomAnalysisData =
        []; // only those data which come more then 2  times
    for (var symptomsData in symptomAnalysisData) {
      if (symptomsData.occurrences! > 2) {
        newSymptomAnalysisData.add(symptomsData);
      }
    }
    symptomAnalysisData.clear();
    symptomAnalysisData.addAll(newSymptomAnalysisData);
    return symptomAnalysisData;
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

    Map<String, dynamic> summaryData = {
      "key_matrix": {
        "current_day_cycle": currentDayCycle,
        "current_phase": "", // TODO
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
        "ovulation_day": nextOvulationDate,
        "is_period_start_from_today": periodStartFromToday,
        "is_period_start_from_tomorrow": periodStartFromTomorrow
      },
      "predicted_symptoms_pattern_today":
          todaySymptomsData.map((e) => e.toJson()).toList()
      /*"predicted_symptoms_pattern_today":
          jsonEncode(todaySymptomsData.map((e) => e.toJson()).toList())*/
    };
    return summaryData;
  }

  Future<void> addDummyData(
      {int numberOfDay = 28,
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
        /* printMenstrualCycleLogs(
            "-------- Period Day (${CalenderDateUtils.dateDayFormat(periodStartDate)}) --------");
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
