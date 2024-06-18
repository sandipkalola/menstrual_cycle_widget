import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../menstrual_cycle_utils.dart';
import 'database_utils.dart';
import 'model/symptoms_data.dart';
import 'model/user_symptoms_log_data.dart';

class MenstrualCycleDbHelper {
  static const _databaseName = "MenstrualCycleAppDatabase.db";
  static const _databaseVersion = 1;

  static const String columnID = "id";
  static const String columnCreatedDateTime = "createdAt";

  // Symptoms data table
  static const String tableSymptomsData = "symptoms_data";
  static const String columnSymptomId = "symptomId";
  static const String columnSymptomName = "symptomName";
  static const String columnCategoryId = "categoryId";
  static const String columnIsVisibleCategory = "isVisibleCategory";
  static const String columnCategoryName = "categoryName";
  static const String columnCategoryColor = "categoryColor";
  static const String columnAssetPath = "assetPath";
  static const String columnIsCustomType = "isCustomType";

  // daily Logs Table
  static const String tableDailyUserSymptomsLogsData =
      "daily_user_symptoms_logs";
  static const String columnUserId = "userid"; // optional. Default zero
  static const String columnUserEncryptDate = "symptomData";
  static const String columnUserSymptomIds = "symptomIds";
  static const String columnMeditationTime = "meditationTime";
  static const String columnSleepTime = "sleepTime";
  static const String columnWater = "waterValue";
  static const String columnNotes = "notes";
  static const String columnWeight = "weight";
  static const String columnBodyTemperature = "bodyTemperature";
  static const String columnLogDate = "logDate";

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

  static const String createTableDailyUserSymptomsLogsData =
      "CREATE TABLE $tableDailyUserSymptomsLogsData ("
      "$columnID INTEGER PRIMARY KEY,"
      "$columnUserId TEXT DEFAULT '0', "
      "$columnUserEncryptDate TEXT, "
      "$columnLogDate TEXT, "
      "$columnCreatedDateTime TEXT)";

  MenstrualCycleDbHelper._privateConstructor();

  static final MenstrualCycleDbHelper instance =
      MenstrualCycleDbHelper._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(createTableSymptomsData);
    await db.execute(createTableDailyUserSymptomsLogsData);
    await _insertDefaultSymptomsData(db);
  }

  Future<int> insertDailyLog(
      Map<String, dynamic> data, String logDate, String userId) async {
    Database? db = await instance.database;
    int? recordExist = Sqflite.firstIntValue(await db!.rawQuery(
        "SELECT COUNT(*) FROM $tableDailyUserSymptomsLogsData WHERE $columnLogDate='$logDate' AND $columnUserId='$userId'"));
    printLogs("Found Data : $recordExist");
    if (recordExist! > 0) {
      int deleted = await db.rawDelete(
          "DELETE FROM $tableDailyUserSymptomsLogsData WHERE $columnLogDate='$logDate' AND $columnUserId='$userId'");
      printLogs("Delete Data $deleted");
    }
    int id = await db.insert(tableDailyUserSymptomsLogsData, data);

    printLogs("Insert Data");

    return id;
  }

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

        printLogs("---------Data Insert: ${row.toString()}");

        await db!.insert(tableSymptomsData, row);
        symptomsIndex = symptomsIndex + 1;
      }
    }

    printLogs("-------------Insert operation Successfully");
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {}

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

  Future<List<UserSymptomsLogData>> getDailyLogs(String userId) async {
    Database? db = await instance.database;

    final List<Map<String, dynamic>> queryResponse = await db!.rawQuery(
        "Select * from $tableDailyUserSymptomsLogsData WHERE $columnUserId='$userId'");
    List<UserSymptomsLogData> usersLogDataList = [];
    List.generate(queryResponse.length, (i) {
      UserSymptomsLogData userLogsData = UserSymptomsLogData();
      userLogsData.id = queryResponse[i][columnID];
      userLogsData.userid = queryResponse[i][columnUserId];
      userLogsData.symptomData = queryResponse[i][columnUserEncryptDate];
      userLogsData.logDate = queryResponse[i][columnLogDate];
      userLogsData.createdAt = queryResponse[i][columnCreatedDateTime];
      usersLogDataList.add(userLogsData);
    });

    return usersLogDataList;
  }
}
