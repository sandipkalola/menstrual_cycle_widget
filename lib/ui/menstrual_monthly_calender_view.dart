import 'package:flutter/material.dart';
import 'package:menstrual_cycle_widget/menstrual_cycle_widget.dart';

import 'calender_view/calender_view.dart';

class MenstrualCycleMonthlyCalenderView extends StatefulWidget {
  final String? themeColor;
  final Color? daySelectedColor;
  final bool hideInfoView;
  final bool isShowCloseIcon;
  final Function? onDataChanged;

  const MenstrualCycleMonthlyCalenderView(
      {super.key,
      this.themeColor = "000000",
      this.daySelectedColor,
      this.isShowCloseIcon = false,
      this.onDataChanged,
      this.hideInfoView = false});

  @override
  State<MenstrualCycleMonthlyCalenderView> createState() =>
      _MenstrualCycleMonthlyCalenderViewState();
}

class _MenstrualCycleMonthlyCalenderViewState
    extends State<MenstrualCycleMonthlyCalenderView> {
  final _instance = MenstrualCycleWidget.instance!;

  Color? _themeColor = Colors.black;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _themeColor = Color(
      int.parse("0xff${widget.themeColor}"),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CalenderMonthlyView(
        themeColor: _themeColor!,
        selectedColor: (widget.daySelectedColor != null)
            ? widget.daySelectedColor
            : Colors.grey,
        cycleLength: _instance.getCycleLength(),
        periodLength: _instance.getPeriodDuration(),
        isFromCalender: widget.isShowCloseIcon,
        onDataChanged: (value) {
          widget.onDataChanged!.call(value);
        },
        hideInfoView: widget.hideInfoView);
  }
}
