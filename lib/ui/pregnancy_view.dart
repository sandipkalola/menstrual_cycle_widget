import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../menstrual_cycle_widget.dart';
import '../widget_languages/languages.dart';
import 'custom_painter/pregnancy_painter.dart';

class PregnancyView extends StatefulWidget {
  final String? firstTrimesterName;
  final Color firstTrimesterColor;
  final Color firstTrimesterTextColor;

  final String? secondTrimesterName;
  final Color secondTrimesterColor;
  final Color secondTrimesterTextColor;

  final Color? highlightCurrentMonthColor;

  final String? thirdTrimesterName;
  final Color thirdTrimesterColor;
  final Color thirdTrimesterTextColor;

  final Color titleTextColor;
  final double titleTextSize;
  final FontWeight titleFontWeight;

  final Color messageTextColor;
  final double messageTextSize;
  final FontWeight messageFontWeight;
  final int spaceBtnTitleMessage;
  final double size;

  const PregnancyView(
      {super.key,
      required this.size,
      this.firstTrimesterName = "",
      this.firstTrimesterColor = defaultMenstruationColor,
      this.firstTrimesterTextColor = Colors.white,
      this.secondTrimesterName = "",
      this.highlightCurrentMonthColor,
      this.secondTrimesterColor = defaultFollicularColor,
      this.secondTrimesterTextColor = Colors.white,
      this.thirdTrimesterName = "",
      this.thirdTrimesterColor = defaultOvulationColor,
      this.thirdTrimesterTextColor = Colors.white,
      this.titleTextColor = Colors.black,
      this.titleTextSize = 20,
      this.titleFontWeight = FontWeight.bold,
      this.messageTextColor = Colors.black45,
      this.messageTextSize = 10,
      this.messageFontWeight = FontWeight.normal,
      this.spaceBtnTitleMessage = 5});

  @override
  State<PregnancyView> createState() => _PregnancyViewState();
}

class _PregnancyViewState extends State<PregnancyView> {
  final _instance = MenstrualCycleWidget.instance!;

  int _currentMonth = 0;
  PregnancyPainter? _painter;
  Size size = Size(300, 300); // Define your size
  String websiteUrl = Strings.pkgUrl;
  double selectedDayCircleSize = 15;
  double widgetSize = 0;
  PhaseTextBoundaries? phaseTextBoundaries;
  Color? _highlightCurrentMonthColor;

  String _title = "";
  String _message = "";
  String _message2 = "";
  String _firstTrimesterName = WidgetBaseLanguage.firstTrimesterName;
  String _secondTrimesterName = WidgetBaseLanguage.secondTrimesterName;
  String _thirdTrimesterName = WidgetBaseLanguage.thirdTrimesterName;

  Future<void> _init() async {
    if (widget.firstTrimesterName != null &&
        widget.firstTrimesterName!.isNotEmpty) {
      _firstTrimesterName = widget.firstTrimesterName!;
    }
    if (widget.secondTrimesterName != null &&
        widget.secondTrimesterName!.isNotEmpty) {
      _secondTrimesterName = widget.secondTrimesterName!;
    }
    if (widget.thirdTrimesterName != null &&
        widget.thirdTrimesterName!.isNotEmpty) {
      _thirdTrimesterName = widget.thirdTrimesterName!;
    }

    if (widget.highlightCurrentMonthColor != null) {
      _highlightCurrentMonthColor = widget.highlightCurrentMonthColor!;
    } else {
      _highlightCurrentMonthColor = Color(0xFF259b24);
    }

    String lastPeriodDate = _instance.getPreviousPeriodDay();
    generateMessagesText(lastPeriodDate);
    updatePaintObject();
  }

  updatePaintObject() {
    _painter = PregnancyPainter(
        totalTrimester: 3,
        secondTrimesterColor: widget.secondTrimesterColor,
        secondTrimesterName: _secondTrimesterName,
        secondTrimesterTextColor: widget.secondTrimesterTextColor,
        firstTrimesterColor: widget.firstTrimesterColor,
        currentMonth: _currentMonth,
        highlightCurrentMonthColor: _highlightCurrentMonthColor,
        firstTrimesterName: _firstTrimesterName,
        firstTrimesterTextColor: widget.firstTrimesterTextColor,
        thirdTrimesterColor: widget.thirdTrimesterColor,
        thirdTrimesterName: _thirdTrimesterName,
        thirdTrimesterTextColor: widget.thirdTrimesterTextColor,
        title: _title,
        titleFontWeight: widget.titleFontWeight,
        titleTextColor: widget.titleTextColor,
        titleTextSize: widget.titleTextSize,
        message: _message,
        message2: _message2,
        messageFontWeight: widget.messageFontWeight,
        messageTextColor: widget.messageTextColor,
        messageTextSize: widget.messageTextSize,
        spaceBtnTitleMessage: widget.spaceBtnTitleMessage);
  }

  /// Generate dynamic messages based on different conditions
  generateMessagesText(lastPeriodDate) {
    if (lastPeriodDate.isNotEmpty) {
      final difference =
          DateTime.now().difference(DateTime.parse(lastPeriodDate)).inDays + 1;
      if (difference > 1) {
        _title = "$difference ${WidgetBaseLanguage.phaseDaysLabel}";
      } else {
        _title = "$difference ${WidgetBaseLanguage.phaseDayLabel}";
      }
      int weekNumber = (difference / 7).floor() + 1;
      int monthNumber = (difference / 30).ceil();
      _currentMonth = monthNumber - 1;
      _message = "$monthNumber${getOrdinalSuffix(monthNumber)} Month";
      _message2 = "$weekNumber${getOrdinalSuffix(weekNumber)} Week";
    }
  }

  String getOrdinalSuffix(int number) {
    if (number >= 11 && number <= 13) {
      return 'th';
    }
    switch (number % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  @override
  void initState() {
    super.initState();
    _checkValidation();
    widgetSize = widget.size;
    _init();
  }

  /// Check Default Validation
  _checkValidation() {
    if (widget.size < 200) {
      throw "${WidgetBaseLanguage.errorInvalidSize} $websiteUrl";
    }
  }

  @override
  Widget build(BuildContext context) {
    /// set dynamically size if provided size more then current screen size
    if (Theme.of(context).platform == TargetPlatform.iOS ||
        Theme.of(context).platform == TargetPlatform.android) {
      if (MediaQuery.of(context).size.width < widget.size) {
        widgetSize = MediaQuery.of(context).size.width - 10;
      }
    } else if (kIsWeb) {
      if (MediaQuery.of(context).size.height < widget.size) {
        widgetSize = MediaQuery.of(context).size.height - 100;
      }
    }
    size = Size(widgetSize, widgetSize);
    return CustomPaint(
      size: Size(widgetSize, widgetSize),
      painter: _painter,
    );
  }
}
