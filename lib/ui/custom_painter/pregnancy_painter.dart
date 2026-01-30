import 'dart:math';

import 'package:flutter/material.dart';
import 'package:menstrual_cycle_widget/ui/text_style/custom_text_style.dart';
import 'dart:ui' as ui;
import '../../menstrual_cycle_widget.dart';
import '../../widget_languages/languages.dart';

class PregnancyPainter extends CustomPainter {
  int totalTrimester;
  int currentMonth;

  String? firstTrimesterName;
  Color firstTrimesterColor;
  Color firstTrimesterTextColor;

  String? secondTrimesterName;
  Color secondTrimesterColor;
  Color secondTrimesterTextColor;

  String? thirdTrimesterName;
  Color thirdTrimesterColor;
  Color thirdTrimesterTextColor;
  Color? highlightCurrentMonthColor;

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
  double imageWidth;
  double imageHeight;
  ui.Image? image;
  bool showImage;
  int messageIndex;

  PregnancyPainter({
    this.totalTrimester = 3,
    this.currentMonth = 1,
    this.firstTrimesterName,
    this.highlightCurrentMonthColor,
    this.image,
    this.showImage = false,
    this.imageWidth = 100,
    this.messageIndex = 0,
    this.imageHeight = 100,
    this.firstTrimesterColor = defaultMenstruationColor,
    this.firstTrimesterTextColor = Colors.white,
    this.secondTrimesterName,
    this.secondTrimesterColor = defaultFollicularColor,
    this.secondTrimesterTextColor = Colors.white,
    this.thirdTrimesterName,
    this.thirdTrimesterColor = defaultOvulationColor,
    this.thirdTrimesterTextColor = Colors.white,
    this.title = "",
    this.titleTextColor = Colors.black,
    this.titleTextSize = 20,
    this.titleFontWeight = FontWeight.bold,
    this.message = "",
    this.message2 = "",
    this.messageTextColor = Colors.black45,
    this.messageTextSize = 10,
    this.messageFontWeight = FontWeight.normal,
    this.spaceBtnTitleMessage = 5,
  });

  @override
  Future<void> paint(Canvas canvas, Size size) async {
    totalTrimester = 3;

    int firstTrimester = 1;
    int secondTrimester = 2;
    int thirdTrimester = 3;

    Size sizeNew = size;

    final rect = Rect.fromLTWH(0, 0, sizeNew.width, sizeNew.height);
    final radius =
        min(sizeNew.width / 2, sizeNew.height / 2) -
        20; // 20 is Manage circle outerline
    final center = Offset(sizeNew.width / 2, sizeNew.height / 2);

    drawTopAndTextPhase(
      canvas,
      rect,
      center,
      radius,
      0,
      firstTrimester,
      firstTrimesterColor,
    );
    drawTopAndTextPhase(
      canvas,
      rect,
      center,
      radius,
      1,
      secondTrimester,
      secondTrimesterColor,
    );
    drawTopAndTextPhase(
      canvas,
      rect,
      center,
      radius,
      2,
      thirdTrimester,
      thirdTrimesterColor,
    );

    /// Show outside phase text
    drawOutSide(
      canvas,
      radius,
      sizeNew,
      firstTrimesterName!,
      0,
      firstTrimester,
      firstTrimesterTextColor,
    );
    drawOutSide(
      canvas,
      radius,
      sizeNew,
      secondTrimesterName!,
      firstTrimester,
      secondTrimester,
      secondTrimesterTextColor,
    );
    drawOutSide(
      canvas,
      radius,
      sizeNew,
      thirdTrimesterName!,
      secondTrimester,
      thirdTrimester,
      thirdTrimesterTextColor,
    );

    Size sizeInside = Size(sizeNew.width - 80, sizeNew.height - 80);

    final rectNew = Rect.fromLTWH(0, 0, sizeInside.width, sizeInside.height);
    final radiusNew =
        min(sizeInside.width / 2, sizeInside.height / 2) -
        20; // 20 is Manage circle outerline
    final centerNew = Offset(sizeNew.width / 2, sizeNew.height / 2);

    for (int i = 0; i < 9; i++) {
      drawTopAndTextPhaseInside(
        canvas,
        rectNew,
        centerNew,
        radiusNew,
        i,
        i + 1,
        getBackgroundColor(i),
      );

      String textTitle = "${i + 1}${WidgetBaseLanguage.month}";
      if (i == currentMonth) {
        if (showImage) {
          if (messageIndex == 1) {
            textTitle = title;
          } else if (messageIndex == 2) {
            textTitle = message2;
          }
        }
      }

      drawInsideText(canvas, radiusNew, sizeNew, textTitle, i, i + 1);
    }

    if (showImage && image != null) {
      final double dx = (size.width - imageWidth) / 2;
      final double dy = (size.height - imageHeight) / 2;
      final Rect src = Rect.fromLTWH(
        0,
        0,
        image!.width.toDouble(),
        image!.height.toDouble(),
      );
      final Rect dst = Rect.fromLTWH(dx, dy, imageWidth, imageHeight);
      canvas.drawImageRect(image!, src, dst, Paint());
    } else {
      final messageTextPainter = TextPainter(
        textAlign: TextAlign.center,
        textDirection: (isArabicLanguage())
            ? TextDirection.rtl
            : TextDirection.ltr,
        maxLines: 2,
        ellipsis: "...",
      );
      double totalHeight = 0;
      List<TextPainter> textPainters = [];

      /// show title text
      TextSpan message1 = TextSpan(
        text: message,
        style: TextStyle(
          color: messageTextColor,
          fontSize: messageTextSize,
          fontWeight: messageFontWeight,
          fontFamily: getFontFamily(),
        ),
      );
      messageTextPainter.text = message1;
      messageTextPainter.layout(minWidth: 0, maxWidth: sizeNew.width * 0.60);
      textPainters.add(messageTextPainter);
      totalHeight += messageTextPainter.height;

      final titleTextPainter = TextPainter(
        textAlign: TextAlign.center,
        textDirection: (isArabicLanguage())
            ? TextDirection.rtl
            : TextDirection.ltr,
        maxLines: 2,
        ellipsis: "...",
      );

      /// Show title text
      TextSpan titleText = TextSpan(
        text: title,
        style: TextStyle(
          color: titleTextColor,
          fontSize: titleTextSize,
          fontWeight: titleFontWeight,
          fontFamily: getFontFamily(),
        ),
      );
      titleTextPainter.text = titleText;
      titleTextPainter.layout(minWidth: 0, maxWidth: sizeNew.width * 0.70);
      textPainters.add(titleTextPainter);
      totalHeight += titleTextPainter.height;

      final message2TextPainter = TextPainter(
        textAlign: TextAlign.center,
        textDirection: (isArabicLanguage())
            ? TextDirection.rtl
            : TextDirection.ltr,
        maxLines: 2,
        ellipsis: "...",
      );

      /// show message2 text
      TextSpan messageText2 = TextSpan(
        text: message2,
        style: TextStyle(
          color: messageTextColor,
          fontSize: messageTextSize,
          fontWeight: messageFontWeight,
          fontFamily: getFontFamily(),
        ),
      );
      message2TextPainter.text = messageText2;
      message2TextPainter.layout(minWidth: 0, maxWidth: sizeNew.width * 0.60);
      textPainters.add(message2TextPainter);
      totalHeight += message2TextPainter.height;

      // Starting Y position
      double startY = center.dy - totalHeight / 2;
      Offset titleOffset = Offset(
        center.dx - textPainters[0].width / 2,
        startY,
      );

      messageTextPainter.layout(minWidth: 0, maxWidth: sizeNew.width * 0.60);
      messageTextPainter.paint(canvas, titleOffset);

      Offset messageOffset = Offset(
        center.dx - textPainters[1].width / 2,
        titleOffset.dy + textPainters[0].height + spaceBtnTitleMessage,
      );

      titleTextPainter.layout(minWidth: 0, maxWidth: sizeNew.width * 0.70);
      titleTextPainter.paint(canvas, messageOffset);

      // Paint message2
      Offset message2Offset = Offset(
        center.dx - textPainters[2].width / 2,
        messageOffset.dy + textPainters[1].height + spaceBtnTitleMessage,
      );

      message2TextPainter.layout(minWidth: 0, maxWidth: sizeNew.width * 0.60);
      message2TextPainter.paint(canvas, message2Offset);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  getBackgroundColor(int index) {
    if (index < 3) {
      return firstTrimesterColor;
    } else if (index < 6) {
      return secondTrimesterColor;
    } else {
      return thirdTrimesterColor;
    }
  }

  void drawInsideText(
    Canvas canvas,
    double radius1,
    Size size,
    String text,
    int startDay,
    int endDay, {
    Offset? offset,
    bool adjust = true,
  }) {
    final startAngle = (2 * pi / 9) * startDay - pi / 2;
    final sweepAngle = (2 * pi / 9) * (endDay - startDay);

    double radius = radius1; // Adjust space btn arc and text
    double angle = startAngle;

    if (adjust) {
      angle +=
          sweepAngle / 2 -
          (text.length *
              5 *
              pi /
              500); // Adjust starting angle for centering text
    }

    for (int i = 0; i < text.length; i++) {
      final char = text[i];

      double charAngle = angle + i * 5 * pi / 180; // Adjust character spacing
      Offset charOffset = Offset(
        size.width / 2 + radius * cos(charAngle),
        size.height / 2 + radius * sin(charAngle),
      );

      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: (i == 0) ? "$char " : char,
          style: TextStyle(
            color: Colors.white,
            fontSize: (startDay == currentMonth) ? 10 : 7,
            fontFamily: getFontFamily(),
            fontWeight: (startDay == currentMonth)
                ? FontWeight.bold
                : FontWeight.normal,
            letterSpacing: 1,
          ),
        ),
        textDirection: (isArabicLanguage())
            ? TextDirection.rtl
            : TextDirection.ltr,
      );

      textPainter.layout();
      canvas.save();
      canvas.translate(charOffset.dx, charOffset.dy);
      canvas.rotate(charAngle + pi / 2);
      textPainter.paint(
        canvas,
        Offset(-textPainter.width / 2, -textPainter.height / 2),
      );
      canvas.restore();
    }
  }

  /// Draw Phase text outside circle like Menstruation, Ovulation etc
  void drawOutSide(
    Canvas canvas,
    double radius1,
    Size size,
    String text,
    int startDay,
    int endDay,
    Color textColor, {
    Offset? offset,
    bool adjust = true,
  }) {
    final startAngle = (2 * pi / totalTrimester) * startDay - pi / 2;
    final sweepAngle = (2 * pi / totalTrimester) * (endDay - startDay);

    double radius = radius1; // Adjust space btn arc and text
    double angle = startAngle;

    if (adjust) {
      angle +=
          sweepAngle / 2 -
          (text.length *
              5 *
              pi /
              600); // Adjust starting angle for centering text
    }

    for (int i = 0; i < text.length; i++) {
      final char = text[i];

      double charAngle = angle + i * 5 * pi / 180; // Adjust character spacing
      Offset charOffset = Offset(
        size.width / 2 + radius * cos(charAngle),
        size.height / 2 + radius * sin(charAngle),
      );

      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: char,
          style: TextStyle(
            color: textColor,
            fontSize: 12,
            fontFamily: getFontFamily(),
          ),
        ),
        textAlign: TextAlign.center,
        textDirection: (isArabicLanguage())
            ? TextDirection.rtl
            : TextDirection.ltr,
      );

      textPainter.layout();
      canvas.save();
      canvas.translate(charOffset.dx, charOffset.dy);
      canvas.rotate(charAngle + pi / 2);
      textPainter.paint(
        canvas,
        Offset(-textPainter.width / 2, -textPainter.height / 2),
      );
      canvas.restore();
    }
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
  ) {
    final startAngle = (2 * pi / totalTrimester) * startDay - pi / 2;
    final sweepAngle = (2 * pi / totalTrimester) * (endDay - startDay);

    ///Draw top view
    //if (theme == MenstrualCycleTheme.arcs) {
    final paint = Paint()
      ..color = topColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30; // Manage Height of Outer circle
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
    //}
  }

  void drawTopAndTextPhaseInside(
    Canvas canvas,
    Rect rect,
    Offset center,
    double radius,
    int startDay,
    int endDay,
    Color topColor,
  ) {
    int totalMonth = 9;
    final startAngle = (2 * pi / totalMonth) * startDay - pi / 2;
    final sweepAngle = (2 * pi / totalMonth) * (endDay - startDay);

    if (startDay == currentMonth) {
      ///Draw top view
      final paint = Paint()
        ..color = highlightCurrentMonthColor!
        ..style = PaintingStyle.stroke
        ..strokeWidth = 25; // Manage Height of Outer circle
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }

    final paint1 = Paint()
      ..color = (startDay == currentMonth)
          ? highlightCurrentMonthColor!
          : topColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20; // Manage Height of Outer circle
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint1,
    );
  }
}
