import 'package:flutter/material.dart';
import 'package:menstrual_cycle_widget/ui/calender_view/scroll_to_index.dart';
import '../../menstrual_cycle_widget.dart';
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

  int pastMonthCount = 3;
  int nextMonthCount = 3;
  int nextMonthIncrementCount = 3;
  int pastMonthDecrementCount = 3;

  late AutoScrollController controller;
  bool isInitialScroll = true;

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
    init();
    _selectedDate = widget.initialDate ?? DateTime.now();
    generateMonthData(true);
  }

  init() async {
    _instance.calculateLastPeriodDate();
    pastAllPeriodsDays = _instance.pastAllPeriodDays;
    futurePeriodDays = await initFuturePeriodDay();
    futureOvulationDays = await initFutureOvulationDay();
    /*setState(() {});*/
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
    for (int index = pastMonthCount; index > 0; index--) {
      DateTime currantMonth = getDateTimeFromMonthsAgo(index);
      monthTitle.add(CalenderDateUtils.monthYear.format(currantMonth));
      monthWidgets
          .add(monthCalendarBuilder(currantMonth, isConsiderFutureDate));
    }
    monthTitle.add(CalenderDateUtils.monthYear.format(_selectedDate));
    monthWidgets.add(monthCalendarBuilder(_selectedDate, isConsiderFutureDate));
    // Next month data
    if (isConsiderFutureDate) {
      DateTime nextMonth = CalenderDateUtils.nextMonth(_selectedDate);
      for (int index = 0; index < nextMonthCount; index++) {
        monthTitle.add(CalenderDateUtils.monthYear.format(nextMonth));
        monthWidgets.add(monthCalendarBuilder(nextMonth, isConsiderFutureDate));
        nextMonth = CalenderDateUtils.nextMonth(nextMonth);
      }
    }

    //setState(() {});
    if (isInitialScroll) {
      await controller.scrollToIndex(3,
          preferPosition: AutoScrollPosition.begin);
      isInitialScroll = false;
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

    selectedPeriodsDate.sort((a, b) => a.compareTo(b));
    if (selectedPeriodsDate.isNotEmpty) {
      DateTime lastPeriodDate = selectedPeriodsDate[0].add(Duration(days: -1));
      /* printMenstrualCycleLogs(
          "Date : ${CalenderDateUtils.dateWithYear(lastPeriodDate)}");*/
      await dbHelper.clearPeriodLogAfterSpecificDate(
          encryptedUserid, CalenderDateUtils.dateDayFormat(lastPeriodDate));
      await dbHelper.insertPeriodLog(selectedPeriodsDate);
    } else {
      await dbHelper.clearPeriodLog(encryptedUserid);
    }
    /*for (int i = 0; i < selectedPeriodsDate.length; i++) {
      printMenstrualCycleLogs(
          "Date : ${CalenderDateUtils.dateWithYear(selectedPeriodsDate[i])}");
    }*/
    /*final dbHelper = MenstrualCycleDbHelper.instance;
    final instance = MenstrualCycleWidget.instance!;
    String encryptedUserid = instance.getCustomerId();
    // TODO Clear only visible date data when we click on save button.
    await dbHelper.clearPeriodLog(encryptedUserid);
    await dbHelper.insertPeriodLog(selectedPeriodsDate);
    */
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
      onPopInvokedWithResult: (bool didPop, d) {
        if (didPop) {
          return;
        }
        if (context.mounted) {
          Navigator.pop(context, isChangedData);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
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
              GridView.count(
                childAspectRatio: 1.5,
                primary: false,
                shrinkWrap: true,
                crossAxisCount: 7,
                padding: const EdgeInsets.only(bottom: 0.0),
                children: titleCalendarBuilder(),
              ),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification notification) {
                      if (notification is ScrollUpdateNotification ||
                          notification is ScrollEndNotification) {
                        /* printMenstrualCycleLogs(
                            "pixels ${notification.metrics.pixels}");
                        printMenstrualCycleLogs(
                            "minScrollExtent ${notification.metrics.minScrollExtent}");
                        printMenstrualCycleLogs(
                            "minScrollExtent ${notification.metrics.maxScrollExtent}");*/

                        if (notification.metrics.pixels < 10) {
                          printMenstrualCycleLogs('Reached top');
                          //
                          pastMonthCount = pastMonthCount + 1;
                          DateTime currantMonth =
                              getDateTimeFromMonthsAgo(pastMonthCount);
                          monthTitle.insert(0,
                              CalenderDateUtils.monthYear.format(currantMonth));
                          monthWidgets.insert(
                              0, monthCalendarBuilder(currantMonth, false));

                          setState(() {});
                        } else if (notification.metrics.pixels + 100 >
                                notification.metrics.maxScrollExtent &&
                            !isEditMode) {
                          printMenstrualCycleLogs('Reached bottom');
                          if (nextMonthCount <= futureMonthCount) {
                            DateTime nextMonth = DateTime.now();
                            for (int index = 0;
                                index <= nextMonthCount;
                                index++) {
                              nextMonth =
                                  CalenderDateUtils.nextMonth(nextMonth);
                            }
                            for (int index = nextMonthCount;
                                index <
                                    nextMonthCount + nextMonthIncrementCount;
                                index++) {
                              monthTitle.add(CalenderDateUtils.monthYear
                                  .format(nextMonth));
                              monthWidgets
                                  .add(monthCalendarBuilder(nextMonth, true));
                              nextMonth =
                                  CalenderDateUtils.nextMonth(nextMonth);
                            }
                            nextMonthCount =
                                nextMonthCount + nextMonthIncrementCount;

                            setState(() {});
                          }
                        }
                      }
                      return true;
                    },
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      controller: controller,
                      padding: const EdgeInsets.all(8),
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: monthWidgets.length,
                      itemBuilder: (BuildContext context, int index) {
                        bool monthStarted = false;
                        return AutoScrollTag(
                          key: ValueKey(index),
                          controller: controller,
                          index: index,
                          child: Column(
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
                                children: List.generate(
                                    monthWidgets[index].length, (childIndex) {
                                  DateTime day = CalenderDateUtils.getDay(
                                      monthWidgets[index][childIndex]);

                                  if (CalenderDateUtils.isFirstDayOfMonth(
                                      day)) {
                                    monthStarted = true;
                                  }
                                  return CalendarCell(
                                    themeColor: widget.themeColor,
                                    selectedColor: widget.selectedColor,
                                    todayColor: widget.todayColor,
                                    isEditMode: isEditMode,
                                    multipleDateSelectionCallBack: (value) {
                                      dateSelectionCallBack(
                                          monthWidgets[index][childIndex],
                                          value);
                                    },
                                    onDateSelected: () =>
                                        _launchDateSelectionCallback(
                                            monthWidgets[index][childIndex]),
                                    currentDay: monthWidgets[index][childIndex],
                                    isBlankDay: (monthStarted) ? false : true,
                                    previousPeriodDate:
                                        _instance.getPreviousPeriodDay(),
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
                          ),
                        );
                      },
                    )),
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
                              child: const Center(
                                child: Text(
                                  Strings.saveLabel,
                                  style: TextStyle(
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
                        child: const Text(
                          Strings.editPeriodDateLabel,
                          style: TextStyle(
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
