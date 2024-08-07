import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui' as ui;
import '../../menstrual_cycle_widget.dart';
import '../calender_view/common_view.dart';
import 'graph_util.dart';
import 'model/water_data.dart';

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

  const MenstrualCycleWaterGraph(
      {super.key,
      this.waterUnits = WaterUnits.ml,
      this.isShowMoreOptions = false,
      this.loadingText = Strings.loading,
      this.isShowXAxisTitle = true,
      this.isShowYAxisTitle = true,
      this.yAxisTitle = Strings.graphWaterUnitTitle,
      this.onDownloadImagePath,
      this.xAxisTitle = Strings.graphWaterDrinkDate,
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
  String waterUnitLbl = "ml";
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
    _tooltipBehavior = TooltipBehavior(enable: true, canShowMarker: false);
    _zoomPanBehavior = ZoomPanBehavior(
      enablePanning: true,
      enablePinching: true,
      maximumZoomLevel: 0.3,
      zoomMode: ZoomMode.x,
    );
  }

  init() async {
    final instance = MenstrualCycleWidget.instance!;
    Map<String, double> minMaxTemp = await instance.getMinMaxDrinkWater(waterUnits: widget.waterUnits);
    minValue = minMaxTemp['min_value']!;
    maxValue = minMaxTemp['max_value']! ;
    if (minValue < 0) {
      minValue = 0;
    }
    allDrinkWaterData = await instance.getDrinkWaterLog(
        startDate: DateTime.now().add(const Duration(days: -1000)),
        endDate: DateTime.now(),
        waterUnits: widget.waterUnits,
        pageNumber: pageNumber,
        itemsPerPage: itemsPerPage);
    if (allDrinkWaterData.length < 7) {
      isLastRecord = true;
    }

    waterUnitLbl = "ml";
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
          minimum: minValue,
          maximum: maxValue,
          interval: 20,
          axisLine: const AxisLine(width: 0),
          labelStyle: widget.yAxisTitleTextStyle,
          title: (widget.isShowYAxisTitle)
              ? AxisTitle(
                  text: "${widget.yAxisTitle} ($waterUnitLbl)" ,
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
  List<CartesianSeries<WaterData, String>>
      _getGradientComparisonSeries() {
    return <CartesianSeries<WaterData, String>>[
      ColumnSeries<WaterData, String>(
        dataSource: allDrinkWaterData,
        onCreateShader: (ShaderDetails details) {
          return ui.Gradient.linear(
              details.rect.topCenter,
              details.rect.bottomCenter,
              const <Color>[Colors.red, Colors.orange, Colors.yellow],
              <double>[0.3, 0.6, 0.9]);
        },
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
    List<WaterData> bodyTemperatureData =
        await instance.getDrinkWaterLog(
            startDate: DateTime.now().add(const Duration(days: -1000)),
            endDate: DateTime.now(),
            waterUnits: widget.waterUnits,
            pageNumber: pageNumber,
            itemsPerPage: itemsPerPage);
    if (bodyTemperatureData.isEmpty) {
      isLastRecord = true;
    }
    allDrinkWaterData.addAll(bodyTemperatureData);
    isLoadMoreView = true;
    seriesController?.updateDataSource(
        addedDataIndexes: getIndexes(bodyTemperatureData.length));
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
