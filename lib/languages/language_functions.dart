import 'package:menstrual_cycle_widget/utils/enumeration.dart';

import '../menstrual_cycle_widget_base.dart';
import 'languages.dart';

getSaveLogs() {
  Languages currentLang = MenstrualCycleWidget.currentLanguage;
  if (currentLang == Languages.english) {
    return enSaveLogs;
  } else if (currentLang == Languages.hindi) {
    return hiSaveLogs;
  } else if (currentLang == Languages.arabic) {
    return arSaveLogs;
  }
}
