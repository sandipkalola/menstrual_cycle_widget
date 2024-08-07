import 'package:flutter/foundation.dart';

import '../menstrual_cycle_widget.dart';

/// Print logs to console
printLogs(String message) {
  String currentDate = currentDateFormat.format(DateTime.now());
  if (kDebugMode) {
    print("${Strings.printLogLabel} ($currentDate): $message");
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

