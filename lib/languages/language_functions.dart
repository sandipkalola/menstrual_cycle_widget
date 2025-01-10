import 'package:menstrual_cycle_widget/utils/enumeration.dart';

import '../menstrual_cycle_widget_base.dart';
import 'languages.dart';

getSaveLogsTitle() {
  final logsByLanguage = {
    Languages.english: enSaveLogs,
    Languages.hindi: hiSaveLogs,
    Languages.arabic: arSaveLogs,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}
