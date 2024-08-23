import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../menstrual_cycle_widget.dart';
import '../calender_view/common_view.dart';
import '../model/water_data.dart';
import 'graph_util.dart';

class MenstrualCycleWaterGraph extends StatefulWidget {
  final String loadingText;
  final WaterUnits? waterUnits;
  final bool isShowMoreOptions;
  final Function? onDownloadImagePath;
  final Function? onDownloadPdfPath;
  final String xAxisTitle;
  final String yAxisTitle;
  final TextStyle xAxisTitleTextStyle;
  final TextStyle yAxisTitleTextStyle;
  final bool isShowXAxisTitle;
  final bool isShowYAxisTitle;
  final Color tooltipBackgroundColor;
  final Color graphColor;

  const MenstrualCycleWaterGraph(
      {super.key,
      this.waterUnits = WaterUnits.liters,
      this.isShowMoreOptions = false,
      this.loadingText = Strings.loading,
      this.isShowXAxisTitle = true,
      this.isShowYAxisTitle = true,
      this.tooltipBackgroundColor = Colors.black,
      this.yAxisTitle = Strings.graphWaterUnitTitle,
      this.onDownloadImagePath,
      this.xAxisTitle = Strings.graphWaterDrinkDate,
      this.graphColor = Colors.blue,
      this.xAxisTitleTextStyle =
          const TextStyle(color: Colors.black, fontSize: 10),
      this.yAxisTitleTextStyle =
          const TextStyle(color: Colors.black, fontSize: 10),
      this.onDownloadPdfPath});

  @override
  State<MenstrualCycleWaterGraph> createState() => _MenstrualWaterGraphState();
}

class _MenstrualWaterGraphState extends State<MenstrualCycleWaterGraph> {
  ChartSeriesController<WaterData, String>? seriesController;

  List<WaterData> allDrinkWaterData = [];
  late GlobalKey<SfCartesianChartState> _chartKey;
  late bool isLoadMoreView, isNeedToUpdateView, isDataUpdated;
  num? oldAxisVisibleMin, oldAxisVisibleMax;
  int pageNumber = 1;
  int itemsPerPage = 7;
  double minValue = 0;
  double maxValue = 0;
  bool isGetData = false;
  bool isLastRecord = false;
  String waterUnitLbl = Strings.graphWaterUnitLiter;
  TooltipBehavior? _tooltipBehavior;
  String fileName = "Water_graph_";
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
        canShowMarker: false,
        color: widget.tooltipBackgroundColor,
        builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
            int seriesIndex) {
          return tooltipView(
              "${allDrinkWaterData[pointIndex].waterValue} $waterUnitLbl");
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
    Map<String, double> minMaxTemp =
        await instance.getMinMaxDrinkWater(waterUnits: widget.waterUnits);
    minValue = minMaxTemp['min_value']!;
    maxValue = minMaxTemp['max_value']!;
    printLogs("minValue $minValue");
    if (minValue < 0) {
      minValue = 0;
    }
    maxValue = maxValue + 2;
    allDrinkWaterData = await instance.getDrinkWaterLog(
        startDate: DateTime.now().add(const Duration(days: -1000)),
        endDate: DateTime.now(),
        waterUnits: widget.waterUnits,
        pageNumber: pageNumber,
        itemsPerPage: itemsPerPage);
    if (allDrinkWaterData.length < 7) {
      isLastRecord = true;
    }

    waterUnitLbl = "Liters";
    WaterUnits waterUnits = widget.waterUnits!;
    if (waterUnits == WaterUnits.liters) {
      waterUnitLbl = "Liters";
    } else if (waterUnits == WaterUnits.cups) {
      waterUnitLbl = "Cups";
    } else if (waterUnits == WaterUnits.flOz) {
      waterUnitLbl = "flOz";
    } else if (waterUnits == WaterUnits.imperialGallons) {
      waterUnitLbl = "Imperial Gallons";
    } else if (waterUnits == WaterUnits.usGallon) {
      waterUnitLbl = "US Gallon";
    } else if (waterUnits == WaterUnits.ml) {
      waterUnitLbl = "ml";
    }

    isGetData = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (allDrinkWaterData.isNotEmpty) {
      return Stack(children: [
        _buildBodyTemperatureView(),
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
  SfCartesianChart _buildBodyTemperatureView() {
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
          labelFormat: '{value}',
          minimum: 1,
          maximum: maxValue,
          interval: 2,
          axisLine: const AxisLine(width: 0),
          labelStyle: widget.yAxisTitleTextStyle,
          title: (widget.isShowYAxisTitle)
              ? AxisTitle(
                  text: "${widget.yAxisTitle} ($waterUnitLbl)",
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

  /// The method returns line series to chart.
  List<CartesianSeries<WaterData, String>> _getGradientComparisonSeries() {
    return <CartesianSeries<WaterData, String>>[
      ColumnSeries<WaterData, String>(
        dataSource: allDrinkWaterData,
        color: widget.graphColor,
        onRendererCreated:
            (ChartSeriesController<WaterData, String>? controller) {
          seriesController = controller;
        },
        name: waterUnitLbl,
        xValueMapper: (WaterData sales, _) => sales.dateTime,
        yValueMapper: (WaterData sales, _) => sales.waterValue,
        animationDuration: 0,
        dataLabelSettings:
            const DataLabelSettings(isVisible: false, offset: Offset(0, -5)),
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
    List<WaterData> waterDataLog = await instance.getDrinkWaterLog(
        startDate: DateTime.now().add(const Duration(days: -1000)),
        endDate: DateTime.now(),
        waterUnits: widget.waterUnits,
        pageNumber: pageNumber,
        itemsPerPage: itemsPerPage);
    if (waterDataLog.isEmpty) {
      isLastRecord = true;
    }
    allDrinkWaterData.addAll(waterDataLog);
    isLoadMoreView = true;
    seriesController?.updateDataSource(
        addedDataIndexes: getIndexes(waterDataLog.length));
  }

  Widget getProgressIndicator() {
    return (isLastRecord) ? const SizedBox() : progressIndicator();
  }

  List<int> getIndexes(int length) {
    final List<int> indexes = <int>[];
    for (int i = length - 1; i >= 0; i--) {
      indexes.add(allDrinkWaterData.length - 1 - i);
    }
    return indexes;
  }

  @override
  void dispose() {
    seriesController = null;
    super.dispose();
  }
}
