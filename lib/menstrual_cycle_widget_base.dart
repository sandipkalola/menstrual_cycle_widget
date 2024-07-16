import 'dart:convert';

import 'menstrual_cycle_widget.dart';
import 'utils/constant.dart';

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
      String? userId = "0",
      DateTime? lastPeriodDate,
      bool isClearData = false}) async {
    assert(_cycleLength > 0, Strings.totalCycleDaysLabel);
    assert(_periodDuration > 0, Strings.totalPeriodDaysLabel);
    // printLogs("userId $userId");
    if (userId!.isNotEmpty) {
      _customerId = userId;
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

  /// Sae your own logs into DB
  saveCustomSymptomsLogs(
      {required Map<String, dynamic>? userSymptomsData,
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
        throw Strings.errorInvalidSymptomsLogDate;
      }
    }

    final dbHelper = MenstrualCycleDbHelper.instance;

    currentDate = currentDateFormat.format(DateTime.now());

    String encryptedData =
        Encryption.instance.encrypt(json.encode(userSymptomsData));
    final instance = MenstrualCycleWidget.instance!;

    String encryptedUserid = instance.getCustomerId();

    //printLogs(("encryptedData $encryptedData");

    Map<String, dynamic> userData = {
      MenstrualCycleDbHelper.columnCustomerId: encryptedUserid,
      MenstrualCycleDbHelper.columnUserEncryptData: encryptedData,
      MenstrualCycleDbHelper.columnLogDate: logDate,
      MenstrualCycleDbHelper.columnCreatedDateTime: currentDate,
    };

    // TODO set customLog tags to identify custom logs data
    int id = await dbHelper.insertDailyLog(userData, logDate, encryptedUserid);
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

  /// get last period date. Default is 1971-01-01
  Future<DateTime> getLastPeriodDate() async {
    String defaultDate = "1971-01-01";
    String lastPeriodDate = "";
    DateTime returnDateTime = DateTime.parse(defaultDate);
    final dbHelper = MenstrualCycleDbHelper.instance;
    lastPeriodDate = await dbHelper.getLastPeriodDate();
    if (lastPeriodDate.isNotEmpty) {
      returnDateTime = DateTime.parse(lastPeriodDate);
    }
    return returnDateTime;
  }

  /// Clear user's log details
  clearPeriodLog(String userId) async {
    final dbHelper = MenstrualCycleDbHelper.instance;
    final instance = MenstrualCycleWidget.instance!;
    String encryptedUserid = instance.getCustomerId();
    await dbHelper.clearPeriodLog(encryptedUserid);
  }

  /// get last period date. Default is []
  Future<List<DateTime>> getLastPeriodDateRange() async {
    List<DateTime> defaultDateRange = [];
    final dbHelper = MenstrualCycleDbHelper.instance;
    List<String> lastPeriodRange = await dbHelper.getPastPeriodDates();
    if (lastPeriodRange.isNotEmpty) {
      for (int i = 0; i < lastPeriodRange.length; i++) {
        defaultDateRange.add(DateTime.parse(lastPeriodRange[i]));
      }
    }
    return defaultDateRange;
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
