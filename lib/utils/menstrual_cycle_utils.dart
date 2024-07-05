import 'package:flutter/foundation.dart';

import '../menstrual_cycle_widget.dart';

printLogs(String message) {
  String currentDate = currentDateFormat.format(DateTime.now());
  if (kDebugMode) {
    print("${Strings.printLogLabel} ($currentDate): $message");
  }
}
