import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../menstrual_cycle_widget.dart';
import '../calender_view/common_view.dart';
import '../model/sleep_data.dart';
import 'graph_util.dart';

class MenstrualSleepGraph extends StatefulWidget {
  final String loadingText;
  final bool isShowMoreOptions;
  final Function? onDownloadImagePath;
  final Function? onDownloadPdfPath;
  final String xAxisTitle;
  final String yAxisTitle;
  final TextStyle xAxisTitleTextStyle;
  final TextStyle yAxisTitleTextStyle;
  final bool isShowXAxisTitle;
  final bool isShowYAxisTitle;
  final bool isShowYAxisGridLine;
  final bool isShowXAxisGridLine;
  final Color graphColor;
  final Color tooltipBackgroundColor;

  const MenstrualSleepGraph(
      {super.key,
      this.isShowMoreOptions = false,
      this.loadingText = Strings.loading,
      this.isShowXAxisTitle = true,
      this.isShowYAxisTitle = true,
      this.tooltipBackgroundColor = Colors.black,
      this.isShowYAxisGridLine = false,
      this.isShowXAxisGridLine = false,
      this.yAxisTitle = Strings.graphSleepTitle,
      this.onDownloadImagePath,
      this.graphColor = Colors.blue,
      this.xAxisTitle = Strings.graphSleepDate,
      this.xAxisTitleTextStyle =
          const TextStyle(color: Colors.black, fontSize: 10),
      this.yAxisTitleTextStyle =
          const TextStyle(color: Colors.black, fontSize: 10),
      this.onDownloadPdfPath});

  @override
  State<MenstrualSleepGraph> createState() => _MenstrualSleepGraphState();
}

class _MenstrualSleepGraphState extends State<MenstrualSleepGraph> {
  ChartSeriesController<SleepData, String>? seriesController;

  List<SleepData> allSleepData = [];
  late GlobalKey<SfCartesianChartState> _chartKey;
  late bool isLoadMoreView, isNeedToUpdateView, isDataUpdated;
  num? oldAxisVisibleMin, oldAxisVisibleMax;
  int pageNumber = 1;
  int itemsPerPage = 7;
  double minValue = 0;
  double maxValue = 0;
  bool isGetData = false;
  bool isLastRecord = false;
  TooltipBehavior? _tooltipBehavior;
  String fileName = "Sleep_graph_";
  late ZoomPanBehavior? _zoomPanBehavior;
  late GlobalKey<State> globalKey;

  @override
  void initState() {
    _initializeVariables();
    init();
    super.initState();
  }

  void _initializeVariables() async {
    _chartKey = GlobalKey();
    isLoadMoreView = false;
    isNeedToUpdateView = false;
    isDataUpdated = true;
    globalKey = GlobalKey<State>();
    _tooltipBehavior = TooltipBehavior(
        enable: true,
        color: widget.tooltipBackgroundColor,
        //canShowMarker: false,
        builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
            int seriesIndex) {
          return tooltipView(
              "${getLabelFormatForToolTip(allSleepData[pointIndex].sleepBedTime.toString())} - ${getLabelFormatForToolTip(allSleepData[pointIndex].wakeUpTime.toString())}");
        });
    _zoomPanBehavior = ZoomPanBehavior(
      enablePanning: true,
      enablePinching: true,
      maximumZoomLevel: 0.3,
      zoomMode: ZoomMode.x,
    );
  }

  init() async {
    final instance = MenstrualCycleWidget.instance!;
    Map<String, int> minMaxTemp = await instance.getMinMaxSleepTimeLog();
    minValue = minMaxTemp['min_temp']! + 0;
    maxValue = minMaxTemp['max_temp']! + 1;

    allSleepData = await instance.getSleepLog(
        startDate: DateTime.now().add(const Duration(days: -1000)),
        endDate: DateTime.now(),
        pageNumber: pageNumber,
        itemsPerPage: itemsPerPage);
    if (allSleepData.length < 7) {
      isLastRecord = true;
    }

    isGetData = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (allSleepData.isNotEmpty) {
      return Stack(children: [
        _buildSleepView(),
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

  /// Get the body temperature graph view
  SfCartesianChart _buildSleepView() {
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
        //Hide the gridlines of x-axis
        majorGridLines:
            MajorGridLines(width: (widget.isShowXAxisGridLine) ? 1 : 0),
        //Hide the axis line of x-axis
        //  axisLine: AxisLine(width: 0),
        rangePadding: ChartRangePadding.normal,
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
        labelPlacement: LabelPlacement.onTicks,
        edgeLabelPlacement: EdgeLabelPlacement.shift,
      ),
      primaryYAxis: NumericAxis(
          //labelFormat: getLabelFormat('{value}'),
          axisLabelFormatter: (AxisLabelRenderDetails details) {
            return ChartAxisLabel(
                getLabelFormat(details.value.toString()), null);
          },
          minimum: minValue,
          maximum: maxValue,
          interval: 2,
          //Hide the gridlines of y-axis
          majorGridLines:
              MajorGridLines(width: (widget.isShowYAxisGridLine) ? 1 : 0),
          // axisLine: const AxisLine(width: 0),
          labelStyle: widget.yAxisTitleTextStyle,
          title: (widget.isShowYAxisTitle)
              ? AxisTitle(
                  text: widget.yAxisTitle,
                  textStyle: widget.yAxisTitleTextStyle,
                )
              : const AxisTitle(
                  text: "",
                ),
          majorTickLines: const MajorTickLines(color: Colors.transparent)),
      tooltipBehavior: _tooltipBehavior,
      series: _getGradientComparisonSeries(),
      loadMoreIndicatorBuilder:
          (BuildContext context, ChartSwipeDirection direction) =>
              getLoadMoreIndicatorBuilder(context, direction),
    );
  }

  String getLabelFormatForToolTip(String value) {
    List<String> timeFormat = value.split(".");
    String min = (int.parse(timeFormat[1]) > 9)
        ? "${int.parse(timeFormat[1])}"
        : "0${int.parse(timeFormat[1])}";
    printLogs("value $value");
    double realValue = double.parse(timeFormat[0]);
    if (realValue > 24) {
      int nextDay = realValue.toInt() - 23;
      if (nextDay > 12) {
        return "$nextDay:$min PM";
      }
      return "$nextDay:$min AM";
    }
    if (realValue > 12) {
      return "${realValue.toInt()}:$min PM";
    }
    return "${realValue.toInt()}:$min AM";
  }

  String getLabelFormat(String value) {
    //printLogs("value $value");
    double realValue = double.parse(value);
    if (realValue > 24) {
      int nextDay = realValue.toInt() - 23;
      if (nextDay > 12) {
        return "$nextDay PM";
      }
      return "$nextDay AM";
    }
    if (realValue > 12) {
      return "${realValue.toInt()} PM";
    }
    return "${realValue.toInt()} AM";
  }

  /// The method returns line series to chart.
  List<RangeColumnSeries<SleepData, String>> _getGradientComparisonSeries() {
    return <RangeColumnSeries<SleepData, String>>[
      RangeColumnSeries<SleepData, String>(
        dataSource: allSleepData,
        onRendererCreated:
            (ChartSeriesController<SleepData, String>? controller) {
          seriesController = controller;
        },
        color: widget.graphColor,
        enableTooltip: true,
        xValueMapper: (SleepData sales, _) => sales.dateTime,
        lowValueMapper: (SleepData sales, _) => sales.sleepBedTime,
        highValueMapper: (SleepData sales, _) => sales.wakeUpTime,
        animationDuration: 0,
        dataLabelSettings: const DataLabelSettings(
          isVisible: false,
        ),
      ),
    ];
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

  Future<void> _updateView() async {
    await Future<void>.delayed(const Duration(seconds: 1), () {
      isNeedToUpdateView = false;
      if (isDataUpdated) {
        pageNumber = pageNumber + 1;
        _updateData();
        isDataUpdated = false;
      }

      if (globalKey.currentState != null) {
        (globalKey.currentState as dynamic).setState(() {});
      }
    });
  }

  void _updateData() async {
    final instance = MenstrualCycleWidget.instance!;
    List<SleepData> sleepData = await instance.getSleepLog(
        startDate: DateTime.now().add(const Duration(days: -1000)),
        endDate: DateTime.now(),
        pageNumber: pageNumber,
        itemsPerPage: itemsPerPage);
    if (sleepData.isEmpty) {
      isLastRecord = true;
    }
    allSleepData.addAll(sleepData);
    isLoadMoreView = true;
    seriesController?.updateDataSource(
        addedDataIndexes: getIndexes(sleepData.length));
  }

  Widget getProgressIndicator() {
    return (isLastRecord) ? const SizedBox() : progressIndicator();
  }

  List<int> getIndexes(int length) {
    final List<int> indexes = <int>[];
    for (int i = length - 1; i >= 0; i--) {
      indexes.add(allSleepData.length - 1 - i);
    }
    return indexes;
  }

  @override
  void dispose() {
    seriesController = null;
    super.dispose();
  }
}
