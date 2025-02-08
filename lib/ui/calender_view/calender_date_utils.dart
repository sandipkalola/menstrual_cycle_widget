import 'package:intl/intl.dart';

import '../../widget_languages/language_functions.dart';

class CalenderDateUtils {
  CalenderDateUtils._();

  static final DateFormat displayMonthYear =
      DateFormat('MMMM yyyy', getLanguageCode());

  static final DateFormat _monthFormat =
      DateFormat('MMMM yyyy', getLanguageCode());
  static final DateFormat _dayFormat = DateFormat('dd');
  static final DateFormat _dayMonth = DateFormat('dd MMMM', getLanguageCode());
  static final DateFormat _dayMonthShort =
      DateFormat('dd MMM', getLanguageCode());

  static final DateFormat _firstDayFormat =
      DateFormat('MMMM dd', getLanguageCode());
  static final DateFormat _dateWithYearFormat = DateFormat('dd-MM-yyyy');
  static final DateFormat _graphDateFormat =
      DateFormat('dd MMMM', getLanguageCode());
  static final DateFormat _fullDayFormat = DateFormat('EEE MMM dd, yyyy');
  static final DateFormat _fullDayName = DateFormat('EEEE', getLanguageCode());
  static final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  static final DateFormat _yearFormat = DateFormat('yyyy', getLanguageCode());
  static final DateFormat _fullDate = DateFormat('yyyy_MM_dd_hh_mm');
  static final DateFormat fullFormat =
      DateFormat('EEEE MMMM dd, yyyy', getLanguageCode());
  static final DateFormat fullFormatWithTime =
      DateFormat('yyyy-MM-dd hh:mm:ss');
  static final DateFormat dateFormatYMD = DateFormat('yyyy-MM-dd');
  static final DateFormat dateFormatDMY = DateFormat('dd-MM-yyyy');
  static final DateFormat dateFormatMDY = DateFormat('MM-dd-yyyy');

  static String fullDateTime(DateTime d) => _fullDate.format(d);

  static String formatYear(DateTime d) => _yearFormat.format(d);

  static String graphDateFormat(DateTime d) => _graphDateFormat.format(d);

  static String dateWithYear(DateTime d) => _dateWithYearFormat.format(d);

  static String formatMonth(DateTime d) => _monthFormat.format(d);

  static String fullDayName(DateTime d) => _fullDayName.format(d);

  static String formatDayMonth(DateTime d) => _dayMonth.format(d);

  static String formatDayMonthShort(DateTime d) => _dayMonthShort.format(d);

  static String formatDay(DateTime d) => _dayFormat.format(d);

  static String formatFirstDay(DateTime d) => _firstDayFormat.format(d);

  static String fullDayFormat(DateTime d) => _fullDayFormat.format(d);

  static String dateDayFormat(DateTime d) => dateFormat.format(d);

  /// The list of days in a given month
  static List<DateTime> daysInMonth(DateTime month) {
    var first = firstDayOfMonth(month);
    var daysBefore = first.weekday;
    var firstToDisplay = first.subtract(Duration(days: daysBefore));
    var last = CalenderDateUtils.lastDayOfMonth(month);

    var daysAfter = 7 - last.weekday;

    // If the last day is sunday (7) the entire week must be rendered
    if (daysAfter == 0) {
      daysAfter = 7;
    }

    var lastToDisplay = last.add(Duration(days: daysAfter));
    return daysInRange(firstToDisplay, lastToDisplay).toList();
  }

  static bool isFirstDayOfMonth(DateTime day) {
    return isSameDay(firstDayOfMonth(day), day);
  }

  static bool isLastDayOfMonth(DateTime day) {
    return isSameDay(lastDayOfMonth(day), day);
  }

  static DateTime firstDayOfMonth(DateTime month) {
    return DateTime(month.year, month.month);
  }

  static DateTime firstDayOfWeek(DateTime day) {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
    day = DateTime.utc(day.year, day.month, day.day, 12);

    /// Weekday is on a 1-7 scale Monday - Sunday,
    /// This Calendar works from Sunday - Monday
    var decreaseNum = day.weekday % 7;
    return day.subtract(Duration(days: decreaseNum));
  }

  static DateTime lastDayOfWeek(DateTime day) {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
    day = DateTime.utc(day.year, day.month, day.day, 12);

    /// Weekday is on a 1-7 scale Monday - Sunday,
    /// This Calendar's Week starts on Sunday
    var increaseNum = day.weekday % 7;
    return day.add(Duration(days: 7 - increaseNum));
  }

  /// The last day of a given month
  static DateTime lastDayOfMonth(DateTime month) {
    var beginningNextMonth = (month.month < 12)
        ? DateTime(month.year, month.month + 1, 1)
        : DateTime(month.year + 1, 1, 1);
    return beginningNextMonth.subtract(const Duration(days: 1));
  }

  /// Returns a [DateTime] for each day the given range.
  ///
  /// [start] inclusive
  /// [end] exclusive
  static Iterable<DateTime> daysInRange(DateTime start, DateTime end) sync* {
    var i = start;
    var offset = start.timeZoneOffset;
    while (i.isBefore(end)) {
      yield i;
      i = i.add(const Duration(days: 1));
      var timeZoneDiff = i.timeZoneOffset - offset;
      if (timeZoneDiff.inSeconds != 0) {
        offset = i.timeZoneOffset;
        i = i.subtract(Duration(seconds: timeZoneDiff.inSeconds));
      }
    }
  }

  /// Whether or not two times are on the same day.
  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static bool isSameWeek(DateTime a, DateTime b) {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
    a = DateTime.utc(a.year, a.month, a.day);
    b = DateTime.utc(b.year, b.month, b.day);

    var diff = a.toUtc().difference(b.toUtc()).inDays;
    if (diff.abs() >= 7) {
      return false;
    }

    var min = a.isBefore(b) ? a : b;
    var max = a.isBefore(b) ? b : a;
    var result = max.weekday % 7 - min.weekday % 7 >= 0;
    return result;
  }

  static DateTime previousMonth(DateTime m) {
    var year = m.year;
    var month = m.month;
    if (month == 1) {
      year--;
      month = 12;
    } else {
      month--;
    }
    return DateTime(year, month);
  }

  static DateTime nextMonth(DateTime m) {
    var year = m.year;
    var month = m.month;

    if (month == 12) {
      year++;
      month = 1;
    } else {
      month++;
    }
    return DateTime(year, month);
  }

  static DateTime previousWeek(DateTime w) {
    return w.subtract(const Duration(days: 7));
  }

  static DateTime nextWeek(DateTime w) {
    return w.add(const Duration(days: 7));
  }

  static DateTime getDay(DateTime date) {
    return DateTime.parse(dateFormat.format(date));
  }
}
