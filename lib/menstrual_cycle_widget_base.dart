import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'menstrual_cycle_widget.dart';
import 'ui/model/body_temperature_data.dart';
import 'ui/model/sleep_data.dart';
import 'ui/model/water_data.dart';

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

  // last period length
  int lastPeriodLength = 0;

  // all past periods date
  List<String> pastAllPeriodDays = [];

  // customer id for storing date
  String _customerId = "0"; // Default is Zero

  static MenstrualCycleWidget? instance;

  // Return previous period day into string
  String getPreviousPeriodDay() => _lastPeriodDate;

  int getPreviousCycleLength() => lastPeriodLength;

  String getSecretKey() => _aesSecretKey;

  int getPeriodDuration() => _periodDuration;

  int getCycleLength() => _cycleLength;

  String getIvKey() => _aesIvKey;

  MenstrualCycleWidget._();

  /// Initialize MenstrualCycleWidget
  static MenstrualCycleWidget init(
      {required String? secretKey, required String? ivKey}) {
    assert(secretKey!.isNotEmpty, Strings.secretKeyLabel);
    assert(ivKey!.isNotEmpty, Strings.ivKeyLabel);
    MenstrualCycleWidget.instance ??= MenstrualCycleWidget._();
    MenstrualCycleWidget.instance!
        .initialize(secretKey: secretKey!, ivKey: ivKey!);
    return MenstrualCycleWidget.instance!;
  }

  void initialize({required String secretKey, required String ivKey}) {
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
      bool isClearData = false}) async {
    assert(_cycleLength > 0, Strings.totalCycleDaysLabel);
    assert(_periodDuration > 0, Strings.totalPeriodDaysLabel);
    // printLogs("userId $userId");
    if (customerId!.isNotEmpty) {
      _customerId = customerId;
    }
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
    return pastAllPeriodDays;
  }

  String getCustomerId() {
    return Encryption.instance.encrypt(_customerId);
  }

  /// ----------------------- Custom Functions -----------------------///

  String next(int min, int max) {
    final random = Random();
    return "${min + random.nextInt(max - min)}";
  }

  /// insert user's period data on userId and log date
  saveSymptomsLogs({
    required List<SymptomsData>? userSymptomsData,
    required Function? onSuccess,
    required Function? onError,
    DateTime? symptomsLogDate,
    String meditationTime = "0",
    TimeOfDay? sleepWakeUpTime,
    TimeOfDay? sleepBedTime,
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
    String sleepTime = "";
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

  /// get Today's symptoms logs
  Future<List<UserLogReportData>> getTodaySymptomsLog() async {
    List<UserLogReportData> usersLogDataList = await getSymptomsLogReport(
        startDate: DateTime.now(), endDate: DateTime.now());
    return usersLogDataList;
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
        printLogs("logReportData.waterValue ${logReportData.waterValue}");

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
            CalenderDateUtils.dateWithYear(logReportData.logDate!);
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

    printLogs("min_temp $minValue");
    printLogs("max_temp $maxValue");

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

      // printLogs("sleepBedTime ${sleepData.sleepBedTime}");
      // printLogs("wakeUpTime ${sleepData.wakeUpTime}");

      sleepData.dateTime =
          CalenderDateUtils.dateWithYear(logReportData.logDate!);

      sleepListData.add(sleepData);
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
            CalenderDateUtils.dateWithYear(logReportData.logDate!);
        bodyTemperatureData.bodyTemperatureUnit =
            bodyTemperatureUnits.toString();

        bodyTemperatureListData.add(bodyTemperatureData);
      }
    }
    printLogs("bodyTemperatureListData ${bodyTemperatureListData.length}");
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
    final mInstance = MenstrualCycleWidget.instance!;
    String customerId = mInstance.getCustomerId();
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

  /// get last period duration. Default is 0
  Future<int> getPreviousPeriodDuration() async {
    List<PeriodsDateRange> allPeriodRange = await getAllPeriodsDetails();
    int lastPeriodDuration = 0;
    if (allPeriodRange.isNotEmpty) {
      lastPeriodDuration = allPeriodRange[0].allPeriodDates!.length;
    }
    return lastPeriodDuration;
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
            /* printLogs("inDays: $inDays");
            printLogs(
                "previousDate: ${CalenderDateUtils.dateDayFormat(previousDate)}");
            printLogs(
                "currentDate: ${CalenderDateUtils.dateDayFormat(currentDate)}");*/
            if (inDays > 1) {
              periodDates = [];
              periodDuration = 1;
              periodsDateRange.cycleDuration = inDays;
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
              periodsDateRange.cycleDuration = inDays;
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
        periodsDateRange.cycleDuration = DateTime.now()
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
        periodsDateRange.cycleDuration = 1;
        periodsDateRange.allPeriodDates!
            .add(CalenderDateUtils.dateDayFormat(periodDateRange[0]));
        listPeriodsDateRange.add(periodsDateRange);
      }
    }
    listPeriodsDateRange = listPeriodsDateRange.reversed.toList();
    return listPeriodsDateRange;
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
