import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../menstrual_cycle_widget.dart';
import '../widget_languages/languages.dart';
import 'custom_painter/pregnancy_painter.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

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

  final String imageUrl;
  final double imageWidth;
  final double imageHeight;

  const PregnancyView(
      {super.key,
      required this.size,
      this.firstTrimesterName = "",
      this.firstTrimesterColor = defaultMenstruationColor,
      this.firstTrimesterTextColor = Colors.white,
      this.secondTrimesterName = "",
      this.imageUrl = "",
      this.highlightCurrentMonthColor,
      this.secondTrimesterColor = defaultFollicularColor,
      this.secondTrimesterTextColor = Colors.white,
      this.thirdTrimesterName = "",
      this.thirdTrimesterColor = defaultOvulationColor,
      this.thirdTrimesterTextColor = Colors.white,
      this.titleTextColor = Colors.black,
      this.titleTextSize = 20,
      this.imageWidth = 100,
      this.imageHeight = 100,
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
  Timer? _timer;
  bool _showImage = false;
  int _currentMonth = 0;
  PregnancyPainter? _painter;
  Size size = Size(300, 300); // Define your size
  String websiteUrl = Strings.pkgUrl;
  double selectedDayCircleSize = 15;
  double widgetSize = 0;
  PhaseTextBoundaries? phaseTextBoundaries;
  Color? _highlightCurrentMonthColor;
  ui.Image? _image;
  int _messageIndex = 0;
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
        image: _image,
        messageIndex: _messageIndex,
        showImage: _showImage,
        imageHeight: widget.imageHeight,
        imageWidth: widget.imageWidth,
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
      _message2 = "Week $weekNumber";
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
    if (widget.imageUrl.isNotEmpty) {
      printMenstrualCycleLogs("URL ${widget.imageUrl}");
      loadImageFromUrl(widget.imageUrl).then((img) {
        setState(() {
          _image = img;
        });
        _startTimer();
        updatePaintObject();
      });
    }
    widgetSize = widget.size;
    _init();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _showImage = !_showImage; // Toggle between text & image
        if (_showImage) {
          _messageIndex = _messageIndex + 1;
          if (_messageIndex > 2) {
            _messageIndex = 1;
          }
        }
      });
      updatePaintObject();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// Check Default Validation
  _checkValidation() {
    if (widget.size < 200) {
      throw "${WidgetBaseLanguage.errorInvalidSize} $websiteUrl";
    }
  }

  Future<ui.Image> loadImageFromUrl(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    final Uint8List bytes = response.bodyBytes;
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(bytes, (ui.Image img) {
      completer.complete(img);
    });
    return completer.future;
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
