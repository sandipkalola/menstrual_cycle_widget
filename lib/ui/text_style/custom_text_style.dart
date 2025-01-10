import 'package:flutter/material.dart';

import '../../menstrual_cycle_widget_base.dart';

/// get font family name
getFontFamily() {
  return MenstrualCycleWidget.defaultFontFamily;
}

/// text style with black color and font size is 10
TextStyle textStyleBlack10() {
  return TextStyle(
      color: Colors.black, fontSize: 10, fontFamily: getFontFamily());
}

/// get text style
TextStyle getTextStyle(TextStyle? style) => style ?? textStyleBlack10();

/// get text style with font size 24 and bold
TextStyle textStyle24Bold() {
  return TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: getFontFamily(),
  );
}
