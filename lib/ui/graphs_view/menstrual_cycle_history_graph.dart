import 'package:flutter/material.dart';

import '../../menstrual_cycle_widget.dart';
import '../../widget_languages/languages.dart';
import 'graph_util.dart';
import 'menstrual_cycle_all_history_graph.dart';

class MenstrualCycleHistoryGraph extends StatefulWidget {
  final String? headerTitle;
  final TextStyle? headerTitleTextStyle;
  final String? loadingText;
  final int viewCycleHistoryLength;
  final Color appBarBackgroundColor;
  final Color iconColor;

  const MenstrualCycleHistoryGraph({
    super.key,
    this.headerTitle,
    this.loadingText,
    this.appBarBackgroundColor = Colors.blueAccent,
    this.viewCycleHistoryLength = 3,
    this.iconColor = Colors.white,
    this.headerTitleTextStyle,
  });

  @override
  State<MenstrualCycleHistoryGraph> createState() =>
      _MenstrualCycleHistoryGraphState();
}

class _MenstrualCycleHistoryGraphState
    extends State<MenstrualCycleHistoryGraph> {
  List<PeriodsDateRange> allPeriodRange = [];

  bool isGetData = false;
  late TextStyle _headerTitleTextStyle;
  String _headerTitle = WidgetBaseLanguage.graphCycleTitle;
  String _loadingText = WidgetBaseLanguage.loading;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    _headerTitleTextStyle = widget.headerTitleTextStyle ??
        TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

    if (widget.headerTitle != null && widget.headerTitle!.isNotEmpty) {
      _headerTitle = widget.headerTitle!;
    }
    if (widget.loadingText != null && widget.loadingText!.isNotEmpty) {
      _loadingText = widget.loadingText!;
    }

    final instance = MenstrualCycleWidget.instance!;
    List<PeriodsDateRange> periodRange = await instance.getAllPeriodsDetails();
    for (int i = 0; i < periodRange.length; i++) {
      int cycleDuration = periodRange[i].cycleLength!;
      if (cycleDuration > 0 && cycleDuration < 50) {
        allPeriodRange.add(periodRange[i]);
      }
    }
    // TODO Add Condition to not allow widget.viewCycleHistoryLength is less then zero
    isGetData = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (allPeriodRange.isNotEmpty) {
      return _buildCycleHistoryView();
    } else {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: (isGetData)
              ? Text(WidgetBaseLanguage.noDataFound)
              : Text(_loadingText),
        ),
      );
    }
  }

  /// Returns the cycle history chart.
  _buildCycleHistoryView() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _headerTitle,
                style: _headerTitleTextStyle,
              ),
              const SizedBox(),
              (allPeriodRange.length > widget.viewCycleHistoryLength)
                  ? GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MenstrualAllCycleHistoryGraph(
                              headerTitle: widget.headerTitle,
                              headerTitleTextStyle: _headerTitleTextStyle,
                              loadingText: widget.loadingText,
                              iconColor: widget.iconColor,
                              appBarBackgroundColor:
                                  widget.appBarBackgroundColor,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        WidgetBaseLanguage.graphCycleViewAllTitle,
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 14),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          const Divider(
            color: Color(0x26212121),
          ),
          ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              itemCount: (allPeriodRange.length > widget.viewCycleHistoryLength)
                  ? widget.viewCycleHistoryLength
                  : allPeriodRange.length,
              itemBuilder: (BuildContext context, int index) {
                return getCycleHistoryView(index, allPeriodRange);
              }),
        ],
      ),
    );
  }
}
