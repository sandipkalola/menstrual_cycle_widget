import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../menstrual_cycle_widget.dart';
import '../../widget_languages/languages.dart';
import '../calender_view/common_view.dart';
import '../model/chart_cycle_periods_data.dart';
import '../text_style/custom_text_style.dart';
import 'graph_util.dart';

class MenstrualCyclePeriodsGraph extends StatefulWidget {
  final String? loadingText;
  final String? xAxisTitle;
  final bool isShowXAxisTitle;
  final bool isShowMoreOptions;
  final TextStyle? xAxisTitleTextStyle;
  final TextStyle? yAxisTitleTextStyle;
  final String? yAxisTitle;
  final bool isShowYAxisTitle;
  final Color periodDaysColor;
  final String? periodDaysTitle;
  final Color otherCycleDaysColor;
  final String? otherCycleDaysTitle;
  final Function? onImageDownloadCallback;
  final Function? onPdfDownloadCallback;

  const MenstrualCyclePeriodsGraph(
      {super.key,
      this.loadingText,
      this.xAxisTitle,
      this.xAxisTitleTextStyle,
      this.yAxisTitleTextStyle,
      this.isShowXAxisTitle = true,
      this.isShowYAxisTitle = true,
      this.yAxisTitle,
      this.periodDaysColor = defaultMenstruationColor,
      this.periodDaysTitle,
      this.otherCycleDaysColor = defaultLutealPhaseColor,
      this.isShowMoreOptions = false,
      this.otherCycleDaysTitle,
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
  late TextStyle _xAxisTitleTextStyle;
  late TextStyle _yAxisTitleTextStyle;
  String _loadingText = WidgetBaseLanguage.loading;
  String _xAxisTitle = WidgetBaseLanguage.graphCycleStartDate;
  String _yAxisTitle = WidgetBaseLanguage.graphCycleLengthDays;
  String _periodDaysTitle = WidgetBaseLanguage.graphCyclePeriodDay;
  String _otherCycleDaysTitle = WidgetBaseLanguage.graphCycleOtherDay;

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
    _xAxisTitleTextStyle = getTextStyle(widget.xAxisTitleTextStyle);
    _yAxisTitleTextStyle = getTextStyle(widget.yAxisTitleTextStyle);
    if (widget.otherCycleDaysTitle != null &&
        widget.otherCycleDaysTitle!.isNotEmpty) {
      _otherCycleDaysTitle = widget.otherCycleDaysTitle!;
    }
    if (widget.periodDaysTitle != null && widget.periodDaysTitle!.isNotEmpty) {
      _periodDaysTitle = widget.periodDaysTitle!;
    }
    if (widget.xAxisTitle != null && widget.xAxisTitle!.isNotEmpty) {
      _xAxisTitle = widget.xAxisTitle!;
    }
    if (widget.yAxisTitle != null && widget.yAxisTitle!.isNotEmpty) {
      _yAxisTitle = widget.yAxisTitle!;
    }
    if (widget.loadingText != null && widget.loadingText!.isNotEmpty) {
      _loadingText = widget.loadingText!;
    }
  }

  init() async {
    allPeriodRange.clear();
    final instance = MenstrualCycleWidget.instance!;
    List<PeriodsDateRange> periodRange = await instance.getAllPeriodsDetails();
    for (int i = 0; i < periodRange.length; i++) {
      int cycleDuration = periodRange[i].cycleLength!;
      if (cycleDuration > 0 && cycleDuration < 50) {
        allPeriodRange.add(periodRange[i]);
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
      int cycleDuration = allPeriodRange[i].cycleLength!;
      DateTime startDate = DateTime.parse(allPeriodRange[i].periodStartDate!);
      periodCycleChartData.add(ChartCyclePeriodsData(
          dateTime: CalenderDateUtils.graphDateFormat(startDate),
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
              ? Text(WidgetBaseLanguage.noDataFound)
              : Text(_loadingText),
        ),
      );
    }
  }

  /// Returns the cycle periods chart.
  SfCartesianChart _buildCyclePeriodsChart() {
    return SfCartesianChart(
      key: _chartKey,
      zoomPanBehavior: _zoomPanBehavior,
      legend: Legend(isVisible: true),
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
        isInversed: isArabicLanguage(),
        labelStyle: _xAxisTitleTextStyle,
        title: (widget.isShowXAxisTitle)
            ? AxisTitle(
                text: _xAxisTitle,
                textStyle: _xAxisTitleTextStyle,
              )
            : const AxisTitle(
                text: "",
              ),
      ),
      primaryYAxis: NumericAxis(
        opposedPosition: isArabicLanguage(),
        axisLine: const AxisLine(width: 0),
        labelFormat: '{value}',
        maximum: maxValue.toDouble(),
        minimum: 1,
        majorTickLines: const MajorTickLines(size: 0),
        labelStyle: _yAxisTitleTextStyle,
        title: (widget.isShowYAxisTitle)
            ? AxisTitle(
                text: _yAxisTitle,
                textStyle: _yAxisTitleTextStyle,
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
        name: _periodDaysTitle,
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
        name: _otherCycleDaysTitle,
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
