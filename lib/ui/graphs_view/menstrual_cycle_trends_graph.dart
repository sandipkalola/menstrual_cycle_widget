import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import '../../menstrual_cycle_widget.dart';
import '../calender_view/common_view.dart';
import '../model/chart_cycle_data.dart';
import 'graph_util.dart';

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
  ChartSeriesController<ChartCycleData, String>? seriesController;

  TooltipBehavior? _tooltipBehavior;
  late GlobalKey<SfCartesianChartState> _chartKey;
  late bool isLoadMoreView, isNeedToUpdateView, isDataUpdated;
  num? oldAxisVisibleMin, oldAxisVisibleMax;
  int minValue = 0;
  int maxValue = 0;
  bool isLastRecord = false;
  late ZoomPanBehavior _zoomPanBehavior;
  late bool _seriesColor;
  late double _horizontalPadding;
  late double _verticalPadding;
  List<ChartCycleData> periodCycleChartData = [];
  ChartDataLabelAlignment? _labelPosition;
  ChartAlignment? _chartAlignment;
  String fileName = "Cycle_trends_graph_";
  bool isGetData = false;
  late GlobalKey<State> globalKey;
  int itemsPerPage = 7;
  int lastDataLength = 0;

  List<PeriodsDateRange> allPeriodDates = [];

  @override
  void initState() {
    _initializeVariables();
    init();
    super.initState();
  }

  void _initializeVariables() async {
    _chartKey = GlobalKey();
    _labelPosition = ChartDataLabelAlignment.top;
    _chartAlignment = ChartAlignment.center;
    _seriesColor = widget.isShowSeriesColor;
    _horizontalPadding = 0;
    _verticalPadding = 0;
    isLoadMoreView = false;
    isNeedToUpdateView = false;
    isDataUpdated = true;
    globalKey = GlobalKey<State>();
    _tooltipBehavior = TooltipBehavior(
      enable: true,
    );
    _zoomPanBehavior = ZoomPanBehavior(
      enablePanning: true,
      enablePinching: true,
      maximumZoomLevel: 0.3,
      zoomMode: ZoomMode.x,
    );
  }

  init() async {
    final instance = MenstrualCycleWidget.instance!;

    allPeriodDates = await instance.getAllPeriodsDetails();

    for (int i = 0; i < allPeriodDates.length; i++) {
      int cycleDuration =
          allPeriodDates[i].cycleDuration! + allPeriodDates[i].periodDuration!;
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
      }
    }
    updateData();
    minValue = minValue - 5;
    maxValue = maxValue + 5;
    if (minValue < 0) {
      minValue = 0;
    }
    isGetData = true;
    setState(() {});
  }

  updateData() {
    int start = periodCycleChartData.length;
    int end = start + itemsPerPage;
    if (end > allPeriodDates.length) end = allPeriodDates.length;
    lastDataLength = 0;
    for (int i = start; i < end; i++) {
      int cycleDuration =
          allPeriodDates[i].cycleDuration! + allPeriodDates[i].periodDuration!;
      DateTime startDate = DateTime.parse(allPeriodDates[i].periodStartDate!);
      periodCycleChartData.add(
        ChartCycleData(
            dateTime: CalenderDateUtils.dateWithYear(startDate),
            cycleLength: cycleDuration),
      );
      lastDataLength = lastDataLength + 1;
    }

    if (periodCycleChartData.length == allPeriodDates.length) {
      isLastRecord = true;
    }
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
      zoomPanBehavior: _zoomPanBehavior,
      onZooming: (ZoomPanArgs args) {},
      onActualRangeChanged: (ActualRangeChangedArgs args) {
        if (args.orientation == AxisOrientation.horizontal) {
          if (isLoadMoreView) {
            args.visibleMin = oldAxisVisibleMin;
            args.visibleMax = oldAxisVisibleMax;
          }
          oldAxisVisibleMin = args.visibleMin as num;
          oldAxisVisibleMax = args.visibleMax as num;
          isLoadMoreView = false;
        }
      },
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
      loadMoreIndicatorBuilder:
          (BuildContext context, ChartSwipeDirection direction) =>
              getLoadMoreIndicatorBuilder(context, direction),
    );
  }

  Widget getLoadMoreIndicatorBuilder(
      BuildContext context, ChartSwipeDirection direction) {
    if (direction == ChartSwipeDirection.end) {
      isNeedToUpdateView = true;
      globalKey = GlobalKey<State>();
      return StatefulBuilder(
          key: globalKey,
          builder: (BuildContext context, StateSetter stateSetter) {
            Widget widget;
            if (isNeedToUpdateView) {
              widget = getProgressIndicator();
              _updateView();
              isDataUpdated = true;
            } else {
              widget = Container();
            }
            return widget;
          });
    } else {
      return SizedBox.fromSize(size: Size.zero);
    }
  }

  Widget getProgressIndicator() {
    return (isLastRecord) ? const SizedBox() : progressIndicator();
  }

  Future<void> _updateView() async {
    await Future<void>.delayed(const Duration(seconds: 1), () {
      isNeedToUpdateView = false;
      if (isDataUpdated) {
        _updateData();
        isDataUpdated = false;
      }

      if (globalKey.currentState != null) {
        (globalKey.currentState as dynamic).setState(() {});
      }
    });
  }

  void _updateData() async {
    updateData();
    isLoadMoreView = true;
    seriesController?.updateDataSource(
        addedDataIndexes: getIndexes(lastDataLength));
  }

  List<int> getIndexes(int length) {
    final List<int> indexes = <int>[];
    for (int i = length - 1; i >= 0; i--) {
      indexes.add(periodCycleChartData.length - 1 - i);
    }
    return indexes;
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
        onRendererCreated:
            (ChartSeriesController<ChartCycleData, String>? controller) {
          seriesController = controller;
        },
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

  @override
  void dispose() {
    seriesController = null;
    super.dispose();
  }
}
