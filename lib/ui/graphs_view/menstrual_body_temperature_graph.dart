import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui' as ui;
import '../../menstrual_cycle_widget.dart';
import 'graph_util.dart';
import 'model/body_temperature_data.dart';

class MenstrualBodyTemperatureGraph extends StatefulWidget {
  final String loadingText;
  final BodyTemperatureUnits? bodyTemperatureUnits;
  final bool isShowMoreOptions;
  final Function? onDownloadImagePath;
  final Function? onDownloadPdfPath;
  final String xAxisTitle;
  final String yAxisTitle;
  final TextStyle xAxisTitleTextStyle;
  final TextStyle yAxisTitleTextStyle;
  final bool isShowXAxisTitle;
  final bool isShowYAxisTitle;

  const MenstrualBodyTemperatureGraph(
      {super.key,
      this.bodyTemperatureUnits = BodyTemperatureUnits.celsius,
      this.isShowMoreOptions = false,
      this.loadingText = Strings.loading,
      this.isShowXAxisTitle = true,
      this.isShowYAxisTitle = true,
      this.yAxisTitle = Strings.graphBodyTempTitle,
      this.onDownloadImagePath,
      this.xAxisTitle = Strings.graphBodyTempDate,
      this.xAxisTitleTextStyle =
          const TextStyle(color: Colors.black, fontSize: 10),
      this.yAxisTitleTextStyle =
          const TextStyle(color: Colors.black, fontSize: 10),
      this.onDownloadPdfPath});

  @override
  State<MenstrualBodyTemperatureGraph> createState() =>
      _MenstrualBodyTemperatureGraphState();
}

class _MenstrualBodyTemperatureGraphState
    extends State<MenstrualBodyTemperatureGraph> {
  List<BodyTemperatureData> allBodyTemperatureData = [];
  late GlobalKey<SfCartesianChartState> _chartKey;

  double minValue = 0;
  double maxValue = 0;
  bool isGetData = false;
  String tempUnit = "C";
  TooltipBehavior? _tooltipBehavior;
  String fileName = "Body_temperature_graph_";
  late ZoomPanBehavior? _zoomPanBehavior;
  @override
  void initState() {
    _chartKey = GlobalKey();
    _tooltipBehavior = TooltipBehavior(enable: true, canShowMarker: false);
    _zoomPanBehavior = ZoomPanBehavior(
      enablePanning: true,
      enablePinching: true,
      maximumZoomLevel: 0.5,
      zoomMode: ZoomMode.x,
    );
    init();
    super.initState();
  }

  init() async {
    final instance = MenstrualCycleWidget.instance!;
    allBodyTemperatureData = await instance.getTemperatureLog(
        startDate: DateTime.now().add(const Duration(days: -1000)),
        endDate: DateTime.now(),
        bodyTemperatureUnits: widget.bodyTemperatureUnits);

    for (int i = 0; i < allBodyTemperatureData.length; i++) {
      tempUnit = (allBodyTemperatureData[i].bodyTemperatureUnit! ==
              BodyTemperatureUnits.celsius.toString())
          ? "C"
          : "F";
      double temp = allBodyTemperatureData[i].bodyTemperature!;
      if (minValue == 0) {
        minValue = temp;
      }
      if (temp > 0) {
        if (minValue >= temp) {
          minValue = temp;
        }
        if (maxValue <= temp) {
          maxValue = temp;
        }
      }
    }
    minValue = minValue - 5;
    maxValue = maxValue + 5;
    isGetData = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (allBodyTemperatureData.isNotEmpty) {
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
      onZooming: (ZoomPanArgs args) {
        if (args.axis is CategoryAxis) {
          printLogs('Horizontal scroll position: ${args.currentZoomPosition}');
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
          labelFormat: '{value}°$tempUnit',
          minimum: minValue,
          maximum: maxValue,
          interval: 20,
          axisLine: const AxisLine(width: 0),
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
    );
  }

  /// The method returns line series to chart.
  List<CartesianSeries<BodyTemperatureData, String>>
      _getGradientComparisonSeries() {
    return <CartesianSeries<BodyTemperatureData, String>>[
      ColumnSeries<BodyTemperatureData, String>(
        dataSource: allBodyTemperatureData,
        onCreateShader: (ShaderDetails details) {
          return ui.Gradient.linear(
              details.rect.topCenter,
              details.rect.bottomCenter,
              const <Color>[Colors.red, Colors.orange, Colors.yellow],
              <double>[0.3, 0.6, 0.9]);
        },
        name: 'Body Temperature',
        xValueMapper: (BodyTemperatureData sales, _) => sales.dateTime,
        yValueMapper: (BodyTemperatureData sales, _) => sales.bodyTemperature,
        animationDuration: 0,
        dataLabelSettings:
            const DataLabelSettings(isVisible: false, offset: Offset(0, -5)),
      ),
    ];
  }
}
