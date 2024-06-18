library menstrual_cycle_widget;

import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'menstrual_cycle_painter.dart';
import 'menstrual_cycle_utils.dart';

class MenstrualCyclePhaseView extends StatefulWidget {
  final int totalCycleDays;
  final double selectedDayCircleSize;
  final int selectedDay;

  // Menstruation Params
  final String menstruationName;
  final Color menstruationColor;
  final Color menstruationDayTextColor;
  final Color menstruationTextColor;
  final int menstruationDayCount;
  final Color menstruationBackgroundColor;
  final PhaseTextBoundaries phaseTextBoundaries;

  // Follicular Phase Params
  final String follicularPhaseName;
  final Color follicularPhaseColor;
  final Color follicularPhaseDayTextColor;
  final Color follicularBackgroundColor;
  final Color follicularTextColor;
  final int follicularDayCount;

  // ovulation Phase Params
  final String ovulationName;
  final Color ovulationColor;
  final int ovulationDayCount;
  final Color ovulationDayTextColor;
  final Color ovulationBackgroundColor;
  final Color ovulationTextColor;

  // luteal Phase Params
  final String lutealPhaseName;
  final Color lutealPhaseColor;
  final Color lutealPhaseBackgroundColor;
  final Color lutealPhaseTextColor;
  final Color lutealPhaseDayTextColor;

  // Day Params
  final String dayTitle;
  final double dayTitleFontSize;
  final double dayFontSize;
  final double selectedDayFontSize;
  final Color selectedDayBackgroundColor;
  final Color selectedDayTextColor;
  final Color dayTextColor;
  final Color selectedDayCircleBorderColor;
  final double phasesTextSize;
  final double outsidePhasesTextSize;
  final int outsideTextCharSpace;
  final int outsideTextSpaceFromArc;

  final bool isShowDayTitle;
  final FontWeight dayFontWeight;
  final double circleDaySize;

  final MenstrualCycleTheme theme;

  final double centralCircleSize;
  final Color centralCircleBackgroundColor;
  final Color centralCircleBorderColor;
  final int centralCircleBorderSize;
  final double imgSize;
  final String imageAssets;
  final bool isRemoveBackgroundPhaseColor;

  final MenstrualCycleViewType viewType;

  final String title;
  final Color titleTextColor;
  final double titleTextSize;
  final FontWeight titleFontWeight;

  final String message;
  final Color messageTextColor;
  final double messageTextSize;
  final FontWeight messageFontWeight;
  final int spaceBtnTitleMessage;

  // Other Variables
  final int menstruationDayCountNew = 0;
  final int follicularDayCountNew = 0;
  final int ovulationDayCountNew = 0;
  final double arcStrokeWidth;

  static const Color defaultBlackColor = Colors.black;
  static const defaultMenstruationColor = Color(0xFFff584f);
  static const defaultFollicularColor = Color(0xFFeec9b7);
  static const defaultOvulationColor = Color(0xFF22bc79);
  static const defaultLutealPhaseColor = Color(0xFFabcdf0);

  static const defaultMenstruationColorBg = Color(0x26ff584f);
  static const defaultFollicularColorBg = Color(0x26eec9b7);
  static const defaultOvulationColorBg = Color(0x2622bc79);
  static const defaultLutealPhaseColorBg = Color(0x26abcdf0);

  final double size;

  // Default central central background color
  static const defaultCentralCircleBackgroundColor = Color(0xffed9dba);

  const MenstrualCyclePhaseView(
      {super.key,
      required this.totalCycleDays,
      required this.size,
      this.selectedDay = 0,

      // Menstruation Params
      this.menstruationName = "Menstruation",
      required this.menstruationDayCount,
      this.menstruationColor = defaultMenstruationColor,
      this.menstruationBackgroundColor = defaultMenstruationColorBg,
      this.menstruationDayTextColor = defaultBlackColor,
      this.menstruationTextColor = defaultMenstruationColor,

      // Follicular Phase Params
      this.follicularPhaseName = "Follicular Phase",
      required this.follicularDayCount,
      this.follicularPhaseDayTextColor = defaultBlackColor,
      this.follicularPhaseColor = defaultFollicularColor,
      this.follicularBackgroundColor = defaultFollicularColorBg,
      this.follicularTextColor = defaultFollicularColor,

      // ovulation Phase Params
      this.ovulationName = "Ovulation",
      required this.ovulationDayCount,
      this.ovulationDayTextColor = defaultBlackColor,
      this.ovulationColor = defaultOvulationColor,
      this.ovulationBackgroundColor = defaultOvulationColorBg,
      this.ovulationTextColor = defaultOvulationColor,

      // luteal Phase Params
      this.lutealPhaseName = "Luteal Phase",
      this.lutealPhaseColor = defaultLutealPhaseColor,
      this.lutealPhaseBackgroundColor = defaultLutealPhaseColorBg,
      this.lutealPhaseTextColor = defaultLutealPhaseColor,
      this.lutealPhaseDayTextColor = defaultBlackColor,

      // Central Circle
      this.imageAssets = "",
      this.imgSize = 30,
      this.centralCircleBackgroundColor = defaultCentralCircleBackgroundColor,
      this.centralCircleSize = 25,

      // Day Params
      this.dayTitle = "Day",
      this.dayTitleFontSize = 5,
      this.dayFontSize = 12,
      this.selectedDayCircleSize = 1, //  18 for Arc Theme, 15 for basic theme
      this.dayTextColor = defaultBlackColor,
      this.selectedDayBackgroundColor = Colors.white,
      this.selectedDayFontSize = 12,
      this.selectedDayTextColor = defaultBlackColor,
      this.selectedDayCircleBorderColor = Colors.transparent,
      this.phasesTextSize = 8,
      this.isShowDayTitle = true,
      this.dayFontWeight = FontWeight.normal,
      this.theme = MenstrualCycleTheme.basic,
      this.circleDaySize = 13, //Only when Theme is MenstrualCycleTheme.circle
      this.phaseTextBoundaries = PhaseTextBoundaries.inside,
      this.arcStrokeWidth = 30,
      this.outsidePhasesTextSize = 12,
      this.outsideTextCharSpace = 3,
      this.outsideTextSpaceFromArc = 30,
      this.centralCircleBorderColor = Colors.transparent,
      this.centralCircleBorderSize = 1,
      this.isRemoveBackgroundPhaseColor = false,
      this.viewType = MenstrualCycleViewType.none,
      this.title = "",
      this.titleTextColor = Colors.black,
      this.titleTextSize = 20,
      this.titleFontWeight = FontWeight.bold,
      this.message = "",
      this.messageTextColor = Colors.black45,
      this.messageTextSize = 10,
      this.messageFontWeight = FontWeight.normal,
      this.spaceBtnTitleMessage = 20});

  @override
  State<MenstrualCyclePhaseView> createState() =>
      _MenstrualCyclePhaseViewState();
}

class _MenstrualCyclePhaseViewState extends State<MenstrualCyclePhaseView> {
  MenstrualCyclePainter? _painter;
  ui.Image? _image;

  String websiteUrl = "https://pub.dev/packages/menstrual_cycle_widget";
  double selectedDayCircleSize = 15;
  double widgetSize = 0;
  PhaseTextBoundaries? phaseTextBoundaries;

  Future<void> _init(String imagePath) async {
    if (imagePath.isNotEmpty) {
      final ByteData data = await rootBundle.load(imagePath);
      final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
      final frame = await codec.getNextFrame();
      setState(() {
        _image = frame.image;
      });
    }

    // Set default phase text boundaries to outside if MenstrualCycleViewType.text
    if (widget.viewType == MenstrualCycleViewType.text) {
      if (widget.phaseTextBoundaries == PhaseTextBoundaries.none) {
        phaseTextBoundaries = widget.phaseTextBoundaries;
      } else {
        phaseTextBoundaries = PhaseTextBoundaries.outside;
      }
    } else {
      phaseTextBoundaries = widget.phaseTextBoundaries;
    }

    _painter = MenstrualCyclePainter(
        totalCycleDays: widget.totalCycleDays,
        menstruationDayCount: widget.menstruationDayCount,
        follicularDayCount: widget.follicularDayCount,
        ovulationDayCount: widget.ovulationDayCount,
        imgSize: widget.imgSize,
        imageAssets: (_image != null) ? _image : null,
        centralCircleBackgroundColor: widget.centralCircleBackgroundColor,
        centralCircleSize: widget.centralCircleSize,
        dayFontSize: widget.dayFontSize,
        selectedDayFontSize: widget.selectedDayFontSize,
        dayTextColor: widget.dayTextColor,
        dayTitle: widget.dayTitle,
        dayTitleFontSize: widget.dayTitleFontSize,
        follicularBackgroundColor: widget.follicularBackgroundColor,
        follicularPhaseColor: widget.follicularPhaseColor,
        follicularPhaseDayTextColor: widget.follicularPhaseDayTextColor,
        follicularPhaseName: widget.follicularPhaseName,
        follicularTextColor: widget.follicularTextColor,
        isShowDayTitle: widget.isShowDayTitle,
        lutealPhaseBackgroundColor: widget.lutealPhaseBackgroundColor,
        lutealPhaseColor: widget.lutealPhaseColor,
        lutealPhaseDayTextColor: widget.lutealPhaseDayTextColor,
        lutealPhaseName: widget.lutealPhaseName,
        lutealPhaseTextColor: widget.lutealPhaseTextColor,
        menstruationBackgroundColor: widget.menstruationBackgroundColor,
        menstruationColor: widget.menstruationColor,
        menstruationDayTextColor: widget.menstruationDayTextColor,
        menstruationName: widget.menstruationName,
        menstruationTextColor: widget.menstruationTextColor,
        ovulationBackgroundColor: widget.ovulationBackgroundColor,
        ovulationColor: widget.ovulationColor,
        ovulationDayTextColor: widget.ovulationDayTextColor,
        ovulationName: widget.ovulationName,
        ovulationTextColor: widget.ovulationTextColor,
        insidePhasesTextSize: widget.phasesTextSize,
        selectedDay: widget.selectedDay,
        selectedDayBackgroundColor: widget.selectedDayBackgroundColor,
        selectedDayCircleBorderColor: widget.selectedDayCircleBorderColor,
        selectedDayCircleSize: selectedDayCircleSize,
        selectedDayTextColor: widget.selectedDayTextColor,
        dayFontWeight: widget.dayFontWeight,
        theme: widget.theme,
        circleDaySize: widget.circleDaySize,
        phaseTextBoundaries: phaseTextBoundaries!,
        arcStrokeWidth: widget.arcStrokeWidth,
        outsidePhasesTextSize: widget.outsidePhasesTextSize,
        outsideTextCharSpace: widget.outsideTextCharSpace,
        outsideTextSpaceFromArc: widget.outsideTextSpaceFromArc,
        centralCircleBorderColor: widget.centralCircleBorderColor,
        centralCircleBorderSize: widget.centralCircleBorderSize,
        isRemoveBackgroundPhaseColor: widget.isRemoveBackgroundPhaseColor,
        viewType: widget.viewType,
        title: widget.title,
        message: widget.message,
        messageFontWeight: widget.messageFontWeight,
        messageTextColor: widget.messageTextColor,
        messageTextSize: widget.messageTextSize,
        titleFontWeight: widget.titleFontWeight,
        titleTextColor: widget.titleTextColor,
        titleTextSize: widget.titleTextSize,
        spaceBtnTitleMessage: widget.spaceBtnTitleMessage);
  }

  @override
  void initState() {
    super.initState();
    _checkValidation();
    if (widget.selectedDayCircleSize == 1) {
      if (widget.theme == MenstrualCycleTheme.basic) {
        selectedDayCircleSize = 15;
      } else if (widget.theme == MenstrualCycleTheme.arcs) {
        selectedDayCircleSize = 18;
      }
    } else {
      selectedDayCircleSize = widget.selectedDayCircleSize;
    }
    widgetSize = widget.size;
    if (widget.imageAssets.isNotEmpty) {
      _init(widget.imageAssets);
    } else {
      _init("");
    }
  }

  _checkValidation() {
    if (widget.size < 200) {
      throw "Invalid 'MenstrualCyclePhaseView' widget size. Size must be greater than or equal to 200. See $websiteUrl";
    }
    if (widget.totalCycleDays < 10) {
      throw "Invalid 'totalCycleDays' count. Count must be greater than or equal to 10. See $websiteUrl";
    }
    if (widget.menstruationDayCount < 0) {
      throw "Invalid 'menstruationDayCount' count. Count must be greater than or equal to 0. See $websiteUrl";
    }
    if (widget.follicularDayCount < 0) {
      throw "Invalid 'follicularDayCount' count. Count must be greater than or equal to 0. See $websiteUrl";
    }
    if (widget.ovulationDayCount < 0) {
      throw "Invalid 'ovulationDayCount' count. Count must be greater than or equal to 0. See $websiteUrl";
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS ||
        Theme.of(context).platform == TargetPlatform.android) {
      if (MediaQuery.of(context).size.width < widget.size) {
        if (widget.phaseTextBoundaries == PhaseTextBoundaries.both ||
            widget.phaseTextBoundaries == PhaseTextBoundaries.outside) {
          widgetSize = MediaQuery.of(context).size.width - 40;
        } else {
          widgetSize = MediaQuery.of(context).size.width - 10;
        }
      }
    } else if (kIsWeb) {
      if (MediaQuery.of(context).size.height < widget.size) {
        widgetSize = MediaQuery.of(context).size.height - 100;
      }
    }

    return CustomPaint(
      size: Size(widgetSize, widgetSize),
      painter: _painter,
    );
  }
}
