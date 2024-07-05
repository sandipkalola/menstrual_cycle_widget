class Strings {
  static String pkgUrl = "https://pub.dev/packages/menstrual_cycle_widget";
  static String secretKeyLabel = "Must required secretKey for data encryption";
  static String ivKeyLabel = "Must required ivKey for data encryption";
  static String totalCycleDaysLabel =
      "totalCycleDays size must be greater than 0";
  static String totalPeriodDaysLabel =
      "totalPeriodDays size must be greater than 0";
  static String printLogLabel = "LOG FROM MENSTRUAL CYCLE";
  static String saveLabel = "Save";
  static String cancelLabel = "Cancel";
  static String editPeriodDateLabel = "Edit Period dates";
  static String periodLabel = "Period";
  static String predictOvulationDateLabel = "Predict ovulation date";
  static String predictPeriodDateLabel = "Predict period date";
  static String selectedDateLabel = "Selected date";
  static String todayLabel = "Today";
  static const String menstruationLabel = "Menstruation";
  static const String follicularPhaseLabel = "Follicular phase";
  static const String ovulationLabel = "Ovulation";
  static const String lutealPhaseLabel = "Luteal phase";
  static const String dayLabel = "Day";
  static const String logPeriodLabel = "Log Period";

  /// Error
  static String errorInvalidSize =
      "Invalid 'MenstrualCyclePhaseView' widget size. Size must be greater than or equal to 200. See ";
  static String errorInvalidCount =
      "Invalid 'totalCycleDays' count. Count must be greater than or equal to 10. See ";
  static String errorInvalidMenstruationDayCount =
      "Invalid 'menstruationDayCount' count. Count must be greater than or equal to 0. See ";
  static String errorInvalidFollicularDayCount =
      "Invalid 'follicularDayCount' count. Count must be greater than or equal to 0. See ";
  static String errorInvalidOvulationDayCount =
      "Invalid 'ovulationDayCount' count. Count must be greater than or equal to 0. See ";
  static String errorInvalidSymptomsLogDate =
      "Invalid symptoms log date. Date format is yyyy-MM-dd";
}
