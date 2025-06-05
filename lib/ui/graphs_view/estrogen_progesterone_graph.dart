import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../menstrual_cycle_widget_base.dart';
import '../../utils/colors_utils.dart';
import '../../utils/constant.dart';
import '../../widget_languages/widget_base_language.dart';
import '../model/hormone_data.dart';

class EstrogenProgesteroneGraph extends StatefulWidget {
  const EstrogenProgesteroneGraph({super.key});

  @override
  State<EstrogenProgesteroneGraph> createState() =>
      _EstrogenProgesteroneGraphState();
}

class _EstrogenProgesteroneGraphState extends State<EstrogenProgesteroneGraph> {
  int cycleLength = 28;
  int selectedDay = 0;
  List<HormoneData> data = [];
  int ovulationDay = 0;
  int menstrualDays = 0;
  final _instance = MenstrualCycleWidget.instance!;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    String lastPeriodDate = _instance.getPreviousPeriodDay();
    if (lastPeriodDate.isNotEmpty) {
      DateTime lastPeriod = DateTime.parse(lastPeriodDate);
      int inDays = DateTime.now().difference(lastPeriod).inDays;
      selectedDay = (inDays + 1);
      cycleLength = _instance.getCycleLength();

      data = generateFloHormoneData();
      ovulationDay = _instance.getPeriodDuration() +
          _instance.getFollicularDayCounts() +
          defaultOvulationDay ~/ 2;
      menstrualDays = _instance.getPeriodDuration();
    }
    setState(() {});
  }

  List<HormoneData> generateFloHormoneData({int cycleLength = 28}) {
    List<HormoneData> data = [];
    int menstrualDays = (cycleLength * 0.18).round().clamp(2, 6);
    int ovulationDay = (cycleLength / 2).round();
    int follicularEnd = ovulationDay - 1;

    for (int day = 1; day <= cycleLength; day++) {
      double estrogen = 0;
      double progesterone = 0;
      String phase = '';

      if (day <= menstrualDays) {
        phase = WidgetBaseLanguage.menstruationLabel;
        estrogen = 40 + (day - 1) * 2;
        progesterone = 0.2;
      } else if (day <= follicularEnd) {
        phase = WidgetBaseLanguage.follicularPhaseLabel;
        final progress =
            (day - menstrualDays) / (follicularEnd - menstrualDays);
        estrogen = 50 + progress * 300;
        progesterone = 0.2;
      } else if (day == ovulationDay) {
        phase = WidgetBaseLanguage.ovulationLabel;
        estrogen = 400;
        progesterone = 1;
      } else {
        phase = WidgetBaseLanguage.lutealPhaseLabel;
        final lutealProgress =
            (day - ovulationDay) / (cycleLength - ovulationDay);
        estrogen = 300 - lutealProgress * 180;
        progesterone = 1 + lutealProgress * 18;
        if (day > cycleLength - 4) {
          estrogen -= (day - (cycleLength - 4)) * 30;
          progesterone -= (day - (cycleLength - 4)) * 6;
        }
      }

      estrogen = estrogen.clamp(30, 450);
      progesterone = progesterone.clamp(0, 25);

      data.add(HormoneData(day, estrogen, progesterone, phase));
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: NumericAxis(
        interval: 1,
        majorGridLines: const MajorGridLines(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        axisLabelFormatter: (AxisLabelRenderDetails details) {
          final int day = details.value.toInt();
          if (day == selectedDay) {
            return ChartAxisLabel(
                '⬆ \n $day', TextStyle(fontSize: 10, color: Colors.green));
          } else {
            return ChartAxisLabel('', TextStyle(fontSize: 0));
          }
        },
        plotBands: <PlotBand>[
          PlotBand(
            start: 1,
            end: menstrualDays.toDouble(),
            text: WidgetBaseLanguage.menstruationLabel,
            color: defaultMenstruationColorBg,
            textStyle: TextStyle(color: defaultMenstruationColor),
          ),
          PlotBand(
            start: menstrualDays.toDouble(),
            end: (ovulationDay - 1).toDouble(),
            text: WidgetBaseLanguage.follicularPhaseLabel,
            color: defaultFollicularColorBg,
            textStyle: TextStyle(color: defaultFollicularColor),
          ),
          PlotBand(
            start: ovulationDay.toDouble(),
            end: ovulationDay.toDouble(),
            text: WidgetBaseLanguage.ovulationLabel,
            color: defaultOvulationColorBg,
            textStyle: TextStyle(color: defaultOvulationColor),
          ),
          PlotBand(
              start: (ovulationDay + 1).toDouble(),
              end: cycleLength.toDouble(),
              text: WidgetBaseLanguage.lutealPhaseLabel,
              color: Color(0x14FF9800),
              textStyle: const TextStyle(color: Colors.orange)),
          PlotBand(
            start: selectedDay.toDouble(),
            end: selectedDay.toDouble(),
            borderColor: Colors.green,
            borderWidth: 2,
            dashArray: <double>[5, 5],
          ),
        ],
      ),
      primaryYAxis: NumericAxis(
        maximum: 450,
        interval: 50,
        isVisible: false,
        majorGridLines: const MajorGridLines(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
      ),
      legend: const Legend(isVisible: true),
      series: [
        SplineSeries<HormoneData, int>(
          name: WidgetBaseLanguage.estrogenLabel,
          dataSource: data,
          xValueMapper: (d, _) => d.day,
          yValueMapper: (d, _) => d.estrogen,
          color: Colors.pink,
          width: 3,
        ),
        SplineSeries<HormoneData, int>(
          name: WidgetBaseLanguage.progesteroneLabel,
          dataSource: data,
          xValueMapper: (d, _) => d.day,
          yValueMapper: (d, _) => d.progesterone * 20,
          // scale to match estrogen visually
          color: Colors.orange,
          width: 3,
        ),
      ],
    );
  }
}
