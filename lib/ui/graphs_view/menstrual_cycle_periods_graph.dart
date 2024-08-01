import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../menstrual_cycle_widget.dart';
import 'graph_util.dart';
import 'model/chart_cycle_periods_data.dart';

class MenstrualCyclePeriodsGraph extends StatefulWidget {
  final bool isShowHeader;
  final String headerTitle;
  final TextStyle headerTitleTextStyle;
  final String loadingText;
  final String xAxisTitle;
  final bool isShowXAxisTitle;
  final bool isShowMoreOptions;
  final TextStyle xAxisTitleTextStyle;
  final TextStyle yAxisTitleTextStyle;
  final String yAxisTitle;
  final bool isShowYAxisTitle;
  final Color periodDaysColor;
  final String periodDaysTitle;
  final Color otherCycleDaysColor;
  final String otherCycleDaysTitle;
  final Function? onDownloadImagePath;
  final Function? onDownloadPdfPath;

  const MenstrualCyclePeriodsGraph(
      {super.key,
      this.isShowHeader = true,
      this.headerTitle = Strings.graphCycleTrends,
      this.loadingText = Strings.loading,
      this.xAxisTitle = Strings.graphCycleStartDate,
      this.xAxisTitleTextStyle =
          const TextStyle(color: Colors.black, fontSize: 10),
      this.headerTitleTextStyle =
          const TextStyle(color: Colors.black, fontSize: 10),
      this.yAxisTitleTextStyle =
          const TextStyle(color: Colors.black, fontSize: 10),
      this.isShowXAxisTitle = true,
      this.isShowYAxisTitle = true,
      this.yAxisTitle = Strings.graphCycleLengthDays,
      this.periodDaysColor = defaultMenstruationColor,
      this.periodDaysTitle = Strings.graphCyclePeriodDay,
      this.otherCycleDaysColor = defaultLutealPhaseColor,
      this.isShowMoreOptions = false,
      this.otherCycleDaysTitle = Strings.graphCycleOtherDay,
      this.onDownloadImagePath,
      this.onDownloadPdfPath});

  @override
  State<MenstrualCyclePeriodsGraph> createState() =>
      _MenstrualCyclePeriodsGraphState();
}

class _MenstrualCyclePeriodsGraphState
    extends State<MenstrualCyclePeriodsGraph> {
  List<ChartCyclePeriodsData> periodCycleChartData = [];
  TooltipBehavior? _tooltipBehavior;
  late GlobalKey<SfCartesianChartState> _chartKey;

  int minValue = 0;
  int maxValue = 0;
  String fileName = "Cycle_periods_graph";
  bool isGetData = false;

  @override
  void initState() {
    _chartKey = GlobalKey();
    _tooltipBehavior = TooltipBehavior(
      enable: true,
    );
    init();
    super.initState();
  }

  init() async {
    final instance = MenstrualCycleWidget.instance!;
    List<PeriodsDateRange> allPeriodRange =
        await instance.getAllPeriodsDetails();

    for (int i = allPeriodRange.length - 1; i > 0; i--) {
      int cycleDuration = allPeriodRange[i].cycleDuration!;
      if (minValue == 0) {
        minValue = cycleDuration;
      }
      if (cycleDuration > 0) {
        if (minValue >= cycleDuration) {
          minValue = cycleDuration;
        }
        if (maxValue <= cycleDuration) {
          maxValue = cycleDuration;
        }
        DateTime startDate = DateTime.parse(allPeriodRange[i].periodStartDate!);
        periodCycleChartData.add(ChartCyclePeriodsData(
            dateTime: CalenderDateUtils.formatFirstDay(startDate),
            cycleLength: cycleDuration,
            periodsLength: allPeriodRange[i].periodDuration));
      }
    }
    minValue = minValue - 5;
    maxValue = maxValue + 5;
    isGetData = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (periodCycleChartData.isNotEmpty) {
      return Stack(children: [
        _buildCyclePeriodsChart(),
        (widget.isShowMoreOptions)
            ? getMenuWidget(
                fileName: fileName,
                onDownloadPdfPath: widget.onDownloadPdfPath,
                globalKey: _chartKey,
                onDownloadImagePath: widget.onDownloadImagePath)
            : const SizedBox(),
      ]);
    } else {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: (isGetData)
              ? const Text(Strings.noDataFound)
              : Text(widget.loadingText),
        ),
      );
    }
  }

  /// Returns the cycle periods chart.
  SfCartesianChart _buildCyclePeriodsChart() {
    return SfCartesianChart(
      key: _chartKey,
      plotAreaBorderWidth: 0,
      legend: Legend(
          isVisible: widget.isShowHeader,
          textStyle: widget.headerTitleTextStyle),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        rangePadding: ChartRangePadding.normal,

        labelStyle: widget.xAxisTitleTextStyle,
        title: (widget.isShowXAxisTitle)
            ? AxisTitle(
                text: widget.xAxisTitle,
                textStyle: widget.xAxisTitleTextStyle,
              )
            : const AxisTitle(
                text: "",
              ),
      ),
      primaryYAxis: NumericAxis(
        rangePadding: ChartRangePadding.none,
        axisLine: const AxisLine(width: 0),
        labelFormat: '{value}',
        maximum: maxValue.toDouble(),
        majorTickLines: const MajorTickLines(size: 0),
        labelStyle: widget.yAxisTitleTextStyle,
        title: (widget.isShowYAxisTitle)
            ? AxisTitle(
                text: widget.yAxisTitle,
                textStyle: widget.yAxisTitleTextStyle,
              )
            : const AxisTitle(
                text: "",
              ),
      ),
      series: _getStackedColumnSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Returns the list of chart series
  /// which need to render on the stacked column 1oo chart.
  List<StackedColumnSeries<ChartCyclePeriodsData, String>>
      _getStackedColumnSeries() {
    return <StackedColumnSeries<ChartCyclePeriodsData, String>>[
      StackedColumnSeries<ChartCyclePeriodsData, String>(
        dataSource: periodCycleChartData,
        color: widget.periodDaysColor,
        dataLabelSettings: const DataLabelSettings(isVisible: true),
        xValueMapper: (ChartCyclePeriodsData sales, _) => sales.dateTime,
        yValueMapper: (ChartCyclePeriodsData sales, _) => sales.periodsLength,
        name: widget.periodDaysTitle,
      ),
      StackedColumnSeries<ChartCyclePeriodsData, String>(
        dataSource: periodCycleChartData,
        color: widget.otherCycleDaysColor,
        dataLabelSettings: const DataLabelSettings(isVisible: true),
        xValueMapper: (ChartCyclePeriodsData sales, _) => sales.dateTime,
        yValueMapper: (ChartCyclePeriodsData sales, _) => sales.cycleLength,
        name: widget.otherCycleDaysTitle,
      ),
    ];
  }
}
