import 'package:flutter/material.dart';

import '../../menstrual_cycle_widget.dart';
import '../../widget_languages/languages.dart';
import 'calender_view.dart';

/// get future prediction due periods dates of next period
initFuturePeriodDay() async {
  final instance = MenstrualCycleWidget.instance!;

  List<String> futurePeriodDays = [];
  int cycleLength = instance.getCycleLength() - 1;
  int periodLength = instance.getPeriodDuration();
  if (instance.getPreviousPeriodDay().isNotEmpty) {
    DateTime nextPeriodDate = CalenderDateUtils.dateFormat
        .parse(instance.getPreviousPeriodDay())
        .add(Duration(days: cycleLength));
    // printLogs("Dates: ${defaultDateFormat.format(nextPeriodDate)}");
    for (int index = 0; index < futureMonthCount; index++) {
      for (int i = 1; i <= periodLength; i++) {
        DateTime addDate = nextPeriodDate.add(Duration(days: i));
        // printLogs("Dates: ${defaultDateFormat.format(addDate)}");
        futurePeriodDays.add(defaultDateFormat.format(addDate));
        // futurePeriodDays
      }
      DateTime newDatetime = nextPeriodDate.add(Duration(days: cycleLength));
      nextPeriodDate = newDatetime;
    }
  }
  return futurePeriodDays;
}

/// get future prediction ovulation dates
initFutureOvulationDay() async {
  final instance = MenstrualCycleWidget.instance!;
  List<String> futureOvulationDays = [];
  int cycleLength = instance.getCycleLength();
  if (instance.getPreviousPeriodDay().isNotEmpty) {
    DateTime nextPeriodDate = CalenderDateUtils.dateFormat
        .parse(instance.getPreviousPeriodDay())
        .add(Duration(days: cycleLength));
    // printLogs("Dates: ${defaultDateFormat.format(nextPeriodDate)}");
    for (int index = 0; index < futureMonthCount; index++) {
      // Ovulation day
      DateTime ovulationDate = nextPeriodDate
          .add(Duration(days: cycleLength))
          .add(const Duration(days: -14));
      futureOvulationDays.add(defaultDateFormat.format(ovulationDate));
      //printLogs("Dates: ${defaultDateFormat.format(ovulationDate)}");
      DateTime newDatetime = nextPeriodDate.add(Duration(days: cycleLength));
      nextPeriodDate = newDatetime;
    }
  }
  return futureOvulationDays;
}

Widget getInformationView(Color daySelectedColor, Color themeColor) {
  const double fontSize = 6;
  const double circleSize = 8;

  return Padding(
    padding: const EdgeInsets.only(left: 5, right: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 5,
        ),
        Container(
          margin: const EdgeInsets.only(right: 2.0),
          width: circleSize,
          height: circleSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: defaultMenstruationColor,
          ),
        ),
        Text(
          WidgetBaseLanguage.periodLabel,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: MenstrualCycleWidget.defaultFontFamily,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        DottedBorder(
          color: defaultOvulationColor,
          borderType: BorderType.circle,
          strokeWidth: 1,
          child: Container(
            margin: const EdgeInsets.only(
              left: 2.0,
              right: 2.0,
            ),
            width: circleSize - 2,
            height: circleSize - 2,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          WidgetBaseLanguage.predictOvulationDateLabel,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: MenstrualCycleWidget.defaultFontFamily,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        DottedBorder(
          color: defaultMenstruationColor,
          borderType: BorderType.circle,
          strokeWidth: 1,
          child: Container(
            margin: const EdgeInsets.only(
              left: 2.0,
              right: 2.0,
            ),
            width: circleSize - 2,
            height: circleSize - 2,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          WidgetBaseLanguage.predictPeriodDateLabel,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: MenstrualCycleWidget.defaultFontFamily,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          margin: const EdgeInsets.only(right: 2.0),
          width: circleSize,
          height: circleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: daySelectedColor,
          ),
        ),
        Text(
          WidgetBaseLanguage.selectedDateLabel,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: MenstrualCycleWidget.defaultFontFamily,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          margin: const EdgeInsets.only(right: 2.0),
          width: circleSize,
          height: circleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: themeColor,
          ),
        ),
        Text(
          WidgetBaseLanguage.todayLabel,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: MenstrualCycleWidget.defaultFontFamily,
          ),
        ),
      ],
    ),
  );
}

Widget progressIndicator() {
  return Align(
    alignment: Alignment.centerRight,
    child: Padding(
      padding: const EdgeInsets.only(),
      child: Container(
        width: 30,
        alignment: Alignment.centerRight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            Color.fromRGBO(33, 33, 33, 0.0),
            Color.fromRGBO(33, 33, 33, 0.74)
          ], stops: <double>[
            0.0,
            1
          ]),
        ),
        child: const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            backgroundColor: Colors.transparent,
            strokeWidth: 3,
          ),
        ),
      ),
    ),
  );
}
