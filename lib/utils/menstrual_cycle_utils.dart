import 'package:flutter/foundation.dart';

import '../menstrual_cycle_widget.dart';
import '../widget_languages/languages.dart';

/// Print logs to console
printMenstrualCycleLogs(String message) {
  String currentDate = currentDateFormat.format(DateTime.now());
  if (kDebugMode) {
    print("${WidgetBaseLanguage.printLogLabel} ($currentDate): $message");
  }
}

/// Convert celsius to fahrenheit
double celsiusToFahrenheit(double celsius) {
  return (celsius * 9 / 5) + 32;
}

/// Convert fahrenheit to Celsius
double fahrenheitToCelsius(double fahrenheit) {
  return (fahrenheit - 32) * 5 / 9;
}

double millilitersToLiters(double milliliters) {
  return milliliters * 0.001;
}

double millilitersToUSGallons(double milliliters) {
  return milliliters * 0.000264172;
}

double millilitersToImperialGallons(double milliliters) {
  return milliliters * 0.000219969;
}

double millilitersToUSFluidOunces(double milliliters) {
  return milliliters * 0.033814;
}

double millilitersToUSCups(double milliliters) {
  return milliliters * 0.00422675;
}

double convertKgToLb(double kg) {
  const double conversionFactor = 2.20462;
  return kg * conversionFactor;
}

double convertLbToKg(double lb) {
  const double conversionFactor = 0.453592;
  return lb * conversionFactor;
}

String convertMinutesToHours(int minutes) {
  int hours = minutes ~/ 60;
  int remainingMinutes = minutes % 60;
  return '${hours}h ${remainingMinutes}m';
}

/// check if arabic language
bool isArabicLanguage() {
  if (MenstrualCycleWidget.currentLanguage == Languages.arabic) {
    return true;
  }
  return false;
}
