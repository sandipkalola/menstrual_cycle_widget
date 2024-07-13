import 'package:flutter/material.dart';
import "package:intl/intl.dart";

import '../../menstrual_cycle_widget.dart';
import '../../utils/constant.dart';
import 'calender_view.dart';

class CalendarCell extends StatefulWidget {
  final VoidCallback? onDateSelected;
  final DateTime? currentDay;
  final String? dayOfWeek;
  final bool isDayOfWeek;
  final bool isSelected;
  final TextStyle? dayOfWeekStyle;
  final TextStyle? dateStyles;
  final Widget? child;
  final Color? selectedColor;
  final Color? todayColor;
  final String? lastPeriodDate;
  final List<String>? futurePeriodDays;
  final List<String>? pastAllPeriodsDays;
  final List<String>? futureOvulationDays;
  final int cycleLength;
  final int periodDuration;
  final bool isBlankDay;
  final Color themeColor;
  final bool isEditMode;
  final Function multipleDateSelectionCallBack;

  const CalendarCell(
      {super.key,
      required this.themeColor,
      this.onDateSelected,
      this.currentDay,
      this.child,
      this.dateStyles,
      this.dayOfWeek,
      this.isEditMode = false,
      this.dayOfWeekStyle,
      this.isDayOfWeek = false,
      this.isSelected = false,
      this.selectedColor,
      this.todayColor,
      this.isBlankDay = false,
      this.futurePeriodDays = const <String>[],
      this.futureOvulationDays = const <String>[],
      this.pastAllPeriodsDays = const <String>[],
      this.cycleLength = defaultCycleLength,
      this.periodDuration = defaultPeriodDuration,
      required this.multipleDateSelectionCallBack,
      this.lastPeriodDate = ""});

  @override
  State<CalendarCell> createState() => _CalendarCellState();
}

class _CalendarCellState extends State<CalendarCell> {
  bool isChecked = false;
  bool isChanged = false;

  @override
  void initState() {
    super.initState();
  }

  Widget renderDateOrDayOfWeek(BuildContext context) {
    if (widget.isDayOfWeek) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          widget.dayOfWeek!,
          style: widget.dayOfWeekStyle,
        ),
      );
    } else {
      bool isOvulationDay = checkIsOvulationDay();
      bool isFutureOvulationDay = checkIsFutureOvulationDay();
      bool isPeriodDayAfterCurrentDate = checkIsPeriodDayAfterCurrentDate();
      bool isPastPeriodDay = checkIsPastPeriodDay();
      bool isPeriodDay = checkIsPeriodDay();
      bool isFutureDateOfPeriod = checkIsFuturePeriodDay();

      return (widget.isBlankDay)
          ? const Text("")
          : InkWell(
              onTap: widget.onDateSelected,
              child: (widget.isEditMode)
                  ? editModeView(
                      isPeriodDay: isPeriodDay,
                      isPastPeriodDay: isPastPeriodDay,
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 5, top: 5),
                      child: (isPeriodDayAfterCurrentDate ||
                              isFutureOvulationDay ||
                              isOvulationDay ||
                              isFutureDateOfPeriod)
                          ? DottedBorder(
                              color: (isPeriodDayAfterCurrentDate ||
                                      isFutureDateOfPeriod)
                                  ? defaultMenstruationColor
                                  : defaultOvulationColor,
                              borderType: BorderType.circle,
                              strokeWidth: 1,
                              child: Center(
                                child: renderDayView(
                                    isOvulationDay: false,
                                    isPeriodDay: false,
                                    isFutureOvulationDay: isFutureOvulationDay,
                                    isToday: CalenderDateUtils.isSameDay(
                                      widget.currentDay!,
                                      DateTime.now(),
                                    ),
                                    isAfterPeriodDay: true),
                              ),
                            )
                          : renderDayView(
                              isOvulationDay: isOvulationDay,
                              isPeriodDay: isPeriodDay,
                              isPastPeriodDay: isPastPeriodDay,
                              isToday: CalenderDateUtils.isSameDay(
                                widget.currentDay!,
                                DateTime.now(),
                              ),
                            ),
                    ),
            );
    }
  }

  /// Display widget while edit mode of calender view
  Widget editModeView({
    bool isPeriodDay = false,
    bool isPastPeriodDay = false,
  }) {
    if ((isPeriodDay || isPastPeriodDay) && !isChanged) {
      isChecked = true;
      widget.multipleDateSelectionCallBack.call(true);
    }
    return Column(
      children: [
        Center(
          child: Text(
            '${widget.currentDay!.day}',
            // Display the day of the month
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: Checkbox(
              value: isChecked,
              activeColor: isChecked ? defaultMenstruationColor : Colors.black,
              onChanged: (value) {
                widget.multipleDateSelectionCallBack.call(value);
                isChanged = true;
                setState(() {
                  isChecked = value!;
                });
              }),
        ),
      ],
    );
  }

  /// Display current day view
  Widget renderDayView(
      {bool isOvulationDay = false,
      bool isPeriodDay = false,
      bool isPastPeriodDay = false,
      bool isToday = false,
      bool isFutureOvulationDay = false,
      bool isAfterPeriodDay = false}) {
    Color selectedColor = Colors.transparent;
    if (isToday) {
      selectedColor = widget.themeColor;
    } else if (widget.isSelected) {
      selectedColor = widget.selectedColor!;
    } else if (isOvulationDay) {
      selectedColor = defaultOvulationColor;
    } else if (isPastPeriodDay) {
      selectedColor = defaultMenstruationColor;
    } else if (isPeriodDay) {
      selectedColor = defaultMenstruationColor;
    } else if (CalenderDateUtils.isSameDay(
        widget.currentDay!, DateTime.now())) {
      selectedColor = widget.todayColor!;
    } else if (isAfterPeriodDay || isFutureOvulationDay) {
      selectedColor = Colors.white;
    }
    return Container(
      height: (isAfterPeriodDay) ? 25 : 30,
      width: (isAfterPeriodDay) ? 25 : 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // borderRadius: BorderRadius.circular(10),
        color: selectedColor,
      ),
      child: Center(
        child: Text(
          '${widget.currentDay!.day}',
          // Display the day of the month
          style: (isPeriodDay || isToday || isOvulationDay || isPastPeriodDay)
              ? (isFutureOvulationDay)
                  ? widget.dateStyles
                  : TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: (isPeriodDay ||
                              isToday ||
                              isOvulationDay ||
                              isPastPeriodDay)
                          ? (isFutureOvulationDay)
                              ? Colors.black
                              : Colors.white
                          : Colors.black,
                    )
              : widget.dateStyles,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return renderDateOrDayOfWeek(context);
  }

  /// Return true if current day is future period day else return false
  bool checkIsFuturePeriodDay() {
    bool isMatchDate = false;
    if (widget.lastPeriodDate!.isNotEmpty) {
      String currentDate = defaultDateFormat.format(widget.currentDay!);
      int index = widget.futurePeriodDays!.indexOf(currentDate);
      if (index != -1) {
        isMatchDate = true;
      }
    }
    return isMatchDate;
  }

  /// Return true if current day is past period day else return false
  bool checkIsPastPeriodDay() {
    bool isPeriodDay = false;
    if (widget.lastPeriodDate!.isNotEmpty) {
      String currentDate = defaultDateFormat.format(widget.currentDay!);
      List<String> periodDays = widget.pastAllPeriodsDays!;
      for (int index = 0; index < periodDays.length; index++) {
        if (periodDays[index] == currentDate) {
          isPeriodDay = true;
          break;
        }
      }
    }
    return isPeriodDay;
  }

  /// Return true if current day is period day else return false
  bool checkIsPeriodDay() {
    bool isPeriodDay = false;
    if (widget.lastPeriodDate!.isNotEmpty) {
      DateTime lastPeriodDate = DateFormat("yyyy-MM-dd")
          .parse(widget.lastPeriodDate!)
          .add(const Duration(days: -1));

      DateTime endPeriodDate = DateFormat("yyyy-MM-dd")
          .parse(widget.lastPeriodDate!)
          .add(Duration(days: widget.periodDuration));

      int inDays = lastPeriodDate.difference(DateTime.now()).inDays;
      //  printLogs("inDays $inDays");
      DateTime startPeriodDate = DateTime.parse(widget.lastPeriodDate!);

      bool isCurrentDateBtnPeriodsDays =
          (startPeriodDate.isBefore(widget.currentDay!) &&
              endPeriodDate.isAfter(widget.currentDay!));

      bool isValidPeriodDayCount =
          false; // Check is valid day count of period date
      if (inDays > 0 && inDays <= widget.periodDuration) {
        isValidPeriodDayCount = true;
      } else if (inDays < 0 && inDays >= -widget.periodDuration) {
        isValidPeriodDayCount = true;
      }
      if (!isCurrentDateBtnPeriodsDays) {
        isPeriodDay = false;
      } else if (!isValidPeriodDayCount) {
        isPeriodDay = false;
      } else {
        bool isBefore = widget.currentDay!.isBefore(endPeriodDate);
        bool isAfter = widget.currentDay!.isAfter(lastPeriodDate);

        if (widget.isEditMode) {
          if (widget.currentDay!.isBefore(DateTime.now())) {
            isPeriodDay = false;
          }
        } else {
          if (isBefore && isAfter) {
            isPeriodDay = true;
          }
        }
      }
    }
    return isPeriodDay;
  }

  /// Return true if period day after current date else return false
  bool checkIsPeriodDayAfterCurrentDate() {
    bool isPeriodDayAfterCurrentDate = false;
    if (widget.lastPeriodDate!.isNotEmpty) {
      if (checkIsPeriodDay()) {
        bool isAfter = widget.currentDay!.isAfter(DateTime.now());
        if (widget.currentDay!.compareTo(DateTime.now()) == 0 || isAfter) {
          isPeriodDayAfterCurrentDate = true;
        }
      }
    }
    return isPeriodDayAfterCurrentDate;
  }

  /// Return true if current day is ovulation day else return false
  bool checkIsOvulationDay() {
    bool isOvlDay = false;
    if (widget.lastPeriodDate!.isNotEmpty) {
      DateTime ovulationDay = DateFormat("yyyy-MM-dd")
          .parse(widget.lastPeriodDate!)
          .add(Duration(days: widget.cycleLength))
          .add(const Duration(days: -15));
      //  printLogs("ovulationDay ${defaultDateFormat.format(ovulationDay)}");
      bool isBefore = widget.currentDay!.isBefore(DateTime.now());
      if (!isBefore) {
        if (widget.currentDay!.compareTo(ovulationDay) == 0) {
          isOvlDay = true;
        }
      }
    }
    return isOvlDay;
  }

  /// Return true if current day is future ovulation day else return false
  bool checkIsFutureOvulationDay() {
    bool isMatchDate = false;
    if (widget.futureOvulationDays!.isNotEmpty) {
      String currentDate = defaultDateFormat.format(widget.currentDay!);
      int index = widget.futureOvulationDays!.indexOf(currentDate);
      if (index != -1) {
        isMatchDate = true;
      }
    }
    return isMatchDate;
  }
}
