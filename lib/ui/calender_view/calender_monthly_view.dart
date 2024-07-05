import 'package:flutter/material.dart';

import '../../menstrual_cycle_widget.dart';
import '../../utils/constant.dart';
import 'calender_view.dart';

class CalenderMonthlyView extends StatefulWidget {
  final ValueChanged<DateTime>? onDateSelected;
  final Color? selectedColor;
  final Color? todayColor;
  final DateTime? initialDate;
  final List<String> weekTitles;
  final double? borderRadius;
  final Function? onDataChanged;
  final int cycleLength;
  final Color themeColor;
  final int periodLength;
  final bool isFromCalender;
  final bool hideInfoView;

  const CalenderMonthlyView({
    super.key,
    this.onDateSelected,
    required this.themeColor,
    this.selectedColor,
    this.todayColor,
    this.initialDate,
    this.weekTitles = CalenderDateUtils.weekTitles,
    this.onDataChanged,
    this.borderRadius = 20,
    this.cycleLength = defaultCycleLength,
    this.periodLength = defaultPeriodDuration,
    this.isFromCalender = true,
    this.hideInfoView = false,
  });

  @override
  State<CalenderMonthlyView> createState() => _CalenderMonthlyViewState();
}

class _CalenderMonthlyViewState extends State<CalenderMonthlyView> {
  DateTime _selectedDate = DateTime.now();
  List<List<DateTime>> monthWidgets = [];
  List<String> monthTitle = [];
  bool isEditMode = false;
  List<DateTime> selectedPeriodsDate = [];
  bool isChangedData = false;

  List<String> futurePeriodDays = [];
  List<String> futureOvulationDays = [];
  List<String>? pastAllPeriodsDays = [];
  final _instance = MenstrualCycleWidget.instance!;

  @override
  void initState() {
    super.initState();
    init();
    _selectedDate = widget.initialDate ?? DateTime.now();
    generateMonthData(true);
  }

  init() async {
    pastAllPeriodsDays = _instance.pastAllPeriodDays;
    futurePeriodDays = await initFuturePeriodDay();
    futureOvulationDays = await initFutureOvulationDay();
    //printLogs(("data.... ${pastAllPeriodsDays.toString()}");
    setState(() {});
  }

  DateTime getDateTimeFromMonthsAgo(int monthsAgo) {
    final now = DateTime.now();
    int year = now.year;
    int month = now.month;

    // Subtract months and adjust year if necessary
    month -= monthsAgo;
    while (month <= 0) {
      month += 12;
      year -= 1;
    }

    // Return the calculated date
    return DateTime(year, month);
  }

  void generateMonthData(bool isConsiderFutureDate) async {
    //printLogs(("isConsiderFutureDate == $isConsiderFutureDate");
    monthWidgets.clear();
    monthTitle.clear();
    // Past month data
    for (int index = 5; index > 0; index--) {
      DateTime currantMonth = getDateTimeFromMonthsAgo(index);
      monthWidgets
          .add(monthCalendarBuilder(currantMonth, isConsiderFutureDate));
    }
    monthWidgets.add(monthCalendarBuilder(_selectedDate, isConsiderFutureDate));
    // Next month data
    if (isConsiderFutureDate) {
      DateTime nextMonth = CalenderDateUtils.nextMonth(_selectedDate);
      for (int index = 0; index < 5; index++) {
        monthWidgets.add(monthCalendarBuilder(nextMonth, isConsiderFutureDate));
        nextMonth = CalenderDateUtils.nextMonth(nextMonth);
      }
    }
  }

  List<DateTime> _daysInMonth(DateTime month) {
    var first = CalenderDateUtils.firstDayOfMonth(month);
    var daysBefore = first.weekday;
    var firstToDisplay = first.subtract(Duration(days: daysBefore));
    var last = CalenderDateUtils.lastDayOfMonth(month);

    var daysAfter = 7 - last.weekday;

    if (daysAfter == 0) {
      daysAfter = 7;
    }

    var lastToDisplay = last.add(const Duration(days: 1));
    return CalenderDateUtils.daysInRange(firstToDisplay, lastToDisplay)
        .toList();
  }

  void previousMonth() {
    _selectedDate = CalenderDateUtils.previousMonth(_selectedDate);
  }

  void nextMonth() {
    _selectedDate = CalenderDateUtils.nextMonth(_selectedDate);
  }

  titleCalendarBuilder() {
    List<Widget> dayWidgets = [];
    for (var day in widget.weekTitles) {
      dayWidgets.add(
        CalendarCell(
          themeColor: widget.themeColor,
          isDayOfWeek: true,
          multipleDateSelectionCallBack: () {},
          dayOfWeekStyle: TextStyle(
              color: widget.themeColor,
              fontWeight: FontWeight.w800,
              fontSize: 11),
          dayOfWeek: day,
        ),
      );
    }
    return dayWidgets;
  }

  monthCalendarBuilder(selectedDate, isConsiderFutureDate) {
    List<DateTime> dayWidgets = [];
    List<DateTime>? calendarDays = _daysInMonth(selectedDate);

    monthTitle.add(monthYear.format(selectedDate));
    for (var day in calendarDays) {
      day = CalenderDateUtils.getDay(day);
      if (day.hour > 0) {
        day = day.toLocal();
        day = day.subtract(Duration(hours: day.hour));
      }
      bool isBeforeCurrentDate = day.isBefore(DateTime.now());
      if (isBeforeCurrentDate) {
        dayWidgets.add(day);
      } else if (isConsiderFutureDate) {
        dayWidgets.add(day);
      }
    }
    return dayWidgets;
  }

  void _launchDateSelectionCallback(DateTime day) {
    //printLogs(("_launchDateSelectionCallback Day Click-------");
    if (!isEditMode) {
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(day);
      }
    }
  }

  void dateSelectionCallBack(DateTime day, bool isChecked) {
    //printLogs(("dateSelectionCallBack-------");
    int index = selectedPeriodsDate.indexOf(day);
    if (index > -1) {
      if (!isChecked) {
        //printLogs(("REMOVE Date $day");
        selectedPeriodsDate.removeAt(index);
      }
    } else {
      if (isChecked) {
        //printLogs(("ADD Date $day");
        selectedPeriodsDate.add(day);
      }
    }
  }

  /// Store user's periods data to firebase
  saveSelectedPeriodDate() async {
    final dbHelper = MenstrualCycleDbHelper.instance;
    final instance = MenstrualCycleWidget.instance!;
    String encryptedUserid = instance.getCustomerId();
    await dbHelper.clearPeriodLog(encryptedUserid);
    await dbHelper.insertPeriodLog(selectedPeriodsDate);
    isChangedData = true;
    widget.onDataChanged!.call(isChangedData);
    isEditMode = false;
    generateMonthData(true);

    //printLogs(("Old data.... ${pastAllPeriodsDays.toString()}");
    pastAllPeriodsDays = await instance.calculateLastPeriodDate();
    //printLogs(("New .... ${pastAllPeriodsDays.toString()}");
    futurePeriodDays = await initFuturePeriodDay();
    futureOvulationDays = await initFutureOvulationDay();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        if (context.mounted) {
          Navigator.pop(context, isChangedData);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.isFromCalender)
                IconButton(
                  onPressed: () {
                    Navigator.pop(context, isChangedData);
                  },
                  iconSize: 25.0,
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  icon: Icon(
                    Icons.close,
                    color: widget.themeColor,
                  ),
                ),
              if (!widget.hideInfoView)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: getInformationView(
                      widget.selectedColor!, widget.themeColor),
                ),
              Expanded(
                child: SingleChildScrollView(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: monthWidgets.length,
                    itemBuilder: (BuildContext context, int index) {
                      bool monthStarted = false;
                      return Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            monthTitle[index],
                            style: TextStyle(
                                color: widget.themeColor,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          GridView.count(
                            childAspectRatio: 1.5,
                            primary: false,
                            shrinkWrap: true,
                            crossAxisCount: 7,
                            padding: const EdgeInsets.only(bottom: 0.0),
                            children: titleCalendarBuilder(),
                          ),
                          GridView.count(
                            childAspectRatio: 1.5,
                            primary: false,
                            shrinkWrap: true,
                            crossAxisCount: 7,
                            padding: const EdgeInsets.only(bottom: 0.0),
                            children: List.generate(monthWidgets[index].length,
                                (childIndex) {
                              DateTime day = CalenderDateUtils.getDay(
                                  monthWidgets[index][childIndex]);

                              if (CalenderDateUtils.isFirstDayOfMonth(day)) {
                                monthStarted = true;
                              }
                              return CalendarCell(
                                themeColor: widget.themeColor,
                                selectedColor: widget.selectedColor,
                                todayColor: widget.todayColor,
                                isEditMode: isEditMode,
                                multipleDateSelectionCallBack: (value) {
                                  dateSelectionCallBack(
                                      monthWidgets[index][childIndex], value);
                                },
                                onDateSelected: () =>
                                    _launchDateSelectionCallback(
                                        monthWidgets[index][childIndex]),
                                currentDay: monthWidgets[index][childIndex],
                                isBlankDay: (monthStarted) ? false : true,
                                lastPeriodDate: _instance.getLastPeriodDay(),
                                pastAllPeriodsDays: pastAllPeriodsDays,
                                futurePeriodDays: futurePeriodDays,
                                futureOvulationDays: futureOvulationDays,
                                cycleLength: widget.cycleLength,
                                periodDuration: widget.periodLength,
                                dateStyles: TextStyle(
                                    color: widget.themeColor,
                                    fontWeight: FontWeight.normal),
                                isSelected: false,
                              );
                            }),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              if (isEditMode)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Divider(
                        color: widget.themeColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              saveSelectedPeriodDate();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                color: widget.themeColor,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    width: 1.0, color: widget.themeColor),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              height: 40,
                              width: 150,
                              child: Center(
                                child: Text(
                                  Strings.saveLabel,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isEditMode) {
                                  generateMonthData(true);
                                  isEditMode = false;
                                } else {
                                  isEditMode = true;
                                }
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 150,
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: widget.themeColor),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  Strings.cancelLabel,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: widget.themeColor),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              if (!isEditMode)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isEditMode) {
                          isEditMode = false;
                        } else {
                          generateMonthData(false);
                          isEditMode = true;
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: widget.themeColor,
                          shape: BoxShape.rectangle,
                          border:
                              Border.all(width: 1.0, color: widget.themeColor),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          Strings.editPeriodDateLabel,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
