import 'dart:convert';

import 'menstrual_cycle_widget.dart';
import 'ui/calender_view/calender_date_utils.dart';
import 'utils/constant.dart';
import 'utils/model/PeriodsDateRange.dart';

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
  String lastPeriodDate = "";

  // last period length
  int lastPeriodLength = 0;

  // all past periods date
  List<String> pastAllPeriodDays = [];

  // customer id for storing date
  String _customerId = "0"; // Default is Zero

  static MenstrualCycleWidget? instance;

  // Return last period day
  String getLastPeriodDay() => lastPeriodDate;

  int getLastPeriodLength() => lastPeriodLength;

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
    lastPeriodDate = await dbHelper.getLastPeriodDate();
    // get all past periods date
    if (lastPeriodDate.isNotEmpty) {
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

  /// Save custom customer's symptom logs
  saveCustomSymptomsLogs({
    required Map<String, dynamic>? userSymptomsData,
    required Function? onSuccess,
    required Function? onError,
    String customerId = "0",
    DateTime? symptomsLogDate,
  }) async {
    String currentDate = "";
    String logDate = "";

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

    final dbHelper = MenstrualCycleDbHelper.instance;

    currentDate = currentDateFormat.format(DateTime.now());

    String encryptedData =
        Encryption.instance.encrypt(json.encode(userSymptomsData));

    Map<String, dynamic> userData = {
      MenstrualCycleDbHelper.columnCustomerId:
          Encryption.instance.encrypt(customerId),
      MenstrualCycleDbHelper.columnUserEncryptData: encryptedData,
      MenstrualCycleDbHelper.columnLogDate: logDate,
      MenstrualCycleDbHelper.columnCreatedDateTime: currentDate,
    };

    int id = await dbHelper.insertCustomDailyLog(
        userData, logDate, Encryption.instance.encrypt(customerId));
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

  /// Get customer custom symptoms logs based on customer id
  Future<List<UserSymptomsLogData>> getAllCustomSymptomsLogs(
      {String customerId = "0"}) async {
    final dbHelper = MenstrualCycleDbHelper.instance;
    return await dbHelper
        .getCustomSymptomsLogs(Encryption.instance.encrypt(customerId));
  }

  /// get last period date. Default is 1971-01-01
  Future<DateTime> getLastPeriodDate() async {
    String defaultDate = "1971-01-01";
    DateTime returnDateTime = DateTime.parse(defaultDate);
    if (lastPeriodDate.isNotEmpty) {
      returnDateTime = DateTime.parse(lastPeriodDate);
    }
    return returnDateTime;
  }

  /// Clear user's log details
  clearPeriodLog(String userId) async {
    final dbHelper = MenstrualCycleDbHelper.instance;
    String encryptedUserid = getCustomerId();
    await dbHelper.clearPeriodLog(encryptedUserid);
  }

  /// get last period date. Default is object of PeriodsDateRange
  Future<PeriodsDateRange> getLastPeriodDateRange() async {
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
            periodDates!
                .add(CalenderDateUtils.dateDayFormat(periodDateRange[i]));
          } else {
            DateTime previousDate = periodDateRange[i - 1];
            DateTime currentDate = periodDateRange[i];
            int inDays = currentDate.difference(previousDate).inDays;
            /* printLogs("inDays: $inDays");
            printLogs(
                "previousDate: ${CalenderDateUtils.dateDayFormat(previousDate)}");
            printLogs(
                "currentDate: ${CalenderDateUtils.dateDayFormat(currentDate)}");*/
            if (inDays > 1) {
              periodDates = [];
              periodDuration = 1;
              listPeriodsDateRange.add(periodsDateRange);
              indexId = indexId + 1;
              periodsDateRange = PeriodsDateRange(allPeriodDates: []);
              periodsDateRange.id = indexId;
              periodsDateRange.periodStartDate =
                  CalenderDateUtils.dateDayFormat(currentDate);
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
        listPeriodsDateRange.add(periodsDateRange);
      } else {
        periodsDateRange.id = indexId;
        periodsDateRange.periodStartDate =
            CalenderDateUtils.dateDayFormat(periodDateRange[0]);
        periodsDateRange.periodEndDate =
            CalenderDateUtils.dateDayFormat(periodDateRange[0]);
        periodsDateRange.periodDuration = periodDuration;
        periodsDateRange.allPeriodDates!
            .add(CalenderDateUtils.dateDayFormat(periodDateRange[0]));
        listPeriodsDateRange.add(periodsDateRange);
      }
    }
    listPeriodsDateRange = listPeriodsDateRange.reversed.toList();
    return listPeriodsDateRange;
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
