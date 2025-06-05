import 'package:flutter/material.dart';

import '../../menstrual_cycle_widget.dart';
import '../../widget_languages/languages.dart';
import '../text_style/custom_text_style.dart';
import 'graph_util.dart';

/// TODO Add start and end date to get data for all graph
class MenstrualAllCycleHistoryGraph extends StatefulWidget {
  final String? headerTitle;
  final TextStyle? headerTitleTextStyle;
  final String? loadingText;
  final Color appBarBackgroundColor;

  const MenstrualAllCycleHistoryGraph({
    super.key,
    this.headerTitle,
    this.loadingText,
    this.appBarBackgroundColor = Colors.blueAccent,
    this.headerTitleTextStyle,
  });

  @override
  State<MenstrualAllCycleHistoryGraph> createState() =>
      _MenstrualAllCycleHistoryGraphState();
}

class _MenstrualAllCycleHistoryGraphState
    extends State<MenstrualAllCycleHistoryGraph> {
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
    _headerTitleTextStyle = getTextStyle(widget.headerTitleTextStyle);
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
    isGetData = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.appBarBackgroundColor,
        title: Text(
          _headerTitle,
          style: _headerTitleTextStyle,
        ),
      ),
      body: (allPeriodRange.isNotEmpty)
          ? _buildCycleHistoryView()
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: (isGetData)
                    ? Text(WidgetBaseLanguage.noDataFound)
                    : Text(_loadingText),
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
            return getCycleHistoryView(index, allPeriodRange);
          }),
    );
  }
}
