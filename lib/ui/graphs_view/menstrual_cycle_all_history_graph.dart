import 'package:flutter/material.dart';

import '../../menstrual_cycle_widget.dart';

/// TODO Add start and end date to get data for all graph
class MenstrualAllCycleHistoryGraph extends StatefulWidget {
  final String headerTitle;
  final TextStyle headerTitleTextStyle;
  final String loadingText;
  final Color appBarBackgroundColor;

  const MenstrualAllCycleHistoryGraph({
    super.key,
    this.headerTitle = Strings.graphCycleTitle,
    this.loadingText = Strings.loading,
    this.appBarBackgroundColor = Colors.blueAccent,
    this.headerTitleTextStyle = const TextStyle(
        color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
  });

  @override
  State<MenstrualAllCycleHistoryGraph> createState() =>
      _MenstrualAllCycleHistoryGraphState();
}

class _MenstrualAllCycleHistoryGraphState
    extends State<MenstrualAllCycleHistoryGraph> {
  List<PeriodsDateRange> allPeriodRange = [];

  bool isGetData = false;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    final instance = MenstrualCycleWidget.instance!;
    List<PeriodsDateRange> periodRange = await instance.getAllPeriodsDetails();
    for (int i = 0; i < periodRange.length; i++) {
      int cycleDuration = periodRange[i].cycleDuration!;
      if (cycleDuration > 0 && cycleDuration < 50) {
        allPeriodRange.add(periodRange[i]);
      }
    }
    isGetData = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.appBarBackgroundColor,
        title: Text(
          widget.headerTitle,
          style: widget.headerTitleTextStyle,
        ),
      ),
      body: (allPeriodRange.isNotEmpty)
          ? _buildCycleHistoryView()
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: (isGetData)
                    ? const Text(Strings.noDataFound)
                    : Text(widget.loadingText),
              ),
            ),
    );
  }

  /// Returns the cycle history chart.
  _buildCycleHistoryView() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          itemCount: allPeriodRange.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (index != 0)
                    ? Text(
                        "${CalenderDateUtils.formatFirstDay(DateTime.parse(allPeriodRange[index].cycleStartDate!))} - ${(allPeriodRange[index].cycleEndDate != null) ? CalenderDateUtils.formatFirstDay(DateTime.parse(allPeriodRange[index].cycleEndDate!)) : "-"}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    : Text(
                        "${CalenderDateUtils.formatFirstDay(DateTime.parse(allPeriodRange[index].cycleStartDate!))} - ${Strings.graphCycleNowTitle}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    height: 25,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        itemCount: allPeriodRange[index].cycleDuration,
                        itemBuilder: (BuildContext context, int inx) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Container(
                              width: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: (inx >
                                        allPeriodRange[index].periodDuration!)
                                    ? const Color(0x26212121)
                                    : const Color(0x80ff584f),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Text(
                  "${allPeriodRange[index].periodDuration!} ${Strings.graphCycleDaysPeriod} , ${allPeriodRange[index].cycleDuration!} ${Strings.graphCycleDaysCycle}",
                  style:
                      const TextStyle(color: Color(0xA6212121), fontSize: 10),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            );
          }),
    );
  }
}
