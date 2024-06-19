import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper/database_helper.dart';
import 'database_helper/database_utils.dart';
import 'database_helper/encryption_file.dart';
import 'database_helper/model/user_symptoms_log_data.dart';

enum MenstrualCycleTheme { basic, arcs, circle }

enum PhaseTextBoundaries { inside, outside, both, none }

enum MenstrualCycleViewType { image, text, none, circleImage, circleText }

/// Save your own logs into DB
saveCustomSymptomsLogs(
    {required Map<String, dynamic>? userSymptomsData,
    String userId = "0",
    String symptomsLogDate = "",
    required Function? onSuccess,
    required Function? onError}) async {
  String currentDate = "";
  String logDate = "";

  if (symptomsLogDate.isEmpty) {
    var now = DateTime.now();
    logDate = defaultDateFormat.format(now);
  } else {
    try {
      logDate = symptomsLogDate;
    } catch (e) {
      throw "Invalid symptoms log date. Date format is yyyy-MM-dd";
    }
  }

  final dbHelper = MenstrualCycleDbHelper.instance;

  currentDate = currentDateFormat.format(DateTime.now());

  String encryptedData =
      Encryption.instance.encrypt(json.encode(userSymptomsData));

  printLogs("encryptedData $encryptedData");

  Map<String, dynamic> userData = {
    MenstrualCycleDbHelper.columnUserId: userId,
    MenstrualCycleDbHelper.columnUserEncryptDate: encryptedData,
    MenstrualCycleDbHelper.columnLogDate: logDate,
    MenstrualCycleDbHelper.columnCreatedDateTime: currentDate,
  };

  int id = await dbHelper.insertDailyLog(userData, logDate, userId);
  printLogs("Save Id: $id");
  if (id > 0) {
    printLogs("Save Data");
    if (onSuccess != null) {
      onSuccess.call(id);
    }
  } else {
    printLogs("False to save Data");
    if (onError != null) {
      onError.call();
    }
  }
}

DateTime getOvulationDate(DateTime currentDate, int periodLength) {
  DateTime currentDay = DateTime.now();
  return currentDay;
}

DateTime getFertileWindow() {
  DateTime currentDay = DateTime.now();
  return currentDay;
}

DateTime getPregnancyDueDate() {
  DateTime currentDay = DateTime.now();
  return currentDay;
}

DateTime getPeriodDate() {
  DateTime currentDay = DateTime.now();
  return currentDay;
}

DateTime getImplementationDate() {
  DateTime currentDay = DateTime.now();
  return currentDay;
}

printLogs(String message) {
  String currentDate = currentDateFormat.format(DateTime.now());
  if (kDebugMode) {
    print("LOG FROM MENSTRUAL CYCLE ($currentDate): $message");
  }
}

/// get Today's symptoms logs based on userId
Future<List<UserSymptomsLogData>> getTodaySymptomsLog(
    {required String? userId}) async {
  List<UserSymptomsLogData> usersLogDataList = [];
  final dbHelper = MenstrualCycleDbHelper.instance;

  Database? db = await dbHelper.database;

  final List<Map<String, dynamic>> queryResponse = await db!.rawQuery(
      "Select * from ${MenstrualCycleDbHelper.tableDailyUserSymptomsLogsData} WHERE ${MenstrualCycleDbHelper.columnUserId}='$userId'");
  List.generate(queryResponse.length, (i) {
    UserSymptomsLogData userLogsData = UserSymptomsLogData();
    userLogsData.id = queryResponse[i][MenstrualCycleDbHelper.columnID];
    userLogsData.userid = queryResponse[i][MenstrualCycleDbHelper.columnUserId];
    userLogsData.symptomData = Encryption.instance.decrypt(
        queryResponse[i][MenstrualCycleDbHelper.columnUserEncryptDate]);
    userLogsData.logDate =
        queryResponse[i][MenstrualCycleDbHelper.columnLogDate];
    userLogsData.createdAt =
        queryResponse[i][MenstrualCycleDbHelper.columnCreatedDateTime];
    usersLogDataList.add(userLogsData);
  });
  return usersLogDataList;
}

/// get symptoms report BETWEEN start & end date based on userId
Future<List<UserSymptomsLogData>> getSymptomsLogReport(
    {required String? userId,
    required String? startDate,
    required String? endDate}) async {
  List<UserSymptomsLogData> usersLogDataList = [];
  final dbHelper = MenstrualCycleDbHelper.instance;

  Database? db = await dbHelper.database;

  final List<Map<String, dynamic>> queryResponse = await db!.rawQuery(
      "Select * from ${MenstrualCycleDbHelper.tableDailyUserSymptomsLogsData} WHERE ${MenstrualCycleDbHelper.columnUserId}='$userId' AND ${MenstrualCycleDbHelper.columnLogDate} BETWEEN '$startDate' AND '$endDate'");
  List.generate(queryResponse.length, (i) {
    UserSymptomsLogData userLogsData = UserSymptomsLogData();
    userLogsData.id = queryResponse[i][MenstrualCycleDbHelper.columnID];
    userLogsData.userid = queryResponse[i][MenstrualCycleDbHelper.columnUserId];
    userLogsData.symptomData = Encryption.instance.decrypt(
        queryResponse[i][MenstrualCycleDbHelper.columnUserEncryptDate]);
    userLogsData.logDate =
        queryResponse[i][MenstrualCycleDbHelper.columnLogDate];
    userLogsData.createdAt =
        queryResponse[i][MenstrualCycleDbHelper.columnCreatedDateTime];
    usersLogDataList.add(userLogsData);
  });
  return usersLogDataList;
}
