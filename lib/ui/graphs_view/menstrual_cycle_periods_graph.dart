import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../menstrual_cycle_widget.dart';
import '../calender_view/common_view.dart';
import '../model/chart_cycle_periods_data.dart';
import 'graph_util.dart';

class MenstrualCyclePeriodsGraph extends StatefulWidget {
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
  final Function? onImageDownloadCallback;
  final Function? onPdfDownloadCallback;

  const MenstrualCyclePeriodsGraph(
      {super.key,
      this.loadingText = Strings.loading,
      this.xAxisTitle = Strings.graphCycleStartDate,
      this.xAxisTitleTextStyle =
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
      this.onImageDownloadCallback,
      this.onPdfDownloadCallback});

  @override
  State<MenstrualCyclePeriodsGraph> createState() =>
      _MenstrualCyclePeriodsGraphState();
}

class _MenstrualCyclePeriodsGraphState
    extends State<MenstrualCyclePeriodsGraph> {
  ChartSeriesController<ChartCyclePeriodsData, String>? seriesController;

  List<ChartCyclePeriodsData> periodCycleChartData = [];
  TooltipBehavior? _tooltipBehavior;
  late GlobalKey<SfCartesianChartState> _chartKey;
  late bool isLoadMoreView, isNeedToUpdateView, isDataUpdated;
  num? oldAxisVisibleMin, oldAxisVisibleMax;
  int maxValue = 0;
  String fileName = "Cycle_periods_graph";
  bool isGetData = false;
  List<PeriodsDateRange> allPeriodRange = [];
  int itemsPerPage = 7;
  int lastDataLength = 0;
  late GlobalKey<State> globalKey;
  late ZoomPanBehavior _zoomPanBehavior;
  bool isLastRecord = false;

  @override
  void initState() {
    _initializeVariables();
    init();
    super.initState();
  }

  void _initializeVariables() async {
    _chartKey = GlobalKey();
    _tooltipBehavior = TooltipBehavior(
      enable: true,
    );
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
    allPeriodRange = await instance.getAllPeriodsDetails();
    for (int i = 0; i < allPeriodRange.length; i++) {
      int cycleDuration = allPeriodRange[i].cycleDuration!;
      if (cycleDuration > 0) {
        if (maxValue <= cycleDuration) {
          maxValue = cycleDuration;
        }
      }
    }
    updateData();
    maxValue = maxValue + 10;
    isGetData = true;
    setState(() {});
  }

  updateData() {
    int start = periodCycleChartData.length;
    int end = start + itemsPerPage;
    if (end > allPeriodRange.length) end = allPeriodRange.length;
    lastDataLength = 0;
    for (int i = start; i < end; i++) {
      int cycleDuration = allPeriodRange[i].cycleDuration!;
      DateTime startDate = DateTime.parse(allPeriodRange[i].periodStartDate!);
      periodCycleChartData.add(ChartCyclePeriodsData(
          dateTime: CalenderDateUtils.dateWithYear(startDate),
          cycleLength: cycleDuration,
          periodsLength: allPeriodRange[i].periodDuration));
      lastDataLength = lastDataLength + 1;
    }

    if (periodCycleChartData.length == allPeriodRange.length) {
      isLastRecord = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (periodCycleChartData.isNotEmpty) {
      return Stack(children: [
        _buildCyclePeriodsChart(),
        (widget.isShowMoreOptions)
            ? getMenuWidget(
                fileName: fileName,
                onPdfDownloadCallback: widget.onPdfDownloadCallback,
                globalKey: _chartKey,
                onImageDownloadCallback: widget.onImageDownloadCallback)
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
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        labelRotation: -70,
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
        //rangePadding: ChartRangePadding.none,
        axisLine: const AxisLine(width: 0),
        labelFormat: '{value}',
        maximum: maxValue.toDouble(),
        minimum: 1,
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

  /// Returns the list of chart series
  /// which need to render on the stacked column 1oo chart.
  List<StackedColumnSeries<ChartCyclePeriodsData, String>>
      _getStackedColumnSeries() {
    return <StackedColumnSeries<ChartCyclePeriodsData, String>>[
      StackedColumnSeries<ChartCyclePeriodsData, String>(
        dataSource: periodCycleChartData,
        color: widget.periodDaysColor,
        onRendererCreated:
            (ChartSeriesController<ChartCyclePeriodsData, String>? controller) {
          seriesController = controller;
        },
        dataLabelSettings: const DataLabelSettings(isVisible: true),
        xValueMapper: (ChartCyclePeriodsData sales, _) => sales.dateTime,
        yValueMapper: (ChartCyclePeriodsData sales, _) => sales.periodsLength,
        name: widget.periodDaysTitle,
      ),
      StackedColumnSeries<ChartCyclePeriodsData, String>(
        dataSource: periodCycleChartData,
        color: widget.otherCycleDaysColor,
        dataLabelSettings: const DataLabelSettings(isVisible: true),
        onRendererCreated:
            (ChartSeriesController<ChartCyclePeriodsData, String>? controller) {
          seriesController = controller;
        },
        xValueMapper: (ChartCyclePeriodsData sales, _) => sales.dateTime,
        yValueMapper: (ChartCyclePeriodsData sales, _) => sales.cycleLength,
        name: widget.otherCycleDaysTitle,
      ),
    ];
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

  @override
  void dispose() {
    seriesController = null;
    super.dispose();
  }
}
