import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../menstrual_cycle_widget.dart';
import '../ui/calender_view/calender_view.dart';

class MenstrualCycleDbHelper {
  static const _databaseName = "MenstrualCycleAppDatabase.db";
  static const _databaseVersion = 3;

  /// Common Columns
  static const String columnID = "id";
  static const String columnCreatedDateTime = "createdAt";
  static const String columnCustomerId = "customerId";

  /// Symptoms data table
  static const String tableSymptomsData = "tblSymptomsData";
  static const String columnSymptomId = "symptomId";
  static const String columnSymptomName = "symptomName";
  static const String columnCategoryId = "categoryId";
  static const String columnIsVisibleCategory = "isVisibleCategory";
  static const String columnCategoryName = "categoryName";
  static const String columnCategoryColor = "categoryColor";
  static const String columnAssetPath = "assetPath";
  static const String columnIsCustomType = "isCustomType";
  static const String createTableSymptomsData =
      "CREATE TABLE $tableSymptomsData ("
      "$columnID INTEGER PRIMARY KEY,"
      "$columnSymptomId INTEGER, "
      "$columnSymptomName TEXT, "
      "$columnCategoryId INTEGER, "
      "$columnCategoryName TEXT, "
      "$columnCategoryColor TEXT, "
      "$columnAssetPath TEXT, "
      "$columnIsVisibleCategory INTEGER DEFAULT 1, "
      "$columnIsCustomType INTEGER DEFAULT 0)";

  /// daily Logs Table and columns
  static const String tableDailyUserSymptomsLogsData =
      "tblDailyUserSymptomsLogs";
  static const String columnUserEncryptData = "symptomData";
  static const String columnUserSymptomIds = "symptomIds";
  static const String columnMeditationTime = "meditationTime";
  static const String columnSleepTime = "sleepTime";
  static const String columnWater = "waterValue";
  static const String columnNotes = "notes";
  static const String columnWeight = "weight";
  static const String columnBodyTemperature = "bodyTemperature";
  static const String columnLogDate = "logDate";

  static const String createTableDailyUserSymptomsLogsData =
      "CREATE TABLE $tableDailyUserSymptomsLogsData ("
      "$columnID INTEGER PRIMARY KEY,"
      "$columnCustomerId TEXT DEFAULT '0', "
      "$columnUserEncryptData TEXT, "
      "$columnLogDate TEXT, "
      "$columnCreatedDateTime TEXT)";

  /// Custom daily Logs Table and columns
  static const String tableCustomDailyUserSymptomsLogsData =
      "tblCustomDailyUserSymptomsLogs";
  static const String createTableCustomDailyUserSymptomsLogsData =
      "CREATE TABLE $tableCustomDailyUserSymptomsLogsData ("
      "$columnID INTEGER PRIMARY KEY,"
      "$columnCustomerId TEXT DEFAULT '0', "
      "$columnUserEncryptData TEXT, "
      "$columnLogDate TEXT, "
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
    await db.execute(createTableSymptomsData);
    await db.execute(createTableDailyUserSymptomsLogsData);
    await db.execute(createTableUserPeriodsLogsData);
    await db.execute(createTableCurrentUserDetails);
    await db.execute(createTableCustomDailyUserSymptomsLogsData);

    await _insertDefaultSymptomsData(db);
  }

  /// this function is called when database version is upgrade
  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (newVersion == 2) {
      await db.execute(createTableCurrentUserDetails);
    }
    if (newVersion == 3) {
      await db.execute(createTableCustomDailyUserSymptomsLogsData);
    }
  }

  /// insert daily logs report based on userId and log date
  Future<int> insertDailyLog(
      Map<String, dynamic> data, String logDate, String customerId) async {
    Database? db = await instance.database;

    /// Check if found logs on provided date
    int? recordExist = Sqflite.firstIntValue(await db!.rawQuery(
        "SELECT COUNT(*) FROM $tableDailyUserSymptomsLogsData WHERE $columnLogDate='$logDate' AND $columnCustomerId='$customerId'"));
    //printLogs("Found Data : $recordExist");
    if (recordExist! > 0) {
      /// remove old logs
      await db.rawDelete(
          "DELETE FROM $tableDailyUserSymptomsLogsData WHERE $columnLogDate='$logDate' AND $columnCustomerId='$customerId'");
      //printLogs("Delete Data $deleted");
    }

    ///insert a new logs
    int id = await db.insert(tableDailyUserSymptomsLogsData, data);
    //printLogs("Insert Data");
    return id;
  }

  /// insert daily custom logs report based on userId and log date
  Future<int> insertCustomDailyLog(
      Map<String, dynamic> data, String logDate, String customerId) async {
    Database? db = await instance.database;

    /// Check if found logs on provided date
    int? recordExist = Sqflite.firstIntValue(await db!.rawQuery(
        "SELECT COUNT(*) FROM $tableCustomDailyUserSymptomsLogsData WHERE $columnLogDate='$logDate' AND $columnCustomerId='$customerId'"));
    //printLogs("Found Data : $recordExist");
    if (recordExist! > 0) {
      /// remove old logs
      await db.rawDelete(
          "DELETE FROM $tableCustomDailyUserSymptomsLogsData WHERE $columnLogDate='$logDate' AND $columnCustomerId='$customerId'");
      //printLogs("Delete Data $deleted");
    }

    ///insert a new logs
    int id = await db.insert(tableCustomDailyUserSymptomsLogsData, data);
    //printLogs("Insert Data");
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

    printLogs(
        "queryResponse[i][columnCustomerId] ${queryResponse[0][columnCustomerId]}");
    if (queryResponse.isNotEmpty) {
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

  /// insert default symptoms data
  _insertDefaultSymptomsData(db) async {
    int symptomsIndex = 1;
    for (int index = 0; index < defaultSymptomsData.length; index++) {
      Symptoms catSymptoms = defaultSymptomsData[index];
      for (int indexJ = 0;
          indexJ < defaultSymptomsData[index].symptomsData!.length;
          indexJ++) {
        SymptomsData? data = defaultSymptomsData[index].symptomsData![indexJ];
        Map<String, dynamic> row = {
          columnSymptomId: symptomsIndex,
          columnSymptomName: data.symptomName,
          columnCategoryId: catSymptoms.categoryId,
          columnCategoryName: catSymptoms.categoryName,
          columnCategoryColor: catSymptoms.categoryColor.toString(),
          columnIsVisibleCategory: catSymptoms.isVisibleCategory,
          columnIsCustomType: catSymptoms.isCustomType,
        };

        //printLogs("---------Data Insert: ${row.toString()}");

        await db!.insert(tableSymptomsData, row);
        symptomsIndex = symptomsIndex + 1;
      }
    }

    //printLogs("-------------Insert operation Successfully");
  }

  /// get all symptoms list
  Future<List<Symptoms>> getSymptoms() async {
    Database? db = await instance.database;

    final List<Map<String, dynamic>> queryResponse = await db!.rawQuery(
        "Select * from $tableSymptomsData WHERE $columnIsVisibleCategory=1"); // TODO Add where condition for columnIsVisibleCategory
    List<Symptoms> listSymptoms = [];
    Symptoms? symptoms = Symptoms(symptomsData: <SymptomsData>[]);
    int? catId = -1;
    List.generate(queryResponse.length, (i) {
      SymptomsData? symptomsData = SymptomsData();
      if (catId == -1) {
        catId = queryResponse[i][columnCategoryId];
        symptoms = Symptoms();
        symptoms!.categoryId = queryResponse[i][columnCategoryId];
        symptoms!.categoryName = queryResponse[i][columnCategoryName];
        symptoms!.categoryColor = queryResponse[i][columnCategoryColor];
        symptoms!.isVisibleCategory = queryResponse[i][columnIsVisibleCategory];
      }
      if (catId != queryResponse[i][columnCategoryId]) {
        listSymptoms.add(symptoms!);
        symptoms = Symptoms();
        symptoms!.categoryId = queryResponse[i][columnCategoryId];
        symptoms!.categoryName = queryResponse[i][columnCategoryName];
        symptoms!.categoryColor = queryResponse[i][columnCategoryColor];
        symptoms!.isVisibleCategory = queryResponse[i][columnIsVisibleCategory];
        catId = queryResponse[i][columnCategoryId];
      } else {
        symptomsData.symptomName = queryResponse[i][columnSymptomName];
        symptomsData.symptomId = queryResponse[i][columnSymptomId];
        symptomsData.id = queryResponse[i][columnID];
        if (symptoms!.symptomsData == null) {
          symptoms!.symptomsData = [];
        }
        symptoms!.symptomsData!.add(symptomsData);
      }
    });

    if (symptoms != null) {
      listSymptoms.add(symptoms!);
    }
    return listSymptoms;
  }

  /// get daily logs based on userID
  Future<List<UserSymptomsLogData>> getDailyLogs() async {
    final mInstance = MenstrualCycleWidget.instance!;
    String customerId = mInstance.getCustomerId();
    Database? db = await instance.database;

    final List<Map<String, dynamic>> queryResponse = await db!.rawQuery(
        "Select * from $tableDailyUserSymptomsLogsData WHERE $columnCustomerId='$customerId'");
    List<UserSymptomsLogData> usersLogDataList = [];
    List.generate(queryResponse.length, (i) {
      UserSymptomsLogData userLogsData = UserSymptomsLogData();
      userLogsData.id = queryResponse[i][columnID];
      userLogsData.customerId = queryResponse[i][columnCustomerId];
      userLogsData.symptomData = queryResponse[i][columnUserEncryptData];
      userLogsData.logDate = queryResponse[i][columnLogDate];
      userLogsData.createdAt = queryResponse[i][columnCreatedDateTime];
      usersLogDataList.add(userLogsData);
    });

    return usersLogDataList;
  }

  /// get daily logs based on userID
  Future<List<UserSymptomsLogData>> getCustomSymptomsLogs(
      String customerId) async {
    Database? db = await instance.database;

    final List<Map<String, dynamic>> queryResponse = await db!.rawQuery(
        "Select * from $tableDailyUserSymptomsLogsData WHERE $columnCustomerId='$customerId'");
    List<UserSymptomsLogData> usersLogDataList = [];
    List.generate(queryResponse.length, (i) {
      UserSymptomsLogData userLogsData = UserSymptomsLogData();
      userLogsData.id = queryResponse[i][columnID];
      userLogsData.customerId =
          Encryption.instance.decrypt(queryResponse[i][columnCustomerId]);
      userLogsData.symptomData =
          Encryption.instance.decrypt(queryResponse[i][columnUserEncryptData]);
      userLogsData.logDate = queryResponse[i][columnLogDate];
      userLogsData.createdAt = queryResponse[i][columnCreatedDateTime];
      usersLogDataList.add(userLogsData);
    });

    return usersLogDataList;
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
    printLogs("customerId : $customerId");
    printLogs(
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
    printLogs("selectedPeriodsDate New Data : ${selectedPeriodsDate.length}");

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
