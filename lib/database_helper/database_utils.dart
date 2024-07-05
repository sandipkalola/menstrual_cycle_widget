import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../menstrual_cycle_widget.dart';

/// Default symptoms data
List<Symptoms> defaultSymptomsData = [];

/// Sunday, 10 Jun
var weekDayNameDayMonth = DateFormat('EEEE, d MMM');

/// May 2024
var monthYear = DateFormat('MMM yyyy');

/// 2024-06-20
var defaultDateFormat = DateFormat('yyyy-MM-dd');

/// 2024-06-20 12:20:11
var currentDateFormat = DateFormat('yyyy-MM-dd hh:mm:ss');

/// get Today's symptoms logs based on userId
Future<List<UserSymptomsLogData>> getTodaySymptomsLog(
    {required String? userId}) async {
  List<UserSymptomsLogData> usersLogDataList = [];
  final dbHelper = MenstrualCycleDbHelper.instance;

  Database? db = await dbHelper.database;

  final List<Map<String, dynamic>> queryResponse = await db!.rawQuery(
      "Select * from ${MenstrualCycleDbHelper.tableDailyUserSymptomsLogsData} WHERE ${MenstrualCycleDbHelper.columnCustomerId}='$userId'");
  List.generate(queryResponse.length, (i) {
    UserSymptomsLogData userLogsData = UserSymptomsLogData();
    userLogsData.id = queryResponse[i][MenstrualCycleDbHelper.columnID];
    userLogsData.customerId =
        queryResponse[i][MenstrualCycleDbHelper.columnCustomerId];
    userLogsData.symptomData = Encryption.instance.decrypt(
        queryResponse[i][MenstrualCycleDbHelper.columnUserEncryptData]);
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
      "Select * from ${MenstrualCycleDbHelper.tableDailyUserSymptomsLogsData} WHERE ${MenstrualCycleDbHelper.columnCustomerId}='$userId' AND ${MenstrualCycleDbHelper.columnLogDate} BETWEEN '$startDate' AND '$endDate'");
  List.generate(queryResponse.length, (i) {
    UserSymptomsLogData userLogsData = UserSymptomsLogData();
    userLogsData.id = queryResponse[i][MenstrualCycleDbHelper.columnID];
    userLogsData.customerId =
        queryResponse[i][MenstrualCycleDbHelper.columnCustomerId];
    userLogsData.symptomData = Encryption.instance.decrypt(
        queryResponse[i][MenstrualCycleDbHelper.columnUserEncryptData]);
    userLogsData.logDate =
        queryResponse[i][MenstrualCycleDbHelper.columnLogDate];
    userLogsData.createdAt =
        queryResponse[i][MenstrualCycleDbHelper.columnCreatedDateTime];
    usersLogDataList.add(userLogsData);
  });
  return usersLogDataList;
}
