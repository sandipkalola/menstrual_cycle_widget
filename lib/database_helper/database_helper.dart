import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../menstrual_cycle_widget.dart';

class MenstrualCycleDbHelper {
  static const _databaseName = "MenstrualCycleAppDatabase.db";
  static const _databaseVersion = 2;

  /// Common Columns
  static const String columnID = "id";
  static const String columnCreatedDateTime = "createdAt";
  static const String columnCustomerId = "customerId";

  /// Symptoms data table
  static const String columnSymptomId = "symptomId";
  static const String columnSymptomName = "symptomName";
  static const String columnCategoryId = "categoryId";
  static const String columnIsVisibleCategory = "isVisibleCategory";
  static const String columnCategoryName = "categoryName";
  static const String columnCategoryColor = "categoryColor";
  static const String columnAssetPath = "assetPath";
  static const String columnIsCustomType = "isCustomType";

  /// daily Logs Table and columns
  static const String tableDailyUserSymptomsLogsData =
      "tblDailyUserSymptomsLogs";
  static const String columnUserEncryptData = "symptomData";
  static const String columnUserSymptomIds = "symptomIds";
  static const String columnMeditationTime = "meditationTime";
  static const String columnSleepTime = "sleepTime";
  static const String columnWater = "waterValue";
  static const String columnBodyTemperatureUnit = "bodyTemperatureUnit";
  static const String columnWaterUnit = "waterUnit";
  static const String columnWeightUnit = "weightUnit";
  static const String columnNotes = "notes";
  static const String columnWeight = "weight";
  static const String columnIsCustomLog = "isCustomLog";
  static const String columnBodyTemperature = "bodyTemperature";
  static const String columnLogDate = "logDate";

  static const String createTableDailyUserSymptomsLogsData =
      "CREATE TABLE $tableDailyUserSymptomsLogsData ("
      "$columnID INTEGER PRIMARY KEY,"
      "$columnCustomerId TEXT DEFAULT '0', "
      "$columnUserEncryptData TEXT, "
      "$columnMeditationTime TEXT, "
      "$columnSleepTime TEXT, "
      "$columnBodyTemperatureUnit TEXT, "
      "$columnWaterUnit TEXT, "
      "$columnWeightUnit TEXT, "
      "$columnWater TEXT, "
      "$columnNotes TEXT, "
      "$columnWeight TEXT, "
      "$columnBodyTemperature TEXT, "
      "$columnLogDate TEXT, "
      "$columnIsCustomLog TEXT DEFAULT '0', "
      "$columnCreatedDateTime TEXT)";

  /// periods log table  and column
  static const String tableUserPeriodsLogsData = "tblUserPeriodsLogs";
  static const String columnPeriodEncryptDate = "periodDate";
  static const String createTableUserPeriodsLogsData =
      "CREATE TABLE $tableUserPeriodsLogsData ("
      "$columnID INTEGER PRIMARY KEY,"
      "$columnCustomerId TEXT DEFAULT '0', "
      "$columnPeriodEncryptDate TEXT)";

  /// current user table  and column
  static const String tableCurrentUserDetails = "tblCurrentUserDetails";
  static const String columnCycleLength = "cycleLength";
  static const String columnPeriodDuration = "periodDuration";
  static const String createTableCurrentUserDetails =
      "CREATE TABLE $tableCurrentUserDetails ("
      "$columnID INTEGER PRIMARY KEY,"
      "$columnCustomerId TEXT DEFAULT '0', "
      "$columnPeriodDuration INTEGER, "
      "$columnCycleLength INTEGER)";

  MenstrualCycleDbHelper._privateConstructor();

  static final MenstrualCycleDbHelper instance =
      MenstrualCycleDbHelper._privateConstructor();

  static Database? _database;

  /// get database instance
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  /// initialize database
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  /// List of queries which execute while creating a database
  Future _onCreate(Database db, int version) async {
    await db.execute(createTableDailyUserSymptomsLogsData);
    await db.execute(createTableUserPeriodsLogsData);
    await db.execute(createTableCurrentUserDetails);
  }

  /// this function is called when database version is upgrade
  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (newVersion == 2) {
      await db.execute(createTableCurrentUserDetails);
    }
  }

  /// insert daily logs report based on userId and log date
  Future<int> insertDailyLog(
      Map<String, dynamic> data, String logDate, String customerId) async {
    Database? db = await instance.database;

    /// Check if found logs on provided date
    int? recordExist = Sqflite.firstIntValue(await db!.rawQuery(
        "SELECT COUNT(*) FROM $tableDailyUserSymptomsLogsData WHERE $columnLogDate='$logDate' AND $columnCustomerId='$customerId'"));
    /* printLogs("Found Data logDate : $logDate");
    printLogs("Found Data customerId : $customerId");
    printLogs("Found Data recordExist : $recordExist");*/

    if (recordExist! > 0) {
      /// remove old logs
      await db.rawDelete(
          "DELETE FROM $tableDailyUserSymptomsLogsData WHERE $columnLogDate='$logDate' AND $columnCustomerId='$customerId'");
      printMenstrualCycleLogs("Delete Data");
    }

    ///insert a new logs
    int id = await db.insert(tableDailyUserSymptomsLogsData, data);
    printMenstrualCycleLogs("Insert Data");
    return id;
  }

  /// insert current user info
  Future<int> insertCurrentUserDetails(
      {int? periodDuration, int? cycleLength, String? customerId}) async {
    Database? db = await instance.database;
    // Delete existing data
    await db!.rawDelete("DELETE FROM $tableCurrentUserDetails");

    Map<String, dynamic> data = {
      columnCustomerId: customerId,
      columnPeriodDuration: periodDuration,
      columnCycleLength: cycleLength,
    };

    ///insert a new current  user details
    int id = await db.insert(tableCurrentUserDetails, data);
    return id;
  }

  /// get all symptoms list
  void setCurrentUserDetail() async {
    Database? db = await instance.database;

    final List<Map<String, dynamic>> queryResponse =
        await db!.rawQuery("Select * from $tableCurrentUserDetails");

    if (queryResponse.isNotEmpty) {
      printMenstrualCycleLogs(
          "queryResponse[i][columnCustomerId] ${queryResponse[0][columnCustomerId]}");
      List.generate(queryResponse.length, (i) {
        MenstrualCycleWidget.instance!.setCurrentUserData(
            queryResponse[i][columnCustomerId],
            queryResponse[i][columnCycleLength],
            queryResponse[i][columnPeriodDuration]);
      });
    }
  }

  /// Delete past period data
  Future<int> clearPeriodLog(String customerId) async {
    Database? db = await instance.database;
    int deleted = await db!.rawDelete(
        "DELETE FROM $tableUserPeriodsLogsData WHERE $columnCustomerId='$customerId'");
    //printLogs("Clear Period Data");
    return deleted;
  }

  /// insert user's period data on userId and log date
  Future<int> insertPeriodLog(List<DateTime> selectedPeriodsDate) async {
    //printLogs("selectedPeriodsDate ${selectedPeriodsDate.toString()}");
    final mInstance = MenstrualCycleWidget.instance!;
    String customerId = mInstance.getCustomerId();
    Database? db = await instance.database;

    for (int i = 0; i < selectedPeriodsDate.length; i++) {
      Map<String, dynamic> data = {
        columnCustomerId: customerId,
        columnPeriodEncryptDate: Encryption.instance
            .encrypt(CalenderDateUtils.dateDayFormat(selectedPeriodsDate[i])),
      };

      ///insert a new periods log
      await db!.insert(tableUserPeriodsLogsData, data);
    }
    //printLogs("Insert Period Data");
    return 0;
  }

  /// Check if found period date
  Future<bool> isPeriodDateFound(DateTime periodDate) async {
    final mInstance = MenstrualCycleWidget.instance!;
    String customerId = mInstance.getCustomerId();
    bool isFoundDate = false;
    Database? db = await instance.database;

    final List<Map<String, dynamic>> queryResponse = await db!.rawQuery(
        "Select * from $tableUserPeriodsLogsData WHERE $columnCustomerId='$customerId' ORDER BY $columnPeriodEncryptDate DESC");

    List<DateTime> selectedPeriodsDate = [];

    List.generate(queryResponse.length, (i) {
      selectedPeriodsDate.add(DateTime.parse(Encryption.instance
          .decrypt(queryResponse[i][columnPeriodEncryptDate])));
    });

    for (int index = 0; index < selectedPeriodsDate.length; index++) {
      if (CalenderDateUtils.isSameDay(periodDate, selectedPeriodsDate[index])) {
        isFoundDate = true;
        break;
      }
    }

    return isFoundDate;
  }

  /// Return last periods start date
  Future<String> getLastPeriodDate() async {
    final mInstance = MenstrualCycleWidget.instance!;
    String customerId = mInstance.getCustomerId();
    String lastPeriodsDate = "";
    printMenstrualCycleLogs("customerId : $customerId");
    printMenstrualCycleLogs(
        "customerId decrypt : ${Encryption.instance.decrypt(customerId)}");
    Database? db = await instance.database;

    final List<Map<String, dynamic>> queryResponse = await db!.rawQuery(
        "Select * from $tableUserPeriodsLogsData WHERE $columnCustomerId='$customerId' ORDER BY $columnPeriodEncryptDate DESC");

    List<DateTime> selectedPeriodsDate = [];

    List.generate(queryResponse.length, (i) {
      selectedPeriodsDate.add(DateTime.parse(Encryption.instance
          .decrypt(queryResponse[i][columnPeriodEncryptDate])));
    });

    selectedPeriodsDate.sort((a, b) => b.compareTo(a));
    printMenstrualCycleLogs(
        "selectedPeriodsDate New Data : ${selectedPeriodsDate.length}");

    int oneDaysCount = 0; // Only If user selected only one cycle of periods
    if (selectedPeriodsDate.isNotEmpty) {
      if (selectedPeriodsDate.length == 1) {
        mInstance.lastPeriodLength = 1;
        oneDaysCount = 1;
        //printLogs("Count length ==1: ${selectedPeriodsDate.length}");
        lastPeriodsDate =
            CalenderDateUtils.dateDayFormat(selectedPeriodsDate[0]);
      } else {
        for (int index = 1; index < selectedPeriodsDate.length; index++) {
          //printLogs(
          //    "Days: ${selectedPeriodsDate[index - 1].difference(selectedPeriodsDate[index]).inDays} = ${selectedPeriodsDate[index]} = ${selectedPeriodsDate[index - 1]}");
          int inDays = selectedPeriodsDate[index - 1]
              .difference(selectedPeriodsDate[index])
              .inDays;
          if (inDays > 2) {
            //printLogs("Count inDays >2: $oneDaysCount");
            mInstance.lastPeriodLength = oneDaysCount + 1;
            lastPeriodsDate =
                CalenderDateUtils.dateDayFormat(selectedPeriodsDate[index - 1]);
            break;
          } else if (inDays == 1) {
            oneDaysCount = oneDaysCount + 1;
          }
        }
      }

      // Only If user selected only one cycle of periods
      if (lastPeriodsDate.isEmpty &&
          oneDaysCount == selectedPeriodsDate.length - 1) {
        mInstance.lastPeriodLength = oneDaysCount + 1;

        //printLogs("Count --- isEmpty: $oneDaysCount");
        lastPeriodsDate = CalenderDateUtils.dateDayFormat(
            selectedPeriodsDate[selectedPeriodsDate.length - 1]);
      }
    }
    if (oneDaysCount == 0) {
      mInstance.lastPeriodLength = 0;
    }
    //printLogs("lastPeriodsDate ------ : $lastPeriodsDate");
    return lastPeriodsDate;
  }

  /// Return range of last periods date
  Future<List<String>> getPastPeriodDates() async {
    final mInstance = MenstrualCycleWidget.instance!;
    Database? db = await instance.database;
    String customerId = mInstance.getCustomerId();
    List<String> periodDays = [];

    final List<Map<String, dynamic>> queryResponse = await db!.rawQuery(
        "Select * from $tableUserPeriodsLogsData WHERE $columnCustomerId='$customerId'");
    List.generate(queryResponse.length, (i) {
      String periodDate = Encryption.instance
          .decrypt(queryResponse[i][columnPeriodEncryptDate]);

      periodDays.add(periodDate);
    });

    //printLogs("Logs ${periodDays.toString()}");
    return periodDays;
  }
}
