import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../menstrual_cycle_widget.dart';

class MenstrualCyclePainter extends CustomPainter {
  int totalCycleDays;
  double selectedDayCircleSize;
  int selectedDay;

  /// Menstruation Params variables
  String menstruationName;
  Color menstruationColor;
  Color menstruationDayTextColor;
  Color menstruationTextColor;
  int menstruationDayCount;
  Color menstruationBackgroundColor;
  PhaseTextBoundaries phaseTextBoundaries;

  /// Follicular Phase Params variables
  String follicularPhaseName;
  Color follicularPhaseColor;
  Color follicularPhaseDayTextColor;
  Color follicularBackgroundColor;
  Color follicularTextColor;
  int follicularDayCount;

  /// ovulation Phase Params variables
  String ovulationName;
  Color ovulationColor;
  int ovulationDayCount;
  Color ovulationDayTextColor;
  Color ovulationBackgroundColor;
  Color ovulationTextColor;

  /// luteal Phase Params variables
  String lutealPhaseName;
  Color lutealPhaseColor;
  Color lutealPhaseBackgroundColor;
  Color lutealPhaseTextColor;
  Color lutealPhaseDayTextColor;

  /// Day Params variables
  String dayTitle;
  double dayTitleFontSize;
  double dayFontSize;
  double selectedDayFontSize;
  Color selectedDayBackgroundColor;
  Color selectedDayTextColor;
  Color dayTextColor;
  Color selectedDayCircleBorderColor;
  double insidePhasesTextSize;
  double outsidePhasesTextSize;
  int outsideTextSpaceFromArc;
  int outsideTextCharSpace;
  bool isShowDayTitle;
  FontWeight dayFontWeight;
  double circleDaySize;
  bool isRemoveBackgroundPhaseColor;

  MenstrualCycleTheme theme;
  double centralCircleSize;
  Color centralCircleBackgroundColor;
  Color centralCircleBorderColor;
  int centralCircleBorderSize;

  MenstrualCycleViewType viewType;

  double imgSize;
  ui.Image? imageAssets;

  /// Other Variables
  int menstruationDayCountNew = 0;
  int follicularDayCountNew = 0;
  int ovulationDayCountNew = 0;
  double arcStrokeWidth = 30;

  String title;
  Color titleTextColor;
  double titleTextSize;
  FontWeight titleFontWeight;

  String message;
  String message2;
  Color messageTextColor;
  double messageTextSize;
  FontWeight messageFontWeight;
  int spaceBtnTitleMessage;

  MenstrualCyclePainter(
      {required this.totalCycleDays,
      this.selectedDay = 0,
      // Menstruation Params
      this.menstruationName = Strings.menstruationLabel,
      required this.menstruationDayCount,
      this.menstruationColor = defaultMenstruationColor,
      this.menstruationBackgroundColor = defaultMenstruationColorBg,
      this.menstruationDayTextColor = defaultBlackColor,
      this.menstruationTextColor = defaultMenstruationColor,

      // Follicular Phase Params
      this.follicularPhaseName = Strings.follicularPhaseLabel,
      required this.follicularDayCount,
      this.follicularPhaseDayTextColor = defaultBlackColor,
      this.follicularPhaseColor = defaultFollicularColor,
      this.follicularBackgroundColor = defaultFollicularColorBg,
      this.follicularTextColor = defaultFollicularColor,

      // ovulation Phase Params
      this.ovulationName = Strings.ovulationLabel,
      required this.ovulationDayCount,
      this.ovulationDayTextColor = defaultBlackColor,
      this.ovulationColor = defaultOvulationColor,
      this.ovulationBackgroundColor = defaultOvulationColorBg,
      this.ovulationTextColor = defaultOvulationColor,

      // luteal Phase Params
      this.lutealPhaseName = Strings.lutealPhaseLabel,
      this.lutealPhaseColor = defaultLutealPhaseColor,
      this.lutealPhaseBackgroundColor = defaultLutealPhaseColorBg,
      this.lutealPhaseTextColor = defaultLutealPhaseColor,
      this.lutealPhaseDayTextColor = defaultBlackColor,

      // Central Circle
      this.imageAssets,
      this.imgSize = 30,
      this.centralCircleBackgroundColor = defaultCentralCircleBackgroundColor,
      this.centralCircleSize = 25,

      // Day Params
      this.dayTitle = Strings.dayLabel,
      this.dayTitleFontSize = 5,
      this.dayFontSize = 12,
      this.selectedDayFontSize = 18,
      this.selectedDayCircleSize = 18,
      this.dayTextColor = defaultBlackColor,
      this.selectedDayBackgroundColor = Colors.white,
      this.selectedDayTextColor = defaultBlackColor,
      this.selectedDayCircleBorderColor = Colors.transparent,
      this.insidePhasesTextSize = 8,
      this.isShowDayTitle = true,
      this.circleDaySize = 13, //Only when Theme is MenstrualCycleTheme.circle
      this.dayFontWeight = FontWeight.normal,
      this.theme = MenstrualCycleTheme.basic,
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
      this.message2 = "",
      this.messageTextColor = Colors.black45,
      this.messageTextSize = 10,
      this.messageFontWeight = FontWeight.normal,
      this.spaceBtnTitleMessage = 5});

  @override
  Future<void> paint(Canvas canvas, Size size) async {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    double selectedDayTextX = 0.0;
    double selectedDayTextY = 0.0;
    TextPainter selectedDayTextPainter = TextPainter();
    String selectedDayLabel = "";

    final radius = min(size.width / 2, size.height / 2) -
        20; // 20 is Manage circle outerline
    final center = Offset(size.width / 2, size.height / 2);

    menstruationDayCountNew = menstruationDayCount;
    follicularDayCountNew = follicularDayCount + menstruationDayCount;
    ovulationDayCountNew = follicularDayCountNew + ovulationDayCount;

    drawTopAndTextPhase(
        canvas,
        rect,
        center,
        radius,
        0,
        menstruationDayCountNew,
        menstruationColor,
        menstruationBackgroundColor,
        menstruationName,
        menstruationTextColor);
    drawTopAndTextPhase(
        canvas,
        rect,
        center,
        radius,
        menstruationDayCount,
        follicularDayCountNew,
        follicularPhaseColor,
        follicularBackgroundColor,
        follicularPhaseName,
        follicularTextColor);
    drawTopAndTextPhase(
        canvas,
        rect,
        center,
        radius,
        follicularDayCountNew,
        ovulationDayCountNew,
        ovulationColor,
        ovulationBackgroundColor,
        ovulationName,
        ovulationTextColor);
    drawTopAndTextPhase(
        canvas,
        rect,
        center,
        radius,
        ovulationDayCountNew,
        totalCycleDays,
        lutealPhaseColor,
        lutealPhaseBackgroundColor,
        lutealPhaseName,
        lutealPhaseTextColor);

    /// Show outside phase text
    if (phaseTextBoundaries != PhaseTextBoundaries.none) {
      if (phaseTextBoundaries == PhaseTextBoundaries.both ||
          phaseTextBoundaries == PhaseTextBoundaries.outside) {
        drawOutSide(canvas, radius, size, menstruationName, 0,
            menstruationDayCountNew, menstruationTextColor);
        drawOutSide(canvas, radius, size, follicularPhaseName,
            menstruationDayCount, follicularDayCountNew, follicularTextColor);
        drawOutSide(canvas, radius, size, ovulationName, follicularDayCountNew,
            ovulationDayCountNew, ovulationTextColor);
        drawOutSide(
          canvas,
          radius,
          size,
          lutealPhaseName,
          ovulationDayCountNew,
          totalCycleDays,
          lutealPhaseTextColor,
        );
      }
    }

    if (viewType == MenstrualCycleViewType.circleImage ||
        viewType == MenstrualCycleViewType.circleText) {
      /// draw border of circle background on center
      final Paint circleBorder = Paint()
        ..color = centralCircleBorderColor
        ..style = PaintingStyle.fill;
      canvas.drawCircle(
          center, centralCircleSize + centralCircleBorderSize, circleBorder);

      /// draw Circle background on center
      final Paint backgroundPaint = Paint()
        ..color = centralCircleBackgroundColor
        ..style = PaintingStyle.fill;
      canvas.drawCircle(center, centralCircleSize, backgroundPaint);
    }

    if (viewType == MenstrualCycleViewType.text ||
        viewType == MenstrualCycleViewType.circleText) {
      final messageTextPainter = TextPainter(
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          maxLines: 2,
          ellipsis: "...");
      double totalHeight = 0;
      List<TextPainter> textPainters = [];

      /// show title text
      TextSpan message1 = TextSpan(
        text: message,
        style: TextStyle(
          color: messageTextColor,
          fontSize: messageTextSize,
          fontWeight: messageFontWeight,
        ),
      );
      messageTextPainter.text = message1;
      messageTextPainter.layout(minWidth: 0, maxWidth: size.width * 0.60);
      textPainters.add(messageTextPainter);
      totalHeight += messageTextPainter.height;

      final titleTextPainter = TextPainter(
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          maxLines: 2,
          ellipsis: "...");

      /// Show title text
      TextSpan titleText = TextSpan(
        text: title,
        style: TextStyle(
          color: titleTextColor,
          fontSize: titleTextSize,
          fontWeight: titleFontWeight,
        ),
      );
      titleTextPainter.text = titleText;
      titleTextPainter.layout(minWidth: 0, maxWidth: size.width * 0.70);
      textPainters.add(titleTextPainter);
      totalHeight += titleTextPainter.height;

      final message2TextPainter = TextPainter(
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          maxLines: 2,
          ellipsis: "...");

      /// show message2 text
      TextSpan messageText2 = TextSpan(
        text: message2,
        style: TextStyle(
          color: messageTextColor,
          fontSize: messageTextSize,
          fontWeight: messageFontWeight,
        ),
      );
      message2TextPainter.text = messageText2;
      message2TextPainter.layout(minWidth: 0, maxWidth: size.width * 0.60);
      textPainters.add(message2TextPainter);
      totalHeight += message2TextPainter.height;

      // Starting Y position
      double startY = center.dy - totalHeight / 2;
      Offset titleOffset =
          Offset(center.dx - textPainters[0].width / 2, startY);

      messageTextPainter.layout(minWidth: 0, maxWidth: size.width * 0.60);
      messageTextPainter.paint(canvas, titleOffset);

      Offset messageOffset = Offset(
        center.dx - textPainters[1].width / 2,
        titleOffset.dy + textPainters[0].height + spaceBtnTitleMessage,
      );

      titleTextPainter.layout(minWidth: 0, maxWidth: size.width * 0.70);
      titleTextPainter.paint(canvas, messageOffset);

      // Paint message2
      Offset message2Offset = Offset(
        center.dx - textPainters[2].width / 2,
        messageOffset.dy + textPainters[1].height + spaceBtnTitleMessage,
      );

      message2TextPainter.layout(minWidth: 0, maxWidth: size.width * 0.60);
      message2TextPainter.paint(canvas, message2Offset);
    }

    if (viewType == MenstrualCycleViewType.image ||
        viewType == MenstrualCycleViewType.circleImage) {
      /// Draw the image at the center
      if (imageAssets != null) {
        final paint = Paint()..style = PaintingStyle.stroke;
        final imageSize = Size(imgSize, imgSize);
        final imageOffset = Offset(
          center.dx - imageSize.width / 2,
          center.dy - imageSize.height / 2,
        );
        canvas.drawImageRect(
          imageAssets!,
          Rect.fromLTWH(0, 0, imageAssets!.width.toDouble(),
              imageAssets!.height.toDouble()),
          imageOffset & imageSize,
          paint,
        );
      }
    }

    /// For loop for display a Days
    for (int day = 1; day <= totalCycleDays; day++) {
      final startAngle = (2 * pi / totalCycleDays) * (day - 1) - pi / 2;
      final endAngle = (2 * pi / totalCycleDays) * day - pi / 2;
      final middleAngle = (startAngle + endAngle) / 2;

      /// Calculate Day position
      final textX = center.dx + radius * cos(middleAngle);
      final textY = center.dy + radius * sin(middleAngle);

      final textPainter = TextPainter(
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      Color circleBorderColor = getSelectedBorderColor(day);
      Color dayTextColor = getSelectedDayTextColor(day);

      /// Draw "Day" label
      TextSpan dayLabel = TextSpan(
        text: dayTitle,
        style: TextStyle(
          color: dayTextColor,
          fontSize: dayTitleFontSize,
          fontWeight: FontWeight.normal,
        ),
      );
      textPainter.text = dayLabel;
      textPainter.layout();
      final labelOffset = Offset(
          textX - textPainter.width / 2, textY - textPainter.height / 3.5 - 10);

      /// 10 Mange space btn Day and 'Day' label
      if (isShowDayTitle) {
        textPainter.paint(canvas, labelOffset);
      }

      if (theme == MenstrualCycleTheme.circle) {
        final Paint borderPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;
        canvas.drawCircle(Offset(textX, textY), circleDaySize, borderPaint);

        /// set background color of selected day
        final Paint highlightCirclePaint = Paint()
          ..color = circleBorderColor
          ..style = PaintingStyle.fill
          ..strokeWidth = 1;
        canvas.drawCircle(
            Offset(textX, textY), circleDaySize, highlightCirclePaint);

        if (isShowDayTitle) {
          textPainter.paint(canvas, labelOffset);
        }
      }

      /// highlight current days
      if (day == selectedDay) {
        selectedDayTextX = textX;
        selectedDayTextY = textY;
        selectedDayLabel = day.toString();

        /// draw outer boarder for selected day
        final Paint borderPaint = Paint()
          ..color = circleBorderColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;
        canvas.drawCircle(
            Offset(textX, textY), selectedDayCircleSize, borderPaint);

        /// set background color of selected day
        final Paint highlightCirclePaint = Paint()
          ..color = selectedDayBackgroundColor
          ..style = PaintingStyle.fill
          ..strokeWidth = 2;
        canvas.drawCircle(Offset(textX, textY), selectedDayCircleSize - 1,
            highlightCirclePaint);

        if (isShowDayTitle) {
          textPainter.paint(canvas, labelOffset);
        }
      }

      double topPos = 2;
      if (isShowDayTitle) {
        topPos = 2.5;
      }

      /// Display day(number)
      TextSpan dayText = TextSpan(
        text: day.toString(),
        style: TextStyle(
          color: dayTextColor,
          fontSize: (day == selectedDay) ? selectedDayFontSize : dayFontSize,
          fontWeight: dayFontWeight,
        ),
      );
      textPainter.text = dayText;
      textPainter.layout();
      final textOffset = Offset(
          textX - textPainter.width / 2, textY - textPainter.height / topPos);
      textPainter.paint(
        canvas,
        textOffset,
      );
      selectedDayTextPainter = textPainter;
    }

    /// Re-draw selected day
    if (selectedDayTextY > 0) {
      double topPos = 2;
      if (isShowDayTitle) {
        topPos = 2.5;
      }

      /// draw outer boarder for selected day
      final Paint borderPaint = Paint()
        ..color = getSelectedBorderColor(selectedDay)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      canvas.drawCircle(Offset(selectedDayTextX, selectedDayTextY),
          selectedDayCircleSize, borderPaint);

      /// set background color of selected day
      final Paint highlightCirclePaint = Paint()
        ..color = selectedDayBackgroundColor
        ..style = PaintingStyle.fill
        ..strokeWidth = 2;
      canvas.drawCircle(Offset(selectedDayTextX, selectedDayTextY),
          selectedDayCircleSize - 1, highlightCirclePaint);

      TextSpan dayLabel = TextSpan(
        text: dayTitle,
        style: TextStyle(
          color: Colors.black,
          fontSize: dayTitleFontSize,
          fontWeight: FontWeight.normal,
        ),
      );
      selectedDayTextPainter.text = dayLabel;
      selectedDayTextPainter.layout();

      final labelOffset = Offset(
          selectedDayTextX - selectedDayTextPainter.width / 2,
          selectedDayTextY - selectedDayTextPainter.height / 3.5 - 10);

      if (isShowDayTitle) {
        selectedDayTextPainter.paint(canvas, labelOffset);
      }

      TextSpan dayText = TextSpan(
        text: selectedDayLabel,
        style: TextStyle(
          color: Colors.black,
          fontSize: selectedDayFontSize,
          fontWeight: dayFontWeight,
        ),
      );
      selectedDayTextPainter.text = dayText;
      selectedDayTextPainter.layout();
      final textOffset = Offset(
          selectedDayTextX - selectedDayTextPainter.width / 2,
          selectedDayTextY - selectedDayTextPainter.height / topPos);
      selectedDayTextPainter.paint(
        canvas,
        textOffset,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  /// Draw Phase text outside circle like Menstruation, Ovulation etc
  void drawOutSide(Canvas canvas, double radius1, Size size, String text,
      int startDay, int endDay, Color color,
      {Offset? offset, bool adjust = true}) {
    final startAngle = (2 * pi / totalCycleDays) * startDay - pi / 2;
    final sweepAngle = (2 * pi / totalCycleDays) * (endDay - startDay);

    double radius =
        radius1 + outsideTextSpaceFromArc; // Adjust space btn arc and text
    double angle = startAngle;

    if (adjust) {
      angle += sweepAngle / 2 -
          (text.length *
              5 *
              pi /
              600); // Adjust starting angle for centering text
    }

    for (int i = 0; i < text.length; i++) {
      final char = text[i];

      double charAngle = angle +
          i * outsideTextCharSpace * pi / 180; // Adjust character spacing
      Offset charOffset = Offset(
        size.width / 2 + radius * cos(charAngle),
        size.height / 2 + radius * sin(charAngle),
      );

      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: char,
          style: TextStyle(
            color: color,
            fontSize: outsidePhasesTextSize,
          ),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      canvas.save();
      canvas.translate(charOffset.dx, charOffset.dy);
      canvas.rotate(charAngle + pi / 2);
      textPainter.paint(
          canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));
      canvas.restore();
    }
  }

  /// Get Selected day text color based on menstrual phase
  Color getSelectedDayTextColor(int day) {
    if (day == selectedDay) {
      if (selectedDayTextColor != Colors.black) {
        return selectedDayTextColor;
      }
      return defaultBlackColor;
    } else {
      if (day <= menstruationDayCount) {
        if (menstruationDayTextColor != defaultBlackColor) {
          return menstruationDayTextColor;
        }
      } else if (day <= follicularDayCountNew) {
        if (follicularPhaseDayTextColor != defaultBlackColor) {
          return follicularPhaseDayTextColor;
        }
      } else if (day <= ovulationDayCountNew) {
        if (ovulationDayTextColor != defaultBlackColor) {
          return ovulationDayTextColor;
        }
      } else {
        if (lutealPhaseDayTextColor != defaultBlackColor) {
          return lutealPhaseDayTextColor;
        }
      }
    }
    return dayTextColor;
  }

  /// Get Selected day border color based on menstrual phase
  Color getSelectedBorderColor(int day) {
    if (selectedDayCircleBorderColor == Colors.transparent) {
      if (day <= menstruationDayCount) {
        return menstruationColor;
      } else if (day <= follicularDayCountNew) {
        return follicularPhaseColor;
      } else if (day <= ovulationDayCountNew) {
        return ovulationColor;
      } else {
        return lutealPhaseColor;
      }
    }
    return selectedDayCircleBorderColor;
  }

  /// Draw top view and inside background
  void drawTopAndTextPhase(
      Canvas canvas,
      Rect rect,
      Offset center,
      double radius,
      int startDay,
      int endDay,
      Color topColor,
      Color bgColor,
      String label,
      Color textColor) {
    final startAngle = (2 * pi / totalCycleDays) * startDay - pi / 2;
    final sweepAngle = (2 * pi / totalCycleDays) * (endDay - startDay);

    ///Draw top view
    if (theme == MenstrualCycleTheme.arcs) {
      final paint = Paint()
        ..color = topColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = arcStrokeWidth; // Manage Height of Outer circle
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }

    if (!isRemoveBackgroundPhaseColor) {
      /// Draw background color based on phase
      final paint1 = Paint()
        ..color = bgColor
        ..style = PaintingStyle.fill;
      canvas.drawArc(rect, startAngle, sweepAngle, true, paint1);
    }

    /// set text inside circle
    if (phaseTextBoundaries != PhaseTextBoundaries.none) {
      if (phaseTextBoundaries == PhaseTextBoundaries.both ||
          phaseTextBoundaries == PhaseTextBoundaries.inside) {
        drawPhaseTextInside(
            canvas, center, radius, startDay, endDay, textColor, label);
      }
    }
  }

  /// Draw Phase text inside circle like Menstruation, Ovulation etc
  void drawPhaseTextInside(Canvas canvas, Offset center, double radius,
      int startDay, int endDay, Color textColor, String label) {
    final startAngle = (2 * pi / totalCycleDays) * startDay - pi / 2;
    final sweepAngle = (2 * pi / totalCycleDays) * (endDay - startDay);

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    final labelAngle = startAngle + sweepAngle / 2;
    final labelRadius = radius / 2;
    final labelX = center.dx + labelRadius * cos(labelAngle);
    final labelY = center.dy + labelRadius * sin(labelAngle);

    /// Calculate rotation angle
    double rotationAngle;
    if (labelAngle > pi / 2 && labelAngle < 3 * pi / 2) {
      rotationAngle = labelAngle - pi;
    } else {
      rotationAngle = labelAngle;
    }

    canvas.save();
    canvas.translate(labelX, labelY);
    canvas.rotate(rotationAngle);
    canvas.translate(-labelX, -labelY);

    final labelText = TextSpan(
      text: label,
      style: TextStyle(
        color: textColor,
        fontSize: insidePhasesTextSize,
        fontWeight: FontWeight.bold,
      ),
    );

    textPainter.text = labelText;
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        labelX - textPainter.width / 2,
        labelY - textPainter.height / 2,
      ),
    );

    canvas.restore();
  }
}
