import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import '../../menstrual_cycle_widget.dart';
import 'graph_util.dart';
import 'model/chart_cycle_data.dart';

class MenstrualCycleTrendsGraph extends StatefulWidget {
  final bool isShowSeriesColor;
  final bool isShowHeader;
  final bool isShowMoreOptions;
  final bool isShowNormalRangeHint;
  final String normalRangeHintTitle;
  final TextStyle normalRangeHintTextStyle;
  final String headerTitle;
  final TextStyle headerTitleTextStyle;
  final String loadingText;
  final String xAxisTitle;
  final bool isShowXAxisTitle;
  final TextStyle xAxisTitleTextStyle;
  final TextStyle yAxisTitleTextStyle;
  final String yAxisTitle;
  final bool isShowYAxisTitle;
  final Color themeColor;
  final Function? onDownloadImagePath;
  final Function? onDownloadPdfPath;

  const MenstrualCycleTrendsGraph(
      {super.key,
      this.isShowSeriesColor = true,
      this.isShowHeader = true,
      this.headerTitle = Strings.graphCycleTrends,
      this.loadingText = Strings.loading,
      this.isShowMoreOptions = false,
      this.xAxisTitle = Strings.graphCycleStartDate,
      this.isShowNormalRangeHint = true,
      this.xAxisTitleTextStyle =
          const TextStyle(color: Colors.black, fontSize: 10),
      this.normalRangeHintTextStyle =
          const TextStyle(color: Colors.black, fontSize: 10),
      this.headerTitleTextStyle =
          const TextStyle(color: Colors.black, fontSize: 10),
      this.yAxisTitleTextStyle =
          const TextStyle(color: Colors.black, fontSize: 10),
      this.isShowXAxisTitle = true,
      this.isShowYAxisTitle = true,
      this.yAxisTitle = Strings.graphCycleLengthDays,
      this.normalRangeHintTitle = Strings.graphCycleNormalDays,
      this.themeColor = Colors.black,
      this.onDownloadImagePath,
      this.onDownloadPdfPath});

  @override
  State<MenstrualCycleTrendsGraph> createState() =>
      _MenstrualCycleTrendsGraphState();
}

class _MenstrualCycleTrendsGraphState extends State<MenstrualCycleTrendsGraph> {
  TooltipBehavior? _tooltipBehavior;
  late GlobalKey<SfCartesianChartState> _chartKey;
  int minValue = 0;
  int maxValue = 0;
  late ZoomPanBehavior _zoomPanBehavior;
  late bool _seriesColor;
  late double _horizontalPadding;
  late double _verticalPadding;
  List<ChartCycleData> periodCycleChartData = [];
  ChartDataLabelAlignment? _labelPosition;
  ChartAlignment? _chartAlignment;
  String fileName = "Cycle_trends_graph_";
  bool isGetData = false;

  @override
  void initState() {
    _chartKey = GlobalKey();
    _labelPosition = ChartDataLabelAlignment.top;
    _chartAlignment = ChartAlignment.center;
    _seriesColor = widget.isShowSeriesColor;
    _horizontalPadding = 0;
    _verticalPadding = 0;
    _tooltipBehavior = TooltipBehavior(
      enable: true,
    );
    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      zoomMode: ZoomMode.x,
      maximumZoomLevel: 0.3,
      enablePanning: true,
    );
    init();
    super.initState();
  }

  init() async {
    final instance = MenstrualCycleWidget.instance!;
    List<PeriodsDateRange> allPeriodRange =
        await instance.getAllPeriodsDetails();

    for (int i = allPeriodRange.length - 1; i > 0; i--) {
      int cycleDuration =
          allPeriodRange[i].cycleDuration! + allPeriodRange[i].periodDuration!;
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
        periodCycleChartData.add(ChartCycleData(
            dateTime: CalenderDateUtils.formatFirstDay(startDate),
            cycleLength: cycleDuration));
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
        _buildCycleTrendsChart(),
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

  /// Returns the cycle trends  chart.
  SfCartesianChart _buildCycleTrendsChart() {
    return SfCartesianChart(
        key: _chartKey,
        plotAreaBorderWidth: 0,
        enableAxisAnimation: true,
        legend: Legend(
            isVisible: widget.isShowHeader,
            textStyle: widget.headerTitleTextStyle),
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          labelRotation: -70,
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
          labelPlacement: LabelPlacement.onTicks,
          edgeLabelPlacement: EdgeLabelPlacement.shift,
        ),
        primaryYAxis: NumericAxis(
          minimum: minValue.toDouble(),
          maximum: maxValue.toDouble(),
          axisLine: const AxisLine(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          labelFormat: '{value}',
          labelStyle: widget.yAxisTitleTextStyle,
          title: (widget.isShowYAxisTitle)
              ? AxisTitle(
                  text: widget.yAxisTitle,
                  textStyle: widget.yAxisTitleTextStyle,
                )
              : const AxisTitle(
                  text: "",
                ),
          majorTickLines: const MajorTickLines(size: 0),
          plotBands: (widget.isShowNormalRangeHint)
              ? <PlotBand>[
                  PlotBand(
                    start: 21,
                    end: 36,
                    color: Colors.grey.withOpacity(0.2),
                    text: widget.normalRangeHintTitle,
                    textStyle: widget.normalRangeHintTextStyle,
                  ),
                ]
              : [],
        ),
        series: _getDefaultSplineSeries(),
        tooltipBehavior: _tooltipBehavior,
        zoomPanBehavior: _zoomPanBehavior);
  }

  /// Returns the list of chart series which need to render on the spline chart.
  List<SplineSeries<ChartCycleData, String>> _getDefaultSplineSeries() {
    return <SplineSeries<ChartCycleData, String>>[
      SplineSeries<ChartCycleData, String>(
        legendIconType: LegendIconType.seriesType,
        dataSource: periodCycleChartData,
        enableTooltip: true,
        color: widget.themeColor,
        xValueMapper: (ChartCycleData sales, _) => sales.dateTime as String,
        yValueMapper: (ChartCycleData sales, _) => sales.cycleLength,
        markerSettings: const MarkerSettings(isVisible: true),
        name: widget.headerTitle,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          useSeriesColor: _seriesColor,
          alignment: _chartAlignment!,
          labelAlignment: _labelPosition!,
          offset: Offset(_horizontalPadding, _verticalPadding),
        ),
      ),
    ];
  }
}
