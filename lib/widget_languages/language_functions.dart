import '../menstrual_cycle_widget.dart';
import 'languages.dart';

/// return language code
String getLanguageCode() {
  switch (MenstrualCycleWidget.currentLanguage) {
    case Languages.english:
      return "en";
    case Languages.hindi:
      return "hi";
    case Languages.arabic:
      return "ar";
    case Languages.spanish:
      return "es";
    case Languages.mandarin:
      return "zh";
    case Languages.french:
      return "fr";
    case Languages.bengali:
      return "bn";
    case Languages.portuguese:
      return "pt";
    case Languages.russian:
      return "ru";
    case Languages.japanese:
      return "ja";
    case Languages.german:
      return "de";
    case Languages.punjabi:
      return "pa";
    case Languages.javanese:
      return "jv";
    case Languages.wuChinese:
      return "wuu";
    case Languages.korean:
      return "ko";
    case Languages.tamil:
      return "ta";
    case Languages.turkish:
      return "tr";
    case Languages.urdu:
      return "ur";
    case Languages.vietnamese:
      return "vi";
    case Languages.italian:
      return "it";
  }
}

getSaveLogsTitle() {
  final logsByLanguage = {
    Languages.english: enSaveLogs,
    Languages.hindi: hiSaveLogs,
    Languages.arabic: arSaveLogs,
    Languages.spanish: esSaveLogs,
    Languages.mandarin: zhSaveLogs,
    Languages.french: frSaveLogs,
    Languages.bengali: bnSaveLogs,
    Languages.portuguese: ptSaveLogs,
    Languages.russian: ruSaveLogs,
    Languages.japanese: jaSaveLogs,
    Languages.german: deSaveLogs,
    Languages.punjabi: paSaveLogs,
    Languages.javanese: jvSaveLogs,
    Languages.wuChinese: wuuSaveLogs,
    Languages.korean: koSaveLogs,
    Languages.tamil: taSaveLogs,
    Languages.turkish: trSaveLogs,
    Languages.urdu: urSaveLogs,
    Languages.vietnamese: viSaveLogs,
    Languages.italian: itSaveLogs,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSecretKeyLabel() {
  final secretKeyLabels = {
    Languages.english: enSecretKeyLabel,
    Languages.hindi: hiSecretKeyLabel,
    Languages.arabic: arSecretKeyLabel,
    Languages.spanish: esSecretKeyLabel,
    Languages.mandarin: zhSecretKeyLabel,
    Languages.french: frSecretKeyLabel,
    Languages.bengali: bnSecretKeyLabel,
    Languages.portuguese: ptSecretKeyLabel,
    Languages.russian: ruSecretKeyLabel,
    Languages.japanese: jaSecretKeyLabel,
    Languages.german: deSecretKeyLabel,
    Languages.punjabi: paSecretKeyLabel,
    Languages.javanese: jvSecretKeyLabel,
    Languages.wuChinese: wuuSecretKeyLabel,
    Languages.korean: koSecretKeyLabel,
    Languages.tamil: taSecretKeyLabel,
    Languages.turkish: trSecretKeyLabel,
    Languages.urdu: urSecretKeyLabel,
    Languages.vietnamese: viSecretKeyLabel,
    Languages.italian: itSecretKeyLabel,
  };
  return secretKeyLabels[MenstrualCycleWidget.currentLanguage];
}

getIvKeyLabel() {
  final ivKeyLabels = {
    Languages.english: enIvKeyLabel,
    Languages.hindi: hiIvKeyLabel,
    Languages.arabic: arIvKeyLabel,
    Languages.spanish: esIvKeyLabel,
    Languages.mandarin: zhIvKeyLabel,
    Languages.french: frIvKeyLabel,
    Languages.bengali: bnIvKeyLabel,
    Languages.portuguese: ptIvKeyLabel,
    Languages.russian: ruIvKeyLabel,
    Languages.japanese: jaIvKeyLabel,
    Languages.german: deIvKeyLabel,
    Languages.punjabi: paIvKeyLabel,
    Languages.javanese: jvIvKeyLabel,
    Languages.wuChinese: wuuIvKeyLabel,
    Languages.korean: koIvKeyLabel,
    Languages.tamil: taIvKeyLabel,
    Languages.turkish: trIvKeyLabel,
    Languages.urdu: urIvKeyLabel,
    Languages.vietnamese: viIvKeyLabel,
    Languages.italian: itIvKeyLabel,
  };
  return ivKeyLabels[MenstrualCycleWidget.currentLanguage];
}

getTotalCycleDaysLabel() {
  final totalCycleDaysLabels = {
    Languages.english: enTotalCycleDaysLabel,
    Languages.hindi: hiTotalCycleDaysLabel,
    Languages.arabic: arTotalCycleDaysLabel,
    Languages.spanish: esTotalCycleDaysLabel,
    Languages.mandarin: zhTotalCycleDaysLabel,
    Languages.french: frTotalCycleDaysLabel,
    Languages.bengali: bnTotalCycleDaysLabel,
    Languages.portuguese: ptTotalCycleDaysLabel,
    Languages.russian: ruTotalCycleDaysLabel,
    Languages.japanese: jaTotalCycleDaysLabel,
    Languages.german: deTotalCycleDaysLabel,
    Languages.punjabi: paTotalCycleDaysLabel,
    Languages.javanese: jvTotalCycleDaysLabel,
    Languages.wuChinese: wuuTotalCycleDaysLabel,
    Languages.korean: koTotalCycleDaysLabel,
    Languages.tamil: taTotalCycleDaysLabel,
    Languages.turkish: trTotalCycleDaysLabel,
    Languages.urdu: urTotalCycleDaysLabel,
    Languages.vietnamese: viTotalCycleDaysLabel,
    Languages.italian: itTotalCycleDaysLabel,
  };
  return totalCycleDaysLabels[MenstrualCycleWidget.currentLanguage];
}

getTotalPeriodDaysLabel() {
  final totalPeriodDaysLabels = {
    Languages.english: enTotalPeriodDaysLabel,
    Languages.hindi: hiTotalPeriodDaysLabel,
    Languages.arabic: arTotalPeriodDaysLabel,
    Languages.spanish: esTotalPeriodDaysLabel,
    Languages.mandarin: zhTotalPeriodDaysLabel,
    Languages.french: frTotalPeriodDaysLabel,
    Languages.bengali: bnTotalPeriodDaysLabel,
    Languages.portuguese: ptTotalPeriodDaysLabel,
    Languages.russian: ruTotalPeriodDaysLabel,
    Languages.japanese: jaTotalPeriodDaysLabel,
    Languages.german: deTotalPeriodDaysLabel,
    Languages.punjabi: paTotalPeriodDaysLabel,
    Languages.javanese: jvTotalPeriodDaysLabel,
    Languages.wuChinese: wuuTotalPeriodDaysLabel,
    Languages.korean: koTotalPeriodDaysLabel,
    Languages.tamil: taTotalPeriodDaysLabel,
    Languages.turkish: trTotalPeriodDaysLabel,
    Languages.urdu: urTotalPeriodDaysLabel,
    Languages.vietnamese: viTotalPeriodDaysLabel,
    Languages.italian: itTotalPeriodDaysLabel,
  };
  return totalPeriodDaysLabels[MenstrualCycleWidget.currentLanguage];
}

getPrintLogLabel() {
  final logsByLanguage = {
    Languages.english: enPrintLogLabel,
    Languages.hindi: hiPrintLogLabel,
    Languages.arabic: arPrintLogLabel,
    Languages.spanish: esPrintLogLabel,
    Languages.mandarin: zhPrintLogLabel,
    Languages.french: frPrintLogLabel,
    Languages.bengali: bnPrintLogLabel,
    Languages.portuguese: ptPrintLogLabel,
    Languages.russian: ruPrintLogLabel,
    Languages.japanese: jaPrintLogLabel,
    Languages.german: dePrintLogLabel,
    Languages.punjabi: paPrintLogLabel,
    Languages.javanese: jvPrintLogLabel,
    Languages.wuChinese: wuuPrintLogLabel,
    Languages.korean: koPrintLogLabel,
    Languages.tamil: taPrintLogLabel,
    Languages.turkish: trPrintLogLabel,
    Languages.urdu: urPrintLogLabel,
    Languages.vietnamese: viPrintLogLabel,
    Languages.italian: itPrintLogLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSaveLabel() {
  final logsByLanguage = {
    Languages.english: enSaveLabel,
    Languages.hindi: hiSaveLabel,
    Languages.arabic: arSaveLabel,
    Languages.spanish: esSaveLabel,
    Languages.mandarin: zhSaveLabel,
    Languages.french: frSaveLabel,
    Languages.bengali: bnSaveLabel,
    Languages.portuguese: ptSaveLabel,
    Languages.russian: ruSaveLabel,
    Languages.japanese: jaSaveLabel,
    Languages.german: deSaveLabel,
    Languages.punjabi: paSaveLabel,
    Languages.javanese: jvSaveLabel,
    Languages.wuChinese: wuuSaveLabel,
    Languages.korean: koSaveLabel,
    Languages.tamil: taSaveLabel,
    Languages.turkish: trSaveLabel,
    Languages.urdu: urSaveLabel,
    Languages.vietnamese: viSaveLabel,
    Languages.italian: itSaveLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCancelLabel() {
  final logsByLanguage = {
    Languages.english: enCancelLabel,
    Languages.hindi: hiCancelLabel,
    Languages.arabic: arCancelLabel,
    Languages.spanish: esCancelLabel,
    Languages.mandarin: zhCancelLabel,
    Languages.french: frCancelLabel,
    Languages.bengali: bnCancelLabel,
    Languages.portuguese: ptCancelLabel,
    Languages.russian: ruCancelLabel,
    Languages.japanese: jaCancelLabel,
    Languages.german: deCancelLabel,
    Languages.punjabi: paCancelLabel,
    Languages.javanese: jvCancelLabel,
    Languages.wuChinese: wuuCancelLabel,
    Languages.korean: koCancelLabel,
    Languages.tamil: taCancelLabel,
    Languages.turkish: trCancelLabel,
    Languages.urdu: urCancelLabel,
    Languages.vietnamese: viCancelLabel,
    Languages.italian: itCancelLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getEditPeriodDateLabel() {
  final logsByLanguage = {
    Languages.english: enEditPeriodDateLabel,
    Languages.hindi: hiEditPeriodDateLabel,
    Languages.arabic: arEditPeriodDateLabel,
    Languages.spanish: esEditPeriodDateLabel,
    Languages.mandarin: zhEditPeriodDateLabel,
    Languages.french: frEditPeriodDateLabel,
    Languages.bengali: bnEditPeriodDateLabel,
    Languages.portuguese: ptEditPeriodDateLabel,
    Languages.russian: ruEditPeriodDateLabel,
    Languages.japanese: jaEditPeriodDateLabel,
    Languages.german: deEditPeriodDateLabel,
    Languages.punjabi: paEditPeriodDateLabel,
    Languages.javanese: jvEditPeriodDateLabel,
    Languages.wuChinese: wuuEditPeriodDateLabel,
    Languages.korean: koEditPeriodDateLabel,
    Languages.tamil: taEditPeriodDateLabel,
    Languages.turkish: trEditPeriodDateLabel,
    Languages.urdu: urEditPeriodDateLabel,
    Languages.vietnamese: viEditPeriodDateLabel,
    Languages.italian: itEditPeriodDateLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPeriodLabel() {
  final logsByLanguage = {
    Languages.english: enPeriodLabel,
    Languages.hindi: hiPeriodLabel,
    Languages.arabic: arPeriodLabel,
    Languages.spanish: esPeriodLabel,
    Languages.mandarin: zhPeriodLabel,
    Languages.french: frPeriodLabel,
    Languages.bengali: bnPeriodLabel,
    Languages.portuguese: ptPeriodLabel,
    Languages.russian: ruPeriodLabel,
    Languages.japanese: jaPeriodLabel,
    Languages.german: dePeriodLabel,
    Languages.punjabi: paPeriodLabel,
    Languages.javanese: jvPeriodLabel,
    Languages.wuChinese: wuuPeriodLabel,
    Languages.korean: koPeriodLabel,
    Languages.tamil: taPeriodLabel,
    Languages.turkish: trPeriodLabel,
    Languages.urdu: urPeriodLabel,
    Languages.vietnamese: viPeriodLabel,
    Languages.italian: itPeriodLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPredictOvulationDateLabel() {
  final logsByLanguage = {
    Languages.english: enPredictOvulationDateLabel,
    Languages.hindi: hiPredictOvulationDateLabel,
    Languages.arabic: arPredictOvulationDateLabel,
    Languages.spanish: esPredictOvulationDateLabel,
    Languages.mandarin: zhPredictOvulationDateLabel,
    Languages.french: frPredictOvulationDateLabel,
    Languages.bengali: bnPredictOvulationDateLabel,
    Languages.portuguese: ptPredictOvulationDateLabel,
    Languages.russian: ruPredictOvulationDateLabel,
    Languages.japanese: jaPredictOvulationDateLabel,
    Languages.german: dePredictOvulationDateLabel,
    Languages.punjabi: paPredictOvulationDateLabel,
    Languages.javanese: jvPredictOvulationDateLabel,
    Languages.wuChinese: wuuPredictOvulationDateLabel,
    Languages.korean: koPredictOvulationDateLabel,
    Languages.tamil: taPredictOvulationDateLabel,
    Languages.turkish: trPredictOvulationDateLabel,
    Languages.urdu: urPredictOvulationDateLabel,
    Languages.vietnamese: viPredictOvulationDateLabel,
    Languages.italian: itPredictOvulationDateLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPredictPeriodDateLabel() {
  final logsByLanguage = {
    Languages.english: enPredictPeriodDateLabel,
    Languages.hindi: hiPredictPeriodDateLabel,
    Languages.arabic: arPredictPeriodDateLabel,
    Languages.spanish: esPredictPeriodDateLabel,
    Languages.mandarin: zhPredictPeriodDateLabel,
    Languages.french: frPredictPeriodDateLabel,
    Languages.bengali: bnPredictPeriodDateLabel,
    Languages.portuguese: ptPredictPeriodDateLabel,
    Languages.russian: ruPredictPeriodDateLabel,
    Languages.japanese: jaPredictPeriodDateLabel,
    Languages.german: dePredictPeriodDateLabel,
    Languages.punjabi: paPredictPeriodDateLabel,
    Languages.javanese: jvPredictPeriodDateLabel,
    Languages.wuChinese: wuuPredictPeriodDateLabel,
    Languages.korean: koPredictPeriodDateLabel,
    Languages.tamil: taPredictPeriodDateLabel,
    Languages.turkish: trPredictPeriodDateLabel,
    Languages.urdu: urPredictPeriodDateLabel,
    Languages.vietnamese: viPredictPeriodDateLabel,
    Languages.italian: itPredictPeriodDateLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSelectedDateLabel() {
  final logsByLanguage = {
    Languages.english: enSelectedDateLabel,
    Languages.hindi: hiSelectedDateLabel,
    Languages.arabic: arSelectedDateLabel,
    Languages.spanish: esSelectedDateLabel,
    Languages.mandarin: zhSelectedDateLabel,
    Languages.french: frSelectedDateLabel,
    Languages.bengali: bnSelectedDateLabel,
    Languages.portuguese: ptSelectedDateLabel,
    Languages.russian: ruSelectedDateLabel,
    Languages.japanese: jaSelectedDateLabel,
    Languages.german: deSelectedDateLabel,
    Languages.punjabi: paSelectedDateLabel,
    Languages.javanese: jvSelectedDateLabel,
    Languages.wuChinese: wuuSelectedDateLabel,
    Languages.korean: koSelectedDateLabel,
    Languages.tamil: taSelectedDateLabel,
    Languages.turkish: trSelectedDateLabel,
    Languages.urdu: urSelectedDateLabel,
    Languages.vietnamese: viSelectedDateLabel,
    Languages.italian: itSelectedDateLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getTodayLabel() {
  final logsByLanguage = {
    Languages.english: enTodayLabel,
    Languages.hindi: hiTodayLabel,
    Languages.arabic: arTodayLabel,
    Languages.spanish: esTodayLabel,
    Languages.mandarin: zhTodayLabel,
    Languages.french: frTodayLabel,
    Languages.bengali: bnTodayLabel,
    Languages.portuguese: ptTodayLabel,
    Languages.russian: ruTodayLabel,
    Languages.japanese: jaTodayLabel,
    Languages.german: deTodayLabel,
    Languages.punjabi: paTodayLabel,
    Languages.javanese: jvTodayLabel,
    Languages.wuChinese: wuuTodayLabel,
    Languages.korean: koTodayLabel,
    Languages.tamil: taTodayLabel,
    Languages.turkish: trTodayLabel,
    Languages.urdu: urTodayLabel,
    Languages.vietnamese: viTodayLabel,
    Languages.italian: itTodayLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getMenstruationLabel() {
  final logsByLanguage = {
    Languages.english: enMenstruationLabel,
    Languages.hindi: hiMenstruationLabel,
    Languages.arabic: arMenstruationLabel,
    Languages.spanish: esMenstruationLabel,
    Languages.mandarin: zhMenstruationLabel,
    Languages.french: frMenstruationLabel,
    Languages.bengali: bnMenstruationLabel,
    Languages.portuguese: ptMenstruationLabel,
    Languages.russian: ruMenstruationLabel,
    Languages.japanese: jaMenstruationLabel,
    Languages.german: deMenstruationLabel,
    Languages.punjabi: paMenstruationLabel,
    Languages.javanese: jvMenstruationLabel,
    Languages.wuChinese: wuuMenstruationLabel,
    Languages.korean: koMenstruationLabel,
    Languages.tamil: taMenstruationLabel,
    Languages.turkish: trMenstruationLabel,
    Languages.urdu: urMenstruationLabel,
    Languages.vietnamese: viMenstruationLabel,
    Languages.italian: itMenstruationLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getThirdTrimesterName() {
  final logsByLanguage = {
    Languages.english: enThirdTrimesterName,
    Languages.hindi: hiThirdTrimesterName,
    Languages.arabic: arThirdTrimesterName,
    Languages.spanish: esThirdTrimesterName,
    Languages.mandarin: zhThirdTrimesterName,
    Languages.french: frThirdTrimesterName,
    Languages.bengali: bnThirdTrimesterName,
    Languages.portuguese: ptThirdTrimesterName,
    Languages.russian: ruThirdTrimesterName,
    Languages.japanese: jaThirdTrimesterName,
    Languages.german: deThirdTrimesterName,
    Languages.punjabi: paThirdTrimesterName,
    Languages.javanese: jvThirdTrimesterName,
    Languages.wuChinese: wuuThirdTrimesterName,
    Languages.korean: koThirdTrimesterName,
    Languages.tamil: taThirdTrimesterName,
    Languages.turkish: trThirdTrimesterName,
    Languages.urdu: urThirdTrimesterName,
    Languages.vietnamese: viThirdTrimesterName,
    Languages.italian: itThirdTrimesterName,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSecondTrimesterName() {
  final logsByLanguage = {
    Languages.english: enSecondTrimesterName,
    Languages.hindi: hiSecondTrimesterName,
    Languages.arabic: arSecondTrimesterName,
    Languages.spanish: esSecondTrimesterName,
    Languages.mandarin: zhSecondTrimesterName,
    Languages.french: frSecondTrimesterName,
    Languages.bengali: bnSecondTrimesterName,
    Languages.portuguese: ptSecondTrimesterName,
    Languages.russian: ruSecondTrimesterName,
    Languages.japanese: jaSecondTrimesterName,
    Languages.german: deSecondTrimesterName,
    Languages.punjabi: paSecondTrimesterName,
    Languages.javanese: jvSecondTrimesterName,
    Languages.wuChinese: wuuSecondTrimesterName,
    Languages.korean: koSecondTrimesterName,
    Languages.tamil: taSecondTrimesterName,
    Languages.turkish: trSecondTrimesterName,
    Languages.urdu: urSecondTrimesterName,
    Languages.vietnamese: viSecondTrimesterName,
    Languages.italian: itSecondTrimesterName,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getFirstTrimesterName() {
  final logsByLanguage = {
    Languages.english: enFirstTrimesterName,
    Languages.hindi: hiFirstTrimesterName,
    Languages.arabic: arFirstTrimesterName,
    Languages.spanish: esFirstTrimesterName,
    Languages.mandarin: zhFirstTrimesterName,
    Languages.french: frFirstTrimesterName,
    Languages.bengali: bnFirstTrimesterName,
    Languages.portuguese: ptFirstTrimesterName,
    Languages.russian: ruFirstTrimesterName,
    Languages.japanese: jaFirstTrimesterName,
    Languages.german: deFirstTrimesterName,
    Languages.punjabi: paFirstTrimesterName,
    Languages.javanese: jvFirstTrimesterName,
    Languages.wuChinese: wuuFirstTrimesterName,
    Languages.korean: koFirstTrimesterName,
    Languages.tamil: taFirstTrimesterName,
    Languages.turkish: trFirstTrimesterName,
    Languages.urdu: urFirstTrimesterName,
    Languages.vietnamese: viFirstTrimesterName,
    Languages.italian: itFirstTrimesterName,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getFollicularPhaseLabel() {
  final logsByLanguage = {
    Languages.english: enFollicularPhaseLabel,
    Languages.hindi: hiFollicularPhaseLabel,
    Languages.arabic: arFollicularPhaseLabel,
    Languages.spanish: esFollicularPhaseLabel,
    Languages.mandarin: zhFollicularPhaseLabel,
    Languages.french: frFollicularPhaseLabel,
    Languages.bengali: bnFollicularPhaseLabel,
    Languages.portuguese: ptFollicularPhaseLabel,
    Languages.russian: ruFollicularPhaseLabel,
    Languages.japanese: jaFollicularPhaseLabel,
    Languages.german: deFollicularPhaseLabel,
    Languages.punjabi: paFollicularPhaseLabel,
    Languages.javanese: jvFollicularPhaseLabel,
    Languages.wuChinese: wuuFollicularPhaseLabel,
    Languages.korean: koFollicularPhaseLabel,
    Languages.tamil: taFollicularPhaseLabel,
    Languages.turkish: trFollicularPhaseLabel,
    Languages.urdu: urFollicularPhaseLabel,
    Languages.vietnamese: viFollicularPhaseLabel,
    Languages.italian: itFollicularPhaseLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getOvulationLabel() {
  final logsByLanguage = {
    Languages.english: enOvulationLabel,
    Languages.hindi: hiOvulationLabel,
    Languages.arabic: arOvulationLabel,
    Languages.spanish: esOvulationLabel,
    Languages.mandarin: zhOvulationLabel,
    Languages.french: frOvulationLabel,
    Languages.bengali: bnOvulationLabel,
    Languages.portuguese: ptOvulationLabel,
    Languages.russian: ruOvulationLabel,
    Languages.japanese: jaOvulationLabel,
    Languages.german: deOvulationLabel,
    Languages.punjabi: paOvulationLabel,
    Languages.javanese: jvOvulationLabel,
    Languages.wuChinese: wuuOvulationLabel,
    Languages.korean: koOvulationLabel,
    Languages.tamil: taOvulationLabel,
    Languages.turkish: trOvulationLabel,
    Languages.urdu: urOvulationLabel,
    Languages.vietnamese: viOvulationLabel,
    Languages.italian: itOvulationLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLutealPhaseLabel() {
  final logsByLanguage = {
    Languages.english: enLutealPhaseLabel,
    Languages.hindi: hiLutealPhaseLabel,
    Languages.arabic: arLutealPhaseLabel,
    Languages.spanish: esLutealPhaseLabel,
    Languages.mandarin: zhLutealPhaseLabel,
    Languages.french: frLutealPhaseLabel,
    Languages.bengali: bnLutealPhaseLabel,
    Languages.portuguese: ptLutealPhaseLabel,
    Languages.russian: ruLutealPhaseLabel,
    Languages.japanese: jaLutealPhaseLabel,
    Languages.german: deLutealPhaseLabel,
    Languages.punjabi: paLutealPhaseLabel,
    Languages.javanese: jvLutealPhaseLabel,
    Languages.wuChinese: wuuLutealPhaseLabel,
    Languages.korean: koLutealPhaseLabel,
    Languages.tamil: taLutealPhaseLabel,
    Languages.turkish: trLutealPhaseLabel,
    Languages.urdu: urLutealPhaseLabel,
    Languages.vietnamese: viLutealPhaseLabel,
    Languages.italian: itLutealPhaseLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getMediumLabel() {
  final logsByLanguage = {
    Languages.english: enMediumLabel,
    Languages.hindi: hiMediumLabel,
    Languages.arabic: arMediumLabel,
    Languages.spanish: esMediumLabel,
    Languages.mandarin: zhMediumLabel,
    Languages.french: frMediumLabel,
    Languages.bengali: bnMediumLabel,
    Languages.portuguese: ptMediumLabel,
    Languages.russian: ruMediumLabel,
    Languages.japanese: jaMediumLabel,
    Languages.german: deMediumLabel,
    Languages.punjabi: paMediumLabel,
    Languages.javanese: jvMediumLabel,
    Languages.wuChinese: wuuMediumLabel,
    Languages.korean: koMediumLabel,
    Languages.tamil: taMediumLabel,
    Languages.turkish: trMediumLabel,
    Languages.urdu: urMediumLabel,
    Languages.vietnamese: viMediumLabel,
    Languages.italian: itMediumLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLowLabel() {
  final logsByLanguage = {
    Languages.english: enLowLabel,
    Languages.hindi: hiLowLabel,
    Languages.arabic: arLowLabel,
    Languages.spanish: esLowLabel,
    Languages.mandarin: zhLowLabel,
    Languages.french: frLowLabel,
    Languages.bengali: bnLowLabel,
    Languages.portuguese: ptLowLabel,
    Languages.russian: ruLowLabel,
    Languages.japanese: jaLowLabel,
    Languages.german: deLowLabel,
    Languages.punjabi: paLowLabel,
    Languages.javanese: jvLowLabel,
    Languages.wuChinese: wuuLowLabel,
    Languages.korean: koLowLabel,
    Languages.tamil: taLowLabel,
    Languages.turkish: trLowLabel,
    Languages.urdu: urLowLabel,
    Languages.vietnamese: viLowLabel,
    Languages.italian: itLowLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getHighLabel() {
  final logsByLanguage = {
    Languages.english: enHighLabel,
    Languages.hindi: hiHighLabel,
    Languages.arabic: arHighLabel,
    Languages.spanish: esHighLabel,
    Languages.mandarin: zhHighLabel,
    Languages.french: frHighLabel,
    Languages.bengali: bnHighLabel,
    Languages.portuguese: ptHighLabel,
    Languages.russian: ruHighLabel,
    Languages.japanese: jaHighLabel,
    Languages.german: deHighLabel,
    Languages.punjabi: paHighLabel,
    Languages.javanese: jvHighLabel,
    Languages.wuChinese: wuuHighLabel,
    Languages.korean: koHighLabel,
    Languages.tamil: taHighLabel,
    Languages.turkish: trHighLabel,
    Languages.urdu: urHighLabel,
    Languages.vietnamese: viHighLabel,
    Languages.italian: itHighLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getEstrogenLabel() {
  final logsByLanguage = {
    Languages.english: enEstrogenLabel,
    Languages.hindi: hiEstrogenLabel,
    Languages.arabic: arEstrogenLabel,
    Languages.spanish: esEstrogenLabel,
    Languages.mandarin: zhEstrogenLabel,
    Languages.french: frEstrogenLabel,
    Languages.bengali: bnEstrogenLabel,
    Languages.portuguese: ptEstrogenLabel,
    Languages.russian: ruEstrogenLabel,
    Languages.japanese: jaEstrogenLabel,
    Languages.german: deEstrogenLabel,
    Languages.punjabi: paEstrogenLabel,
    Languages.javanese: jvEstrogenLabel,
    Languages.wuChinese: wuuEstrogenLabel,
    Languages.korean: koEstrogenLabel,
    Languages.tamil: taEstrogenLabel,
    Languages.turkish: trEstrogenLabel,
    Languages.urdu: urEstrogenLabel,
    Languages.vietnamese: viEstrogenLabel,
    Languages.italian: itEstrogenLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getProgesteroneLabel() {
  final logsByLanguage = {
    Languages.english: enProgesteroneLabel,
    Languages.hindi: hiProgesteroneLabel,
    Languages.arabic: arProgesteroneLabel,
    Languages.spanish: esProgesteroneLabel,
    Languages.mandarin: zhProgesteroneLabel,
    Languages.french: frProgesteroneLabel,
    Languages.bengali: bnProgesteroneLabel,
    Languages.portuguese: ptProgesteroneLabel,
    Languages.russian: ruProgesteroneLabel,
    Languages.japanese: jaProgesteroneLabel,
    Languages.german: deProgesteroneLabel,
    Languages.punjabi: paProgesteroneLabel,
    Languages.javanese: jvProgesteroneLabel,
    Languages.wuChinese: wuuProgesteroneLabel,
    Languages.korean: koProgesteroneLabel,
    Languages.tamil: taProgesteroneLabel,
    Languages.turkish: trProgesteroneLabel,
    Languages.urdu: urProgesteroneLabel,
    Languages.vietnamese: viProgesteroneLabel,
    Languages.italian: itProgesteroneLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLatePeriodLabel() {
  final logsByLanguage = {
    Languages.english: enLatePeriod,
    Languages.hindi: hiLatePeriod,
    Languages.arabic: arLatePeriod,
    Languages.spanish: esLatePeriod,
    Languages.mandarin: zhLatePeriod,
    Languages.french: frLatePeriod,
    Languages.bengali: bnLatePeriod,
    Languages.portuguese: ptLatePeriod,
    Languages.russian: ruLatePeriod,
    Languages.japanese: jaLatePeriod,
    Languages.german: deLatePeriod,
    Languages.punjabi: paLatePeriod,
    Languages.javanese: jvLatePeriod,
    Languages.wuChinese: wuuLatePeriod,
    Languages.korean: koLatePeriod,
    Languages.tamil: taLatePeriod,
    Languages.turkish: trLatePeriod,
    Languages.urdu: urLatePeriod,
    Languages.vietnamese: viLatePeriod,
    Languages.italian: itLatePeriod,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getDayLabel() {
  final logsByLanguage = {
    Languages.english: enDayLabel,
    Languages.hindi: hiDayLabel,
    Languages.arabic: arDayLabel,
    Languages.spanish: esDayLabel,
    Languages.mandarin: zhDayLabel,
    Languages.french: frDayLabel,
    Languages.bengali: bnDayLabel,
    Languages.portuguese: ptDayLabel,
    Languages.russian: ruDayLabel,
    Languages.japanese: jaDayLabel,
    Languages.german: deDayLabel,
    Languages.punjabi: paDayLabel,
    Languages.javanese: jvDayLabel,
    Languages.wuChinese: wuuDayLabel,
    Languages.korean: koDayLabel,
    Languages.tamil: taDayLabel,
    Languages.turkish: trDayLabel,
    Languages.urdu: urDayLabel,
    Languages.vietnamese: viDayLabel,
    Languages.italian: itDayLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLogPeriodLabel() {
  final logsByLanguage = {
    Languages.english: enLogPeriodLabel,
    Languages.hindi: hiLogPeriodLabel,
    Languages.arabic: arLogPeriodLabel,
    Languages.spanish: esLogPeriodLabel,
    Languages.mandarin: zhLogPeriodLabel,
    Languages.french: frLogPeriodLabel,
    Languages.bengali: bnLogPeriodLabel,
    Languages.portuguese: ptLogPeriodLabel,
    Languages.russian: ruLogPeriodLabel,
    Languages.japanese: jaLogPeriodLabel,
    Languages.german: deLogPeriodLabel,
    Languages.punjabi: paLogPeriodLabel,
    Languages.javanese: jvLogPeriodLabel,
    Languages.wuChinese: wuuLogPeriodLabel,
    Languages.korean: koLogPeriodLabel,
    Languages.tamil: taLogPeriodLabel,
    Languages.turkish: trLogPeriodLabel,
    Languages.urdu: urLogPeriodLabel,
    Languages.vietnamese: viLogPeriodLabel,
    Languages.italian: itLogPeriodLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPastCycleLabel() {
  final logsByLanguage = {
    Languages.english: enPastCycleLabel,
    Languages.hindi: hiPastCycleLabel,
    Languages.arabic: arPastCycleLabel,
    Languages.spanish: esPastCycleLabel,
    Languages.mandarin: zhPastCycleLabel,
    Languages.french: frPastCycleLabel,
    Languages.bengali: bnPastCycleLabel,
    Languages.portuguese: ptPastCycleLabel,
    Languages.russian: ruPastCycleLabel,
    Languages.japanese: jaPastCycleLabel,
    Languages.german: dePastCycleLabel,
    Languages.punjabi: paPastCycleLabel,
    Languages.javanese: jvPastCycleLabel,
    Languages.wuChinese: wuuPastCycleLabel,
    Languages.korean: koPastCycleLabel,
    Languages.tamil: taPastCycleLabel,
    Languages.turkish: trPastCycleLabel,
    Languages.urdu: urPastCycleLabel,
    Languages.vietnamese: viPastCycleLabel,
    Languages.italian: itPastCycleLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCircleDaysLateLabel() {
  final logsByLanguage = {
    Languages.english: enCircleDaysLateLabel,
    Languages.hindi: hiCircleDaysLateLabel,
    Languages.arabic: arCircleDaysLateLabel,
    Languages.spanish: esCircleDaysLateLabel,
    Languages.mandarin: zhCircleDaysLateLabel,
    Languages.french: frCircleDaysLateLabel,
    Languages.bengali: bnCircleDaysLateLabel,
    Languages.portuguese: ptCircleDaysLateLabel,
    Languages.russian: ruCircleDaysLateLabel,
    Languages.japanese: jaCircleDaysLateLabel,
    Languages.german: deCircleDaysLateLabel,
    Languages.punjabi: paCircleDaysLateLabel,
    Languages.javanese: jvCircleDaysLateLabel,
    Languages.wuChinese: wuuCircleDaysLateLabel,
    Languages.korean: koCircleDaysLateLabel,
    Languages.tamil: taCircleDaysLateLabel,
    Languages.turkish: trCircleDaysLateLabel,
    Languages.urdu: urCircleDaysLateLabel,
    Languages.vietnamese: viCircleDaysLateLabel,
    Languages.italian: itCircleDaysLateLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCircleDayLateLabel() {
  final logsByLanguage = {
    Languages.english: enCircleDayLateLabel,
    Languages.hindi: hiCircleDayLateLabel,
    Languages.arabic: arCircleDayLateLabel,
    Languages.spanish: esCircleDayLateLabel,
    Languages.mandarin: zhCircleDayLateLabel,
    Languages.french: frCircleDayLateLabel,
    Languages.bengali: bnCircleDayLateLabel,
    Languages.portuguese: ptCircleDayLateLabel,
    Languages.russian: ruCircleDayLateLabel,
    Languages.japanese: jaCircleDayLateLabel,
    Languages.german: deCircleDayLateLabel,
    Languages.punjabi: paCircleDayLateLabel,
    Languages.javanese: jvCircleDayLateLabel,
    Languages.wuChinese: wuuCircleDayLateLabel,
    Languages.korean: koCircleDayLateLabel,
    Languages.tamil: taCircleDayLateLabel,
    Languages.turkish: trCircleDayLateLabel,
    Languages.urdu: urCircleDayLateLabel,
    Languages.vietnamese: viCircleDayLateLabel,
    Languages.italian: itCircleDayLateLabel,
  };
  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLateLabel() {
  final logsByLanguage = {
    Languages.english: enLateLabel,
    Languages.hindi: hiLateLabel,
    Languages.arabic: arLateLabel,
    Languages.spanish: esLateLabel,
    Languages.mandarin: zhLateLabel,
    Languages.french: frLateLabel,
    Languages.bengali: bnLateLabel,
    Languages.portuguese: ptLateLabel,
    Languages.russian: ruLateLabel,
    Languages.japanese: jaLateLabel,
    Languages.german: deLateLabel,
    Languages.punjabi: paLateLabel,
    Languages.javanese: jvLateLabel,
    Languages.wuChinese: wuuLateLabel,
    Languages.korean: koLateLabel,
    Languages.tamil: taLateLabel,
    Languages.turkish: trLateLabel,
    Languages.urdu: urLateLabel,
    Languages.vietnamese: viLateLabel,
    Languages.italian: itLateLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getTimeForPregnancyTestLabel() {
  final logsByLanguage = {
    Languages.english: enTimeForPregnancyTestLabel,
    Languages.hindi: hiTimeForPregnancyTestLabel,
    Languages.arabic: arTimeForPregnancyTestLabel,
    Languages.spanish: esTimeForPregnancyTestLabel,
    Languages.mandarin: zhTimeForPregnancyTestLabel,
    Languages.french: frTimeForPregnancyTestLabel,
    Languages.bengali: bnTimeForPregnancyTestLabel,
    Languages.portuguese: ptTimeForPregnancyTestLabel,
    Languages.russian: ruTimeForPregnancyTestLabel,
    Languages.japanese: jaTimeForPregnancyTestLabel,
    Languages.german: deTimeForPregnancyTestLabel,
    Languages.punjabi: paTimeForPregnancyTestLabel,
    Languages.javanese: jvTimeForPregnancyTestLabel,
    Languages.wuChinese: wuuTimeForPregnancyTestLabel,
    Languages.korean: koTimeForPregnancyTestLabel,
    Languages.tamil: taTimeForPregnancyTestLabel,
    Languages.turkish: trTimeForPregnancyTestLabel,
    Languages.urdu: urTimeForPregnancyTestLabel,
    Languages.vietnamese: viTimeForPregnancyTestLabel,
    Languages.italian: itTimeForPregnancyTestLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getTimeForPregnancyTestTitleLabel() {
  final logsByLanguage = {
    Languages.english: enTimeForPregnancyTestTitleLabel,
    Languages.hindi: hiTimeForPregnancyTestTitleLabel,
    Languages.arabic: arTimeForPregnancyTestTitleLabel,
    Languages.spanish: esTimeForPregnancyTestTitleLabel,
    Languages.mandarin: zhTimeForPregnancyTestTitleLabel,
    Languages.french: frTimeForPregnancyTestTitleLabel,
    Languages.bengali: bnTimeForPregnancyTestTitleLabel,
    Languages.portuguese: ptTimeForPregnancyTestTitleLabel,
    Languages.russian: ruTimeForPregnancyTestTitleLabel,
    Languages.japanese: jaTimeForPregnancyTestTitleLabel,
    Languages.german: deTimeForPregnancyTestTitleLabel,
    Languages.punjabi: paTimeForPregnancyTestTitleLabel,
    Languages.javanese: jvTimeForPregnancyTestTitleLabel,
    Languages.wuChinese: wuuTimeForPregnancyTestTitleLabel,
    Languages.korean: koTimeForPregnancyTestTitleLabel,
    Languages.tamil: taTimeForPregnancyTestTitleLabel,
    Languages.turkish: trTimeForPregnancyTestTitleLabel,
    Languages.urdu: urTimeForPregnancyTestTitleLabel,
    Languages.vietnamese: viTimeForPregnancyTestTitleLabel,
    Languages.italian: itTimeForPregnancyTestTitleLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getTimeForPregnancyTestTitleLabel2() {
  final logsByLanguage = {
    Languages.english: enTimeForPregnancyTestTitleLabel2,
    Languages.hindi: hiTimeForPregnancyTestTitleLabel2,
    Languages.arabic: arTimeForPregnancyTestTitleLabel2,
    Languages.spanish: esTimeForPregnancyTestTitleLabel2,
    Languages.mandarin: zhTimeForPregnancyTestTitleLabel2,
    Languages.french: frTimeForPregnancyTestTitleLabel2,
    Languages.bengali: bnTimeForPregnancyTestTitleLabel2,
    Languages.portuguese: ptTimeForPregnancyTestTitleLabel2,
    Languages.russian: ruTimeForPregnancyTestTitleLabel2,
    Languages.japanese: jaTimeForPregnancyTestTitleLabel2,
    Languages.german: deTimeForPregnancyTestTitleLabel2,
    Languages.punjabi: paTimeForPregnancyTestTitleLabel2,
    Languages.javanese: jvTimeForPregnancyTestTitleLabel2,
    Languages.wuChinese: wuuTimeForPregnancyTestTitleLabel2,
    Languages.korean: koTimeForPregnancyTestTitleLabel2,
    Languages.tamil: taTimeForPregnancyTestTitleLabel2,
    Languages.turkish: trTimeForPregnancyTestTitleLabel2,
    Languages.urdu: urTimeForPregnancyTestTitleLabel2,
    Languages.vietnamese: viTimeForPregnancyTestTitleLabel2,
    Languages.italian: itTimeForPregnancyTestTitleLabel2,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getTimeForPregnancyTestTitleLabel4() {
  final logsByLanguage = {
    Languages.english: enTimeForPregnancyTestTitleLabel4,
    Languages.hindi: hiTimeForPregnancyTestTitleLabel4,
    Languages.arabic: arTimeForPregnancyTestTitleLabel4,
    Languages.spanish: esTimeForPregnancyTestTitleLabel4,
    Languages.mandarin: zhTimeForPregnancyTestTitleLabel4,
    Languages.french: frTimeForPregnancyTestTitleLabel4,
    Languages.bengali: bnTimeForPregnancyTestTitleLabel4,
    Languages.portuguese: ptTimeForPregnancyTestTitleLabel4,
    Languages.russian: ruTimeForPregnancyTestTitleLabel4,
    Languages.japanese: jaTimeForPregnancyTestTitleLabel4,
    Languages.german: deTimeForPregnancyTestTitleLabel4,
    Languages.punjabi: paTimeForPregnancyTestTitleLabel4,
    Languages.javanese: jvTimeForPregnancyTestTitleLabel4,
    Languages.wuChinese: wuuTimeForPregnancyTestTitleLabel4,
    Languages.korean: koTimeForPregnancyTestTitleLabel4,
    Languages.tamil: taTimeForPregnancyTestTitleLabel4,
    Languages.turkish: trTimeForPregnancyTestTitleLabel4,
    Languages.urdu: urTimeForPregnancyTestTitleLabel4,
    Languages.vietnamese: viTimeForPregnancyTestTitleLabel4,
    Languages.italian: itTimeForPregnancyTestTitleLabel4,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getTimeForPregnancyTestTitleLabel3() {
  final logsByLanguage = {
    Languages.english: enTimeForPregnancyTestTitleLabel3,
    Languages.hindi: hiTimeForPregnancyTestTitleLabel3,
    Languages.arabic: arTimeForPregnancyTestTitleLabel3,
    Languages.spanish: esTimeForPregnancyTestTitleLabel3,
    Languages.mandarin: zhTimeForPregnancyTestTitleLabel3,
    Languages.french: frTimeForPregnancyTestTitleLabel3,
    Languages.bengali: bnTimeForPregnancyTestTitleLabel3,
    Languages.portuguese: ptTimeForPregnancyTestTitleLabel3,
    Languages.russian: ruTimeForPregnancyTestTitleLabel3,
    Languages.japanese: jaTimeForPregnancyTestTitleLabel3,
    Languages.german: deTimeForPregnancyTestTitleLabel3,
    Languages.punjabi: paTimeForPregnancyTestTitleLabel3,
    Languages.javanese: jvTimeForPregnancyTestTitleLabel3,
    Languages.wuChinese: wuuTimeForPregnancyTestTitleLabel3,
    Languages.korean: koTimeForPregnancyTestTitleLabel3,
    Languages.tamil: taTimeForPregnancyTestTitleLabel3,
    Languages.turkish: trTimeForPregnancyTestTitleLabel3,
    Languages.urdu: urTimeForPregnancyTestTitleLabel3,
    Languages.vietnamese: viTimeForPregnancyTestTitleLabel3,
    Languages.italian: itTimeForPregnancyTestTitleLabel3,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPredictPeriodLabel() {
  final logsByLanguage = {
    Languages.english: enPredictPeriodLabel,
    Languages.hindi: hiPredictPeriodLabel,
    Languages.arabic: arPredictPeriodLabel,
    Languages.spanish: esPredictPeriodLabel,
    Languages.mandarin: zhPredictPeriodLabel,
    Languages.french: frPredictPeriodLabel,
    Languages.bengali: bnPredictPeriodLabel,
    Languages.portuguese: ptPredictPeriodLabel,
    Languages.russian: ruPredictPeriodLabel,
    Languages.japanese: jaPredictPeriodLabel,
    Languages.german: dePredictPeriodLabel,
    Languages.punjabi: paPredictPeriodLabel,
    Languages.javanese: jvPredictPeriodLabel,
    Languages.wuChinese: wuuPredictPeriodLabel,
    Languages.korean: koPredictPeriodLabel,
    Languages.tamil: taPredictPeriodLabel,
    Languages.turkish: trPredictPeriodLabel,
    Languages.urdu: urPredictPeriodLabel,
    Languages.vietnamese: viPredictPeriodLabel,
    Languages.italian: itPredictPeriodLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getConceiveLabel() {
  final logsByLanguage = {
    Languages.english: enConceiveLabel,
    Languages.hindi: hiConceiveLabel,
    Languages.arabic: arConceiveLabel,
    Languages.spanish: esConceiveLabel,
    Languages.mandarin: zhConceiveLabel,
    Languages.french: frConceiveLabel,
    Languages.bengali: bnConceiveLabel,
    Languages.portuguese: ptConceiveLabel,
    Languages.russian: ruConceiveLabel,
    Languages.japanese: jaConceiveLabel,
    Languages.german: deConceiveLabel,
    Languages.punjabi: paConceiveLabel,
    Languages.javanese: jvConceiveLabel,
    Languages.wuChinese: wuuConceiveLabel,
    Languages.korean: koConceiveLabel,
    Languages.tamil: taConceiveLabel,
    Languages.turkish: trConceiveLabel,
    Languages.urdu: urConceiveLabel,
    Languages.vietnamese: viConceiveLabel,
    Languages.italian: itConceiveLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getConceiveLabel2() {
  final logsByLanguage = {
    Languages.english: enConceiveLabel2,
    Languages.hindi: hiConceiveLabel2,
    Languages.arabic: arConceiveLabel2,
    Languages.spanish: esConceiveLabel2,
    Languages.mandarin: zhConceiveLabel2,
    Languages.french: frConceiveLabel2,
    Languages.bengali: bnConceiveLabel2,
    Languages.portuguese: ptConceiveLabel2,
    Languages.russian: ruConceiveLabel2,
    Languages.japanese: jaConceiveLabel2,
    Languages.german: deConceiveLabel2,
    Languages.punjabi: paConceiveLabel2,
    Languages.javanese: jvConceiveLabel2,
    Languages.wuChinese: wuuConceiveLabel2,
    Languages.korean: koConceiveLabel2,
    Languages.tamil: taConceiveLabel2,
    Languages.turkish: trConceiveLabel2,
    Languages.urdu: urConceiveLabel2,
    Languages.vietnamese: viConceiveLabel2,
    Languages.italian: itConceiveLabel2,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPeriodPhaseLabel() {
  final logsByLanguage = {
    Languages.english: enPeriodPhaseLabel,
    Languages.hindi: hiPeriodPhaseLabel,
    Languages.arabic: arPeriodPhaseLabel,
    Languages.spanish: esPeriodPhaseLabel,
    Languages.mandarin: zhPeriodPhaseLabel,
    Languages.french: frPeriodPhaseLabel,
    Languages.bengali: bnPeriodPhaseLabel,
    Languages.portuguese: ptPeriodPhaseLabel,
    Languages.russian: ruPeriodPhaseLabel,
    Languages.japanese: jaPeriodPhaseLabel,
    Languages.german: dePeriodPhaseLabel,
    Languages.punjabi: paPeriodPhaseLabel,
    Languages.javanese: jvPeriodPhaseLabel,
    Languages.wuChinese: wuuPeriodPhaseLabel,
    Languages.korean: koPeriodPhaseLabel,
    Languages.tamil: taPeriodPhaseLabel,
    Languages.turkish: trPeriodPhaseLabel,
    Languages.urdu: urPeriodPhaseLabel,
    Languages.vietnamese: viPeriodPhaseLabel,
    Languages.italian: itPeriodPhaseLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPhaseDayLabel() {
  final logsByLanguage = {
    Languages.english: enPhaseDayLabel,
    Languages.hindi: hiPhaseDayLabel,
    Languages.arabic: arPhaseDayLabel,
    Languages.spanish: esPhaseDayLabel,
    Languages.mandarin: zhPhaseDayLabel,
    Languages.french: frPhaseDayLabel,
    Languages.bengali: bnPhaseDayLabel,
    Languages.portuguese: ptPhaseDayLabel,
    Languages.russian: ruPhaseDayLabel,
    Languages.japanese: jaPhaseDayLabel,
    Languages.german: dePhaseDayLabel,
    Languages.punjabi: paPhaseDayLabel,
    Languages.javanese: jvPhaseDayLabel,
    Languages.wuChinese: wuuPhaseDayLabel,
    Languages.korean: koPhaseDayLabel,
    Languages.tamil: taPhaseDayLabel,
    Languages.turkish: trPhaseDayLabel,
    Languages.urdu: urPhaseDayLabel,
    Languages.vietnamese: viPhaseDayLabel,
    Languages.italian: itPhaseDayLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPhaseDaysLabel() {
  final logsByLanguage = {
    Languages.english: enPhaseDaysLabel,
    Languages.hindi: hiPhaseDaysLabel,
    Languages.arabic: arPhaseDaysLabel,
    Languages.spanish: esPhaseDaysLabel,
    Languages.mandarin: zhPhaseDaysLabel,
    Languages.french: frPhaseDaysLabel,
    Languages.bengali: bnPhaseDaysLabel,
    Languages.portuguese: ptPhaseDaysLabel,
    Languages.russian: ruPhaseDaysLabel,
    Languages.japanese: jaPhaseDaysLabel,
    Languages.german: dePhaseDaysLabel,
    Languages.punjabi: paPhaseDaysLabel,
    Languages.javanese: jvPhaseDaysLabel,
    Languages.wuChinese: wuuPhaseDaysLabel,
    Languages.korean: koPhaseDaysLabel,
    Languages.tamil: taPhaseDaysLabel,
    Languages.turkish: trPhaseDaysLabel,
    Languages.urdu: urPhaseDaysLabel,
    Languages.vietnamese: viPhaseDaysLabel,
    Languages.italian: itPhaseDaysLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPregnancyChanceMsg1() {
  final logsByLanguage = {
    Languages.english: enPregnancyChanceMsg1,
    Languages.hindi: hiPregnancyChanceMsg1,
    Languages.arabic: arPregnancyChanceMsg1,
    Languages.spanish: esPregnancyChanceMsg1,
    Languages.mandarin: zhPregnancyChanceMsg1,
    Languages.french: frPregnancyChanceMsg1,
    Languages.bengali: bnPregnancyChanceMsg1,
    Languages.portuguese: ptPregnancyChanceMsg1,
    Languages.russian: ruPregnancyChanceMsg1,
    Languages.japanese: jaPregnancyChanceMsg1,
    Languages.german: dePregnancyChanceMsg1,
    Languages.punjabi: paPregnancyChanceMsg1,
    Languages.javanese: jvPregnancyChanceMsg1,
    Languages.wuChinese: wuuPregnancyChanceMsg1,
    Languages.korean: koPregnancyChanceMsg1,
    Languages.tamil: taPregnancyChanceMsg1,
    Languages.turkish: trPregnancyChanceMsg1,
    Languages.urdu: urPregnancyChanceMsg1,
    Languages.vietnamese: viPregnancyChanceMsg1,
    Languages.italian: itPregnancyChanceMsg1,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPregnancyChanceMsg2() {
  final logsByLanguage = {
    Languages.english: enPregnancyChanceMsg2,
    Languages.hindi: hiPregnancyChanceMsg2,
    Languages.arabic: arPregnancyChanceMsg2,
    Languages.spanish: esPregnancyChanceMsg2,
    Languages.mandarin: zhPregnancyChanceMsg2,
    Languages.french: frPregnancyChanceMsg2,
    Languages.bengali: bnPregnancyChanceMsg2,
    Languages.portuguese: ptPregnancyChanceMsg2,
    Languages.russian: ruPregnancyChanceMsg2,
    Languages.japanese: jaPregnancyChanceMsg2,
    Languages.german: dePregnancyChanceMsg2,
    Languages.punjabi: paPregnancyChanceMsg2,
    Languages.javanese: jvPregnancyChanceMsg2,
    Languages.wuChinese: wuuPregnancyChanceMsg2,
    Languages.korean: koPregnancyChanceMsg2,
    Languages.tamil: taPregnancyChanceMsg2,
    Languages.turkish: trPregnancyChanceMsg2,
    Languages.urdu: urPregnancyChanceMsg2,
    Languages.vietnamese: viPregnancyChanceMsg2,
    Languages.italian: itPregnancyChanceMsg2,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPregnancyChanceMsg3() {
  final logsByLanguage = {
    Languages.english: enPregnancyChanceMsg3,
    Languages.hindi: hiPregnancyChanceMsg3,
    Languages.arabic: arPregnancyChanceMsg3,
    Languages.spanish: esPregnancyChanceMsg3,
    Languages.mandarin: zhPregnancyChanceMsg3,
    Languages.french: frPregnancyChanceMsg3,
    Languages.bengali: bnPregnancyChanceMsg3,
    Languages.portuguese: ptPregnancyChanceMsg3,
    Languages.russian: ruPregnancyChanceMsg3,
    Languages.japanese: jaPregnancyChanceMsg3,
    Languages.german: dePregnancyChanceMsg3,
    Languages.punjabi: paPregnancyChanceMsg3,
    Languages.javanese: jvPregnancyChanceMsg3,
    Languages.wuChinese: wuuPregnancyChanceMsg3,
    Languages.korean: koPregnancyChanceMsg3,
    Languages.tamil: taPregnancyChanceMsg3,
    Languages.turkish: trPregnancyChanceMsg3,
    Languages.urdu: urPregnancyChanceMsg3,
    Languages.vietnamese: viPregnancyChanceMsg3,
    Languages.italian: itPregnancyChanceMsg3,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPregnancyChanceMsg4() {
  final logsByLanguage = {
    Languages.english: enPregnancyChanceMsg4,
    Languages.hindi: hiPregnancyChanceMsg4,
    Languages.arabic: arPregnancyChanceMsg4,
    Languages.spanish: esPregnancyChanceMsg4,
    Languages.mandarin: zhPregnancyChanceMsg4,
    Languages.french: frPregnancyChanceMsg4,
    Languages.bengali: bnPregnancyChanceMsg4,
    Languages.portuguese: ptPregnancyChanceMsg4,
    Languages.russian: ruPregnancyChanceMsg4,
    Languages.japanese: jaPregnancyChanceMsg4,
    Languages.german: dePregnancyChanceMsg4,
    Languages.punjabi: paPregnancyChanceMsg4,
    Languages.javanese: jvPregnancyChanceMsg4,
    Languages.wuChinese: wuuPregnancyChanceMsg4,
    Languages.korean: koPregnancyChanceMsg4,
    Languages.tamil: taPregnancyChanceMsg4,
    Languages.turkish: trPregnancyChanceMsg4,
    Languages.urdu: urPregnancyChanceMsg4,
    Languages.vietnamese: viPregnancyChanceMsg4,
    Languages.italian: itPregnancyChanceMsg4,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getOvulationDayMsg1() {
  final logsByLanguage = {
    Languages.english: enOvulationDayMsg1,
    Languages.hindi: hiOvulationDayMsg1,
    Languages.arabic: arOvulationDayMsg1,
    Languages.spanish: esOvulationDayMsg1,
    Languages.mandarin: zhOvulationDayMsg1,
    Languages.french: frOvulationDayMsg1,
    Languages.bengali: bnOvulationDayMsg1,
    Languages.portuguese: ptOvulationDayMsg1,
    Languages.russian: ruOvulationDayMsg1,
    Languages.japanese: jaOvulationDayMsg1,
    Languages.german: deOvulationDayMsg1,
    Languages.punjabi: paOvulationDayMsg1,
    Languages.javanese: jvOvulationDayMsg1,
    Languages.wuChinese: wuuOvulationDayMsg1,
    Languages.korean: koOvulationDayMsg1,
    Languages.tamil: taOvulationDayMsg1,
    Languages.turkish: trOvulationDayMsg1,
    Languages.urdu: urOvulationDayMsg1,
    Languages.vietnamese: viOvulationDayMsg1,
    Languages.italian: itOvulationDayMsg1,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getOvulationDayTitle() {
  final logsByLanguage = {
    Languages.english: enOvulationDayTitle,
    Languages.hindi: hiOvulationDayTitle,
    Languages.arabic: arOvulationDayTitle,
    Languages.spanish: esOvulationDayTitle,
    Languages.mandarin: zhOvulationDayTitle,
    Languages.french: frOvulationDayTitle,
    Languages.bengali: bnOvulationDayTitle,
    Languages.portuguese: ptOvulationDayTitle,
    Languages.russian: ruOvulationDayTitle,
    Languages.japanese: jaOvulationDayTitle,
    Languages.german: deOvulationDayTitle,
    Languages.punjabi: paOvulationDayTitle,
    Languages.javanese: jvOvulationDayTitle,
    Languages.wuChinese: wuuOvulationDayTitle,
    Languages.korean: koOvulationDayTitle,
    Languages.tamil: taOvulationDayTitle,
    Languages.turkish: trOvulationDayTitle,
    Languages.urdu: urOvulationDayTitle,
    Languages.vietnamese: viOvulationDayTitle,
    Languages.italian: itOvulationDayTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPredictPeriodDayStartLabel() {
  final logsByLanguage = {
    Languages.english: enPredictPeriodDayStartLabel,
    Languages.hindi: hiPredictPeriodDayStartLabel,
    Languages.arabic: arPredictPeriodDayStartLabel,
    Languages.spanish: esPredictPeriodDayStartLabel,
    Languages.mandarin: zhPredictPeriodDayStartLabel,
    Languages.french: frPredictPeriodDayStartLabel,
    Languages.bengali: bnPredictPeriodDayStartLabel,
    Languages.portuguese: ptPredictPeriodDayStartLabel,
    Languages.russian: ruPredictPeriodDayStartLabel,
    Languages.japanese: jaPredictPeriodDayStartLabel,
    Languages.german: dePredictPeriodDayStartLabel,
    Languages.punjabi: paPredictPeriodDayStartLabel,
    Languages.javanese: jvPredictPeriodDayStartLabel,
    Languages.wuChinese: wuuPredictPeriodDayStartLabel,
    Languages.korean: koPredictPeriodDayStartLabel,
    Languages.tamil: taPredictPeriodDayStartLabel,
    Languages.turkish: trPredictPeriodDayStartLabel,
    Languages.urdu: urPredictPeriodDayStartLabel,
    Languages.vietnamese: viPredictPeriodDayStartLabel,
    Languages.italian: itPredictPeriodDayStartLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPredictPeriodDayStartLabel2() {
  final logsByLanguage = {
    Languages.english: enPredictPeriodDayStartLabel2,
    Languages.hindi: hiPredictPeriodDayStartLabel2,
    Languages.arabic: arPredictPeriodDayStartLabel2,
    Languages.spanish: esPredictPeriodDayStartLabel2,
    Languages.mandarin: zhPredictPeriodDayStartLabel2,
    Languages.french: frPredictPeriodDayStartLabel2,
    Languages.bengali: bnPredictPeriodDayStartLabel2,
    Languages.portuguese: ptPredictPeriodDayStartLabel2,
    Languages.russian: ruPredictPeriodDayStartLabel2,
    Languages.japanese: jaPredictPeriodDayStartLabel2,
    Languages.german: dePredictPeriodDayStartLabel2,
    Languages.punjabi: paPredictPeriodDayStartLabel2,
    Languages.javanese: jvPredictPeriodDayStartLabel2,
    Languages.wuChinese: wuuPredictPeriodDayStartLabel2,
    Languages.korean: koPredictPeriodDayStartLabel2,
    Languages.tamil: taPredictPeriodDayStartLabel2,
    Languages.turkish: trPredictPeriodDayStartLabel2,
    Languages.urdu: urPredictPeriodDayStartLabel2,
    Languages.vietnamese: viPredictPeriodDayStartLabel2,
    Languages.italian: itPredictPeriodDayStartLabel2,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPredictPeriodDayStartLabel1() {
  final logsByLanguage = {
    Languages.english: enPredictPeriodDayStartLabel1,
    Languages.hindi: hiPredictPeriodDayStartLabel1,
    Languages.arabic: arPredictPeriodDayStartLabel1,
    Languages.spanish: esPredictPeriodDayStartLabel1,
    Languages.mandarin: zhPredictPeriodDayStartLabel1,
    Languages.french: frPredictPeriodDayStartLabel1,
    Languages.bengali: bnPredictPeriodDayStartLabel1,
    Languages.portuguese: ptPredictPeriodDayStartLabel1,
    Languages.russian: ruPredictPeriodDayStartLabel1,
    Languages.japanese: jaPredictPeriodDayStartLabel1,
    Languages.german: dePredictPeriodDayStartLabel1,
    Languages.punjabi: paPredictPeriodDayStartLabel1,
    Languages.javanese: jvPredictPeriodDayStartLabel1,
    Languages.wuChinese: wuuPredictPeriodDayStartLabel1,
    Languages.korean: koPredictPeriodDayStartLabel1,
    Languages.tamil: taPredictPeriodDayStartLabel1,
    Languages.turkish: trPredictPeriodDayStartLabel1,
    Languages.urdu: urPredictPeriodDayStartLabel1,
    Languages.vietnamese: viPredictPeriodDayStartLabel1,
    Languages.italian: itPredictPeriodDayStartLabel1,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getErrorInvalidSize() {
  final logsByLanguage = {
    Languages.english: enErrorInvalidSize,
    Languages.hindi: hiErrorInvalidSize,
    Languages.arabic: arErrorInvalidSize,
    Languages.spanish: esErrorInvalidSize,
    Languages.mandarin: zhErrorInvalidSize,
    Languages.french: frErrorInvalidSize,
    Languages.bengali: bnErrorInvalidSize,
    Languages.portuguese: ptErrorInvalidSize,
    Languages.russian: ruErrorInvalidSize,
    Languages.japanese: jaErrorInvalidSize,
    Languages.german: deErrorInvalidSize,
    Languages.punjabi: paErrorInvalidSize,
    Languages.javanese: jvErrorInvalidSize,
    Languages.wuChinese: wuuErrorInvalidSize,
    Languages.korean: koErrorInvalidSize,
    Languages.tamil: taErrorInvalidSize,
    Languages.turkish: trErrorInvalidSize,
    Languages.urdu: urErrorInvalidSize,
    Languages.vietnamese: viErrorInvalidSize,
    Languages.italian: itErrorInvalidSize,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getErrorInvalidCount() {
  final logsByLanguage = {
    Languages.english: enErrorInvalidCount,
    Languages.hindi: hiErrorInvalidCount,
    Languages.arabic: arErrorInvalidCount,
    Languages.spanish: esErrorInvalidCount,
    Languages.mandarin: zhErrorInvalidCount,
    Languages.french: frErrorInvalidCount,
    Languages.bengali: bnErrorInvalidCount,
    Languages.portuguese: ptErrorInvalidCount,
    Languages.russian: ruErrorInvalidCount,
    Languages.japanese: jaErrorInvalidCount,
    Languages.german: deErrorInvalidCount,
    Languages.punjabi: paErrorInvalidCount,
    Languages.javanese: jvErrorInvalidCount,
    Languages.wuChinese: wuuErrorInvalidCount,
    Languages.korean: koErrorInvalidCount,
    Languages.tamil: taErrorInvalidCount,
    Languages.turkish: trErrorInvalidCount,
    Languages.urdu: urErrorInvalidCount,
    Languages.vietnamese: viErrorInvalidCount,
    Languages.italian: itErrorInvalidCount,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getErrorInvalidMenstruationDayCount() {
  final logsByLanguage = {
    Languages.english: enErrorInvalidMenstruationDayCount,
    Languages.hindi: hiErrorInvalidMenstruationDayCount,
    Languages.arabic: arErrorInvalidMenstruationDayCount,
    Languages.spanish: esErrorInvalidMenstruationDayCount,
    Languages.mandarin: zhErrorInvalidMenstruationDayCount,
    Languages.french: frErrorInvalidMenstruationDayCount,
    Languages.bengali: bnErrorInvalidMenstruationDayCount,
    Languages.portuguese: ptErrorInvalidMenstruationDayCount,
    Languages.russian: ruErrorInvalidMenstruationDayCount,
    Languages.japanese: jaErrorInvalidMenstruationDayCount,
    Languages.german: deErrorInvalidMenstruationDayCount,
    Languages.punjabi: paErrorInvalidMenstruationDayCount,
    Languages.javanese: jvErrorInvalidMenstruationDayCount,
    Languages.wuChinese: wuuErrorInvalidMenstruationDayCount,
    Languages.korean: koErrorInvalidMenstruationDayCount,
    Languages.tamil: taErrorInvalidMenstruationDayCount,
    Languages.turkish: trErrorInvalidMenstruationDayCount,
    Languages.urdu: urErrorInvalidMenstruationDayCount,
    Languages.vietnamese: viErrorInvalidMenstruationDayCount,
    Languages.italian: itErrorInvalidMenstruationDayCount,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getErrorInvalidFollicularDayCount() {
  final logsByLanguage = {
    Languages.english: enErrorInvalidFollicularDayCount,
    Languages.hindi: hiErrorInvalidFollicularDayCount,
    Languages.arabic: arErrorInvalidFollicularDayCount,
    Languages.spanish: esErrorInvalidFollicularDayCount,
    Languages.mandarin: zhErrorInvalidFollicularDayCount,
    Languages.french: frErrorInvalidFollicularDayCount,
    Languages.bengali: bnErrorInvalidFollicularDayCount,
    Languages.portuguese: ptErrorInvalidFollicularDayCount,
    Languages.russian: ruErrorInvalidFollicularDayCount,
    Languages.japanese: jaErrorInvalidFollicularDayCount,
    Languages.german: deErrorInvalidFollicularDayCount,
    Languages.punjabi: paErrorInvalidFollicularDayCount,
    Languages.javanese: jvErrorInvalidFollicularDayCount,
    Languages.wuChinese: wuuErrorInvalidFollicularDayCount,
    Languages.korean: koErrorInvalidFollicularDayCount,
    Languages.tamil: taErrorInvalidFollicularDayCount,
    Languages.turkish: trErrorInvalidFollicularDayCount,
    Languages.urdu: urErrorInvalidFollicularDayCount,
    Languages.vietnamese: viErrorInvalidFollicularDayCount,
    Languages.italian: itErrorInvalidFollicularDayCount,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getErrorInvalidOvulationDayCount() {
  final logsByLanguage = {
    Languages.english: enErrorInvalidOvulationDayCount,
    Languages.hindi: hiErrorInvalidOvulationDayCount,
    Languages.arabic: arErrorInvalidOvulationDayCount,
    Languages.spanish: esErrorInvalidOvulationDayCount,
    Languages.mandarin: zhErrorInvalidOvulationDayCount,
    Languages.french: frErrorInvalidOvulationDayCount,
    Languages.bengali: bnErrorInvalidOvulationDayCount,
    Languages.portuguese: ptErrorInvalidOvulationDayCount,
    Languages.russian: ruErrorInvalidOvulationDayCount,
    Languages.japanese: jaErrorInvalidOvulationDayCount,
    Languages.german: deErrorInvalidOvulationDayCount,
    Languages.punjabi: paErrorInvalidOvulationDayCount,
    Languages.javanese: jvErrorInvalidOvulationDayCount,
    Languages.wuChinese: wuuErrorInvalidOvulationDayCount,
    Languages.korean: koErrorInvalidOvulationDayCount,
    Languages.tamil: taErrorInvalidOvulationDayCount,
    Languages.turkish: trErrorInvalidOvulationDayCount,
    Languages.urdu: urErrorInvalidOvulationDayCount,
    Languages.vietnamese: viErrorInvalidOvulationDayCount,
    Languages.italian: itErrorInvalidOvulationDayCount,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getErrorInvalidSymptomsLogDate() {
  final logsByLanguage = {
    Languages.english: enErrorInvalidSymptomsLogDate,
    Languages.hindi: hiErrorInvalidSymptomsLogDate,
    Languages.arabic: arErrorInvalidSymptomsLogDate,
    Languages.spanish: esErrorInvalidSymptomsLogDate,
    Languages.mandarin: zhErrorInvalidSymptomsLogDate,
    Languages.french: frErrorInvalidSymptomsLogDate,
    Languages.bengali: bnErrorInvalidSymptomsLogDate,
    Languages.portuguese: ptErrorInvalidSymptomsLogDate,
    Languages.russian: ruErrorInvalidSymptomsLogDate,
    Languages.japanese: jaErrorInvalidSymptomsLogDate,
    Languages.german: deErrorInvalidSymptomsLogDate,
    Languages.punjabi: paErrorInvalidSymptomsLogDate,
    Languages.javanese: jvErrorInvalidSymptomsLogDate,
    Languages.wuChinese: wuuErrorInvalidSymptomsLogDate,
    Languages.korean: koErrorInvalidSymptomsLogDate,
    Languages.tamil: taErrorInvalidSymptomsLogDate,
    Languages.turkish: trErrorInvalidSymptomsLogDate,
    Languages.urdu: urErrorInvalidSymptomsLogDate,
    Languages.vietnamese: viErrorInvalidSymptomsLogDate,
    Languages.italian: itErrorInvalidSymptomsLogDate,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCycleTitle() {
  final logsByLanguage = {
    Languages.english: enGraphCycleTitle,
    Languages.hindi: hiGraphCycleTitle,
    Languages.arabic: arGraphCycleTitle,
    Languages.spanish: esGraphCycleTitle,
    Languages.mandarin: zhGraphCycleTitle,
    Languages.french: frGraphCycleTitle,
    Languages.bengali: bnGraphCycleTitle,
    Languages.portuguese: ptGraphCycleTitle,
    Languages.russian: ruGraphCycleTitle,
    Languages.japanese: jaGraphCycleTitle,
    Languages.german: deGraphCycleTitle,
    Languages.punjabi: paGraphCycleTitle,
    Languages.javanese: jvGraphCycleTitle,
    Languages.wuChinese: wuuGraphCycleTitle,
    Languages.korean: koGraphCycleTitle,
    Languages.tamil: taGraphCycleTitle,
    Languages.turkish: trGraphCycleTitle,
    Languages.urdu: urGraphCycleTitle,
    Languages.vietnamese: viGraphCycleTitle,
    Languages.italian: itGraphCycleTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCycleDaysPeriod() {
  final logsByLanguage = {
    Languages.english: enGraphCycleDaysPeriod,
    Languages.hindi: hiGraphCycleDaysPeriod,
    Languages.arabic: arGraphCycleDaysPeriod,
    Languages.spanish: esGraphCycleDaysPeriod,
    Languages.mandarin: zhGraphCycleDaysPeriod,
    Languages.french: frGraphCycleDaysPeriod,
    Languages.bengali: bnGraphCycleDaysPeriod,
    Languages.portuguese: ptGraphCycleDaysPeriod,
    Languages.russian: ruGraphCycleDaysPeriod,
    Languages.japanese: jaGraphCycleDaysPeriod,
    Languages.german: deGraphCycleDaysPeriod,
    Languages.punjabi: paGraphCycleDaysPeriod,
    Languages.javanese: jvGraphCycleDaysPeriod,
    Languages.wuChinese: wuuGraphCycleDaysPeriod,
    Languages.korean: koGraphCycleDaysPeriod,
    Languages.tamil: taGraphCycleDaysPeriod,
    Languages.turkish: trGraphCycleDaysPeriod,
    Languages.urdu: urGraphCycleDaysPeriod,
    Languages.vietnamese: viGraphCycleDaysPeriod,
    Languages.italian: itGraphCycleDaysPeriod,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCycleDaysCycle() {
  final logsByLanguage = {
    Languages.english: enGraphCycleDaysCycle,
    Languages.hindi: hiGraphCycleDaysCycle,
    Languages.arabic: arGraphCycleDaysCycle,
    Languages.spanish: esGraphCycleDaysCycle,
    Languages.mandarin: zhGraphCycleDaysCycle,
    Languages.french: frGraphCycleDaysCycle,
    Languages.bengali: bnGraphCycleDaysCycle,
    Languages.portuguese: ptGraphCycleDaysCycle,
    Languages.russian: ruGraphCycleDaysCycle,
    Languages.japanese: jaGraphCycleDaysCycle,
    Languages.german: deGraphCycleDaysCycle,
    Languages.punjabi: paGraphCycleDaysCycle,
    Languages.javanese: jvGraphCycleDaysCycle,
    Languages.wuChinese: wuuGraphCycleDaysCycle,
    Languages.korean: koGraphCycleDaysCycle,
    Languages.tamil: taGraphCycleDaysCycle,
    Languages.turkish: trGraphCycleDaysCycle,
    Languages.urdu: urGraphCycleDaysCycle,
    Languages.vietnamese: viGraphCycleDaysCycle,
    Languages.italian: itGraphCycleDaysCycle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCycleNowTitle() {
  final logsByLanguage = {
    Languages.english: enGraphCycleNowTitle,
    Languages.hindi: hiGraphCycleNowTitle,
    Languages.arabic: arGraphCycleNowTitle,
    Languages.spanish: esGraphCycleNowTitle,
    Languages.mandarin: zhGraphCycleNowTitle,
    Languages.french: frGraphCycleNowTitle,
    Languages.bengali: bnGraphCycleNowTitle,
    Languages.portuguese: ptGraphCycleNowTitle,
    Languages.russian: ruGraphCycleNowTitle,
    Languages.japanese: jaGraphCycleNowTitle,
    Languages.german: deGraphCycleNowTitle,
    Languages.punjabi: paGraphCycleNowTitle,
    Languages.javanese: jvGraphCycleNowTitle,
    Languages.wuChinese: wuuGraphCycleNowTitle,
    Languages.korean: koGraphCycleNowTitle,
    Languages.tamil: taGraphCycleNowTitle,
    Languages.turkish: trGraphCycleNowTitle,
    Languages.urdu: urGraphCycleNowTitle,
    Languages.vietnamese: viGraphCycleNowTitle,
    Languages.italian: itGraphCycleNowTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCycleViewAllTitle() {
  final logsByLanguage = {
    Languages.english: enGraphCycleViewAllTitle,
    Languages.hindi: hiGraphCycleViewAllTitle,
    Languages.arabic: arGraphCycleViewAllTitle,
    Languages.spanish: esGraphCycleViewAllTitle,
    Languages.mandarin: zhGraphCycleViewAllTitle,
    Languages.french: frGraphCycleViewAllTitle,
    Languages.bengali: bnGraphCycleViewAllTitle,
    Languages.portuguese: ptGraphCycleViewAllTitle,
    Languages.russian: ruGraphCycleViewAllTitle,
    Languages.japanese: jaGraphCycleViewAllTitle,
    Languages.german: deGraphCycleViewAllTitle,
    Languages.punjabi: paGraphCycleViewAllTitle,
    Languages.javanese: jvGraphCycleViewAllTitle,
    Languages.wuChinese: wuuGraphCycleViewAllTitle,
    Languages.korean: koGraphCycleViewAllTitle,
    Languages.tamil: taGraphCycleViewAllTitle,
    Languages.turkish: trGraphCycleViewAllTitle,
    Languages.urdu: urGraphCycleViewAllTitle,
    Languages.vietnamese: viGraphCycleViewAllTitle,
    Languages.italian: itGraphCycleViewAllTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCycleStartDate() {
  final logsByLanguage = {
    Languages.english: enGraphCycleStartDate,
    Languages.hindi: hiGraphCycleStartDate,
    Languages.arabic: arGraphCycleStartDate,
    Languages.spanish: esGraphCycleStartDate,
    Languages.mandarin: zhGraphCycleStartDate,
    Languages.french: frGraphCycleStartDate,
    Languages.bengali: bnGraphCycleStartDate,
    Languages.portuguese: ptGraphCycleStartDate,
    Languages.russian: ruGraphCycleStartDate,
    Languages.japanese: jaGraphCycleStartDate,
    Languages.german: deGraphCycleStartDate,
    Languages.punjabi: paGraphCycleStartDate,
    Languages.javanese: jvGraphCycleStartDate,
    Languages.wuChinese: wuuGraphCycleStartDate,
    Languages.korean: koGraphCycleStartDate,
    Languages.tamil: taGraphCycleStartDate,
    Languages.turkish: trGraphCycleStartDate,
    Languages.urdu: urGraphCycleStartDate,
    Languages.vietnamese: viGraphCycleStartDate,
    Languages.italian: itGraphCycleStartDate,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLoading() {
  final logsByLanguage = {
    Languages.english: enLoading,
    Languages.hindi: hiLoading,
    Languages.arabic: arLoading,
    Languages.spanish: esLoading,
    Languages.mandarin: zhLoading,
    Languages.french: frLoading,
    Languages.bengali: bnLoading,
    Languages.portuguese: ptLoading,
    Languages.russian: ruLoading,
    Languages.japanese: jaLoading,
    Languages.german: deLoading,
    Languages.punjabi: paLoading,
    Languages.javanese: jvLoading,
    Languages.wuChinese: wuuLoading,
    Languages.korean: koLoading,
    Languages.tamil: taLoading,
    Languages.turkish: trLoading,
    Languages.urdu: urLoading,
    Languages.vietnamese: viLoading,
    Languages.italian: itLoading,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCycleTrends() {
  final logsByLanguage = {
    Languages.english: enGraphCycleTrends,
    Languages.hindi: hiGraphCycleTrends,
    Languages.arabic: arGraphCycleTrends,
    Languages.spanish: esGraphCycleTrends,
    Languages.mandarin: zhGraphCycleTrends,
    Languages.french: frGraphCycleTrends,
    Languages.bengali: bnGraphCycleTrends,
    Languages.portuguese: ptGraphCycleTrends,
    Languages.russian: ruGraphCycleTrends,
    Languages.japanese: jaGraphCycleTrends,
    Languages.german: deGraphCycleTrends,
    Languages.punjabi: paGraphCycleTrends,
    Languages.javanese: jvGraphCycleTrends,
    Languages.wuChinese: wuuGraphCycleTrends,
    Languages.korean: koGraphCycleTrends,
    Languages.tamil: taGraphCycleTrends,
    Languages.turkish: trGraphCycleTrends,
    Languages.urdu: urGraphCycleTrends,
    Languages.vietnamese: viGraphCycleTrends,
    Languages.italian: itGraphCycleTrends,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCycleLengthDays() {
  final logsByLanguage = {
    Languages.english: enGraphCycleLengthDays,
    Languages.hindi: hiGraphCycleLengthDays,
    Languages.arabic: arGraphCycleLengthDays,
    Languages.spanish: esGraphCycleLengthDays,
    Languages.mandarin: zhGraphCycleLengthDays,
    Languages.french: frGraphCycleLengthDays,
    Languages.bengali: bnGraphCycleLengthDays,
    Languages.portuguese: ptGraphCycleLengthDays,
    Languages.russian: ruGraphCycleLengthDays,
    Languages.japanese: jaGraphCycleLengthDays,
    Languages.german: deGraphCycleLengthDays,
    Languages.punjabi: paGraphCycleLengthDays,
    Languages.javanese: jvGraphCycleLengthDays,
    Languages.wuChinese: wuuGraphCycleLengthDays,
    Languages.korean: koGraphCycleLengthDays,
    Languages.tamil: taGraphCycleLengthDays,
    Languages.turkish: trGraphCycleLengthDays,
    Languages.urdu: urGraphCycleLengthDays,
    Languages.vietnamese: viGraphCycleLengthDays,
    Languages.italian: itGraphCycleLengthDays,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCycleNormalDays() {
  final logsByLanguage = {
    Languages.english: enGraphCycleNormalDays,
    Languages.hindi: hiGraphCycleNormalDays,
    Languages.arabic: arGraphCycleNormalDays,
    Languages.spanish: esGraphCycleNormalDays,
    Languages.mandarin: zhGraphCycleNormalDays,
    Languages.french: frGraphCycleNormalDays,
    Languages.bengali: bnGraphCycleNormalDays,
    Languages.portuguese: ptGraphCycleNormalDays,
    Languages.russian: ruGraphCycleNormalDays,
    Languages.japanese: jaGraphCycleNormalDays,
    Languages.german: deGraphCycleNormalDays,
    Languages.punjabi: paGraphCycleNormalDays,
    Languages.javanese: jvGraphCycleNormalDays,
    Languages.wuChinese: wuuGraphCycleNormalDays,
    Languages.korean: koGraphCycleNormalDays,
    Languages.tamil: taGraphCycleNormalDays,
    Languages.turkish: trGraphCycleNormalDays,
    Languages.urdu: urGraphCycleNormalDays,
    Languages.vietnamese: viGraphCycleNormalDays,
    Languages.italian: itGraphCycleNormalDays,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCyclePeriodDay() {
  final logsByLanguage = {
    Languages.english: enGraphCyclePeriodDay,
    Languages.hindi: hiGraphCyclePeriodDay,
    Languages.arabic: arGraphCyclePeriodDay,
    Languages.spanish: esGraphCyclePeriodDay,
    Languages.mandarin: zhGraphCyclePeriodDay,
    Languages.french: frGraphCyclePeriodDay,
    Languages.bengali: bnGraphCyclePeriodDay,
    Languages.portuguese: ptGraphCyclePeriodDay,
    Languages.russian: ruGraphCyclePeriodDay,
    Languages.japanese: jaGraphCyclePeriodDay,
    Languages.german: deGraphCyclePeriodDay,
    Languages.punjabi: paGraphCyclePeriodDay,
    Languages.javanese: jvGraphCyclePeriodDay,
    Languages.wuChinese: wuuGraphCyclePeriodDay,
    Languages.korean: koGraphCyclePeriodDay,
    Languages.tamil: taGraphCyclePeriodDay,
    Languages.turkish: trGraphCyclePeriodDay,
    Languages.urdu: urGraphCyclePeriodDay,
    Languages.vietnamese: viGraphCyclePeriodDay,
    Languages.italian: itGraphCyclePeriodDay,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCycleOtherDay() {
  final logsByLanguage = {
    Languages.english: enGraphCycleOtherDay,
    Languages.hindi: hiGraphCycleOtherDay,
    Languages.arabic: arGraphCycleOtherDay,
    Languages.spanish: esGraphCycleOtherDay,
    Languages.mandarin: zhGraphCycleOtherDay,
    Languages.french: frGraphCycleOtherDay,
    Languages.bengali: bnGraphCycleOtherDay,
    Languages.portuguese: ptGraphCycleOtherDay,
    Languages.russian: ruGraphCycleOtherDay,
    Languages.japanese: jaGraphCycleOtherDay,
    Languages.german: deGraphCycleOtherDay,
    Languages.punjabi: paGraphCycleOtherDay,
    Languages.javanese: jvGraphCycleOtherDay,
    Languages.wuChinese: wuuGraphCycleOtherDay,
    Languages.korean: koGraphCycleOtherDay,
    Languages.tamil: taGraphCycleOtherDay,
    Languages.turkish: trGraphCycleOtherDay,
    Languages.urdu: urGraphCycleOtherDay,
    Languages.vietnamese: viGraphCycleOtherDay,
    Languages.italian: itGraphCycleOtherDay,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getOptionsDownloadImage() {
  final logsByLanguage = {
    Languages.english: enOptionsDownloadImage,
    Languages.hindi: hiOptionsDownloadImage,
    Languages.arabic: arOptionsDownloadImage,
    Languages.spanish: esOptionsDownloadImage,
    Languages.mandarin: zhOptionsDownloadImage,
    Languages.french: frOptionsDownloadImage,
    Languages.bengali: bnOptionsDownloadImage,
    Languages.portuguese: ptOptionsDownloadImage,
    Languages.russian: ruOptionsDownloadImage,
    Languages.japanese: jaOptionsDownloadImage,
    Languages.german: deOptionsDownloadImage,
    Languages.punjabi: paOptionsDownloadImage,
    Languages.javanese: jvOptionsDownloadImage,
    Languages.wuChinese: wuuOptionsDownloadImage,
    Languages.korean: koOptionsDownloadImage,
    Languages.tamil: taOptionsDownloadImage,
    Languages.turkish: trOptionsDownloadImage,
    Languages.urdu: urOptionsDownloadImage,
    Languages.vietnamese: viOptionsDownloadImage,
    Languages.italian: itOptionsDownloadImage,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getOptionsDownloadPDF() {
  final logsByLanguage = {
    Languages.english: enOptionsDownloadPDF,
    Languages.hindi: hiOptionsDownloadPDF,
    Languages.arabic: arOptionsDownloadPDF,
    Languages.spanish: esOptionsDownloadPDF,
    Languages.mandarin: zhOptionsDownloadPDF,
    Languages.french: frOptionsDownloadPDF,
    Languages.bengali: bnOptionsDownloadPDF,
    Languages.portuguese: ptOptionsDownloadPDF,
    Languages.russian: ruOptionsDownloadPDF,
    Languages.japanese: jaOptionsDownloadPDF,
    Languages.german: deOptionsDownloadPDF,
    Languages.punjabi: paOptionsDownloadPDF,
    Languages.javanese: jvOptionsDownloadPDF,
    Languages.wuChinese: wuuOptionsDownloadPDF,
    Languages.korean: koOptionsDownloadPDF,
    Languages.tamil: taOptionsDownloadPDF,
    Languages.turkish: trOptionsDownloadPDF,
    Languages.urdu: urOptionsDownloadPDF,
    Languages.vietnamese: viOptionsDownloadPDF,
    Languages.italian: itOptionsDownloadPDF,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getOptionsViewLandscape() {
  final logsByLanguage = {
    Languages.english: enOptionsViewLandscape,
    Languages.hindi: hiOptionsViewLandscape,
    Languages.arabic: arOptionsViewLandscape,
    Languages.spanish: esOptionsViewLandscape,
    Languages.mandarin: zhOptionsViewLandscape,
    Languages.french: frOptionsViewLandscape,
    Languages.bengali: bnOptionsViewLandscape,
    Languages.portuguese: ptOptionsViewLandscape,
    Languages.russian: ruOptionsViewLandscape,
    Languages.japanese: jaOptionsViewLandscape,
    Languages.german: deOptionsViewLandscape,
    Languages.punjabi: paOptionsViewLandscape,
    Languages.javanese: jvOptionsViewLandscape,
    Languages.wuChinese: wuuOptionsViewLandscape,
    Languages.korean: koOptionsViewLandscape,
    Languages.tamil: taOptionsViewLandscape,
    Languages.turkish: trOptionsViewLandscape,
    Languages.urdu: urOptionsViewLandscape,
    Languages.vietnamese: viOptionsViewLandscape,
    Languages.italian: itOptionsViewLandscape,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCurrentCycle() {
  final logsByLanguage = {
    Languages.english: enCurrentCycle,
    Languages.hindi: hiCurrentCycle,
    Languages.arabic: arCurrentCycle,
    Languages.spanish: esCurrentCycle,
    Languages.mandarin: zhCurrentCycle,
    Languages.french: frCurrentCycle,
    Languages.bengali: bnCurrentCycle,
    Languages.portuguese: ptCurrentCycle,
    Languages.russian: ruCurrentCycle,
    Languages.japanese: jaCurrentCycle,
    Languages.german: deCurrentCycle,
    Languages.punjabi: paCurrentCycle,
    Languages.javanese: jvCurrentCycle,
    Languages.wuChinese: wuuCurrentCycle,
    Languages.korean: koCurrentCycle,
    Languages.tamil: taCurrentCycle,
    Languages.turkish: trCurrentCycle,
    Languages.urdu: urCurrentCycle,
    Languages.vietnamese: viCurrentCycle,
    Languages.italian: itCurrentCycle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getToolTip() {
  final logsByLanguage = {
    Languages.english: enToolTip,
    Languages.hindi: hiToolTip,
    Languages.arabic: arToolTip,
    Languages.spanish: esToolTip,
    Languages.mandarin: zhToolTip,
    Languages.french: frToolTip,
    Languages.bengali: bnToolTip,
    Languages.portuguese: ptToolTip,
    Languages.russian: ruToolTip,
    Languages.japanese: jaToolTip,
    Languages.german: deToolTip,
    Languages.punjabi: paToolTip,
    Languages.javanese: jvToolTip,
    Languages.wuChinese: wuuToolTip,
    Languages.korean: koToolTip,
    Languages.tamil: taToolTip,
    Languages.turkish: trToolTip,
    Languages.urdu: urToolTip,
    Languages.vietnamese: viToolTip,
    Languages.italian: itToolTip,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getNoDataFound() {
  final logsByLanguage = {
    Languages.english: enNoDataFound,
    Languages.hindi: hiNoDataFound,
    Languages.arabic: arNoDataFound,
    Languages.spanish: esNoDataFound,
    Languages.mandarin: zhNoDataFound,
    Languages.french: frNoDataFound,
    Languages.bengali: bnNoDataFound,
    Languages.portuguese: ptNoDataFound,
    Languages.russian: ruNoDataFound,
    Languages.japanese: jaNoDataFound,
    Languages.german: deNoDataFound,
    Languages.punjabi: paNoDataFound,
    Languages.javanese: jvNoDataFound,
    Languages.wuChinese: wuuNoDataFound,
    Languages.korean: koNoDataFound,
    Languages.tamil: taNoDataFound,
    Languages.turkish: trNoDataFound,
    Languages.urdu: urNoDataFound,
    Languages.vietnamese: viNoDataFound,
    Languages.italian: itNoDataFound,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphBodyTempDate() {
  final logsByLanguage = {
    Languages.english: enGraphBodyTempDate,
    Languages.hindi: hiGraphBodyTempDate,
    Languages.arabic: arGraphBodyTempDate,
    Languages.spanish: esGraphBodyTempDate,
    Languages.mandarin: zhGraphBodyTempDate,
    Languages.french: frGraphBodyTempDate,
    Languages.bengali: bnGraphBodyTempDate,
    Languages.portuguese: ptGraphBodyTempDate,
    Languages.russian: ruGraphBodyTempDate,
    Languages.japanese: jaGraphBodyTempDate,
    Languages.german: deGraphBodyTempDate,
    Languages.punjabi: paGraphBodyTempDate,
    Languages.javanese: jvGraphBodyTempDate,
    Languages.wuChinese: wuuGraphBodyTempDate,
    Languages.korean: koGraphBodyTempDate,
    Languages.tamil: taGraphBodyTempDate,
    Languages.turkish: trGraphBodyTempDate,
    Languages.urdu: urGraphBodyTempDate,
    Languages.vietnamese: viGraphBodyTempDate,
    Languages.italian: itGraphBodyTempDate,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphBodyTempTitle() {
  final logsByLanguage = {
    Languages.english: enGraphBodyTempTitle,
    Languages.hindi: hiGraphBodyTempTitle,
    Languages.arabic: arGraphBodyTempTitle,
    Languages.spanish: esGraphBodyTempTitle,
    Languages.mandarin: zhGraphBodyTempTitle,
    Languages.french: frGraphBodyTempTitle,
    Languages.bengali: bnGraphBodyTempTitle,
    Languages.portuguese: ptGraphBodyTempTitle,
    Languages.russian: ruGraphBodyTempTitle,
    Languages.japanese: jaGraphBodyTempTitle,
    Languages.german: deGraphBodyTempTitle,
    Languages.punjabi: paGraphBodyTempTitle,
    Languages.javanese: jvGraphBodyTempTitle,
    Languages.wuChinese: wuuGraphBodyTempTitle,
    Languages.korean: koGraphBodyTempTitle,
    Languages.tamil: taGraphBodyTempTitle,
    Languages.turkish: trGraphBodyTempTitle,
    Languages.urdu: urGraphBodyTempTitle,
    Languages.vietnamese: viGraphBodyTempTitle,
    Languages.italian: itGraphBodyTempTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWaterDrinkDate() {
  final logsByLanguage = {
    Languages.english: enGraphWaterDrinkDate,
    Languages.hindi: hiGraphWaterDrinkDate,
    Languages.arabic: arGraphWaterDrinkDate,
    Languages.spanish: esGraphWaterDrinkDate,
    Languages.mandarin: zhGraphWaterDrinkDate,
    Languages.french: frGraphWaterDrinkDate,
    Languages.bengali: bnGraphWaterDrinkDate,
    Languages.portuguese: ptGraphWaterDrinkDate,
    Languages.russian: ruGraphWaterDrinkDate,
    Languages.japanese: jaGraphWaterDrinkDate,
    Languages.german: deGraphWaterDrinkDate,
    Languages.punjabi: paGraphWaterDrinkDate,
    Languages.javanese: jvGraphWaterDrinkDate,
    Languages.wuChinese: wuuGraphWaterDrinkDate,
    Languages.korean: koGraphWaterDrinkDate,
    Languages.tamil: taGraphWaterDrinkDate,
    Languages.turkish: trGraphWaterDrinkDate,
    Languages.urdu: urGraphWaterDrinkDate,
    Languages.vietnamese: viGraphWaterDrinkDate,
    Languages.italian: itGraphWaterDrinkDate,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWaterUnitTitle() {
  final logsByLanguage = {
    Languages.english: enGraphWaterUnitTitle,
    Languages.hindi: hiGraphWaterUnitTitle,
    Languages.arabic: arGraphWaterUnitTitle,
    Languages.spanish: esGraphWaterUnitTitle,
    Languages.mandarin: zhGraphWaterUnitTitle,
    Languages.french: frGraphWaterUnitTitle,
    Languages.bengali: bnGraphWaterUnitTitle,
    Languages.portuguese: ptGraphWaterUnitTitle,
    Languages.russian: ruGraphWaterUnitTitle,
    Languages.japanese: jaGraphWaterUnitTitle,
    Languages.german: deGraphWaterUnitTitle,
    Languages.punjabi: paGraphWaterUnitTitle,
    Languages.javanese: jvGraphWaterUnitTitle,
    Languages.wuChinese: wuuGraphWaterUnitTitle,
    Languages.korean: koGraphWaterUnitTitle,
    Languages.tamil: taGraphWaterUnitTitle,
    Languages.turkish: trGraphWaterUnitTitle,
    Languages.urdu: urGraphWaterUnitTitle,
    Languages.vietnamese: viGraphWaterUnitTitle,
    Languages.italian: itGraphWaterUnitTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWaterUnitLiter() {
  final logsByLanguage = {
    Languages.english: enGraphWaterUnitLiter,
    Languages.hindi: hiGraphWaterUnitLiter,
    Languages.arabic: arGraphWaterUnitLiter,
    Languages.spanish: esGraphWaterUnitLiter,
    Languages.mandarin: zhGraphWaterUnitLiter,
    Languages.french: frGraphWaterUnitLiter,
    Languages.bengali: bnGraphWaterUnitLiter,
    Languages.portuguese: ptGraphWaterUnitLiter,
    Languages.russian: ruGraphWaterUnitLiter,
    Languages.japanese: jaGraphWaterUnitLiter,
    Languages.german: deGraphWaterUnitLiter,
    Languages.punjabi: paGraphWaterUnitLiter,
    Languages.javanese: jvGraphWaterUnitLiter,
    Languages.wuChinese: wuuGraphWaterUnitLiter,
    Languages.korean: koGraphWaterUnitLiter,
    Languages.tamil: taGraphWaterUnitLiter,
    Languages.turkish: trGraphWaterUnitLiter,
    Languages.urdu: urGraphWaterUnitLiter,
    Languages.vietnamese: viGraphWaterUnitLiter,
    Languages.italian: itGraphWaterUnitLiter,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getBodyTempC() {
  final logsByLanguage = {
    Languages.english: enBodyTempC,
    Languages.hindi: hiBodyTempC,
    Languages.arabic: arBodyTempC,
    Languages.spanish: esBodyTempC,
    Languages.mandarin: zhBodyTempC,
    Languages.french: frBodyTempC,
    Languages.bengali: bnBodyTempC,
    Languages.portuguese: ptBodyTempC,
    Languages.russian: ruBodyTempC,
    Languages.japanese: jaBodyTempC,
    Languages.german: deBodyTempC,
    Languages.punjabi: paBodyTempC,
    Languages.javanese: jvBodyTempC,
    Languages.wuChinese: wuuBodyTempC,
    Languages.korean: koBodyTempC,
    Languages.tamil: taBodyTempC,
    Languages.turkish: trBodyTempC,
    Languages.urdu: urBodyTempC,
    Languages.vietnamese: viBodyTempC,
    Languages.italian: itBodyTempC,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getWeightKg() {
  final logsByLanguage = {
    Languages.english: enWeightKg,
    Languages.hindi: hiWeightKg,
    Languages.arabic: arWeightKg,
    Languages.spanish: esWeightKg,
    Languages.mandarin: zhWeightKg,
    Languages.french: frWeightKg,
    Languages.bengali: bnWeightKg,
    Languages.portuguese: ptWeightKg,
    Languages.russian: ruWeightKg,
    Languages.japanese: jaWeightKg,
    Languages.german: deWeightKg,
    Languages.punjabi: paWeightKg,
    Languages.javanese: jvWeightKg,
    Languages.wuChinese: wuuWeightKg,
    Languages.korean: koWeightKg,
    Languages.tamil: taWeightKg,
    Languages.turkish: trWeightKg,
    Languages.urdu: urWeightKg,
    Languages.vietnamese: viWeightKg,
    Languages.italian: itWeightKg,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getBodyTempF() {
  final logsByLanguage = {
    Languages.english: enBodyTempF,
    Languages.hindi: hiBodyTempF,
    Languages.arabic: arBodyTempF,
    Languages.spanish: esBodyTempF,
    Languages.mandarin: zhBodyTempF,
    Languages.french: frBodyTempF,
    Languages.bengali: bnBodyTempF,
    Languages.portuguese: ptBodyTempF,
    Languages.russian: ruBodyTempF,
    Languages.japanese: jaBodyTempF,
    Languages.german: deBodyTempF,
    Languages.punjabi: paBodyTempF,
    Languages.javanese: jvBodyTempF,
    Languages.wuChinese: wuuBodyTempF,
    Languages.korean: koBodyTempF,
    Languages.tamil: taBodyTempF,
    Languages.turkish: trBodyTempF,
    Languages.urdu: urBodyTempF,
    Languages.vietnamese: viBodyTempF,
    Languages.italian: itBodyTempF,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getErrorInvalidSymptomsDate() {
  final logsByLanguage = {
    Languages.english: enErrorInvalidSymptomsDate,
    Languages.hindi: hiErrorInvalidSymptomsDate,
    Languages.arabic: arErrorInvalidSymptomsDate,
    Languages.spanish: esErrorInvalidSymptomsDate,
    Languages.mandarin: zhErrorInvalidSymptomsDate,
    Languages.french: frErrorInvalidSymptomsDate,
    Languages.bengali: bnErrorInvalidSymptomsDate,
    Languages.portuguese: ptErrorInvalidSymptomsDate,
    Languages.russian: ruErrorInvalidSymptomsDate,
    Languages.japanese: jaErrorInvalidSymptomsDate,
    Languages.german: deErrorInvalidSymptomsDate,
    Languages.punjabi: paErrorInvalidSymptomsDate,
    Languages.javanese: jvErrorInvalidSymptomsDate,
    Languages.wuChinese: wuuErrorInvalidSymptomsDate,
    Languages.korean: koErrorInvalidSymptomsDate,
    Languages.tamil: taErrorInvalidSymptomsDate,
    Languages.turkish: trErrorInvalidSymptomsDate,
    Languages.urdu: urErrorInvalidSymptomsDate,
    Languages.vietnamese: viErrorInvalidSymptomsDate,
    Languages.italian: itErrorInvalidSymptomsDate,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblDone() {
  final logsByLanguage = {
    Languages.english: enLblDone,
    Languages.hindi: hiLblDone,
    Languages.arabic: arLblDone,
    Languages.spanish: esLblDone,
    Languages.mandarin: zhLblDone,
    Languages.french: frLblDone,
    Languages.bengali: bnLblDone,
    Languages.portuguese: ptLblDone,
    Languages.russian: ruLblDone,
    Languages.japanese: jaLblDone,
    Languages.german: deLblDone,
    Languages.punjabi: paLblDone,
    Languages.javanese: jvLblDone,
    Languages.wuChinese: wuuLblDone,
    Languages.korean: koLblDone,
    Languages.tamil: taLblDone,
    Languages.turkish: trLblDone,
    Languages.urdu: urLblDone,
    Languages.vietnamese: viLblDone,
    Languages.italian: itLblDone,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblWeight() {
  final logsByLanguage = {
    Languages.english: enLblWeight,
    Languages.hindi: hiLblWeight,
    Languages.arabic: arLblWeight,
    Languages.spanish: esLblWeight,
    Languages.mandarin: zhLblWeight,
    Languages.french: frLblWeight,
    Languages.bengali: bnLblWeight,
    Languages.portuguese: ptLblWeight,
    Languages.russian: ruLblWeight,
    Languages.japanese: jaLblWeight,
    Languages.german: deLblWeight,
    Languages.punjabi: paLblWeight,
    Languages.javanese: jvLblWeight,
    Languages.wuChinese: wuuLblWeight,
    Languages.korean: koLblWeight,
    Languages.tamil: taLblWeight,
    Languages.turkish: trLblWeight,
    Languages.urdu: urLblWeight,
    Languages.vietnamese: viLblWeight,
    Languages.italian: itLblWeight,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblWeightTitle() {
  final logsByLanguage = {
    Languages.english: enLblWeightTitle,
    Languages.hindi: hiLblWeightTitle,
    Languages.arabic: arLblWeightTitle,
    Languages.spanish: esLblWeightTitle,
    Languages.mandarin: zhLblWeightTitle,
    Languages.french: frLblWeightTitle,
    Languages.bengali: bnLblWeightTitle,
    Languages.portuguese: ptLblWeightTitle,
    Languages.russian: ruLblWeightTitle,
    Languages.japanese: jaLblWeightTitle,
    Languages.german: deLblWeightTitle,
    Languages.punjabi: paLblWeightTitle,
    Languages.javanese: jvLblWeightTitle,
    Languages.wuChinese: wuuLblWeightTitle,
    Languages.korean: koLblWeightTitle,
    Languages.tamil: taLblWeightTitle,
    Languages.turkish: trLblWeightTitle,
    Languages.urdu: urLblWeightTitle,
    Languages.vietnamese: viLblWeightTitle,
    Languages.italian: itLblWeightTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblBodyTemp() {
  final logsByLanguage = {
    Languages.english: enLblBodyTemp,
    Languages.hindi: hiLblBodyTemp,
    Languages.arabic: arLblBodyTemp,
    Languages.spanish: esLblBodyTemp,
    Languages.mandarin: zhLblBodyTemp,
    Languages.french: frLblBodyTemp,
    Languages.bengali: bnLblBodyTemp,
    Languages.portuguese: ptLblBodyTemp,
    Languages.russian: ruLblBodyTemp,
    Languages.japanese: jaLblBodyTemp,
    Languages.german: deLblBodyTemp,
    Languages.punjabi: paLblBodyTemp,
    Languages.javanese: jvLblBodyTemp,
    Languages.wuChinese: wuuLblBodyTemp,
    Languages.korean: koLblBodyTemp,
    Languages.tamil: taLblBodyTemp,
    Languages.turkish: trLblBodyTemp,
    Languages.urdu: urLblBodyTemp,
    Languages.vietnamese: viLblBodyTemp,
    Languages.italian: itLblBodyTemp,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblBodyTempTitle() {
  final logsByLanguage = {
    Languages.english: enLblBodyTempTitle,
    Languages.hindi: hiLblBodyTempTitle,
    Languages.arabic: arLblBodyTempTitle,
    Languages.spanish: esLblBodyTempTitle,
    Languages.mandarin: zhLblBodyTempTitle,
    Languages.french: frLblBodyTempTitle,
    Languages.bengali: bnLblBodyTempTitle,
    Languages.portuguese: ptLblBodyTempTitle,
    Languages.russian: ruLblBodyTempTitle,
    Languages.japanese: jaLblBodyTempTitle,
    Languages.german: deLblBodyTempTitle,
    Languages.punjabi: paLblBodyTempTitle,
    Languages.javanese: jvLblBodyTempTitle,
    Languages.wuChinese: wuuLblBodyTempTitle,
    Languages.korean: koLblBodyTempTitle,
    Languages.tamil: taLblBodyTempTitle,
    Languages.turkish: trLblBodyTempTitle,
    Languages.urdu: urLblBodyTempTitle,
    Languages.vietnamese: viLblBodyTempTitle,
    Languages.italian: itLblBodyTempTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblSleep() {
  final logsByLanguage = {
    Languages.english: enLblSleep,
    Languages.hindi: hiLblSleep,
    Languages.arabic: arLblSleep,
    Languages.spanish: esLblSleep,
    Languages.mandarin: zhLblSleep,
    Languages.french: frLblSleep,
    Languages.bengali: bnLblSleep,
    Languages.portuguese: ptLblSleep,
    Languages.russian: ruLblSleep,
    Languages.japanese: jaLblSleep,
    Languages.german: deLblSleep,
    Languages.punjabi: paLblSleep,
    Languages.javanese: jvLblSleep,
    Languages.wuChinese: wuuLblSleep,
    Languages.korean: koLblSleep,
    Languages.tamil: taLblSleep,
    Languages.turkish: trLblSleep,
    Languages.urdu: urLblSleep,
    Languages.vietnamese: viLblSleep,
    Languages.italian: itLblSleep,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblSleepAm() {
  final logsByLanguage = {
    Languages.english: enLblSleepAm,
    Languages.hindi: hiLblSleepAm,
    Languages.arabic: arLblSleepAm,
    Languages.spanish: esLblSleepAm,
    Languages.mandarin: zhLblSleepAm,
    Languages.french: frLblSleepAm,
    Languages.bengali: bnLblSleepAm,
    Languages.portuguese: ptLblSleepAm,
    Languages.russian: ruLblSleepAm,
    Languages.japanese: jaLblSleepAm,
    Languages.german: deLblSleepAm,
    Languages.punjabi: paLblSleepAm,
    Languages.javanese: jvLblSleepAm,
    Languages.wuChinese: wuuLblSleepAm,
    Languages.korean: koLblSleepAm,
    Languages.tamil: taLblSleepAm,
    Languages.turkish: trLblSleepAm,
    Languages.urdu: urLblSleepAm,
    Languages.vietnamese: viLblSleepAm,
    Languages.italian: itLblSleepAm,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblSleepPm() {
  final logsByLanguage = {
    Languages.english: enLblSleepPm,
    Languages.hindi: hiLblSleepPm,
    Languages.arabic: arLblSleepPm,
    Languages.spanish: esLblSleepPm,
    Languages.mandarin: zhLblSleepPm,
    Languages.french: frLblSleepPm,
    Languages.bengali: bnLblSleepPm,
    Languages.portuguese: ptLblSleepPm,
    Languages.russian: ruLblSleepPm,
    Languages.japanese: jaLblSleepPm,
    Languages.german: deLblSleepPm,
    Languages.punjabi: paLblSleepPm,
    Languages.javanese: jvLblSleepPm,
    Languages.wuChinese: wuuLblSleepPm,
    Languages.korean: koLblSleepPm,
    Languages.tamil: taLblSleepPm,
    Languages.turkish: trLblSleepPm,
    Languages.urdu: urLblSleepPm,
    Languages.vietnamese: viLblSleepPm,
    Languages.italian: itLblSleepPm,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblSleepTitle() {
  final logsByLanguage = {
    Languages.english: enLblSleepTitle,
    Languages.hindi: hiLblSleepTitle,
    Languages.arabic: arLblSleepTitle,
    Languages.spanish: esLblSleepTitle,
    Languages.mandarin: zhLblSleepTitle,
    Languages.french: frLblSleepTitle,
    Languages.bengali: bnLblSleepTitle,
    Languages.portuguese: ptLblSleepTitle,
    Languages.russian: ruLblSleepTitle,
    Languages.japanese: jaLblSleepTitle,
    Languages.german: deLblSleepTitle,
    Languages.punjabi: paLblSleepTitle,
    Languages.javanese: jvLblSleepTitle,
    Languages.wuChinese: wuuLblSleepTitle,
    Languages.korean: koLblSleepTitle,
    Languages.tamil: taLblSleepTitle,
    Languages.turkish: trLblSleepTitle,
    Languages.urdu: urLblSleepTitle,
    Languages.vietnamese: viLblSleepTitle,
    Languages.italian: itLblSleepTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblMeditation() {
  final logsByLanguage = {
    Languages.english: enLblMeditation,
    Languages.hindi: hiLblMeditation,
    Languages.arabic: arLblMeditation,
    Languages.spanish: esLblMeditation,
    Languages.mandarin: zhLblMeditation,
    Languages.french: frLblMeditation,
    Languages.bengali: bnLblMeditation,
    Languages.portuguese: ptLblMeditation,
    Languages.russian: ruLblMeditation,
    Languages.japanese: jaLblMeditation,
    Languages.german: deLblMeditation,
    Languages.punjabi: paLblMeditation,
    Languages.javanese: jvLblMeditation,
    Languages.wuChinese: wuuLblMeditation,
    Languages.korean: koLblMeditation,
    Languages.tamil: taLblMeditation,
    Languages.turkish: trLblMeditation,
    Languages.urdu: urLblMeditation,
    Languages.vietnamese: viLblMeditation,
    Languages.italian: itLblMeditation,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblMeditationTitle() {
  final logsByLanguage = {
    Languages.english: enLblMeditationTitle,
    Languages.hindi: hiLblMeditationTitle,
    Languages.arabic: arLblMeditationTitle,
    Languages.spanish: esLblMeditationTitle,
    Languages.mandarin: zhLblMeditationTitle,
    Languages.french: frLblMeditationTitle,
    Languages.bengali: bnLblMeditationTitle,
    Languages.portuguese: ptLblMeditationTitle,
    Languages.russian: ruLblMeditationTitle,
    Languages.japanese: jaLblMeditationTitle,
    Languages.german: deLblMeditationTitle,
    Languages.punjabi: paLblMeditationTitle,
    Languages.javanese: jvLblMeditationTitle,
    Languages.wuChinese: wuuLblMeditationTitle,
    Languages.korean: koLblMeditationTitle,
    Languages.tamil: taLblMeditationTitle,
    Languages.turkish: trLblMeditationTitle,
    Languages.urdu: urLblMeditationTitle,
    Languages.vietnamese: viLblMeditationTitle,
    Languages.italian: itLblMeditationTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblWater() {
  final logsByLanguage = {
    Languages.english: enLblWater,
    Languages.hindi: hiLblWater,
    Languages.arabic: arLblWater,
    Languages.spanish: esLblWater,
    Languages.mandarin: zhLblWater,
    Languages.french: frLblWater,
    Languages.bengali: bnLblWater,
    Languages.portuguese: ptLblWater,
    Languages.russian: ruLblWater,
    Languages.japanese: jaLblWater,
    Languages.german: deLblWater,
    Languages.punjabi: paLblWater,
    Languages.javanese: jvLblWater,
    Languages.wuChinese: wuuLblWater,
    Languages.korean: koLblWater,
    Languages.tamil: taLblWater,
    Languages.turkish: trLblWater,
    Languages.urdu: urLblWater,
    Languages.vietnamese: viLblWater,
    Languages.italian: itLblWater,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblWaterTitle() {
  final logsByLanguage = {
    Languages.english: enLblWaterTitle,
    Languages.hindi: hiLblWaterTitle,
    Languages.arabic: arLblWaterTitle,
    Languages.spanish: esLblWaterTitle,
    Languages.mandarin: zhLblWaterTitle,
    Languages.french: frLblWaterTitle,
    Languages.bengali: bnLblWaterTitle,
    Languages.portuguese: ptLblWaterTitle,
    Languages.russian: ruLblWaterTitle,
    Languages.japanese: jaLblWaterTitle,
    Languages.german: deLblWaterTitle,
    Languages.punjabi: paLblWaterTitle,
    Languages.javanese: jvLblWaterTitle,
    Languages.wuChinese: wuuLblWaterTitle,
    Languages.korean: koLblWaterTitle,
    Languages.tamil: taLblWaterTitle,
    Languages.turkish: trLblWaterTitle,
    Languages.urdu: urLblWaterTitle,
    Languages.vietnamese: viLblWaterTitle,
    Languages.italian: itLblWaterTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphSleepTitle() {
  final logsByLanguage = {
    Languages.english: enGraphSleepTitle,
    Languages.hindi: hiGraphSleepTitle,
    Languages.arabic: arGraphSleepTitle,
    Languages.spanish: esGraphSleepTitle,
    Languages.mandarin: zhGraphSleepTitle,
    Languages.french: frGraphSleepTitle,
    Languages.bengali: bnGraphSleepTitle,
    Languages.portuguese: ptGraphSleepTitle,
    Languages.russian: ruGraphSleepTitle,
    Languages.japanese: jaGraphSleepTitle,
    Languages.german: deGraphSleepTitle,
    Languages.punjabi: paGraphSleepTitle,
    Languages.javanese: jvGraphSleepTitle,
    Languages.wuChinese: wuuGraphSleepTitle,
    Languages.korean: koGraphSleepTitle,
    Languages.tamil: taGraphSleepTitle,
    Languages.turkish: trGraphSleepTitle,
    Languages.urdu: urGraphSleepTitle,
    Languages.vietnamese: viGraphSleepTitle,
    Languages.italian: itGraphSleepTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphSleepDate() {
  final logsByLanguage = {
    Languages.english: enGraphSleepDate,
    Languages.hindi: hiGraphSleepDate,
    Languages.arabic: arGraphSleepDate,
    Languages.spanish: esGraphSleepDate,
    Languages.mandarin: zhGraphSleepDate,
    Languages.french: frGraphSleepDate,
    Languages.bengali: bnGraphSleepDate,
    Languages.portuguese: ptGraphSleepDate,
    Languages.russian: ruGraphSleepDate,
    Languages.japanese: jaGraphSleepDate,
    Languages.german: deGraphSleepDate,
    Languages.punjabi: paGraphSleepDate,
    Languages.javanese: jvGraphSleepDate,
    Languages.wuChinese: wuuGraphSleepDate,
    Languages.korean: koGraphSleepDate,
    Languages.tamil: taGraphSleepDate,
    Languages.turkish: trGraphSleepDate,
    Languages.urdu: urGraphSleepDate,
    Languages.vietnamese: viGraphSleepDate,
    Languages.italian: itGraphSleepDate,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWeightUnitTitle() {
  final logsByLanguage = {
    Languages.english: enGraphWeightUnitTitle,
    Languages.hindi: hiGraphWeightUnitTitle,
    Languages.arabic: arGraphWeightUnitTitle,
    Languages.spanish: esGraphWeightUnitTitle,
    Languages.mandarin: zhGraphWeightUnitTitle,
    Languages.french: frGraphWeightUnitTitle,
    Languages.bengali: bnGraphWeightUnitTitle,
    Languages.portuguese: ptGraphWeightUnitTitle,
    Languages.russian: ruGraphWeightUnitTitle,
    Languages.japanese: jaGraphWeightUnitTitle,
    Languages.german: deGraphWeightUnitTitle,
    Languages.punjabi: paGraphWeightUnitTitle,
    Languages.javanese: jvGraphWeightUnitTitle,
    Languages.wuChinese: wuuGraphWeightUnitTitle,
    Languages.korean: koGraphWeightUnitTitle,
    Languages.tamil: taGraphWeightUnitTitle,
    Languages.turkish: trGraphWeightUnitTitle,
    Languages.urdu: urGraphWeightUnitTitle,
    Languages.vietnamese: viGraphWeightUnitTitle,
    Languages.italian: itGraphWeightUnitTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWeightLogDate() {
  final logsByLanguage = {
    Languages.english: enGraphWeightLogDate,
    Languages.hindi: hiGraphWeightLogDate,
    Languages.arabic: arGraphWeightLogDate,
    Languages.spanish: esGraphWeightLogDate,
    Languages.mandarin: zhGraphWeightLogDate,
    Languages.french: frGraphWeightLogDate,
    Languages.bengali: bnGraphWeightLogDate,
    Languages.portuguese: ptGraphWeightLogDate,
    Languages.russian: ruGraphWeightLogDate,
    Languages.japanese: jaGraphWeightLogDate,
    Languages.german: deGraphWeightLogDate,
    Languages.punjabi: paGraphWeightLogDate,
    Languages.javanese: jvGraphWeightLogDate,
    Languages.wuChinese: wuuGraphWeightLogDate,
    Languages.korean: koGraphWeightLogDate,
    Languages.tamil: taGraphWeightLogDate,
    Languages.turkish: trGraphWeightLogDate,
    Languages.urdu: urGraphWeightLogDate,
    Languages.vietnamese: viGraphWeightLogDate,
    Languages.italian: itGraphWeightLogDate,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryFeelings() {
  final logsByLanguage = {
    Languages.english: enCategoryFeelings,
    Languages.hindi: hiCategoryFeelings,
    Languages.arabic: arCategoryFeelings,
    Languages.spanish: esCategoryFeelings,
    Languages.mandarin: zhCategoryFeelings,
    Languages.french: frCategoryFeelings,
    Languages.bengali: bnCategoryFeelings,
    Languages.portuguese: ptCategoryFeelings,
    Languages.russian: ruCategoryFeelings,
    Languages.japanese: jaCategoryFeelings,
    Languages.german: deCategoryFeelings,
    Languages.punjabi: paCategoryFeelings,
    Languages.javanese: jvCategoryFeelings,
    Languages.wuChinese: wuuCategoryFeelings,
    Languages.korean: koCategoryFeelings,
    Languages.tamil: taCategoryFeelings,
    Languages.turkish: trCategoryFeelings,
    Languages.urdu: urCategoryFeelings,
    Languages.vietnamese: viCategoryFeelings,
    Languages.italian: itCategoryFeelings,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryMind() {
  final logsByLanguage = {
    Languages.english: enCategoryMind,
    Languages.hindi: hiCategoryMind,
    Languages.arabic: arCategoryMind,
    Languages.spanish: esCategoryMind,
    Languages.mandarin: zhCategoryMind,
    Languages.french: frCategoryMind,
    Languages.bengali: bnCategoryMind,
    Languages.portuguese: ptCategoryMind,
    Languages.russian: ruCategoryMind,
    Languages.japanese: jaCategoryMind,
    Languages.german: deCategoryMind,
    Languages.punjabi: paCategoryMind,
    Languages.javanese: jvCategoryMind,
    Languages.wuChinese: wuuCategoryMind,
    Languages.korean: koCategoryMind,
    Languages.tamil: taCategoryMind,
    Languages.turkish: trCategoryMind,
    Languages.urdu: urCategoryMind,
    Languages.vietnamese: viCategoryMind,
    Languages.italian: itCategoryMind,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategorySexualLife() {
  final logsByLanguage = {
    Languages.english: enCategorySexualLife,
    Languages.hindi: hiCategorySexualLife,
    Languages.arabic: arCategorySexualLife,
    Languages.spanish: esCategorySexualLife,
    Languages.mandarin: zhCategorySexualLife,
    Languages.french: frCategorySexualLife,
    Languages.bengali: bnCategorySexualLife,
    Languages.portuguese: ptCategorySexualLife,
    Languages.russian: ruCategorySexualLife,
    Languages.japanese: jaCategorySexualLife,
    Languages.german: deCategorySexualLife,
    Languages.punjabi: paCategorySexualLife,
    Languages.javanese: jvCategorySexualLife,
    Languages.wuChinese: wuuCategorySexualLife,
    Languages.korean: koCategorySexualLife,
    Languages.tamil: taCategorySexualLife,
    Languages.turkish: trCategorySexualLife,
    Languages.urdu: urCategorySexualLife,
    Languages.vietnamese: viCategorySexualLife,
    Languages.italian: itCategorySexualLife,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryEnergy() {
  final logsByLanguage = {
    Languages.english: enCategoryEnergy,
    Languages.hindi: hiCategoryEnergy,
    Languages.arabic: arCategoryEnergy,
    Languages.spanish: esCategoryEnergy,
    Languages.mandarin: zhCategoryEnergy,
    Languages.french: frCategoryEnergy,
    Languages.bengali: bnCategoryEnergy,
    Languages.portuguese: ptCategoryEnergy,
    Languages.russian: ruCategoryEnergy,
    Languages.japanese: jaCategoryEnergy,
    Languages.german: deCategoryEnergy,
    Languages.punjabi: paCategoryEnergy,
    Languages.javanese: jvCategoryEnergy,
    Languages.wuChinese: wuuCategoryEnergy,
    Languages.korean: koCategoryEnergy,
    Languages.tamil: taCategoryEnergy,
    Languages.turkish: trCategoryEnergy,
    Languages.urdu: urCategoryEnergy,
    Languages.vietnamese: viCategoryEnergy,
    Languages.italian: itCategoryEnergy,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryPeriod() {
  final logsByLanguage = {
    Languages.english: enCategoryPeriod,
    Languages.hindi: hiCategoryPeriod,
    Languages.arabic: arCategoryPeriod,
    Languages.spanish: esCategoryPeriod,
    Languages.mandarin: zhCategoryPeriod,
    Languages.french: frCategoryPeriod,
    Languages.bengali: bnCategoryPeriod,
    Languages.portuguese: ptCategoryPeriod,
    Languages.russian: ruCategoryPeriod,
    Languages.japanese: jaCategoryPeriod,
    Languages.german: deCategoryPeriod,
    Languages.punjabi: paCategoryPeriod,
    Languages.javanese: jvCategoryPeriod,
    Languages.wuChinese: wuuCategoryPeriod,
    Languages.korean: koCategoryPeriod,
    Languages.tamil: taCategoryPeriod,
    Languages.turkish: trCategoryPeriod,
    Languages.urdu: urCategoryPeriod,
    Languages.vietnamese: viCategoryPeriod,
    Languages.italian: itCategoryPeriod,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategorySymptoms() {
  final logsByLanguage = {
    Languages.english: enCategorySymptoms,
    Languages.hindi: hiCategorySymptoms,
    Languages.arabic: arCategorySymptoms,
    Languages.spanish: esCategorySymptoms,
    Languages.mandarin: zhCategorySymptoms,
    Languages.french: frCategorySymptoms,
    Languages.bengali: bnCategorySymptoms,
    Languages.portuguese: ptCategorySymptoms,
    Languages.russian: ruCategorySymptoms,
    Languages.japanese: jaCategorySymptoms,
    Languages.german: deCategorySymptoms,
    Languages.punjabi: paCategorySymptoms,
    Languages.javanese: jvCategorySymptoms,
    Languages.wuChinese: wuuCategorySymptoms,
    Languages.korean: koCategorySymptoms,
    Languages.tamil: taCategorySymptoms,
    Languages.turkish: trCategorySymptoms,
    Languages.urdu: urCategorySymptoms,
    Languages.vietnamese: viCategorySymptoms,
    Languages.italian: itCategorySymptoms,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryPain() {
  final logsByLanguage = {
    Languages.english: enCategoryPain,
    Languages.hindi: hiCategoryPain,
    Languages.arabic: arCategoryPain,
    Languages.spanish: esCategoryPain,
    Languages.mandarin: zhCategoryPain,
    Languages.french: frCategoryPain,
    Languages.bengali: bnCategoryPain,
    Languages.portuguese: ptCategoryPain,
    Languages.russian: ruCategoryPain,
    Languages.japanese: jaCategoryPain,
    Languages.german: deCategoryPain,
    Languages.punjabi: paCategoryPain,
    Languages.javanese: jvCategoryPain,
    Languages.wuChinese: wuuCategoryPain,
    Languages.korean: koCategoryPain,
    Languages.tamil: taCategoryPain,
    Languages.turkish: trCategoryPain,
    Languages.urdu: urCategoryPain,
    Languages.vietnamese: viCategoryPain,
    Languages.italian: itCategoryPain,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryVaginalDischarge() {
  final logsByLanguage = {
    Languages.english: enCategoryVaginalDischarge,
    Languages.hindi: hiCategoryVaginalDischarge,
    Languages.arabic: arCategoryVaginalDischarge,
    Languages.spanish: esCategoryVaginalDischarge,
    Languages.mandarin: zhCategoryVaginalDischarge,
    Languages.french: frCategoryVaginalDischarge,
    Languages.bengali: bnCategoryVaginalDischarge,
    Languages.portuguese: ptCategoryVaginalDischarge,
    Languages.russian: ruCategoryVaginalDischarge,
    Languages.japanese: jaCategoryVaginalDischarge,
    Languages.german: deCategoryVaginalDischarge,
    Languages.punjabi: paCategoryVaginalDischarge,
    Languages.javanese: jvCategoryVaginalDischarge,
    Languages.wuChinese: wuuCategoryVaginalDischarge,
    Languages.korean: koCategoryVaginalDischarge,
    Languages.tamil: taCategoryVaginalDischarge,
    Languages.turkish: trCategoryVaginalDischarge,
    Languages.urdu: urCategoryVaginalDischarge,
    Languages.vietnamese: viCategoryVaginalDischarge,
    Languages.italian: itCategoryVaginalDischarge,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryDigestion() {
  final logsByLanguage = {
    Languages.english: enCategoryDigestion,
    Languages.hindi: hiCategoryDigestion,
    Languages.arabic: arCategoryDigestion,
    Languages.spanish: esCategoryDigestion,
    Languages.mandarin: zhCategoryDigestion,
    Languages.french: frCategoryDigestion,
    Languages.bengali: bnCategoryDigestion,
    Languages.portuguese: ptCategoryDigestion,
    Languages.russian: ruCategoryDigestion,
    Languages.japanese: jaCategoryDigestion,
    Languages.german: deCategoryDigestion,
    Languages.punjabi: paCategoryDigestion,
    Languages.javanese: jvCategoryDigestion,
    Languages.wuChinese: wuuCategoryDigestion,
    Languages.korean: koCategoryDigestion,
    Languages.tamil: taCategoryDigestion,
    Languages.turkish: trCategoryDigestion,
    Languages.urdu: urCategoryDigestion,
    Languages.vietnamese: viCategoryDigestion,
    Languages.italian: itCategoryDigestion,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryActivity() {
  final logsByLanguage = {
    Languages.english: enCategoryActivity,
    Languages.hindi: hiCategoryActivity,
    Languages.arabic: arCategoryActivity,
    Languages.spanish: esCategoryActivity,
    Languages.mandarin: zhCategoryActivity,
    Languages.french: frCategoryActivity,
    Languages.bengali: bnCategoryActivity,
    Languages.portuguese: ptCategoryActivity,
    Languages.russian: ruCategoryActivity,
    Languages.japanese: jaCategoryActivity,
    Languages.german: deCategoryActivity,
    Languages.punjabi: paCategoryActivity,
    Languages.javanese: jvCategoryActivity,
    Languages.wuChinese: wuuCategoryActivity,
    Languages.korean: koCategoryActivity,
    Languages.tamil: taCategoryActivity,
    Languages.turkish: trCategoryActivity,
    Languages.urdu: urCategoryActivity,
    Languages.vietnamese: viCategoryActivity,
    Languages.italian: itCategoryActivity,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryCravings() {
  final logsByLanguage = {
    Languages.english: enCategoryCravings,
    Languages.hindi: hiCategoryCravings,
    Languages.arabic: arCategoryCravings,
    Languages.spanish: esCategoryCravings,
    Languages.mandarin: zhCategoryCravings,
    Languages.french: frCategoryCravings,
    Languages.bengali: bnCategoryCravings,
    Languages.portuguese: ptCategoryCravings,
    Languages.russian: ruCategoryCravings,
    Languages.japanese: jaCategoryCravings,
    Languages.german: deCategoryCravings,
    Languages.punjabi: paCategoryCravings,
    Languages.javanese: jvCategoryCravings,
    Languages.wuChinese: wuuCategoryCravings,
    Languages.korean: koCategoryCravings,
    Languages.tamil: taCategoryCravings,
    Languages.turkish: trCategoryCravings,
    Languages.urdu: urCategoryCravings,
    Languages.vietnamese: viCategoryCravings,
    Languages.italian: itCategoryCravings,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryTests() {
  final logsByLanguage = {
    Languages.english: enCategoryTests,
    Languages.hindi: hiCategoryTests,
    Languages.arabic: arCategoryTests,
    Languages.spanish: esCategoryTests,
    Languages.mandarin: zhCategoryTests,
    Languages.french: frCategoryTests,
    Languages.bengali: bnCategoryTests,
    Languages.portuguese: ptCategoryTests,
    Languages.russian: ruCategoryTests,
    Languages.japanese: jaCategoryTests,
    Languages.german: deCategoryTests,
    Languages.punjabi: paCategoryTests,
    Languages.javanese: jvCategoryTests,
    Languages.wuChinese: wuuCategoryTests,
    Languages.korean: koCategoryTests,
    Languages.tamil: taCategoryTests,
    Languages.turkish: trCategoryTests,
    Languages.urdu: urCategoryTests,
    Languages.vietnamese: viCategoryTests,
    Languages.italian: itCategoryTests,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryAilments() {
  final logsByLanguage = {
    Languages.english: enCategoryAilments,
    Languages.hindi: hiCategoryAilments,
    Languages.arabic: arCategoryAilments,
    Languages.spanish: esCategoryAilments,
    Languages.mandarin: zhCategoryAilments,
    Languages.french: frCategoryAilments,
    Languages.bengali: bnCategoryAilments,
    Languages.portuguese: ptCategoryAilments,
    Languages.russian: ruCategoryAilments,
    Languages.japanese: jaCategoryAilments,
    Languages.german: deCategoryAilments,
    Languages.punjabi: paCategoryAilments,
    Languages.javanese: jvCategoryAilments,
    Languages.wuChinese: wuuCategoryAilments,
    Languages.korean: koCategoryAilments,
    Languages.tamil: taCategoryAilments,
    Languages.turkish: trCategoryAilments,
    Languages.urdu: urCategoryAilments,
    Languages.vietnamese: viCategoryAilments,
    Languages.italian: itCategoryAilments,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryAppointments() {
  final logsByLanguage = {
    Languages.english: enCategoryAppointments,
    Languages.hindi: hiCategoryAppointments,
    Languages.arabic: arCategoryAppointments,
    Languages.spanish: esCategoryAppointments,
    Languages.mandarin: zhCategoryAppointments,
    Languages.french: frCategoryAppointments,
    Languages.bengali: bnCategoryAppointments,
    Languages.portuguese: ptCategoryAppointments,
    Languages.russian: ruCategoryAppointments,
    Languages.japanese: jaCategoryAppointments,
    Languages.german: deCategoryAppointments,
    Languages.punjabi: paCategoryAppointments,
    Languages.javanese: jvCategoryAppointments,
    Languages.wuChinese: wuuCategoryAppointments,
    Languages.korean: koCategoryAppointments,
    Languages.tamil: taCategoryAppointments,
    Languages.turkish: trCategoryAppointments,
    Languages.urdu: urCategoryAppointments,
    Languages.vietnamese: viCategoryAppointments,
    Languages.italian: itCategoryAppointments,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryBirthControlPill() {
  final logsByLanguage = {
    Languages.english: enCategoryBirthControlPill,
    Languages.hindi: hiCategoryBirthControlPill,
    Languages.arabic: arCategoryBirthControlPill,
    Languages.spanish: esCategoryBirthControlPill,
    Languages.mandarin: zhCategoryBirthControlPill,
    Languages.french: frCategoryBirthControlPill,
    Languages.bengali: bnCategoryBirthControlPill,
    Languages.portuguese: ptCategoryBirthControlPill,
    Languages.russian: ruCategoryBirthControlPill,
    Languages.japanese: jaCategoryBirthControlPill,
    Languages.german: deCategoryBirthControlPill,
    Languages.punjabi: paCategoryBirthControlPill,
    Languages.javanese: jvCategoryBirthControlPill,
    Languages.wuChinese: wuuCategoryBirthControlPill,
    Languages.korean: koCategoryBirthControlPill,
    Languages.tamil: taCategoryBirthControlPill,
    Languages.turkish: trCategoryBirthControlPill,
    Languages.urdu: urCategoryBirthControlPill,
    Languages.vietnamese: viCategoryBirthControlPill,
    Languages.italian: itCategoryBirthControlPill,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryIUD() {
  final logsByLanguage = {
    Languages.english: enCategoryIUD,
    Languages.hindi: hiCategoryIUD,
    Languages.arabic: arCategoryIUD,
    Languages.spanish: esCategoryIUD,
    Languages.mandarin: zhCategoryIUD,
    Languages.french: frCategoryIUD,
    Languages.bengali: bnCategoryIUD,
    Languages.portuguese: ptCategoryIUD,
    Languages.russian: ruCategoryIUD,
    Languages.japanese: jaCategoryIUD,
    Languages.german: deCategoryIUD,
    Languages.punjabi: paCategoryIUD,
    Languages.javanese: jvCategoryIUD,
    Languages.wuChinese: wuuCategoryIUD,
    Languages.korean: koCategoryIUD,
    Languages.tamil: taCategoryIUD,
    Languages.turkish: trCategoryIUD,
    Languages.urdu: urCategoryIUD,
    Languages.vietnamese: viCategoryIUD,
    Languages.italian: itCategoryIUD,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategorySupplements() {
  final logsByLanguage = {
    Languages.english: enCategorySupplements,
    Languages.hindi: hiCategorySupplements,
    Languages.arabic: arCategorySupplements,
    Languages.spanish: esCategorySupplements,
    Languages.mandarin: zhCategorySupplements,
    Languages.french: frCategorySupplements,
    Languages.bengali: bnCategorySupplements,
    Languages.portuguese: ptCategorySupplements,
    Languages.russian: ruCategorySupplements,
    Languages.japanese: jaCategorySupplements,
    Languages.german: deCategorySupplements,
    Languages.punjabi: paCategorySupplements,
    Languages.javanese: jvCategorySupplements,
    Languages.wuChinese: wuuCategorySupplements,
    Languages.korean: koCategorySupplements,
    Languages.tamil: taCategorySupplements,
    Languages.turkish: trCategorySupplements,
    Languages.urdu: urCategorySupplements,
    Languages.vietnamese: viCategorySupplements,
    Languages.italian: itCategorySupplements,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryUrine() {
  final logsByLanguage = {
    Languages.english: enCategoryUrine,
    Languages.hindi: hiCategoryUrine,
    Languages.arabic: arCategoryUrine,
    Languages.spanish: esCategoryUrine,
    Languages.mandarin: zhCategoryUrine,
    Languages.french: frCategoryUrine,
    Languages.bengali: bnCategoryUrine,
    Languages.portuguese: ptCategoryUrine,
    Languages.russian: ruCategoryUrine,
    Languages.japanese: jaCategoryUrine,
    Languages.german: deCategoryUrine,
    Languages.punjabi: paCategoryUrine,
    Languages.javanese: jvCategoryUrine,
    Languages.wuChinese: wuuCategoryUrine,
    Languages.korean: koCategoryUrine,
    Languages.tamil: taCategoryUrine,
    Languages.turkish: trCategoryUrine,
    Languages.urdu: urCategoryUrine,
    Languages.vietnamese: viCategoryUrine,
    Languages.italian: itCategoryUrine,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryOther() {
  final logsByLanguage = {
    Languages.english: enCategoryOther,
    Languages.hindi: hiCategoryOther,
    Languages.arabic: arCategoryOther,
    Languages.spanish: esCategoryOther,
    Languages.mandarin: zhCategoryOther,
    Languages.french: frCategoryOther,
    Languages.bengali: bnCategoryOther,
    Languages.portuguese: ptCategoryOther,
    Languages.russian: ruCategoryOther,
    Languages.japanese: jaCategoryOther,
    Languages.german: deCategoryOther,
    Languages.punjabi: paCategoryOther,
    Languages.javanese: jvCategoryOther,
    Languages.wuChinese: wuuCategoryOther,
    Languages.korean: koCategoryOther,
    Languages.tamil: taCategoryOther,
    Languages.turkish: trCategoryOther,
    Languages.urdu: urCategoryOther,
    Languages.vietnamese: viCategoryOther,
    Languages.italian: itCategoryOther,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphMeditationTitle() {
  final logsByLanguage = {
    Languages.english: enGraphMeditationTitle,
    Languages.hindi: hiGraphMeditationTitle,
    Languages.arabic: arGraphMeditationTitle,
    Languages.spanish: esGraphMeditationTitle,
    Languages.mandarin: zhGraphMeditationTitle,
    Languages.french: frGraphMeditationTitle,
    Languages.bengali: bnGraphMeditationTitle,
    Languages.portuguese: ptGraphMeditationTitle,
    Languages.russian: ruGraphMeditationTitle,
    Languages.japanese: jaGraphMeditationTitle,
    Languages.german: deGraphMeditationTitle,
    Languages.punjabi: paGraphMeditationTitle,
    Languages.javanese: jvGraphMeditationTitle,
    Languages.wuChinese: wuuGraphMeditationTitle,
    Languages.korean: koGraphMeditationTitle,
    Languages.tamil: taGraphMeditationTitle,
    Languages.turkish: trGraphMeditationTitle,
    Languages.urdu: urGraphMeditationTitle,
    Languages.vietnamese: viGraphMeditationTitle,
    Languages.italian: itGraphMeditationTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphMeditationDate() {
  final logsByLanguage = {
    Languages.english: enGraphMeditationDate,
    Languages.hindi: hiGraphMeditationDate,
    Languages.arabic: arGraphMeditationDate,
    Languages.spanish: esGraphMeditationDate,
    Languages.mandarin: zhGraphMeditationDate,
    Languages.french: frGraphMeditationDate,
    Languages.bengali: bnGraphMeditationDate,
    Languages.portuguese: ptGraphMeditationDate,
    Languages.russian: ruGraphMeditationDate,
    Languages.japanese: jaGraphMeditationDate,
    Languages.german: deGraphMeditationDate,
    Languages.punjabi: paGraphMeditationDate,
    Languages.javanese: jvGraphMeditationDate,
    Languages.wuChinese: wuuGraphMeditationDate,
    Languages.korean: koGraphMeditationDate,
    Languages.tamil: taGraphMeditationDate,
    Languages.turkish: trGraphMeditationDate,
    Languages.urdu: urGraphMeditationDate,
    Languages.vietnamese: viGraphMeditationDate,
    Languages.italian: itGraphMeditationDate,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphMeditationMin() {
  final logsByLanguage = {
    Languages.english: enGraphMeditationMin,
    Languages.hindi: hiGraphMeditationMin,
    Languages.arabic: arGraphMeditationMin,
    Languages.spanish: esGraphMeditationMin,
    Languages.mandarin: zhGraphMeditationMin,
    Languages.french: frGraphMeditationMin,
    Languages.bengali: bnGraphMeditationMin,
    Languages.portuguese: ptGraphMeditationMin,
    Languages.russian: ruGraphMeditationMin,
    Languages.japanese: jaGraphMeditationMin,
    Languages.german: deGraphMeditationMin,
    Languages.punjabi: paGraphMeditationMin,
    Languages.javanese: jvGraphMeditationMin,
    Languages.wuChinese: wuuGraphMeditationMin,
    Languages.korean: koGraphMeditationMin,
    Languages.tamil: taGraphMeditationMin,
    Languages.turkish: trGraphMeditationMin,
    Languages.urdu: urGraphMeditationMin,
    Languages.vietnamese: viGraphMeditationMin,
    Languages.italian: itGraphMeditationMin,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphMeditationMinTitle() {
  final logsByLanguage = {
    Languages.english: enGraphMeditationMinTitle,
    Languages.hindi: hiGraphMeditationMinTitle,
    Languages.arabic: arGraphMeditationMinTitle,
    Languages.spanish: esGraphMeditationMinTitle,
    Languages.mandarin: zhGraphMeditationMinTitle,
    Languages.french: frGraphMeditationMinTitle,
    Languages.bengali: bnGraphMeditationMinTitle,
    Languages.portuguese: ptGraphMeditationMinTitle,
    Languages.russian: ruGraphMeditationMinTitle,
    Languages.japanese: jaGraphMeditationMinTitle,
    Languages.german: deGraphMeditationMinTitle,
    Languages.punjabi: paGraphMeditationMinTitle,
    Languages.javanese: jvGraphMeditationMinTitle,
    Languages.wuChinese: wuuGraphMeditationMinTitle,
    Languages.korean: koGraphMeditationMinTitle,
    Languages.tamil: taGraphMeditationMinTitle,
    Languages.turkish: trGraphMeditationMinTitle,
    Languages.urdu: urGraphMeditationMinTitle,
    Languages.vietnamese: viGraphMeditationMinTitle,
    Languages.italian: itGraphMeditationMinTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWaterUnitCup() {
  final logsByLanguage = {
    Languages.english: enGraphWaterUnitCup,
    Languages.hindi: hiGraphWaterUnitCup,
    Languages.arabic: arGraphWaterUnitCup,
    Languages.spanish: esGraphWaterUnitCup,
    Languages.mandarin: zhGraphWaterUnitCup,
    Languages.french: frGraphWaterUnitCup,
    Languages.bengali: bnGraphWaterUnitCup,
    Languages.portuguese: ptGraphWaterUnitCup,
    Languages.russian: ruGraphWaterUnitCup,
    Languages.japanese: jaGraphWaterUnitCup,
    Languages.german: deGraphWaterUnitCup,
    Languages.punjabi: paGraphWaterUnitCup,
    Languages.javanese: jvGraphWaterUnitCup,
    Languages.wuChinese: wuuGraphWaterUnitCup,
    Languages.korean: koGraphWaterUnitCup,
    Languages.tamil: taGraphWaterUnitCup,
    Languages.turkish: trGraphWaterUnitCup,
    Languages.urdu: urGraphWaterUnitCup,
    Languages.vietnamese: viGraphWaterUnitCup,
    Languages.italian: itGraphWaterUnitCup,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWaterUnitFlOz() {
  final logsByLanguage = {
    Languages.english: enGraphWaterUnitFlOz,
    Languages.hindi: hiGraphWaterUnitFlOz,
    Languages.arabic: arGraphWaterUnitFlOz,
    Languages.spanish: esGraphWaterUnitFlOz,
    Languages.mandarin: zhGraphWaterUnitFlOz,
    Languages.french: frGraphWaterUnitFlOz,
    Languages.bengali: bnGraphWaterUnitFlOz,
    Languages.portuguese: ptGraphWaterUnitFlOz,
    Languages.russian: ruGraphWaterUnitFlOz,
    Languages.japanese: jaGraphWaterUnitFlOz,
    Languages.german: deGraphWaterUnitFlOz,
    Languages.punjabi: paGraphWaterUnitFlOz,
    Languages.javanese: jvGraphWaterUnitFlOz,
    Languages.wuChinese: wuuGraphWaterUnitFlOz,
    Languages.korean: koGraphWaterUnitFlOz,
    Languages.tamil: taGraphWaterUnitFlOz,
    Languages.turkish: trGraphWaterUnitFlOz,
    Languages.urdu: urGraphWaterUnitFlOz,
    Languages.vietnamese: viGraphWaterUnitFlOz,
    Languages.italian: itGraphWaterUnitFlOz,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWaterUnitImperialGallons() {
  final logsByLanguage = {
    Languages.english: enGraphWaterUnitImperialGallons,
    Languages.hindi: hiGraphWaterUnitImperialGallons,
    Languages.arabic: arGraphWaterUnitImperialGallons,
    Languages.spanish: esGraphWaterUnitImperialGallons,
    Languages.mandarin: zhGraphWaterUnitImperialGallons,
    Languages.french: frGraphWaterUnitImperialGallons,
    Languages.bengali: bnGraphWaterUnitImperialGallons,
    Languages.portuguese: ptGraphWaterUnitImperialGallons,
    Languages.russian: ruGraphWaterUnitImperialGallons,
    Languages.japanese: jaGraphWaterUnitImperialGallons,
    Languages.german: deGraphWaterUnitImperialGallons,
    Languages.punjabi: paGraphWaterUnitImperialGallons,
    Languages.javanese: jvGraphWaterUnitImperialGallons,
    Languages.wuChinese: wuuGraphWaterUnitImperialGallons,
    Languages.korean: koGraphWaterUnitImperialGallons,
    Languages.tamil: taGraphWaterUnitImperialGallons,
    Languages.turkish: trGraphWaterUnitImperialGallons,
    Languages.urdu: urGraphWaterUnitImperialGallons,
    Languages.vietnamese: viGraphWaterUnitImperialGallons,
    Languages.italian: itGraphWaterUnitImperialGallons,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWaterUnitUSGallon() {
  final logsByLanguage = {
    Languages.english: enGraphWaterUnitUSGallon,
    Languages.hindi: hiGraphWaterUnitUSGallon,
    Languages.arabic: arGraphWaterUnitUSGallon,
    Languages.spanish: esGraphWaterUnitUSGallon,
    Languages.mandarin: zhGraphWaterUnitUSGallon,
    Languages.french: frGraphWaterUnitUSGallon,
    Languages.bengali: bnGraphWaterUnitUSGallon,
    Languages.portuguese: ptGraphWaterUnitUSGallon,
    Languages.russian: ruGraphWaterUnitUSGallon,
    Languages.japanese: jaGraphWaterUnitUSGallon,
    Languages.german: deGraphWaterUnitUSGallon,
    Languages.punjabi: paGraphWaterUnitUSGallon,
    Languages.javanese: jvGraphWaterUnitUSGallon,
    Languages.wuChinese: wuuGraphWaterUnitUSGallon,
    Languages.korean: koGraphWaterUnitUSGallon,
    Languages.tamil: taGraphWaterUnitUSGallon,
    Languages.turkish: trGraphWaterUnitUSGallon,
    Languages.urdu: urGraphWaterUnitUSGallon,
    Languages.vietnamese: viGraphWaterUnitUSGallon,
    Languages.italian: itGraphWaterUnitUSGallon,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWaterUnitMl() {
  final logsByLanguage = {
    Languages.english: enGraphWaterUnitMl,
    Languages.hindi: hiGraphWaterUnitMl,
    Languages.arabic: arGraphWaterUnitMl,
    Languages.spanish: esGraphWaterUnitMl,
    Languages.mandarin: zhGraphWaterUnitMl,
    Languages.french: frGraphWaterUnitMl,
    Languages.bengali: bnGraphWaterUnitMl,
    Languages.portuguese: ptGraphWaterUnitMl,
    Languages.russian: ruGraphWaterUnitMl,
    Languages.japanese: jaGraphWaterUnitMl,
    Languages.german: deGraphWaterUnitMl,
    Languages.punjabi: paGraphWaterUnitMl,
    Languages.javanese: jvGraphWaterUnitMl,
    Languages.wuChinese: wuuGraphWaterUnitMl,
    Languages.korean: koGraphWaterUnitMl,
    Languages.tamil: taGraphWaterUnitMl,
    Languages.turkish: trGraphWaterUnitMl,
    Languages.urdu: urGraphWaterUnitMl,
    Languages.vietnamese: viGraphWaterUnitMl,
    Languages.italian: itGraphWaterUnitMl,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWeightKg() {
  final logsByLanguage = {
    Languages.english: enGraphWeightKg,
    Languages.hindi: hiGraphWeightKg,
    Languages.arabic: arGraphWeightKg,
    Languages.spanish: esGraphWeightKg,
    Languages.mandarin: zhGraphWeightKg,
    Languages.french: frGraphWeightKg,
    Languages.bengali: bnGraphWeightKg,
    Languages.portuguese: ptGraphWeightKg,
    Languages.russian: ruGraphWeightKg,
    Languages.japanese: jaGraphWeightKg,
    Languages.german: deGraphWeightKg,
    Languages.punjabi: paGraphWeightKg,
    Languages.javanese: jvGraphWeightKg,
    Languages.wuChinese: wuuGraphWeightKg,
    Languages.korean: koGraphWeightKg,
    Languages.tamil: taGraphWeightKg,
    Languages.turkish: trGraphWeightKg,
    Languages.urdu: urGraphWeightKg,
    Languages.vietnamese: viGraphWeightKg,
    Languages.italian: itGraphWeightKg,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWeighLb() {
  final logsByLanguage = {
    Languages.english: enGraphWeighLb,
    Languages.hindi: hiGraphWeighLb,
    Languages.arabic: arGraphWeighLb,
    Languages.spanish: esGraphWeighLb,
    Languages.mandarin: zhGraphWeighLb,
    Languages.french: frGraphWeighLb,
    Languages.bengali: bnGraphWeighLb,
    Languages.portuguese: ptGraphWeighLb,
    Languages.russian: ruGraphWeighLb,
    Languages.japanese: jaGraphWeighLb,
    Languages.german: deGraphWeighLb,
    Languages.punjabi: paGraphWeighLb,
    Languages.javanese: jvGraphWeighLb,
    Languages.wuChinese: wuuGraphWeighLb,
    Languages.korean: koGraphWeighLb,
    Languages.tamil: taGraphWeighLb,
    Languages.turkish: trGraphWeighLb,
    Languages.urdu: urGraphWeighLb,
    Languages.vietnamese: viGraphWeighLb,
    Languages.italian: itGraphWeighLb,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLogPeriodBedtime() {
  final logsByLanguage = {
    Languages.english: enLogPeriodBedtime,
    Languages.hindi: hiLogPeriodBedtime,
    Languages.arabic: arLogPeriodBedtime,
    Languages.spanish: esLogPeriodBedtime,
    Languages.mandarin: zhLogPeriodBedtime,
    Languages.french: frLogPeriodBedtime,
    Languages.bengali: bnLogPeriodBedtime,
    Languages.portuguese: ptLogPeriodBedtime,
    Languages.russian: ruLogPeriodBedtime,
    Languages.japanese: jaLogPeriodBedtime,
    Languages.german: deLogPeriodBedtime,
    Languages.punjabi: paLogPeriodBedtime,
    Languages.javanese: jvLogPeriodBedtime,
    Languages.wuChinese: wuuLogPeriodBedtime,
    Languages.korean: koLogPeriodBedtime,
    Languages.tamil: taLogPeriodBedtime,
    Languages.turkish: trLogPeriodBedtime,
    Languages.urdu: urLogPeriodBedtime,
    Languages.vietnamese: viLogPeriodBedtime,
    Languages.italian: itLogPeriodBedtime,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLogPeriodWakeUpTime() {
  final logsByLanguage = {
    Languages.english: enLogPeriodWakeUpTime,
    Languages.hindi: hiLogPeriodWakeUpTime,
    Languages.arabic: arLogPeriodWakeUpTime,
    Languages.spanish: esLogPeriodWakeUpTime,
    Languages.mandarin: zhLogPeriodWakeUpTime,
    Languages.french: frLogPeriodWakeUpTime,
    Languages.bengali: bnLogPeriodWakeUpTime,
    Languages.portuguese: ptLogPeriodWakeUpTime,
    Languages.russian: ruLogPeriodWakeUpTime,
    Languages.japanese: jaLogPeriodWakeUpTime,
    Languages.german: deLogPeriodWakeUpTime,
    Languages.punjabi: paLogPeriodWakeUpTime,
    Languages.javanese: jvLogPeriodWakeUpTime,
    Languages.wuChinese: wuuLogPeriodWakeUpTime,
    Languages.korean: koLogPeriodWakeUpTime,
    Languages.tamil: taLogPeriodWakeUpTime,
    Languages.turkish: trLogPeriodWakeUpTime,
    Languages.urdu: urLogPeriodWakeUpTime,
    Languages.vietnamese: viLogPeriodWakeUpTime,
    Languages.italian: itLogPeriodWakeUpTime,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLogPeriodWakeUpTimeLog() {
  final logsByLanguage = {
    Languages.english: enLogPeriodWakeUpTimeLog,
    Languages.hindi: hiLogPeriodWakeUpTimeLog,
    Languages.arabic: arLogPeriodWakeUpTimeLog,
    Languages.spanish: esLogPeriodWakeUpTimeLog,
    Languages.mandarin: zhLogPeriodWakeUpTimeLog,
    Languages.french: frLogPeriodWakeUpTimeLog,
    Languages.bengali: bnLogPeriodWakeUpTimeLog,
    Languages.portuguese: ptLogPeriodWakeUpTimeLog,
    Languages.russian: ruLogPeriodWakeUpTimeLog,
    Languages.japanese: jaLogPeriodWakeUpTimeLog,
    Languages.german: deLogPeriodWakeUpTimeLog,
    Languages.punjabi: paLogPeriodWakeUpTimeLog,
    Languages.javanese: jvLogPeriodWakeUpTimeLog,
    Languages.wuChinese: wuuLogPeriodWakeUpTimeLog,
    Languages.korean: koLogPeriodWakeUpTimeLog,
    Languages.tamil: taLogPeriodWakeUpTimeLog,
    Languages.turkish: trLogPeriodWakeUpTimeLog,
    Languages.urdu: urLogPeriodWakeUpTimeLog,
    Languages.vietnamese: viLogPeriodWakeUpTimeLog,
    Languages.italian: itLogPeriodWakeUpTimeLog,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLogPeriodBedTimeLog() {
  final logsByLanguage = {
    Languages.english: enLogPeriodBedTimeLog,
    Languages.hindi: hiLogPeriodBedTimeLog,
    Languages.arabic: arLogPeriodBedTimeLog,
    Languages.spanish: esLogPeriodBedTimeLog,
    Languages.mandarin: zhLogPeriodBedTimeLog,
    Languages.french: frLogPeriodBedTimeLog,
    Languages.bengali: bnLogPeriodBedTimeLog,
    Languages.portuguese: ptLogPeriodBedTimeLog,
    Languages.russian: ruLogPeriodBedTimeLog,
    Languages.japanese: jaLogPeriodBedTimeLog,
    Languages.german: deLogPeriodBedTimeLog,
    Languages.punjabi: paLogPeriodBedTimeLog,
    Languages.javanese: jvLogPeriodBedTimeLog,
    Languages.wuChinese: wuuLogPeriodBedTimeLog,
    Languages.korean: koLogPeriodBedTimeLog,
    Languages.tamil: taLogPeriodBedTimeLog,
    Languages.turkish: trLogPeriodBedTimeLog,
    Languages.urdu: urLogPeriodBedTimeLog,
    Languages.vietnamese: viLogPeriodBedTimeLog,
    Languages.italian: itLogPeriodBedTimeLog,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameLight() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameLight,
    Languages.hindi: hiSymptomsNameLight,
    Languages.arabic: arSymptomsNameLight,
    Languages.spanish: esSymptomsNameLight,
    Languages.mandarin: zhSymptomsNameLight,
    Languages.french: frSymptomsNameLight,
    Languages.bengali: bnSymptomsNameLight,
    Languages.portuguese: ptSymptomsNameLight,
    Languages.russian: ruSymptomsNameLight,
    Languages.japanese: jaSymptomsNameLight,
    Languages.german: deSymptomsNameLight,
    Languages.punjabi: paSymptomsNameLight,
    Languages.javanese: jvSymptomsNameLight,
    Languages.wuChinese: wuuSymptomsNameLight,
    Languages.korean: koSymptomsNameLight,
    Languages.tamil: taSymptomsNameLight,
    Languages.turkish: trSymptomsNameLight,
    Languages.urdu: urSymptomsNameLight,
    Languages.vietnamese: viSymptomsNameLight,
    Languages.italian: itSymptomsNameLight,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameMedium() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameMedium,
    Languages.hindi: hiSymptomsNameMedium,
    Languages.arabic: arSymptomsNameMedium,
    Languages.spanish: esSymptomsNameMedium,
    Languages.mandarin: zhSymptomsNameMedium,
    Languages.french: frSymptomsNameMedium,
    Languages.bengali: bnSymptomsNameMedium,
    Languages.portuguese: ptSymptomsNameMedium,
    Languages.russian: ruSymptomsNameMedium,
    Languages.japanese: jaSymptomsNameMedium,
    Languages.german: deSymptomsNameMedium,
    Languages.punjabi: paSymptomsNameMedium,
    Languages.javanese: jvSymptomsNameMedium,
    Languages.wuChinese: wuuSymptomsNameMedium,
    Languages.korean: koSymptomsNameMedium,
    Languages.tamil: taSymptomsNameMedium,
    Languages.turkish: trSymptomsNameMedium,
    Languages.urdu: urSymptomsNameMedium,
    Languages.vietnamese: viSymptomsNameMedium,
    Languages.italian: itSymptomsNameMedium,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameHeavy() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameHeavy,
    Languages.hindi: hiSymptomsNameHeavy,
    Languages.arabic: arSymptomsNameHeavy,
    Languages.spanish: esSymptomsNameHeavy,
    Languages.mandarin: zhSymptomsNameHeavy,
    Languages.french: frSymptomsNameHeavy,
    Languages.bengali: bnSymptomsNameHeavy,
    Languages.portuguese: ptSymptomsNameHeavy,
    Languages.russian: ruSymptomsNameHeavy,
    Languages.japanese: jaSymptomsNameHeavy,
    Languages.german: deSymptomsNameHeavy,
    Languages.punjabi: paSymptomsNameHeavy,
    Languages.javanese: jvSymptomsNameHeavy,
    Languages.wuChinese: wuuSymptomsNameHeavy,
    Languages.korean: koSymptomsNameHeavy,
    Languages.tamil: taSymptomsNameHeavy,
    Languages.turkish: trSymptomsNameHeavy,
    Languages.urdu: urSymptomsNameHeavy,
    Languages.vietnamese: viSymptomsNameHeavy,
    Languages.italian: itSymptomsNameHeavy,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSuperHeavy() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSuperHeavy,
    Languages.hindi: hiSymptomsNameSuperHeavy,
    Languages.arabic: arSymptomsNameSuperHeavy,
    Languages.spanish: esSymptomsNameSuperHeavy,
    Languages.mandarin: zhSymptomsNameSuperHeavy,
    Languages.french: frSymptomsNameSuperHeavy,
    Languages.bengali: bnSymptomsNameSuperHeavy,
    Languages.portuguese: ptSymptomsNameSuperHeavy,
    Languages.russian: ruSymptomsNameSuperHeavy,
    Languages.japanese: jaSymptomsNameSuperHeavy,
    Languages.german: deSymptomsNameSuperHeavy,
    Languages.punjabi: paSymptomsNameSuperHeavy,
    Languages.javanese: jvSymptomsNameSuperHeavy,
    Languages.wuChinese: wuuSymptomsNameSuperHeavy,
    Languages.korean: koSymptomsNameSuperHeavy,
    Languages.tamil: taSymptomsNameSuperHeavy,
    Languages.turkish: trSymptomsNameSuperHeavy,
    Languages.urdu: urSymptomsNameSuperHeavy,
    Languages.vietnamese: viSymptomsNameSuperHeavy,
    Languages.italian: itSymptomsNameSuperHeavy,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameDontKnow() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameDontKnow,
    Languages.hindi: hiSymptomsNameDontKnow,
    Languages.arabic: arSymptomsNameDontKnow,
    Languages.spanish: esSymptomsNameDontKnow,
    Languages.mandarin: zhSymptomsNameDontKnow,
    Languages.french: frSymptomsNameDontKnow,
    Languages.bengali: bnSymptomsNameDontKnow,
    Languages.portuguese: ptSymptomsNameDontKnow,
    Languages.russian: ruSymptomsNameDontKnow,
    Languages.japanese: jaSymptomsNameDontKnow,
    Languages.german: deSymptomsNameDontKnow,
    Languages.punjabi: paSymptomsNameDontKnow,
    Languages.javanese: jvSymptomsNameDontKnow,
    Languages.wuChinese: wuuSymptomsNameDontKnow,
    Languages.korean: koSymptomsNameDontKnow,
    Languages.tamil: taSymptomsNameDontKnow,
    Languages.turkish: trSymptomsNameDontKnow,
    Languages.urdu: urSymptomsNameDontKnow,
    Languages.vietnamese: viSymptomsNameDontKnow,
    Languages.italian: itSymptomsNameDontKnow,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameExhausted() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameExhausted,
    Languages.hindi: hiSymptomsNameExhausted,
    Languages.arabic: arSymptomsNameExhausted,
    Languages.spanish: esSymptomsNameExhausted,
    Languages.mandarin: zhSymptomsNameExhausted,
    Languages.french: frSymptomsNameExhausted,
    Languages.bengali: bnSymptomsNameExhausted,
    Languages.portuguese: ptSymptomsNameExhausted,
    Languages.russian: ruSymptomsNameExhausted,
    Languages.japanese: jaSymptomsNameExhausted,
    Languages.german: deSymptomsNameExhausted,
    Languages.punjabi: paSymptomsNameExhausted,
    Languages.javanese: jvSymptomsNameExhausted,
    Languages.wuChinese: wuuSymptomsNameExhausted,
    Languages.korean: koSymptomsNameExhausted,
    Languages.tamil: taSymptomsNameExhausted,
    Languages.turkish: trSymptomsNameExhausted,
    Languages.urdu: urSymptomsNameExhausted,
    Languages.vietnamese: viSymptomsNameExhausted,
    Languages.italian: itSymptomsNameExhausted,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameTired() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameTired,
    Languages.hindi: hiSymptomsNameTired,
    Languages.arabic: arSymptomsNameTired,
    Languages.spanish: esSymptomsNameTired,
    Languages.mandarin: zhSymptomsNameTired,
    Languages.french: frSymptomsNameTired,
    Languages.bengali: bnSymptomsNameTired,
    Languages.portuguese: ptSymptomsNameTired,
    Languages.russian: ruSymptomsNameTired,
    Languages.japanese: jaSymptomsNameTired,
    Languages.german: deSymptomsNameTired,
    Languages.punjabi: paSymptomsNameTired,
    Languages.javanese: jvSymptomsNameTired,
    Languages.wuChinese: wuuSymptomsNameTired,
    Languages.korean: koSymptomsNameTired,
    Languages.tamil: taSymptomsNameTired,
    Languages.turkish: trSymptomsNameTired,
    Languages.urdu: urSymptomsNameTired,
    Languages.vietnamese: viSymptomsNameTired,
    Languages.italian: itSymptomsNameTired,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameOK() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameOK,
    Languages.hindi: hiSymptomsNameOK,
    Languages.arabic: arSymptomsNameOK,
    Languages.spanish: esSymptomsNameOK,
    Languages.mandarin: zhSymptomsNameOK,
    Languages.french: frSymptomsNameOK,
    Languages.bengali: bnSymptomsNameOK,
    Languages.portuguese: ptSymptomsNameOK,
    Languages.russian: ruSymptomsNameOK,
    Languages.japanese: jaSymptomsNameOK,
    Languages.german: deSymptomsNameOK,
    Languages.punjabi: paSymptomsNameOK,
    Languages.javanese: jvSymptomsNameOK,
    Languages.wuChinese: wuuSymptomsNameOK,
    Languages.korean: koSymptomsNameOK,
    Languages.tamil: taSymptomsNameOK,
    Languages.turkish: trSymptomsNameOK,
    Languages.urdu: urSymptomsNameOK,
    Languages.vietnamese: viSymptomsNameOK,
    Languages.italian: itSymptomsNameOK,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameEnergetic() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameEnergetic,
    Languages.hindi: hiSymptomsNameEnergetic,
    Languages.arabic: arSymptomsNameEnergetic,
    Languages.spanish: esSymptomsNameEnergetic,
    Languages.mandarin: zhSymptomsNameEnergetic,
    Languages.french: frSymptomsNameEnergetic,
    Languages.bengali: bnSymptomsNameEnergetic,
    Languages.portuguese: ptSymptomsNameEnergetic,
    Languages.russian: ruSymptomsNameEnergetic,
    Languages.japanese: jaSymptomsNameEnergetic,
    Languages.german: deSymptomsNameEnergetic,
    Languages.punjabi: paSymptomsNameEnergetic,
    Languages.javanese: jvSymptomsNameEnergetic,
    Languages.wuChinese: wuuSymptomsNameEnergetic,
    Languages.korean: koSymptomsNameEnergetic,
    Languages.tamil: taSymptomsNameEnergetic,
    Languages.turkish: trSymptomsNameEnergetic,
    Languages.urdu: urSymptomsNameEnergetic,
    Languages.vietnamese: viSymptomsNameEnergetic,
    Languages.italian: itSymptomsNameEnergetic,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameFullyEnergized() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameFullyEnergized,
    Languages.hindi: hiSymptomsNameFullyEnergized,
    Languages.arabic: arSymptomsNameFullyEnergized,
    Languages.spanish: esSymptomsNameFullyEnergized,
    Languages.mandarin: zhSymptomsNameFullyEnergized,
    Languages.french: frSymptomsNameFullyEnergized,
    Languages.bengali: bnSymptomsNameFullyEnergized,
    Languages.portuguese: ptSymptomsNameFullyEnergized,
    Languages.russian: ruSymptomsNameFullyEnergized,
    Languages.japanese: jaSymptomsNameFullyEnergized,
    Languages.german: deSymptomsNameFullyEnergized,
    Languages.punjabi: paSymptomsNameFullyEnergized,
    Languages.javanese: jvSymptomsNameFullyEnergized,
    Languages.wuChinese: wuuSymptomsNameFullyEnergized,
    Languages.korean: koSymptomsNameFullyEnergized,
    Languages.tamil: taSymptomsNameFullyEnergized,
    Languages.turkish: trSymptomsNameFullyEnergized,
    Languages.urdu: urSymptomsNameFullyEnergized,
    Languages.vietnamese: viSymptomsNameFullyEnergized,
    Languages.italian: itSymptomsNameFullyEnergized,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSensitive() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSensitive,
    Languages.hindi: hiSymptomsNameSensitive,
    Languages.arabic: arSymptomsNameSensitive,
    Languages.spanish: esSymptomsNameSensitive,
    Languages.mandarin: zhSymptomsNameSensitive,
    Languages.french: frSymptomsNameSensitive,
    Languages.bengali: bnSymptomsNameSensitive,
    Languages.portuguese: ptSymptomsNameSensitive,
    Languages.russian: ruSymptomsNameSensitive,
    Languages.japanese: jaSymptomsNameSensitive,
    Languages.german: deSymptomsNameSensitive,
    Languages.punjabi: paSymptomsNameSensitive,
    Languages.javanese: jvSymptomsNameSensitive,
    Languages.wuChinese: wuuSymptomsNameSensitive,
    Languages.korean: koSymptomsNameSensitive,
    Languages.tamil: taSymptomsNameSensitive,
    Languages.turkish: trSymptomsNameSensitive,
    Languages.urdu: urSymptomsNameSensitive,
    Languages.vietnamese: viSymptomsNameSensitive,
    Languages.italian: itSymptomsNameSensitive,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameNotInControl() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameNotInControl,
    Languages.hindi: hiSymptomsNameNotInControl,
    Languages.arabic: arSymptomsNameNotInControl,
    Languages.spanish: esSymptomsNameNotInControl,
    Languages.mandarin: zhSymptomsNameNotInControl,
    Languages.french: frSymptomsNameNotInControl,
    Languages.bengali: bnSymptomsNameNotInControl,
    Languages.portuguese: ptSymptomsNameNotInControl,
    Languages.russian: ruSymptomsNameNotInControl,
    Languages.japanese: jaSymptomsNameNotInControl,
    Languages.german: deSymptomsNameNotInControl,
    Languages.punjabi: paSymptomsNameNotInControl,
    Languages.javanese: jvSymptomsNameNotInControl,
    Languages.wuChinese: wuuSymptomsNameNotInControl,
    Languages.korean: koSymptomsNameNotInControl,
    Languages.tamil: taSymptomsNameNotInControl,
    Languages.turkish: trSymptomsNameNotInControl,
    Languages.urdu: urSymptomsNameNotInControl,
    Languages.vietnamese: viSymptomsNameNotInControl,
    Languages.italian: itSymptomsNameNotInControl,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameHappy() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameHappy,
    Languages.hindi: hiSymptomsNameHappy,
    Languages.arabic: arSymptomsNameHappy,
    Languages.spanish: esSymptomsNameHappy,
    Languages.mandarin: zhSymptomsNameHappy,
    Languages.french: frSymptomsNameHappy,
    Languages.bengali: bnSymptomsNameHappy,
    Languages.portuguese: ptSymptomsNameHappy,
    Languages.russian: ruSymptomsNameHappy,
    Languages.japanese: jaSymptomsNameHappy,
    Languages.german: deSymptomsNameHappy,
    Languages.punjabi: paSymptomsNameHappy,
    Languages.javanese: jvSymptomsNameHappy,
    Languages.wuChinese: wuuSymptomsNameHappy,
    Languages.korean: koSymptomsNameHappy,
    Languages.tamil: taSymptomsNameHappy,
    Languages.turkish: trSymptomsNameHappy,
    Languages.urdu: urSymptomsNameHappy,
    Languages.vietnamese: viSymptomsNameHappy,
    Languages.italian: itSymptomsNameHappy,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameFrisky() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameFrisky,
    Languages.hindi: hiSymptomsNameFrisky,
    Languages.arabic: arSymptomsNameFrisky,
    Languages.spanish: esSymptomsNameFrisky,
    Languages.mandarin: zhSymptomsNameFrisky,
    Languages.french: frSymptomsNameFrisky,
    Languages.bengali: bnSymptomsNameFrisky,
    Languages.portuguese: ptSymptomsNameFrisky,
    Languages.russian: ruSymptomsNameFrisky,
    Languages.japanese: jaSymptomsNameFrisky,
    Languages.german: deSymptomsNameFrisky,
    Languages.punjabi: paSymptomsNameFrisky,
    Languages.javanese: jvSymptomsNameFrisky,
    Languages.wuChinese: wuuSymptomsNameFrisky,
    Languages.korean: koSymptomsNameFrisky,
    Languages.tamil: taSymptomsNameFrisky,
    Languages.turkish: trSymptomsNameFrisky,
    Languages.urdu: urSymptomsNameFrisky,
    Languages.vietnamese: viSymptomsNameFrisky,
    Languages.italian: itSymptomsNameFrisky,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameMoodSwings() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameMoodSwings,
    Languages.hindi: hiSymptomsNameMoodSwings,
    Languages.arabic: arSymptomsNameMoodSwings,
    Languages.spanish: esSymptomsNameMoodSwings,
    Languages.mandarin: zhSymptomsNameMoodSwings,
    Languages.french: frSymptomsNameMoodSwings,
    Languages.bengali: bnSymptomsNameMoodSwings,
    Languages.portuguese: ptSymptomsNameMoodSwings,
    Languages.russian: ruSymptomsNameMoodSwings,
    Languages.japanese: jaSymptomsNameMoodSwings,
    Languages.german: deSymptomsNameMoodSwings,
    Languages.punjabi: paSymptomsNameMoodSwings,
    Languages.javanese: jvSymptomsNameMoodSwings,
    Languages.wuChinese: wuuSymptomsNameMoodSwings,
    Languages.korean: koSymptomsNameMoodSwings,
    Languages.tamil: taSymptomsNameMoodSwings,
    Languages.turkish: trSymptomsNameMoodSwings,
    Languages.urdu: urSymptomsNameMoodSwings,
    Languages.vietnamese: viSymptomsNameMoodSwings,
    Languages.italian: itSymptomsNameMoodSwings,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameIrritated() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameIrritated,
    Languages.hindi: hiSymptomsNameIrritated,
    Languages.arabic: arSymptomsNameIrritated,
    Languages.spanish: esSymptomsNameIrritated,
    Languages.mandarin: zhSymptomsNameIrritated,
    Languages.french: frSymptomsNameIrritated,
    Languages.bengali: bnSymptomsNameIrritated,
    Languages.portuguese: ptSymptomsNameIrritated,
    Languages.russian: ruSymptomsNameIrritated,
    Languages.japanese: jaSymptomsNameIrritated,
    Languages.german: deSymptomsNameIrritated,
    Languages.punjabi: paSymptomsNameIrritated,
    Languages.javanese: jvSymptomsNameIrritated,
    Languages.wuChinese: wuuSymptomsNameIrritated,
    Languages.korean: koSymptomsNameIrritated,
    Languages.tamil: taSymptomsNameIrritated,
    Languages.turkish: trSymptomsNameIrritated,
    Languages.urdu: urSymptomsNameIrritated,
    Languages.vietnamese: viSymptomsNameIrritated,
    Languages.italian: itSymptomsNameIrritated,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSad() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSad,
    Languages.hindi: hiSymptomsNameSad,
    Languages.arabic: arSymptomsNameSad,
    Languages.spanish: esSymptomsNameSad,
    Languages.mandarin: zhSymptomsNameSad,
    Languages.french: frSymptomsNameSad,
    Languages.bengali: bnSymptomsNameSad,
    Languages.portuguese: ptSymptomsNameSad,
    Languages.russian: ruSymptomsNameSad,
    Languages.japanese: jaSymptomsNameSad,
    Languages.german: deSymptomsNameSad,
    Languages.punjabi: paSymptomsNameSad,
    Languages.javanese: jvSymptomsNameSad,
    Languages.wuChinese: wuuSymptomsNameSad,
    Languages.korean: koSymptomsNameSad,
    Languages.tamil: taSymptomsNameSad,
    Languages.turkish: trSymptomsNameSad,
    Languages.urdu: urSymptomsNameSad,
    Languages.vietnamese: viSymptomsNameSad,
    Languages.italian: itSymptomsNameSad,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameTension() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameTension,
    Languages.hindi: hiSymptomsNameTension,
    Languages.arabic: arSymptomsNameTension,
    Languages.spanish: esSymptomsNameTension,
    Languages.mandarin: zhSymptomsNameTension,
    Languages.french: frSymptomsNameTension,
    Languages.bengali: bnSymptomsNameTension,
    Languages.portuguese: ptSymptomsNameTension,
    Languages.russian: ruSymptomsNameTension,
    Languages.japanese: jaSymptomsNameTension,
    Languages.german: deSymptomsNameTension,
    Languages.punjabi: paSymptomsNameTension,
    Languages.javanese: jvSymptomsNameTension,
    Languages.wuChinese: wuuSymptomsNameTension,
    Languages.korean: koSymptomsNameTension,
    Languages.tamil: taSymptomsNameTension,
    Languages.turkish: trSymptomsNameTension,
    Languages.urdu: urSymptomsNameTension,
    Languages.vietnamese: viSymptomsNameTension,
    Languages.italian: itSymptomsNameTension,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameAngry() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameAngry,
    Languages.hindi: hiSymptomsNameAngry,
    Languages.arabic: arSymptomsNameAngry,
    Languages.spanish: esSymptomsNameAngry,
    Languages.mandarin: zhSymptomsNameAngry,
    Languages.french: frSymptomsNameAngry,
    Languages.bengali: bnSymptomsNameAngry,
    Languages.portuguese: ptSymptomsNameAngry,
    Languages.russian: ruSymptomsNameAngry,
    Languages.japanese: jaSymptomsNameAngry,
    Languages.german: deSymptomsNameAngry,
    Languages.punjabi: paSymptomsNameAngry,
    Languages.javanese: jvSymptomsNameAngry,
    Languages.wuChinese: wuuSymptomsNameAngry,
    Languages.korean: koSymptomsNameAngry,
    Languages.tamil: taSymptomsNameAngry,
    Languages.turkish: trSymptomsNameAngry,
    Languages.urdu: urSymptomsNameAngry,
    Languages.vietnamese: viSymptomsNameAngry,
    Languages.italian: itSymptomsNameAngry,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameConfident() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameConfident,
    Languages.hindi: hiSymptomsNameConfident,
    Languages.arabic: arSymptomsNameConfident,
    Languages.spanish: esSymptomsNameConfident,
    Languages.mandarin: zhSymptomsNameConfident,
    Languages.french: frSymptomsNameConfident,
    Languages.bengali: bnSymptomsNameConfident,
    Languages.portuguese: ptSymptomsNameConfident,
    Languages.russian: ruSymptomsNameConfident,
    Languages.japanese: jaSymptomsNameConfident,
    Languages.german: deSymptomsNameConfident,
    Languages.punjabi: paSymptomsNameConfident,
    Languages.javanese: jvSymptomsNameConfident,
    Languages.wuChinese: wuuSymptomsNameConfident,
    Languages.korean: koSymptomsNameConfident,
    Languages.tamil: taSymptomsNameConfident,
    Languages.turkish: trSymptomsNameConfident,
    Languages.urdu: urSymptomsNameConfident,
    Languages.vietnamese: viSymptomsNameConfident,
    Languages.italian: itSymptomsNameConfident,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameInsecure() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameInsecure,
    Languages.hindi: hiSymptomsNameInsecure,
    Languages.arabic: arSymptomsNameInsecure,
    Languages.spanish: esSymptomsNameInsecure,
    Languages.mandarin: zhSymptomsNameInsecure,
    Languages.french: frSymptomsNameInsecure,
    Languages.bengali: bnSymptomsNameInsecure,
    Languages.portuguese: ptSymptomsNameInsecure,
    Languages.russian: ruSymptomsNameInsecure,
    Languages.japanese: jaSymptomsNameInsecure,
    Languages.german: deSymptomsNameInsecure,
    Languages.punjabi: paSymptomsNameInsecure,
    Languages.javanese: jvSymptomsNameInsecure,
    Languages.wuChinese: wuuSymptomsNameInsecure,
    Languages.korean: koSymptomsNameInsecure,
    Languages.tamil: taSymptomsNameInsecure,
    Languages.turkish: trSymptomsNameInsecure,
    Languages.urdu: urSymptomsNameInsecure,
    Languages.vietnamese: viSymptomsNameInsecure,
    Languages.italian: itSymptomsNameInsecure,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameGrateful() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameGrateful,
    Languages.hindi: hiSymptomsNameGrateful,
    Languages.arabic: arSymptomsNameGrateful,
    Languages.spanish: esSymptomsNameGrateful,
    Languages.mandarin: zhSymptomsNameGrateful,
    Languages.french: frSymptomsNameGrateful,
    Languages.bengali: bnSymptomsNameGrateful,
    Languages.portuguese: ptSymptomsNameGrateful,
    Languages.russian: ruSymptomsNameGrateful,
    Languages.japanese: jaSymptomsNameGrateful,
    Languages.german: deSymptomsNameGrateful,
    Languages.punjabi: paSymptomsNameGrateful,
    Languages.javanese: jvSymptomsNameGrateful,
    Languages.wuChinese: wuuSymptomsNameGrateful,
    Languages.korean: koSymptomsNameGrateful,
    Languages.tamil: taSymptomsNameGrateful,
    Languages.turkish: trSymptomsNameGrateful,
    Languages.urdu: urSymptomsNameGrateful,
    Languages.vietnamese: viSymptomsNameGrateful,
    Languages.italian: itSymptomsNameGrateful,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameAnxiety() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameAnxiety,
    Languages.hindi: hiSymptomsNameAnxiety,
    Languages.arabic: arSymptomsNameAnxiety,
    Languages.spanish: esSymptomsNameAnxiety,
    Languages.mandarin: zhSymptomsNameAnxiety,
    Languages.french: frSymptomsNameAnxiety,
    Languages.bengali: bnSymptomsNameAnxiety,
    Languages.portuguese: ptSymptomsNameAnxiety,
    Languages.russian: ruSymptomsNameAnxiety,
    Languages.japanese: jaSymptomsNameAnxiety,
    Languages.german: deSymptomsNameAnxiety,
    Languages.punjabi: paSymptomsNameAnxiety,
    Languages.javanese: jvSymptomsNameAnxiety,
    Languages.wuChinese: wuuSymptomsNameAnxiety,
    Languages.korean: koSymptomsNameAnxiety,
    Languages.tamil: taSymptomsNameAnxiety,
    Languages.turkish: trSymptomsNameAnxiety,
    Languages.urdu: urSymptomsNameAnxiety,
    Languages.vietnamese: viSymptomsNameAnxiety,
    Languages.italian: itSymptomsNameAnxiety,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameExcited() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameExcited,
    Languages.hindi: hiSymptomsNameExcited,
    Languages.arabic: arSymptomsNameExcited,
    Languages.spanish: esSymptomsNameExcited,
    Languages.mandarin: zhSymptomsNameExcited,
    Languages.french: frSymptomsNameExcited,
    Languages.bengali: bnSymptomsNameExcited,
    Languages.portuguese: ptSymptomsNameExcited,
    Languages.russian: ruSymptomsNameExcited,
    Languages.japanese: jaSymptomsNameExcited,
    Languages.german: deSymptomsNameExcited,
    Languages.punjabi: paSymptomsNameExcited,
    Languages.javanese: jvSymptomsNameExcited,
    Languages.wuChinese: wuuSymptomsNameExcited,
    Languages.korean: koSymptomsNameExcited,
    Languages.tamil: taSymptomsNameExcited,
    Languages.turkish: trSymptomsNameExcited,
    Languages.urdu: urSymptomsNameExcited,
    Languages.vietnamese: viSymptomsNameExcited,
    Languages.italian: itSymptomsNameExcited,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameCalm() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameCalm,
    Languages.hindi: hiSymptomsNameCalm,
    Languages.arabic: arSymptomsNameCalm,
    Languages.spanish: esSymptomsNameCalm,
    Languages.mandarin: zhSymptomsNameCalm,
    Languages.french: frSymptomsNameCalm,
    Languages.bengali: bnSymptomsNameCalm,
    Languages.portuguese: ptSymptomsNameCalm,
    Languages.russian: ruSymptomsNameCalm,
    Languages.japanese: jaSymptomsNameCalm,
    Languages.german: deSymptomsNameCalm,
    Languages.punjabi: paSymptomsNameCalm,
    Languages.javanese: jvSymptomsNameCalm,
    Languages.wuChinese: wuuSymptomsNameCalm,
    Languages.korean: koSymptomsNameCalm,
    Languages.tamil: taSymptomsNameCalm,
    Languages.turkish: trSymptomsNameCalm,
    Languages.urdu: urSymptomsNameCalm,
    Languages.vietnamese: viSymptomsNameCalm,
    Languages.italian: itSymptomsNameCalm,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameDistracted() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameDistracted,
    Languages.hindi: hiSymptomsNameDistracted,
    Languages.arabic: arSymptomsNameDistracted,
    Languages.spanish: esSymptomsNameDistracted,
    Languages.mandarin: zhSymptomsNameDistracted,
    Languages.french: frSymptomsNameDistracted,
    Languages.bengali: bnSymptomsNameDistracted,
    Languages.portuguese: ptSymptomsNameDistracted,
    Languages.russian: ruSymptomsNameDistracted,
    Languages.japanese: jaSymptomsNameDistracted,
    Languages.german: deSymptomsNameDistracted,
    Languages.punjabi: paSymptomsNameDistracted,
    Languages.javanese: jvSymptomsNameDistracted,
    Languages.wuChinese: wuuSymptomsNameDistracted,
    Languages.korean: koSymptomsNameDistracted,
    Languages.tamil: taSymptomsNameDistracted,
    Languages.turkish: trSymptomsNameDistracted,
    Languages.urdu: urSymptomsNameDistracted,
    Languages.vietnamese: viSymptomsNameDistracted,
    Languages.italian: itSymptomsNameDistracted,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameFocused() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameFocused,
    Languages.hindi: hiSymptomsNameFocused,
    Languages.arabic: arSymptomsNameFocused,
    Languages.spanish: esSymptomsNameFocused,
    Languages.mandarin: zhSymptomsNameFocused,
    Languages.french: frSymptomsNameFocused,
    Languages.bengali: bnSymptomsNameFocused,
    Languages.portuguese: ptSymptomsNameFocused,
    Languages.russian: ruSymptomsNameFocused,
    Languages.japanese: jaSymptomsNameFocused,
    Languages.german: deSymptomsNameFocused,
    Languages.punjabi: paSymptomsNameFocused,
    Languages.javanese: jvSymptomsNameFocused,
    Languages.wuChinese: wuuSymptomsNameFocused,
    Languages.korean: koSymptomsNameFocused,
    Languages.tamil: taSymptomsNameFocused,
    Languages.turkish: trSymptomsNameFocused,
    Languages.urdu: urSymptomsNameFocused,
    Languages.vietnamese: viSymptomsNameFocused,
    Languages.italian: itSymptomsNameFocused,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameDepressed() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameDepressed,
    Languages.hindi: hiSymptomsNameDepressed,
    Languages.arabic: arSymptomsNameDepressed,
    Languages.spanish: esSymptomsNameDepressed,
    Languages.mandarin: zhSymptomsNameDepressed,
    Languages.french: frSymptomsNameDepressed,
    Languages.bengali: bnSymptomsNameDepressed,
    Languages.portuguese: ptSymptomsNameDepressed,
    Languages.russian: ruSymptomsNameDepressed,
    Languages.japanese: jaSymptomsNameDepressed,
    Languages.german: deSymptomsNameDepressed,
    Languages.punjabi: paSymptomsNameDepressed,
    Languages.javanese: jvSymptomsNameDepressed,
    Languages.wuChinese: wuuSymptomsNameDepressed,
    Languages.korean: koSymptomsNameDepressed,
    Languages.tamil: taSymptomsNameDepressed,
    Languages.turkish: trSymptomsNameDepressed,
    Languages.urdu: urSymptomsNameDepressed,
    Languages.vietnamese: viSymptomsNameDepressed,
    Languages.italian: itSymptomsNameDepressed,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameConfused() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameConfused,
    Languages.hindi: hiSymptomsNameConfused,
    Languages.arabic: arSymptomsNameConfused,
    Languages.spanish: esSymptomsNameConfused,
    Languages.mandarin: zhSymptomsNameConfused,
    Languages.french: frSymptomsNameConfused,
    Languages.bengali: bnSymptomsNameConfused,
    Languages.portuguese: ptSymptomsNameConfused,
    Languages.russian: ruSymptomsNameConfused,
    Languages.japanese: jaSymptomsNameConfused,
    Languages.german: deSymptomsNameConfused,
    Languages.punjabi: paSymptomsNameConfused,
    Languages.javanese: jvSymptomsNameConfused,
    Languages.wuChinese: wuuSymptomsNameConfused,
    Languages.korean: koSymptomsNameConfused,
    Languages.tamil: taSymptomsNameConfused,
    Languages.turkish: trSymptomsNameConfused,
    Languages.urdu: urSymptomsNameConfused,
    Languages.vietnamese: viSymptomsNameConfused,
    Languages.italian: itSymptomsNameConfused,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameStressed() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameStressed,
    Languages.hindi: hiSymptomsNameStressed,
    Languages.arabic: arSymptomsNameStressed,
    Languages.spanish: esSymptomsNameStressed,
    Languages.mandarin: zhSymptomsNameStressed,
    Languages.french: frSymptomsNameStressed,
    Languages.bengali: bnSymptomsNameStressed,
    Languages.portuguese: ptSymptomsNameStressed,
    Languages.russian: ruSymptomsNameStressed,
    Languages.japanese: jaSymptomsNameStressed,
    Languages.german: deSymptomsNameStressed,
    Languages.punjabi: paSymptomsNameStressed,
    Languages.javanese: jvSymptomsNameStressed,
    Languages.wuChinese: wuuSymptomsNameStressed,
    Languages.korean: koSymptomsNameStressed,
    Languages.tamil: taSymptomsNameStressed,
    Languages.turkish: trSymptomsNameStressed,
    Languages.urdu: urSymptomsNameStressed,
    Languages.vietnamese: viSymptomsNameStressed,
    Languages.italian: itSymptomsNameStressed,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameMotivated() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameMotivated,
    Languages.hindi: hiSymptomsNameMotivated,
    Languages.arabic: arSymptomsNameMotivated,
    Languages.spanish: esSymptomsNameMotivated,
    Languages.mandarin: zhSymptomsNameMotivated,
    Languages.french: frSymptomsNameMotivated,
    Languages.bengali: bnSymptomsNameMotivated,
    Languages.portuguese: ptSymptomsNameMotivated,
    Languages.russian: ruSymptomsNameMotivated,
    Languages.japanese: jaSymptomsNameMotivated,
    Languages.german: deSymptomsNameMotivated,
    Languages.punjabi: paSymptomsNameMotivated,
    Languages.javanese: jvSymptomsNameMotivated,
    Languages.wuChinese: wuuSymptomsNameMotivated,
    Languages.korean: koSymptomsNameMotivated,
    Languages.tamil: taSymptomsNameMotivated,
    Languages.turkish: trSymptomsNameMotivated,
    Languages.urdu: urSymptomsNameMotivated,
    Languages.vietnamese: viSymptomsNameMotivated,
    Languages.italian: itSymptomsNameMotivated,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameUnmotivated() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameUnmotivated,
    Languages.hindi: hiSymptomsNameUnmotivated,
    Languages.arabic: arSymptomsNameUnmotivated,
    Languages.spanish: esSymptomsNameUnmotivated,
    Languages.mandarin: zhSymptomsNameUnmotivated,
    Languages.french: frSymptomsNameUnmotivated,
    Languages.bengali: bnSymptomsNameUnmotivated,
    Languages.portuguese: ptSymptomsNameUnmotivated,
    Languages.russian: ruSymptomsNameUnmotivated,
    Languages.japanese: jaSymptomsNameUnmotivated,
    Languages.german: deSymptomsNameUnmotivated,
    Languages.punjabi: paSymptomsNameUnmotivated,
    Languages.javanese: jvSymptomsNameUnmotivated,
    Languages.wuChinese: wuuSymptomsNameUnmotivated,
    Languages.korean: koSymptomsNameUnmotivated,
    Languages.tamil: taSymptomsNameUnmotivated,
    Languages.turkish: trSymptomsNameUnmotivated,
    Languages.urdu: urSymptomsNameUnmotivated,
    Languages.vietnamese: viSymptomsNameUnmotivated,
    Languages.italian: itSymptomsNameUnmotivated,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameCreative() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameCreative,
    Languages.hindi: hiSymptomsNameCreative,
    Languages.arabic: arSymptomsNameCreative,
    Languages.spanish: esSymptomsNameCreative,
    Languages.mandarin: zhSymptomsNameCreative,
    Languages.french: frSymptomsNameCreative,
    Languages.bengali: bnSymptomsNameCreative,
    Languages.portuguese: ptSymptomsNameCreative,
    Languages.russian: ruSymptomsNameCreative,
    Languages.japanese: jaSymptomsNameCreative,
    Languages.german: deSymptomsNameCreative,
    Languages.punjabi: paSymptomsNameCreative,
    Languages.javanese: jvSymptomsNameCreative,
    Languages.wuChinese: wuuSymptomsNameCreative,
    Languages.korean: koSymptomsNameCreative,
    Languages.tamil: taSymptomsNameCreative,
    Languages.turkish: trSymptomsNameCreative,
    Languages.urdu: urSymptomsNameCreative,
    Languages.vietnamese: viSymptomsNameCreative,
    Languages.italian: itSymptomsNameCreative,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameProductive() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameProductive,
    Languages.hindi: hiSymptomsNameProductive,
    Languages.arabic: arSymptomsNameProductive,
    Languages.spanish: esSymptomsNameProductive,
    Languages.mandarin: zhSymptomsNameProductive,
    Languages.french: frSymptomsNameProductive,
    Languages.bengali: bnSymptomsNameProductive,
    Languages.portuguese: ptSymptomsNameProductive,
    Languages.russian: ruSymptomsNameProductive,
    Languages.japanese: jaSymptomsNameProductive,
    Languages.german: deSymptomsNameProductive,
    Languages.punjabi: paSymptomsNameProductive,
    Languages.javanese: jvSymptomsNameProductive,
    Languages.wuChinese: wuuSymptomsNameProductive,
    Languages.korean: koSymptomsNameProductive,
    Languages.tamil: taSymptomsNameProductive,
    Languages.turkish: trSymptomsNameProductive,
    Languages.urdu: urSymptomsNameProductive,
    Languages.vietnamese: viSymptomsNameProductive,
    Languages.italian: itSymptomsNameProductive,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameUnproductive() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameUnproductive,
    Languages.hindi: hiSymptomsNameUnproductive,
    Languages.arabic: arSymptomsNameUnproductive,
    Languages.spanish: esSymptomsNameUnproductive,
    Languages.mandarin: zhSymptomsNameUnproductive,
    Languages.french: frSymptomsNameUnproductive,
    Languages.bengali: bnSymptomsNameUnproductive,
    Languages.portuguese: ptSymptomsNameUnproductive,
    Languages.russian: ruSymptomsNameUnproductive,
    Languages.japanese: jaSymptomsNameUnproductive,
    Languages.german: deSymptomsNameUnproductive,
    Languages.punjabi: paSymptomsNameUnproductive,
    Languages.javanese: jvSymptomsNameUnproductive,
    Languages.wuChinese: wuuSymptomsNameUnproductive,
    Languages.korean: koSymptomsNameUnproductive,
    Languages.tamil: taSymptomsNameUnproductive,
    Languages.turkish: trSymptomsNameUnproductive,
    Languages.urdu: urSymptomsNameUnproductive,
    Languages.vietnamese: viSymptomsNameUnproductive,
    Languages.italian: itSymptomsNameUnproductive,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameNoSex() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameNoSex,
    Languages.hindi: hiSymptomsNameNoSex,
    Languages.arabic: arSymptomsNameNoSex,
    Languages.spanish: esSymptomsNameNoSex,
    Languages.mandarin: zhSymptomsNameNoSex,
    Languages.french: frSymptomsNameNoSex,
    Languages.bengali: bnSymptomsNameNoSex,
    Languages.portuguese: ptSymptomsNameNoSex,
    Languages.russian: ruSymptomsNameNoSex,
    Languages.japanese: jaSymptomsNameNoSex,
    Languages.german: deSymptomsNameNoSex,
    Languages.punjabi: paSymptomsNameNoSex,
    Languages.javanese: jvSymptomsNameNoSex,
    Languages.wuChinese: wuuSymptomsNameNoSex,
    Languages.korean: koSymptomsNameNoSex,
    Languages.tamil: taSymptomsNameNoSex,
    Languages.turkish: trSymptomsNameNoSex,
    Languages.urdu: urSymptomsNameNoSex,
    Languages.vietnamese: viSymptomsNameNoSex,
    Languages.italian: itSymptomsNameNoSex,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameProtectedSex() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameProtectedSex,
    Languages.hindi: hiSymptomsNameProtectedSex,
    Languages.arabic: arSymptomsNameProtectedSex,
    Languages.spanish: esSymptomsNameProtectedSex,
    Languages.mandarin: zhSymptomsNameProtectedSex,
    Languages.french: frSymptomsNameProtectedSex,
    Languages.bengali: bnSymptomsNameProtectedSex,
    Languages.portuguese: ptSymptomsNameProtectedSex,
    Languages.russian: ruSymptomsNameProtectedSex,
    Languages.japanese: jaSymptomsNameProtectedSex,
    Languages.german: deSymptomsNameProtectedSex,
    Languages.punjabi: paSymptomsNameProtectedSex,
    Languages.javanese: jvSymptomsNameProtectedSex,
    Languages.wuChinese: wuuSymptomsNameProtectedSex,
    Languages.korean: koSymptomsNameProtectedSex,
    Languages.tamil: taSymptomsNameProtectedSex,
    Languages.turkish: trSymptomsNameProtectedSex,
    Languages.urdu: urSymptomsNameProtectedSex,
    Languages.vietnamese: viSymptomsNameProtectedSex,
    Languages.italian: itSymptomsNameProtectedSex,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameUnprotectedSex() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameUnprotectedSex,
    Languages.hindi: hiSymptomsNameUnprotectedSex,
    Languages.arabic: arSymptomsNameUnprotectedSex,
    Languages.spanish: esSymptomsNameUnprotectedSex,
    Languages.mandarin: zhSymptomsNameUnprotectedSex,
    Languages.french: frSymptomsNameUnprotectedSex,
    Languages.bengali: bnSymptomsNameUnprotectedSex,
    Languages.portuguese: ptSymptomsNameUnprotectedSex,
    Languages.russian: ruSymptomsNameUnprotectedSex,
    Languages.japanese: jaSymptomsNameUnprotectedSex,
    Languages.german: deSymptomsNameUnprotectedSex,
    Languages.punjabi: paSymptomsNameUnprotectedSex,
    Languages.javanese: jvSymptomsNameUnprotectedSex,
    Languages.wuChinese: wuuSymptomsNameUnprotectedSex,
    Languages.korean: koSymptomsNameUnprotectedSex,
    Languages.tamil: taSymptomsNameUnprotectedSex,
    Languages.turkish: trSymptomsNameUnprotectedSex,
    Languages.urdu: urSymptomsNameUnprotectedSex,
    Languages.vietnamese: viSymptomsNameUnprotectedSex,
    Languages.italian: itSymptomsNameUnprotectedSex,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameOralSex() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameOralSex,
    Languages.hindi: hiSymptomsNameOralSex,
    Languages.arabic: arSymptomsNameOralSex,
    Languages.spanish: esSymptomsNameOralSex,
    Languages.mandarin: zhSymptomsNameOralSex,
    Languages.french: frSymptomsNameOralSex,
    Languages.bengali: bnSymptomsNameOralSex,
    Languages.portuguese: ptSymptomsNameOralSex,
    Languages.russian: ruSymptomsNameOralSex,
    Languages.japanese: jaSymptomsNameOralSex,
    Languages.german: deSymptomsNameOralSex,
    Languages.punjabi: paSymptomsNameOralSex,
    Languages.javanese: jvSymptomsNameOralSex,
    Languages.wuChinese: wuuSymptomsNameOralSex,
    Languages.korean: koSymptomsNameOralSex,
    Languages.tamil: taSymptomsNameOralSex,
    Languages.turkish: trSymptomsNameOralSex,
    Languages.urdu: urSymptomsNameOralSex,
    Languages.vietnamese: viSymptomsNameOralSex,
    Languages.italian: itSymptomsNameOralSex,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameAnalSex() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameAnalSex,
    Languages.hindi: hiSymptomsNameAnalSex,
    Languages.arabic: arSymptomsNameAnalSex,
    Languages.spanish: esSymptomsNameAnalSex,
    Languages.mandarin: zhSymptomsNameAnalSex,
    Languages.french: frSymptomsNameAnalSex,
    Languages.bengali: bnSymptomsNameAnalSex,
    Languages.portuguese: ptSymptomsNameAnalSex,
    Languages.russian: ruSymptomsNameAnalSex,
    Languages.japanese: jaSymptomsNameAnalSex,
    Languages.german: deSymptomsNameAnalSex,
    Languages.punjabi: paSymptomsNameAnalSex,
    Languages.javanese: jvSymptomsNameAnalSex,
    Languages.wuChinese: wuuSymptomsNameAnalSex,
    Languages.korean: koSymptomsNameAnalSex,
    Languages.tamil: taSymptomsNameAnalSex,
    Languages.turkish: trSymptomsNameAnalSex,
    Languages.urdu: urSymptomsNameAnalSex,
    Languages.vietnamese: viSymptomsNameAnalSex,
    Languages.italian: itSymptomsNameAnalSex,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameMasturbation() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameMasturbation,
    Languages.hindi: hiSymptomsNameMasturbation,
    Languages.arabic: arSymptomsNameMasturbation,
    Languages.spanish: esSymptomsNameMasturbation,
    Languages.mandarin: zhSymptomsNameMasturbation,
    Languages.french: frSymptomsNameMasturbation,
    Languages.bengali: bnSymptomsNameMasturbation,
    Languages.portuguese: ptSymptomsNameMasturbation,
    Languages.russian: ruSymptomsNameMasturbation,
    Languages.japanese: jaSymptomsNameMasturbation,
    Languages.german: deSymptomsNameMasturbation,
    Languages.punjabi: paSymptomsNameMasturbation,
    Languages.javanese: jvSymptomsNameMasturbation,
    Languages.wuChinese: wuuSymptomsNameMasturbation,
    Languages.korean: koSymptomsNameMasturbation,
    Languages.tamil: taSymptomsNameMasturbation,
    Languages.turkish: trSymptomsNameMasturbation,
    Languages.urdu: urSymptomsNameMasturbation,
    Languages.vietnamese: viSymptomsNameMasturbation,
    Languages.italian: itSymptomsNameMasturbation,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameHighSexDrive() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameHighSexDrive,
    Languages.hindi: hiSymptomsNameHighSexDrive,
    Languages.arabic: arSymptomsNameHighSexDrive,
    Languages.spanish: esSymptomsNameHighSexDrive,
    Languages.mandarin: zhSymptomsNameHighSexDrive,
    Languages.french: frSymptomsNameHighSexDrive,
    Languages.bengali: bnSymptomsNameHighSexDrive,
    Languages.portuguese: ptSymptomsNameHighSexDrive,
    Languages.russian: ruSymptomsNameHighSexDrive,
    Languages.japanese: jaSymptomsNameHighSexDrive,
    Languages.german: deSymptomsNameHighSexDrive,
    Languages.punjabi: paSymptomsNameHighSexDrive,
    Languages.javanese: jvSymptomsNameHighSexDrive,
    Languages.wuChinese: wuuSymptomsNameHighSexDrive,
    Languages.korean: koSymptomsNameHighSexDrive,
    Languages.tamil: taSymptomsNameHighSexDrive,
    Languages.turkish: trSymptomsNameHighSexDrive,
    Languages.urdu: urSymptomsNameHighSexDrive,
    Languages.vietnamese: viSymptomsNameHighSexDrive,
    Languages.italian: itSymptomsNameHighSexDrive,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameNeutralSexDrive() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameNeutralSexDrive,
    Languages.hindi: hiSymptomsNameNeutralSexDrive,
    Languages.arabic: arSymptomsNameNeutralSexDrive,
    Languages.spanish: esSymptomsNameNeutralSexDrive,
    Languages.mandarin: zhSymptomsNameNeutralSexDrive,
    Languages.french: frSymptomsNameNeutralSexDrive,
    Languages.bengali: bnSymptomsNameNeutralSexDrive,
    Languages.portuguese: ptSymptomsNameNeutralSexDrive,
    Languages.russian: ruSymptomsNameNeutralSexDrive,
    Languages.japanese: jaSymptomsNameNeutralSexDrive,
    Languages.german: deSymptomsNameNeutralSexDrive,
    Languages.punjabi: paSymptomsNameNeutralSexDrive,
    Languages.javanese: jvSymptomsNameNeutralSexDrive,
    Languages.wuChinese: wuuSymptomsNameNeutralSexDrive,
    Languages.korean: koSymptomsNameNeutralSexDrive,
    Languages.tamil: taSymptomsNameNeutralSexDrive,
    Languages.turkish: trSymptomsNameNeutralSexDrive,
    Languages.urdu: urSymptomsNameNeutralSexDrive,
    Languages.vietnamese: viSymptomsNameNeutralSexDrive,
    Languages.italian: itSymptomsNameNeutralSexDrive,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameLowSexDrive() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameLowSexDrive,
    Languages.hindi: hiSymptomsNameLowSexDrive,
    Languages.arabic: arSymptomsNameLowSexDrive,
    Languages.spanish: esSymptomsNameLowSexDrive,
    Languages.mandarin: zhSymptomsNameLowSexDrive,
    Languages.french: frSymptomsNameLowSexDrive,
    Languages.bengali: bnSymptomsNameLowSexDrive,
    Languages.portuguese: ptSymptomsNameLowSexDrive,
    Languages.russian: ruSymptomsNameLowSexDrive,
    Languages.japanese: jaSymptomsNameLowSexDrive,
    Languages.german: deSymptomsNameLowSexDrive,
    Languages.punjabi: paSymptomsNameLowSexDrive,
    Languages.javanese: jvSymptomsNameLowSexDrive,
    Languages.wuChinese: wuuSymptomsNameLowSexDrive,
    Languages.korean: koSymptomsNameLowSexDrive,
    Languages.tamil: taSymptomsNameLowSexDrive,
    Languages.turkish: trSymptomsNameLowSexDrive,
    Languages.urdu: urSymptomsNameLowSexDrive,
    Languages.vietnamese: viSymptomsNameLowSexDrive,
    Languages.italian: itSymptomsNameLowSexDrive,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSexToys() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSexToys,
    Languages.hindi: hiSymptomsNameSexToys,
    Languages.arabic: arSymptomsNameSexToys,
    Languages.spanish: esSymptomsNameSexToys,
    Languages.mandarin: zhSymptomsNameSexToys,
    Languages.french: frSymptomsNameSexToys,
    Languages.bengali: bnSymptomsNameSexToys,
    Languages.portuguese: ptSymptomsNameSexToys,
    Languages.russian: ruSymptomsNameSexToys,
    Languages.japanese: jaSymptomsNameSexToys,
    Languages.german: deSymptomsNameSexToys,
    Languages.punjabi: paSymptomsNameSexToys,
    Languages.javanese: jvSymptomsNameSexToys,
    Languages.wuChinese: wuuSymptomsNameSexToys,
    Languages.korean: koSymptomsNameSexToys,
    Languages.tamil: taSymptomsNameSexToys,
    Languages.turkish: trSymptomsNameSexToys,
    Languages.urdu: urSymptomsNameSexToys,
    Languages.vietnamese: viSymptomsNameSexToys,
    Languages.italian: itSymptomsNameSexToys,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameOrgasm() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameOrgasm,
    Languages.hindi: hiSymptomsNameOrgasm,
    Languages.arabic: arSymptomsNameOrgasm,
    Languages.spanish: esSymptomsNameOrgasm,
    Languages.mandarin: zhSymptomsNameOrgasm,
    Languages.french: frSymptomsNameOrgasm,
    Languages.bengali: bnSymptomsNameOrgasm,
    Languages.portuguese: ptSymptomsNameOrgasm,
    Languages.russian: ruSymptomsNameOrgasm,
    Languages.japanese: jaSymptomsNameOrgasm,
    Languages.german: deSymptomsNameOrgasm,
    Languages.punjabi: paSymptomsNameOrgasm,
    Languages.javanese: jvSymptomsNameOrgasm,
    Languages.wuChinese: wuuSymptomsNameOrgasm,
    Languages.korean: koSymptomsNameOrgasm,
    Languages.tamil: taSymptomsNameOrgasm,
    Languages.turkish: trSymptomsNameOrgasm,
    Languages.urdu: urSymptomsNameOrgasm,
    Languages.vietnamese: viSymptomsNameOrgasm,
    Languages.italian: itSymptomsNameOrgasm,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameNoOrgasm() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameNoOrgasm,
    Languages.hindi: hiSymptomsNameNoOrgasm,
    Languages.arabic: arSymptomsNameNoOrgasm,
    Languages.spanish: esSymptomsNameNoOrgasm,
    Languages.mandarin: zhSymptomsNameNoOrgasm,
    Languages.french: frSymptomsNameNoOrgasm,
    Languages.bengali: bnSymptomsNameNoOrgasm,
    Languages.portuguese: ptSymptomsNameNoOrgasm,
    Languages.russian: ruSymptomsNameNoOrgasm,
    Languages.japanese: jaSymptomsNameNoOrgasm,
    Languages.german: deSymptomsNameNoOrgasm,
    Languages.punjabi: paSymptomsNameNoOrgasm,
    Languages.javanese: jvSymptomsNameNoOrgasm,
    Languages.wuChinese: wuuSymptomsNameNoOrgasm,
    Languages.korean: koSymptomsNameNoOrgasm,
    Languages.tamil: taSymptomsNameNoOrgasm,
    Languages.turkish: trSymptomsNameNoOrgasm,
    Languages.urdu: urSymptomsNameNoOrgasm,
    Languages.vietnamese: viSymptomsNameNoOrgasm,
    Languages.italian: itSymptomsNameNoOrgasm,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameEverythingWell() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameEverythingWell,
    Languages.hindi: hiSymptomsNameEverythingWell,
    Languages.arabic: arSymptomsNameEverythingWell,
    Languages.spanish: esSymptomsNameEverythingWell,
    Languages.mandarin: zhSymptomsNameEverythingWell,
    Languages.french: frSymptomsNameEverythingWell,
    Languages.bengali: bnSymptomsNameEverythingWell,
    Languages.portuguese: ptSymptomsNameEverythingWell,
    Languages.russian: ruSymptomsNameEverythingWell,
    Languages.japanese: jaSymptomsNameEverythingWell,
    Languages.german: deSymptomsNameEverythingWell,
    Languages.punjabi: paSymptomsNameEverythingWell,
    Languages.javanese: jvSymptomsNameEverythingWell,
    Languages.wuChinese: wuuSymptomsNameEverythingWell,
    Languages.korean: koSymptomsNameEverythingWell,
    Languages.tamil: taSymptomsNameEverythingWell,
    Languages.turkish: trSymptomsNameEverythingWell,
    Languages.urdu: urSymptomsNameEverythingWell,
    Languages.vietnamese: viSymptomsNameEverythingWell,
    Languages.italian: itSymptomsNameEverythingWell,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameCramps() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameCramps,
    Languages.hindi: hiSymptomsNameCramps,
    Languages.arabic: arSymptomsNameCramps,
    Languages.spanish: esSymptomsNameCramps,
    Languages.mandarin: zhSymptomsNameCramps,
    Languages.french: frSymptomsNameCramps,
    Languages.bengali: bnSymptomsNameCramps,
    Languages.portuguese: ptSymptomsNameCramps,
    Languages.russian: ruSymptomsNameCramps,
    Languages.japanese: jaSymptomsNameCramps,
    Languages.german: deSymptomsNameCramps,
    Languages.punjabi: paSymptomsNameCramps,
    Languages.javanese: jvSymptomsNameCramps,
    Languages.wuChinese: wuuSymptomsNameCramps,
    Languages.korean: koSymptomsNameCramps,
    Languages.tamil: taSymptomsNameCramps,
    Languages.turkish: trSymptomsNameCramps,
    Languages.urdu: urSymptomsNameCramps,
    Languages.vietnamese: viSymptomsNameCramps,
    Languages.italian: itSymptomsNameCramps,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameTenderBreasts() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameTenderBreasts,
    Languages.hindi: hiSymptomsNameTenderBreasts,
    Languages.arabic: arSymptomsNameTenderBreasts,
    Languages.spanish: esSymptomsNameTenderBreasts,
    Languages.mandarin: zhSymptomsNameTenderBreasts,
    Languages.french: frSymptomsNameTenderBreasts,
    Languages.bengali: bnSymptomsNameTenderBreasts,
    Languages.portuguese: ptSymptomsNameTenderBreasts,
    Languages.russian: ruSymptomsNameTenderBreasts,
    Languages.japanese: jaSymptomsNameTenderBreasts,
    Languages.german: deSymptomsNameTenderBreasts,
    Languages.punjabi: paSymptomsNameTenderBreasts,
    Languages.javanese: jvSymptomsNameTenderBreasts,
    Languages.wuChinese: wuuSymptomsNameTenderBreasts,
    Languages.korean: koSymptomsNameTenderBreasts,
    Languages.tamil: taSymptomsNameTenderBreasts,
    Languages.turkish: trSymptomsNameTenderBreasts,
    Languages.urdu: urSymptomsNameTenderBreasts,
    Languages.vietnamese: viSymptomsNameTenderBreasts,
    Languages.italian: itSymptomsNameTenderBreasts,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameHeadache() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameHeadache,
    Languages.hindi: hiSymptomsNameHeadache,
    Languages.arabic: arSymptomsNameHeadache,
    Languages.spanish: esSymptomsNameHeadache,
    Languages.mandarin: zhSymptomsNameHeadache,
    Languages.french: frSymptomsNameHeadache,
    Languages.bengali: bnSymptomsNameHeadache,
    Languages.portuguese: ptSymptomsNameHeadache,
    Languages.russian: ruSymptomsNameHeadache,
    Languages.japanese: jaSymptomsNameHeadache,
    Languages.german: deSymptomsNameHeadache,
    Languages.punjabi: paSymptomsNameHeadache,
    Languages.javanese: jvSymptomsNameHeadache,
    Languages.wuChinese: wuuSymptomsNameHeadache,
    Languages.korean: koSymptomsNameHeadache,
    Languages.tamil: taSymptomsNameHeadache,
    Languages.turkish: trSymptomsNameHeadache,
    Languages.urdu: urSymptomsNameHeadache,
    Languages.vietnamese: viSymptomsNameHeadache,
    Languages.italian: itSymptomsNameHeadache,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameAcne() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameAcne,
    Languages.hindi: hiSymptomsNameAcne,
    Languages.arabic: arSymptomsNameAcne,
    Languages.spanish: esSymptomsNameAcne,
    Languages.mandarin: zhSymptomsNameAcne,
    Languages.french: frSymptomsNameAcne,
    Languages.bengali: bnSymptomsNameAcne,
    Languages.portuguese: ptSymptomsNameAcne,
    Languages.russian: ruSymptomsNameAcne,
    Languages.japanese: jaSymptomsNameAcne,
    Languages.german: deSymptomsNameAcne,
    Languages.punjabi: paSymptomsNameAcne,
    Languages.javanese: jvSymptomsNameAcne,
    Languages.wuChinese: wuuSymptomsNameAcne,
    Languages.korean: koSymptomsNameAcne,
    Languages.tamil: taSymptomsNameAcne,
    Languages.turkish: trSymptomsNameAcne,
    Languages.urdu: urSymptomsNameAcne,
    Languages.vietnamese: viSymptomsNameAcne,
    Languages.italian: itSymptomsNameAcne,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameBackache() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameBackache,
    Languages.hindi: hiSymptomsNameBackache,
    Languages.arabic: arSymptomsNameBackache,
    Languages.spanish: esSymptomsNameBackache,
    Languages.mandarin: zhSymptomsNameBackache,
    Languages.french: frSymptomsNameBackache,
    Languages.bengali: bnSymptomsNameBackache,
    Languages.portuguese: ptSymptomsNameBackache,
    Languages.russian: ruSymptomsNameBackache,
    Languages.japanese: jaSymptomsNameBackache,
    Languages.german: deSymptomsNameBackache,
    Languages.punjabi: paSymptomsNameBackache,
    Languages.javanese: jvSymptomsNameBackache,
    Languages.wuChinese: wuuSymptomsNameBackache,
    Languages.korean: koSymptomsNameBackache,
    Languages.tamil: taSymptomsNameBackache,
    Languages.turkish: trSymptomsNameBackache,
    Languages.urdu: urSymptomsNameBackache,
    Languages.vietnamese: viSymptomsNameBackache,
    Languages.italian: itSymptomsNameBackache,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameAbdominalPain() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameAbdominalPain,
    Languages.hindi: hiSymptomsNameAbdominalPain,
    Languages.arabic: arSymptomsNameAbdominalPain,
    Languages.spanish: esSymptomsNameAbdominalPain,
    Languages.mandarin: zhSymptomsNameAbdominalPain,
    Languages.french: frSymptomsNameAbdominalPain,
    Languages.bengali: bnSymptomsNameAbdominalPain,
    Languages.portuguese: ptSymptomsNameAbdominalPain,
    Languages.russian: ruSymptomsNameAbdominalPain,
    Languages.japanese: jaSymptomsNameAbdominalPain,
    Languages.german: deSymptomsNameAbdominalPain,
    Languages.punjabi: paSymptomsNameAbdominalPain,
    Languages.javanese: jvSymptomsNameAbdominalPain,
    Languages.wuChinese: wuuSymptomsNameAbdominalPain,
    Languages.korean: koSymptomsNameAbdominalPain,
    Languages.tamil: taSymptomsNameAbdominalPain,
    Languages.turkish: trSymptomsNameAbdominalPain,
    Languages.urdu: urSymptomsNameAbdominalPain,
    Languages.vietnamese: viSymptomsNameAbdominalPain,
    Languages.italian: itSymptomsNameAbdominalPain,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameFatigue() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameFatigue,
    Languages.hindi: hiSymptomsNameFatigue,
    Languages.arabic: arSymptomsNameFatigue,
    Languages.spanish: esSymptomsNameFatigue,
    Languages.mandarin: zhSymptomsNameFatigue,
    Languages.french: frSymptomsNameFatigue,
    Languages.bengali: bnSymptomsNameFatigue,
    Languages.portuguese: ptSymptomsNameFatigue,
    Languages.russian: ruSymptomsNameFatigue,
    Languages.japanese: jaSymptomsNameFatigue,
    Languages.german: deSymptomsNameFatigue,
    Languages.punjabi: paSymptomsNameFatigue,
    Languages.javanese: jvSymptomsNameFatigue,
    Languages.wuChinese: wuuSymptomsNameFatigue,
    Languages.korean: koSymptomsNameFatigue,
    Languages.tamil: taSymptomsNameFatigue,
    Languages.turkish: trSymptomsNameFatigue,
    Languages.urdu: urSymptomsNameFatigue,
    Languages.vietnamese: viSymptomsNameFatigue,
    Languages.italian: itSymptomsNameFatigue,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNamePainFree() {
  final logsByLanguage = {
    Languages.english: enSymptomsNamePainFree,
    Languages.hindi: hiSymptomsNamePainFree,
    Languages.arabic: arSymptomsNamePainFree,
    Languages.spanish: esSymptomsNamePainFree,
    Languages.mandarin: zhSymptomsNamePainFree,
    Languages.french: frSymptomsNamePainFree,
    Languages.bengali: bnSymptomsNamePainFree,
    Languages.portuguese: ptSymptomsNamePainFree,
    Languages.russian: ruSymptomsNamePainFree,
    Languages.japanese: jaSymptomsNamePainFree,
    Languages.german: deSymptomsNamePainFree,
    Languages.punjabi: paSymptomsNamePainFree,
    Languages.javanese: jvSymptomsNamePainFree,
    Languages.wuChinese: wuuSymptomsNamePainFree,
    Languages.korean: koSymptomsNamePainFree,
    Languages.tamil: taSymptomsNamePainFree,
    Languages.turkish: trSymptomsNamePainFree,
    Languages.urdu: urSymptomsNamePainFree,
    Languages.vietnamese: viSymptomsNamePainFree,
    Languages.italian: itSymptomsNamePainFree,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNamePeriodCramps() {
  final logsByLanguage = {
    Languages.english: enSymptomsNamePeriodCramps,
    Languages.hindi: hiSymptomsNamePeriodCramps,
    Languages.arabic: arSymptomsNamePeriodCramps,
    Languages.spanish: esSymptomsNamePeriodCramps,
    Languages.mandarin: zhSymptomsNamePeriodCramps,
    Languages.french: frSymptomsNamePeriodCramps,
    Languages.bengali: bnSymptomsNamePeriodCramps,
    Languages.portuguese: ptSymptomsNamePeriodCramps,
    Languages.russian: ruSymptomsNamePeriodCramps,
    Languages.japanese: jaSymptomsNamePeriodCramps,
    Languages.german: deSymptomsNamePeriodCramps,
    Languages.punjabi: paSymptomsNamePeriodCramps,
    Languages.javanese: jvSymptomsNamePeriodCramps,
    Languages.wuChinese: wuuSymptomsNamePeriodCramps,
    Languages.korean: koSymptomsNamePeriodCramps,
    Languages.tamil: taSymptomsNamePeriodCramps,
    Languages.turkish: trSymptomsNamePeriodCramps,
    Languages.urdu: urSymptomsNamePeriodCramps,
    Languages.vietnamese: viSymptomsNamePeriodCramps,
    Languages.italian: itSymptomsNamePeriodCramps,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameOvulation() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameOvulation,
    Languages.hindi: hiSymptomsNameOvulation,
    Languages.arabic: arSymptomsNameOvulation,
    Languages.spanish: esSymptomsNameOvulation,
    Languages.mandarin: zhSymptomsNameOvulation,
    Languages.french: frSymptomsNameOvulation,
    Languages.bengali: bnSymptomsNameOvulation,
    Languages.portuguese: ptSymptomsNameOvulation,
    Languages.russian: ruSymptomsNameOvulation,
    Languages.japanese: jaSymptomsNameOvulation,
    Languages.german: deSymptomsNameOvulation,
    Languages.punjabi: paSymptomsNameOvulation,
    Languages.javanese: jvSymptomsNameOvulation,
    Languages.wuChinese: wuuSymptomsNameOvulation,
    Languages.korean: koSymptomsNameOvulation,
    Languages.tamil: taSymptomsNameOvulation,
    Languages.turkish: trSymptomsNameOvulation,
    Languages.urdu: urSymptomsNameOvulation,
    Languages.vietnamese: viSymptomsNameOvulation,
    Languages.italian: itSymptomsNameOvulation,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameBreastTenderness() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameBreastTenderness,
    Languages.hindi: hiSymptomsNameBreastTenderness,
    Languages.arabic: arSymptomsNameBreastTenderness,
    Languages.spanish: esSymptomsNameBreastTenderness,
    Languages.mandarin: zhSymptomsNameBreastTenderness,
    Languages.french: frSymptomsNameBreastTenderness,
    Languages.bengali: bnSymptomsNameBreastTenderness,
    Languages.portuguese: ptSymptomsNameBreastTenderness,
    Languages.russian: ruSymptomsNameBreastTenderness,
    Languages.japanese: jaSymptomsNameBreastTenderness,
    Languages.german: deSymptomsNameBreastTenderness,
    Languages.punjabi: paSymptomsNameBreastTenderness,
    Languages.javanese: jvSymptomsNameBreastTenderness,
    Languages.wuChinese: wuuSymptomsNameBreastTenderness,
    Languages.korean: koSymptomsNameBreastTenderness,
    Languages.tamil: taSymptomsNameBreastTenderness,
    Languages.turkish: trSymptomsNameBreastTenderness,
    Languages.urdu: urSymptomsNameBreastTenderness,
    Languages.vietnamese: viSymptomsNameBreastTenderness,
    Languages.italian: itSymptomsNameBreastTenderness,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameMigraine() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameMigraine,
    Languages.hindi: hiSymptomsNameMigraine,
    Languages.arabic: arSymptomsNameMigraine,
    Languages.spanish: esSymptomsNameMigraine,
    Languages.mandarin: zhSymptomsNameMigraine,
    Languages.french: frSymptomsNameMigraine,
    Languages.bengali: bnSymptomsNameMigraine,
    Languages.portuguese: ptSymptomsNameMigraine,
    Languages.russian: ruSymptomsNameMigraine,
    Languages.japanese: jaSymptomsNameMigraine,
    Languages.german: deSymptomsNameMigraine,
    Languages.punjabi: paSymptomsNameMigraine,
    Languages.javanese: jvSymptomsNameMigraine,
    Languages.wuChinese: wuuSymptomsNameMigraine,
    Languages.korean: koSymptomsNameMigraine,
    Languages.tamil: taSymptomsNameMigraine,
    Languages.turkish: trSymptomsNameMigraine,
    Languages.urdu: urSymptomsNameMigraine,
    Languages.vietnamese: viSymptomsNameMigraine,
    Languages.italian: itSymptomsNameMigraine,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameMigraineWithAura() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameMigraineWithAura,
    Languages.hindi: hiSymptomsNameMigraineWithAura,
    Languages.arabic: arSymptomsNameMigraineWithAura,
    Languages.spanish: esSymptomsNameMigraineWithAura,
    Languages.mandarin: zhSymptomsNameMigraineWithAura,
    Languages.french: frSymptomsNameMigraineWithAura,
    Languages.bengali: bnSymptomsNameMigraineWithAura,
    Languages.portuguese: ptSymptomsNameMigraineWithAura,
    Languages.russian: ruSymptomsNameMigraineWithAura,
    Languages.japanese: jaSymptomsNameMigraineWithAura,
    Languages.german: deSymptomsNameMigraineWithAura,
    Languages.punjabi: paSymptomsNameMigraineWithAura,
    Languages.javanese: jvSymptomsNameMigraineWithAura,
    Languages.wuChinese: wuuSymptomsNameMigraineWithAura,
    Languages.korean: koSymptomsNameMigraineWithAura,
    Languages.tamil: taSymptomsNameMigraineWithAura,
    Languages.turkish: trSymptomsNameMigraineWithAura,
    Languages.urdu: urSymptomsNameMigraineWithAura,
    Languages.vietnamese: viSymptomsNameMigraineWithAura,
    Languages.italian: itSymptomsNameMigraineWithAura,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameLowerBack() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameLowerBack,
    Languages.hindi: hiSymptomsNameLowerBack,
    Languages.arabic: arSymptomsNameLowerBack,
    Languages.spanish: esSymptomsNameLowerBack,
    Languages.mandarin: zhSymptomsNameLowerBack,
    Languages.french: frSymptomsNameLowerBack,
    Languages.bengali: bnSymptomsNameLowerBack,
    Languages.portuguese: ptSymptomsNameLowerBack,
    Languages.russian: ruSymptomsNameLowerBack,
    Languages.japanese: jaSymptomsNameLowerBack,
    Languages.german: deSymptomsNameLowerBack,
    Languages.punjabi: paSymptomsNameLowerBack,
    Languages.javanese: jvSymptomsNameLowerBack,
    Languages.wuChinese: wuuSymptomsNameLowerBack,
    Languages.korean: koSymptomsNameLowerBack,
    Languages.tamil: taSymptomsNameLowerBack,
    Languages.turkish: trSymptomsNameLowerBack,
    Languages.urdu: urSymptomsNameLowerBack,
    Languages.vietnamese: viSymptomsNameLowerBack,
    Languages.italian: itSymptomsNameLowerBack,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameLeg() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameLeg,
    Languages.hindi: hiSymptomsNameLeg,
    Languages.arabic: arSymptomsNameLeg,
    Languages.spanish: esSymptomsNameLeg,
    Languages.mandarin: zhSymptomsNameLeg,
    Languages.french: frSymptomsNameLeg,
    Languages.bengali: bnSymptomsNameLeg,
    Languages.portuguese: ptSymptomsNameLeg,
    Languages.russian: ruSymptomsNameLeg,
    Languages.japanese: jaSymptomsNameLeg,
    Languages.german: deSymptomsNameLeg,
    Languages.punjabi: paSymptomsNameLeg,
    Languages.javanese: jvSymptomsNameLeg,
    Languages.wuChinese: wuuSymptomsNameLeg,
    Languages.korean: koSymptomsNameLeg,
    Languages.tamil: taSymptomsNameLeg,
    Languages.turkish: trSymptomsNameLeg,
    Languages.urdu: urSymptomsNameLeg,
    Languages.vietnamese: viSymptomsNameLeg,
    Languages.italian: itSymptomsNameLeg,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameJoint() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameJoint,
    Languages.hindi: hiSymptomsNameJoint,
    Languages.arabic: arSymptomsNameJoint,
    Languages.spanish: esSymptomsNameJoint,
    Languages.mandarin: zhSymptomsNameJoint,
    Languages.french: frSymptomsNameJoint,
    Languages.bengali: bnSymptomsNameJoint,
    Languages.portuguese: ptSymptomsNameJoint,
    Languages.russian: ruSymptomsNameJoint,
    Languages.japanese: jaSymptomsNameJoint,
    Languages.german: deSymptomsNameJoint,
    Languages.punjabi: paSymptomsNameJoint,
    Languages.javanese: jvSymptomsNameJoint,
    Languages.wuChinese: wuuSymptomsNameJoint,
    Languages.korean: koSymptomsNameJoint,
    Languages.tamil: taSymptomsNameJoint,
    Languages.turkish: trSymptomsNameJoint,
    Languages.urdu: urSymptomsNameJoint,
    Languages.vietnamese: viSymptomsNameJoint,
    Languages.italian: itSymptomsNameJoint,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameNoDischarge() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameNoDischarge,
    Languages.hindi: hiSymptomsNameNoDischarge,
    Languages.arabic: arSymptomsNameNoDischarge,
    Languages.spanish: esSymptomsNameNoDischarge,
    Languages.mandarin: zhSymptomsNameNoDischarge,
    Languages.french: frSymptomsNameNoDischarge,
    Languages.bengali: bnSymptomsNameNoDischarge,
    Languages.portuguese: ptSymptomsNameNoDischarge,
    Languages.russian: ruSymptomsNameNoDischarge,
    Languages.japanese: jaSymptomsNameNoDischarge,
    Languages.german: deSymptomsNameNoDischarge,
    Languages.punjabi: paSymptomsNameNoDischarge,
    Languages.javanese: jvSymptomsNameNoDischarge,
    Languages.wuChinese: wuuSymptomsNameNoDischarge,
    Languages.korean: koSymptomsNameNoDischarge,
    Languages.tamil: taSymptomsNameNoDischarge,
    Languages.turkish: trSymptomsNameNoDischarge,
    Languages.urdu: urSymptomsNameNoDischarge,
    Languages.vietnamese: viSymptomsNameNoDischarge,
    Languages.italian: itSymptomsNameNoDischarge,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameLightDischarge() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameLightDischarge,
    Languages.hindi: hiSymptomsNameLightDischarge,
    Languages.arabic: arSymptomsNameLightDischarge,
    Languages.spanish: esSymptomsNameLightDischarge,
    Languages.mandarin: zhSymptomsNameLightDischarge,
    Languages.french: frSymptomsNameLightDischarge,
    Languages.bengali: bnSymptomsNameLightDischarge,
    Languages.portuguese: ptSymptomsNameLightDischarge,
    Languages.russian: ruSymptomsNameLightDischarge,
    Languages.japanese: jaSymptomsNameLightDischarge,
    Languages.german: deSymptomsNameLightDischarge,
    Languages.punjabi: paSymptomsNameLightDischarge,
    Languages.javanese: jvSymptomsNameLightDischarge,
    Languages.wuChinese: wuuSymptomsNameLightDischarge,
    Languages.korean: koSymptomsNameLightDischarge,
    Languages.tamil: taSymptomsNameLightDischarge,
    Languages.turkish: trSymptomsNameLightDischarge,
    Languages.urdu: urSymptomsNameLightDischarge,
    Languages.vietnamese: viSymptomsNameLightDischarge,
    Languages.italian: itSymptomsNameLightDischarge,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameCreamy() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameCreamy,
    Languages.hindi: hiSymptomsNameCreamy,
    Languages.arabic: arSymptomsNameCreamy,
    Languages.spanish: esSymptomsNameCreamy,
    Languages.mandarin: zhSymptomsNameCreamy,
    Languages.french: frSymptomsNameCreamy,
    Languages.bengali: bnSymptomsNameCreamy,
    Languages.portuguese: ptSymptomsNameCreamy,
    Languages.russian: ruSymptomsNameCreamy,
    Languages.japanese: jaSymptomsNameCreamy,
    Languages.german: deSymptomsNameCreamy,
    Languages.punjabi: paSymptomsNameCreamy,
    Languages.javanese: jvSymptomsNameCreamy,
    Languages.wuChinese: wuuSymptomsNameCreamy,
    Languages.korean: koSymptomsNameCreamy,
    Languages.tamil: taSymptomsNameCreamy,
    Languages.turkish: trSymptomsNameCreamy,
    Languages.urdu: urSymptomsNameCreamy,
    Languages.vietnamese: viSymptomsNameCreamy,
    Languages.italian: itSymptomsNameCreamy,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameWatery() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameWatery,
    Languages.hindi: hiSymptomsNameWatery,
    Languages.arabic: arSymptomsNameWatery,
    Languages.spanish: esSymptomsNameWatery,
    Languages.mandarin: zhSymptomsNameWatery,
    Languages.french: frSymptomsNameWatery,
    Languages.bengali: bnSymptomsNameWatery,
    Languages.portuguese: ptSymptomsNameWatery,
    Languages.russian: ruSymptomsNameWatery,
    Languages.japanese: jaSymptomsNameWatery,
    Languages.german: deSymptomsNameWatery,
    Languages.punjabi: paSymptomsNameWatery,
    Languages.javanese: jvSymptomsNameWatery,
    Languages.wuChinese: wuuSymptomsNameWatery,
    Languages.korean: koSymptomsNameWatery,
    Languages.tamil: taSymptomsNameWatery,
    Languages.turkish: trSymptomsNameWatery,
    Languages.urdu: urSymptomsNameWatery,
    Languages.vietnamese: viSymptomsNameWatery,
    Languages.italian: itSymptomsNameWatery,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameUnusual() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameUnusual,
    Languages.hindi: hiSymptomsNameUnusual,
    Languages.arabic: arSymptomsNameUnusual,
    Languages.spanish: esSymptomsNameUnusual,
    Languages.mandarin: zhSymptomsNameUnusual,
    Languages.french: frSymptomsNameUnusual,
    Languages.bengali: bnSymptomsNameUnusual,
    Languages.portuguese: ptSymptomsNameUnusual,
    Languages.russian: ruSymptomsNameUnusual,
    Languages.japanese: jaSymptomsNameUnusual,
    Languages.german: deSymptomsNameUnusual,
    Languages.punjabi: paSymptomsNameUnusual,
    Languages.javanese: jvSymptomsNameUnusual,
    Languages.wuChinese: wuuSymptomsNameUnusual,
    Languages.korean: koSymptomsNameUnusual,
    Languages.tamil: taSymptomsNameUnusual,
    Languages.turkish: trSymptomsNameUnusual,
    Languages.urdu: urSymptomsNameUnusual,
    Languages.vietnamese: viSymptomsNameUnusual,
    Languages.italian: itSymptomsNameUnusual,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSpotting() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSpotting,
    Languages.hindi: hiSymptomsNameSpotting,
    Languages.arabic: arSymptomsNameSpotting,
    Languages.spanish: esSymptomsNameSpotting,
    Languages.mandarin: zhSymptomsNameSpotting,
    Languages.french: frSymptomsNameSpotting,
    Languages.bengali: bnSymptomsNameSpotting,
    Languages.portuguese: ptSymptomsNameSpotting,
    Languages.russian: ruSymptomsNameSpotting,
    Languages.japanese: jaSymptomsNameSpotting,
    Languages.german: deSymptomsNameSpotting,
    Languages.punjabi: paSymptomsNameSpotting,
    Languages.javanese: jvSymptomsNameSpotting,
    Languages.wuChinese: wuuSymptomsNameSpotting,
    Languages.korean: koSymptomsNameSpotting,
    Languages.tamil: taSymptomsNameSpotting,
    Languages.turkish: trSymptomsNameSpotting,
    Languages.urdu: urSymptomsNameSpotting,
    Languages.vietnamese: viSymptomsNameSpotting,
    Languages.italian: itSymptomsNameSpotting,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSticky() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSticky,
    Languages.hindi: hiSymptomsNameSticky,
    Languages.arabic: arSymptomsNameSticky,
    Languages.spanish: esSymptomsNameSticky,
    Languages.mandarin: zhSymptomsNameSticky,
    Languages.french: frSymptomsNameSticky,
    Languages.bengali: bnSymptomsNameSticky,
    Languages.portuguese: ptSymptomsNameSticky,
    Languages.russian: ruSymptomsNameSticky,
    Languages.japanese: jaSymptomsNameSticky,
    Languages.german: deSymptomsNameSticky,
    Languages.punjabi: paSymptomsNameSticky,
    Languages.javanese: jvSymptomsNameSticky,
    Languages.wuChinese: wuuSymptomsNameSticky,
    Languages.korean: koSymptomsNameSticky,
    Languages.tamil: taSymptomsNameSticky,
    Languages.turkish: trSymptomsNameSticky,
    Languages.urdu: urSymptomsNameSticky,
    Languages.vietnamese: viSymptomsNameSticky,
    Languages.italian: itSymptomsNameSticky,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameEggWhite() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameEggWhite,
    Languages.hindi: hiSymptomsNameEggWhite,
    Languages.arabic: arSymptomsNameEggWhite,
    Languages.spanish: esSymptomsNameEggWhite,
    Languages.mandarin: zhSymptomsNameEggWhite,
    Languages.french: frSymptomsNameEggWhite,
    Languages.bengali: bnSymptomsNameEggWhite,
    Languages.portuguese: ptSymptomsNameEggWhite,
    Languages.russian: ruSymptomsNameEggWhite,
    Languages.japanese: jaSymptomsNameEggWhite,
    Languages.german: deSymptomsNameEggWhite,
    Languages.punjabi: paSymptomsNameEggWhite,
    Languages.javanese: jvSymptomsNameEggWhite,
    Languages.wuChinese: wuuSymptomsNameEggWhite,
    Languages.korean: koSymptomsNameEggWhite,
    Languages.tamil: taSymptomsNameEggWhite,
    Languages.turkish: trSymptomsNameEggWhite,
    Languages.urdu: urSymptomsNameEggWhite,
    Languages.vietnamese: viSymptomsNameEggWhite,
    Languages.italian: itSymptomsNameEggWhite,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameGray() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameGray,
    Languages.hindi: hiSymptomsNameGray,
    Languages.arabic: arSymptomsNameGray,
    Languages.spanish: esSymptomsNameGray,
    Languages.mandarin: zhSymptomsNameGray,
    Languages.french: frSymptomsNameGray,
    Languages.bengali: bnSymptomsNameGray,
    Languages.portuguese: ptSymptomsNameGray,
    Languages.russian: ruSymptomsNameGray,
    Languages.japanese: jaSymptomsNameGray,
    Languages.german: deSymptomsNameGray,
    Languages.punjabi: paSymptomsNameGray,
    Languages.javanese: jvSymptomsNameGray,
    Languages.wuChinese: wuuSymptomsNameGray,
    Languages.korean: koSymptomsNameGray,
    Languages.tamil: taSymptomsNameGray,
    Languages.turkish: trSymptomsNameGray,
    Languages.urdu: urSymptomsNameGray,
    Languages.vietnamese: viSymptomsNameGray,
    Languages.italian: itSymptomsNameGray,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameGassy() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameGassy,
    Languages.hindi: hiSymptomsNameGassy,
    Languages.arabic: arSymptomsNameGassy,
    Languages.spanish: esSymptomsNameGassy,
    Languages.mandarin: zhSymptomsNameGassy,
    Languages.french: frSymptomsNameGassy,
    Languages.bengali: bnSymptomsNameGassy,
    Languages.portuguese: ptSymptomsNameGassy,
    Languages.russian: ruSymptomsNameGassy,
    Languages.japanese: jaSymptomsNameGassy,
    Languages.german: deSymptomsNameGassy,
    Languages.punjabi: paSymptomsNameGassy,
    Languages.javanese: jvSymptomsNameGassy,
    Languages.wuChinese: wuuSymptomsNameGassy,
    Languages.korean: koSymptomsNameGassy,
    Languages.tamil: taSymptomsNameGassy,
    Languages.turkish: trSymptomsNameGassy,
    Languages.urdu: urSymptomsNameGassy,
    Languages.vietnamese: viSymptomsNameGassy,
    Languages.italian: itSymptomsNameGassy,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameBloating() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameBloating,
    Languages.hindi: hiSymptomsNameBloating,
    Languages.arabic: arSymptomsNameBloating,
    Languages.spanish: esSymptomsNameBloating,
    Languages.mandarin: zhSymptomsNameBloating,
    Languages.french: frSymptomsNameBloating,
    Languages.bengali: bnSymptomsNameBloating,
    Languages.portuguese: ptSymptomsNameBloating,
    Languages.russian: ruSymptomsNameBloating,
    Languages.japanese: jaSymptomsNameBloating,
    Languages.german: deSymptomsNameBloating,
    Languages.punjabi: paSymptomsNameBloating,
    Languages.javanese: jvSymptomsNameBloating,
    Languages.wuChinese: wuuSymptomsNameBloating,
    Languages.korean: koSymptomsNameBloating,
    Languages.tamil: taSymptomsNameBloating,
    Languages.turkish: trSymptomsNameBloating,
    Languages.urdu: urSymptomsNameBloating,
    Languages.vietnamese: viSymptomsNameBloating,
    Languages.italian: itSymptomsNameBloating,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameHeartburn() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameHeartburn,
    Languages.hindi: hiSymptomsNameHeartburn,
    Languages.arabic: arSymptomsNameHeartburn,
    Languages.spanish: esSymptomsNameHeartburn,
    Languages.mandarin: zhSymptomsNameHeartburn,
    Languages.french: frSymptomsNameHeartburn,
    Languages.bengali: bnSymptomsNameHeartburn,
    Languages.portuguese: ptSymptomsNameHeartburn,
    Languages.russian: ruSymptomsNameHeartburn,
    Languages.japanese: jaSymptomsNameHeartburn,
    Languages.german: deSymptomsNameHeartburn,
    Languages.punjabi: paSymptomsNameHeartburn,
    Languages.javanese: jvSymptomsNameHeartburn,
    Languages.wuChinese: wuuSymptomsNameHeartburn,
    Languages.korean: koSymptomsNameHeartburn,
    Languages.tamil: taSymptomsNameHeartburn,
    Languages.turkish: trSymptomsNameHeartburn,
    Languages.urdu: urSymptomsNameHeartburn,
    Languages.vietnamese: viSymptomsNameHeartburn,
    Languages.italian: itSymptomsNameHeartburn,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameNauseous() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameNauseous,
    Languages.hindi: hiSymptomsNameNauseous,
    Languages.arabic: arSymptomsNameNauseous,
    Languages.spanish: esSymptomsNameNauseous,
    Languages.mandarin: zhSymptomsNameNauseous,
    Languages.french: frSymptomsNameNauseous,
    Languages.bengali: bnSymptomsNameNauseous,
    Languages.portuguese: ptSymptomsNameNauseous,
    Languages.russian: ruSymptomsNameNauseous,
    Languages.japanese: jaSymptomsNameNauseous,
    Languages.german: deSymptomsNameNauseous,
    Languages.punjabi: paSymptomsNameNauseous,
    Languages.javanese: jvSymptomsNameNauseous,
    Languages.wuChinese: wuuSymptomsNameNauseous,
    Languages.korean: koSymptomsNameNauseous,
    Languages.tamil: taSymptomsNameNauseous,
    Languages.turkish: trSymptomsNameNauseous,
    Languages.urdu: urSymptomsNameNauseous,
    Languages.vietnamese: viSymptomsNameNauseous,
    Languages.italian: itSymptomsNameNauseous,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameVomiting() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameVomiting,
    Languages.hindi: hiSymptomsNameVomiting,
    Languages.arabic: arSymptomsNameVomiting,
    Languages.spanish: esSymptomsNameVomiting,
    Languages.mandarin: zhSymptomsNameVomiting,
    Languages.french: frSymptomsNameVomiting,
    Languages.bengali: bnSymptomsNameVomiting,
    Languages.portuguese: ptSymptomsNameVomiting,
    Languages.russian: ruSymptomsNameVomiting,
    Languages.japanese: jaSymptomsNameVomiting,
    Languages.german: deSymptomsNameVomiting,
    Languages.punjabi: paSymptomsNameVomiting,
    Languages.javanese: jvSymptomsNameVomiting,
    Languages.wuChinese: wuuSymptomsNameVomiting,
    Languages.korean: koSymptomsNameVomiting,
    Languages.tamil: taSymptomsNameVomiting,
    Languages.turkish: trSymptomsNameVomiting,
    Languages.urdu: urSymptomsNameVomiting,
    Languages.vietnamese: viSymptomsNameVomiting,
    Languages.italian: itSymptomsNameVomiting,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameYoga() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameYoga,
    Languages.hindi: hiSymptomsNameYoga,
    Languages.arabic: arSymptomsNameYoga,
    Languages.spanish: esSymptomsNameYoga,
    Languages.mandarin: zhSymptomsNameYoga,
    Languages.french: frSymptomsNameYoga,
    Languages.bengali: bnSymptomsNameYoga,
    Languages.portuguese: ptSymptomsNameYoga,
    Languages.russian: ruSymptomsNameYoga,
    Languages.japanese: jaSymptomsNameYoga,
    Languages.german: deSymptomsNameYoga,
    Languages.punjabi: paSymptomsNameYoga,
    Languages.javanese: jvSymptomsNameYoga,
    Languages.wuChinese: wuuSymptomsNameYoga,
    Languages.korean: koSymptomsNameYoga,
    Languages.tamil: taSymptomsNameYoga,
    Languages.turkish: trSymptomsNameYoga,
    Languages.urdu: urSymptomsNameYoga,
    Languages.vietnamese: viSymptomsNameYoga,
    Languages.italian: itSymptomsNameYoga,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameRunning() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameRunning,
    Languages.hindi: hiSymptomsNameRunning,
    Languages.arabic: arSymptomsNameRunning,
    Languages.spanish: esSymptomsNameRunning,
    Languages.mandarin: zhSymptomsNameRunning,
    Languages.french: frSymptomsNameRunning,
    Languages.bengali: bnSymptomsNameRunning,
    Languages.portuguese: ptSymptomsNameRunning,
    Languages.russian: ruSymptomsNameRunning,
    Languages.japanese: jaSymptomsNameRunning,
    Languages.german: deSymptomsNameRunning,
    Languages.punjabi: paSymptomsNameRunning,
    Languages.javanese: jvSymptomsNameRunning,
    Languages.wuChinese: wuuSymptomsNameRunning,
    Languages.korean: koSymptomsNameRunning,
    Languages.tamil: taSymptomsNameRunning,
    Languages.turkish: trSymptomsNameRunning,
    Languages.urdu: urSymptomsNameRunning,
    Languages.vietnamese: viSymptomsNameRunning,
    Languages.italian: itSymptomsNameRunning,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameGym() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameGym,
    Languages.hindi: hiSymptomsNameGym,
    Languages.arabic: arSymptomsNameGym,
    Languages.spanish: esSymptomsNameGym,
    Languages.mandarin: zhSymptomsNameGym,
    Languages.french: frSymptomsNameGym,
    Languages.bengali: bnSymptomsNameGym,
    Languages.portuguese: ptSymptomsNameGym,
    Languages.russian: ruSymptomsNameGym,
    Languages.japanese: jaSymptomsNameGym,
    Languages.german: deSymptomsNameGym,
    Languages.punjabi: paSymptomsNameGym,
    Languages.javanese: jvSymptomsNameGym,
    Languages.wuChinese: wuuSymptomsNameGym,
    Languages.korean: koSymptomsNameGym,
    Languages.tamil: taSymptomsNameGym,
    Languages.turkish: trSymptomsNameGym,
    Languages.urdu: urSymptomsNameGym,
    Languages.vietnamese: viSymptomsNameGym,
    Languages.italian: itSymptomsNameGym,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSwimming() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSwimming,
    Languages.hindi: hiSymptomsNameSwimming,
    Languages.arabic: arSymptomsNameSwimming,
    Languages.spanish: esSymptomsNameSwimming,
    Languages.mandarin: zhSymptomsNameSwimming,
    Languages.french: frSymptomsNameSwimming,
    Languages.bengali: bnSymptomsNameSwimming,
    Languages.portuguese: ptSymptomsNameSwimming,
    Languages.russian: ruSymptomsNameSwimming,
    Languages.japanese: jaSymptomsNameSwimming,
    Languages.german: deSymptomsNameSwimming,
    Languages.punjabi: paSymptomsNameSwimming,
    Languages.javanese: jvSymptomsNameSwimming,
    Languages.wuChinese: wuuSymptomsNameSwimming,
    Languages.korean: koSymptomsNameSwimming,
    Languages.tamil: taSymptomsNameSwimming,
    Languages.turkish: trSymptomsNameSwimming,
    Languages.urdu: urSymptomsNameSwimming,
    Languages.vietnamese: viSymptomsNameSwimming,
    Languages.italian: itSymptomsNameSwimming,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameCycling() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameCycling,
    Languages.hindi: hiSymptomsNameCycling,
    Languages.arabic: arSymptomsNameCycling,
    Languages.spanish: esSymptomsNameCycling,
    Languages.mandarin: zhSymptomsNameCycling,
    Languages.french: frSymptomsNameCycling,
    Languages.bengali: bnSymptomsNameCycling,
    Languages.portuguese: ptSymptomsNameCycling,
    Languages.russian: ruSymptomsNameCycling,
    Languages.japanese: jaSymptomsNameCycling,
    Languages.german: deSymptomsNameCycling,
    Languages.punjabi: paSymptomsNameCycling,
    Languages.javanese: jvSymptomsNameCycling,
    Languages.wuChinese: wuuSymptomsNameCycling,
    Languages.korean: koSymptomsNameCycling,
    Languages.tamil: taSymptomsNameCycling,
    Languages.turkish: trSymptomsNameCycling,
    Languages.urdu: urSymptomsNameCycling,
    Languages.vietnamese: viSymptomsNameCycling,
    Languages.italian: itSymptomsNameCycling,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameWalking() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameWalking,
    Languages.hindi: hiSymptomsNameWalking,
    Languages.arabic: arSymptomsNameWalking,
    Languages.spanish: esSymptomsNameWalking,
    Languages.mandarin: zhSymptomsNameWalking,
    Languages.french: frSymptomsNameWalking,
    Languages.bengali: bnSymptomsNameWalking,
    Languages.portuguese: ptSymptomsNameWalking,
    Languages.russian: ruSymptomsNameWalking,
    Languages.japanese: jaSymptomsNameWalking,
    Languages.german: deSymptomsNameWalking,
    Languages.punjabi: paSymptomsNameWalking,
    Languages.javanese: jvSymptomsNameWalking,
    Languages.wuChinese: wuuSymptomsNameWalking,
    Languages.korean: koSymptomsNameWalking,
    Languages.tamil: taSymptomsNameWalking,
    Languages.turkish: trSymptomsNameWalking,
    Languages.urdu: urSymptomsNameWalking,
    Languages.vietnamese: viSymptomsNameWalking,
    Languages.italian: itSymptomsNameWalking,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNamePilates() {
  final logsByLanguage = {
    Languages.english: enSymptomsNamePilates,
    Languages.hindi: hiSymptomsNamePilates,
    Languages.arabic: arSymptomsNamePilates,
    Languages.spanish: esSymptomsNamePilates,
    Languages.mandarin: zhSymptomsNamePilates,
    Languages.french: frSymptomsNamePilates,
    Languages.bengali: bnSymptomsNamePilates,
    Languages.portuguese: ptSymptomsNamePilates,
    Languages.russian: ruSymptomsNamePilates,
    Languages.japanese: jaSymptomsNamePilates,
    Languages.german: deSymptomsNamePilates,
    Languages.punjabi: paSymptomsNamePilates,
    Languages.javanese: jvSymptomsNamePilates,
    Languages.wuChinese: wuuSymptomsNamePilates,
    Languages.korean: koSymptomsNamePilates,
    Languages.tamil: taSymptomsNamePilates,
    Languages.turkish: trSymptomsNamePilates,
    Languages.urdu: urSymptomsNamePilates,
    Languages.vietnamese: viSymptomsNamePilates,
    Languages.italian: itSymptomsNamePilates,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameStrengthTraining() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameStrengthTraining,
    Languages.hindi: hiSymptomsNameStrengthTraining,
    Languages.arabic: arSymptomsNameStrengthTraining,
    Languages.spanish: esSymptomsNameStrengthTraining,
    Languages.mandarin: zhSymptomsNameStrengthTraining,
    Languages.french: frSymptomsNameStrengthTraining,
    Languages.bengali: bnSymptomsNameStrengthTraining,
    Languages.portuguese: ptSymptomsNameStrengthTraining,
    Languages.russian: ruSymptomsNameStrengthTraining,
    Languages.japanese: jaSymptomsNameStrengthTraining,
    Languages.german: deSymptomsNameStrengthTraining,
    Languages.punjabi: paSymptomsNameStrengthTraining,
    Languages.javanese: jvSymptomsNameStrengthTraining,
    Languages.wuChinese: wuuSymptomsNameStrengthTraining,
    Languages.korean: koSymptomsNameStrengthTraining,
    Languages.tamil: taSymptomsNameStrengthTraining,
    Languages.turkish: trSymptomsNameStrengthTraining,
    Languages.urdu: urSymptomsNameStrengthTraining,
    Languages.vietnamese: viSymptomsNameStrengthTraining,
    Languages.italian: itSymptomsNameStrengthTraining,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameStretching() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameStretching,
    Languages.hindi: hiSymptomsNameStretching,
    Languages.arabic: arSymptomsNameStretching,
    Languages.spanish: esSymptomsNameStretching,
    Languages.mandarin: zhSymptomsNameStretching,
    Languages.french: frSymptomsNameStretching,
    Languages.bengali: bnSymptomsNameStretching,
    Languages.portuguese: ptSymptomsNameStretching,
    Languages.russian: ruSymptomsNameStretching,
    Languages.japanese: jaSymptomsNameStretching,
    Languages.german: deSymptomsNameStretching,
    Languages.punjabi: paSymptomsNameStretching,
    Languages.javanese: jvSymptomsNameStretching,
    Languages.wuChinese: wuuSymptomsNameStretching,
    Languages.korean: koSymptomsNameStretching,
    Languages.tamil: taSymptomsNameStretching,
    Languages.turkish: trSymptomsNameStretching,
    Languages.urdu: urSymptomsNameStretching,
    Languages.vietnamese: viSymptomsNameStretching,
    Languages.italian: itSymptomsNameStretching,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameRestDay() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameRestDay,
    Languages.hindi: hiSymptomsNameRestDay,
    Languages.arabic: arSymptomsNameRestDay,
    Languages.spanish: esSymptomsNameRestDay,
    Languages.mandarin: zhSymptomsNameRestDay,
    Languages.french: frSymptomsNameRestDay,
    Languages.bengali: bnSymptomsNameRestDay,
    Languages.portuguese: ptSymptomsNameRestDay,
    Languages.russian: ruSymptomsNameRestDay,
    Languages.japanese: jaSymptomsNameRestDay,
    Languages.german: deSymptomsNameRestDay,
    Languages.punjabi: paSymptomsNameRestDay,
    Languages.javanese: jvSymptomsNameRestDay,
    Languages.wuChinese: wuuSymptomsNameRestDay,
    Languages.korean: koSymptomsNameRestDay,
    Languages.tamil: taSymptomsNameRestDay,
    Languages.turkish: trSymptomsNameRestDay,
    Languages.urdu: urSymptomsNameRestDay,
    Languages.vietnamese: viSymptomsNameRestDay,
    Languages.italian: itSymptomsNameRestDay,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameMeditation() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameMeditation,
    Languages.hindi: hiSymptomsNameMeditation,
    Languages.arabic: arSymptomsNameMeditation,
    Languages.spanish: esSymptomsNameMeditation,
    Languages.mandarin: zhSymptomsNameMeditation,
    Languages.french: frSymptomsNameMeditation,
    Languages.bengali: bnSymptomsNameMeditation,
    Languages.portuguese: ptSymptomsNameMeditation,
    Languages.russian: ruSymptomsNameMeditation,
    Languages.japanese: jaSymptomsNameMeditation,
    Languages.german: deSymptomsNameMeditation,
    Languages.punjabi: paSymptomsNameMeditation,
    Languages.javanese: jvSymptomsNameMeditation,
    Languages.wuChinese: wuuSymptomsNameMeditation,
    Languages.korean: koSymptomsNameMeditation,
    Languages.tamil: taSymptomsNameMeditation,
    Languages.turkish: trSymptomsNameMeditation,
    Languages.urdu: urSymptomsNameMeditation,
    Languages.vietnamese: viSymptomsNameMeditation,
    Languages.italian: itSymptomsNameMeditation,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSweet() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSweet,
    Languages.hindi: hiSymptomsNameSweet,
    Languages.arabic: arSymptomsNameSweet,
    Languages.spanish: esSymptomsNameSweet,
    Languages.mandarin: zhSymptomsNameSweet,
    Languages.french: frSymptomsNameSweet,
    Languages.bengali: bnSymptomsNameSweet,
    Languages.portuguese: ptSymptomsNameSweet,
    Languages.russian: ruSymptomsNameSweet,
    Languages.japanese: jaSymptomsNameSweet,
    Languages.german: deSymptomsNameSweet,
    Languages.punjabi: paSymptomsNameSweet,
    Languages.javanese: jvSymptomsNameSweet,
    Languages.wuChinese: wuuSymptomsNameSweet,
    Languages.korean: koSymptomsNameSweet,
    Languages.tamil: taSymptomsNameSweet,
    Languages.turkish: trSymptomsNameSweet,
    Languages.urdu: urSymptomsNameSweet,
    Languages.vietnamese: viSymptomsNameSweet,
    Languages.italian: itSymptomsNameSweet,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSalty() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSalty,
    Languages.hindi: hiSymptomsNameSalty,
    Languages.arabic: arSymptomsNameSalty,
    Languages.spanish: esSymptomsNameSalty,
    Languages.mandarin: zhSymptomsNameSalty,
    Languages.french: frSymptomsNameSalty,
    Languages.bengali: bnSymptomsNameSalty,
    Languages.portuguese: ptSymptomsNameSalty,
    Languages.russian: ruSymptomsNameSalty,
    Languages.japanese: jaSymptomsNameSalty,
    Languages.german: deSymptomsNameSalty,
    Languages.punjabi: paSymptomsNameSalty,
    Languages.javanese: jvSymptomsNameSalty,
    Languages.wuChinese: wuuSymptomsNameSalty,
    Languages.korean: koSymptomsNameSalty,
    Languages.tamil: taSymptomsNameSalty,
    Languages.turkish: trSymptomsNameSalty,
    Languages.urdu: urSymptomsNameSalty,
    Languages.vietnamese: viSymptomsNameSalty,
    Languages.italian: itSymptomsNameSalty,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameGreasy() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameGreasy,
    Languages.hindi: hiSymptomsNameGreasy,
    Languages.arabic: arSymptomsNameGreasy,
    Languages.spanish: esSymptomsNameGreasy,
    Languages.mandarin: zhSymptomsNameGreasy,
    Languages.french: frSymptomsNameGreasy,
    Languages.bengali: bnSymptomsNameGreasy,
    Languages.portuguese: ptSymptomsNameGreasy,
    Languages.russian: ruSymptomsNameGreasy,
    Languages.japanese: jaSymptomsNameGreasy,
    Languages.german: deSymptomsNameGreasy,
    Languages.punjabi: paSymptomsNameGreasy,
    Languages.javanese: jvSymptomsNameGreasy,
    Languages.wuChinese: wuuSymptomsNameGreasy,
    Languages.korean: koSymptomsNameGreasy,
    Languages.tamil: taSymptomsNameGreasy,
    Languages.turkish: trSymptomsNameGreasy,
    Languages.urdu: urSymptomsNameGreasy,
    Languages.vietnamese: viSymptomsNameGreasy,
    Languages.italian: itSymptomsNameGreasy,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSpicy() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSpicy,
    Languages.hindi: hiSymptomsNameSpicy,
    Languages.arabic: arSymptomsNameSpicy,
    Languages.spanish: esSymptomsNameSpicy,
    Languages.mandarin: zhSymptomsNameSpicy,
    Languages.french: frSymptomsNameSpicy,
    Languages.bengali: bnSymptomsNameSpicy,
    Languages.portuguese: ptSymptomsNameSpicy,
    Languages.russian: ruSymptomsNameSpicy,
    Languages.japanese: jaSymptomsNameSpicy,
    Languages.german: deSymptomsNameSpicy,
    Languages.punjabi: paSymptomsNameSpicy,
    Languages.javanese: jvSymptomsNameSpicy,
    Languages.wuChinese: wuuSymptomsNameSpicy,
    Languages.korean: koSymptomsNameSpicy,
    Languages.tamil: taSymptomsNameSpicy,
    Languages.turkish: trSymptomsNameSpicy,
    Languages.urdu: urSymptomsNameSpicy,
    Languages.vietnamese: viSymptomsNameSpicy,
    Languages.italian: itSymptomsNameSpicy,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameCarbs() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameCarbs,
    Languages.hindi: hiSymptomsNameCarbs,
    Languages.arabic: arSymptomsNameCarbs,
    Languages.spanish: esSymptomsNameCarbs,
    Languages.mandarin: zhSymptomsNameCarbs,
    Languages.french: frSymptomsNameCarbs,
    Languages.bengali: bnSymptomsNameCarbs,
    Languages.portuguese: ptSymptomsNameCarbs,
    Languages.russian: ruSymptomsNameCarbs,
    Languages.japanese: jaSymptomsNameCarbs,
    Languages.german: deSymptomsNameCarbs,
    Languages.punjabi: paSymptomsNameCarbs,
    Languages.javanese: jvSymptomsNameCarbs,
    Languages.wuChinese: wuuSymptomsNameCarbs,
    Languages.korean: koSymptomsNameCarbs,
    Languages.tamil: taSymptomsNameCarbs,
    Languages.turkish: trSymptomsNameCarbs,
    Languages.urdu: urSymptomsNameCarbs,
    Languages.vietnamese: viSymptomsNameCarbs,
    Languages.italian: itSymptomsNameCarbs,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameDontTakeTest() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameDontTakeTest,
    Languages.hindi: hiSymptomsNameDontTakeTest,
    Languages.arabic: arSymptomsNameDontTakeTest,
    Languages.spanish: esSymptomsNameDontTakeTest,
    Languages.mandarin: zhSymptomsNameDontTakeTest,
    Languages.french: frSymptomsNameDontTakeTest,
    Languages.bengali: bnSymptomsNameDontTakeTest,
    Languages.portuguese: ptSymptomsNameDontTakeTest,
    Languages.russian: ruSymptomsNameDontTakeTest,
    Languages.japanese: jaSymptomsNameDontTakeTest,
    Languages.german: deSymptomsNameDontTakeTest,
    Languages.punjabi: paSymptomsNameDontTakeTest,
    Languages.javanese: jvSymptomsNameDontTakeTest,
    Languages.wuChinese: wuuSymptomsNameDontTakeTest,
    Languages.korean: koSymptomsNameDontTakeTest,
    Languages.tamil: taSymptomsNameDontTakeTest,
    Languages.turkish: trSymptomsNameDontTakeTest,
    Languages.urdu: urSymptomsNameDontTakeTest,
    Languages.vietnamese: viSymptomsNameDontTakeTest,
    Languages.italian: itSymptomsNameDontTakeTest,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameNegative() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameNegative,
    Languages.hindi: hiSymptomsNameNegative,
    Languages.arabic: arSymptomsNameNegative,
    Languages.spanish: esSymptomsNameNegative,
    Languages.mandarin: zhSymptomsNameNegative,
    Languages.french: frSymptomsNameNegative,
    Languages.bengali: bnSymptomsNameNegative,
    Languages.portuguese: ptSymptomsNameNegative,
    Languages.russian: ruSymptomsNameNegative,
    Languages.japanese: jaSymptomsNameNegative,
    Languages.german: deSymptomsNameNegative,
    Languages.punjabi: paSymptomsNameNegative,
    Languages.javanese: jvSymptomsNameNegative,
    Languages.wuChinese: wuuSymptomsNameNegative,
    Languages.korean: koSymptomsNameNegative,
    Languages.tamil: taSymptomsNameNegative,
    Languages.turkish: trSymptomsNameNegative,
    Languages.urdu: urSymptomsNameNegative,
    Languages.vietnamese: viSymptomsNameNegative,
    Languages.italian: itSymptomsNameNegative,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNamePositive() {
  final logsByLanguage = {
    Languages.english: enSymptomsNamePositive,
    Languages.hindi: hiSymptomsNamePositive,
    Languages.arabic: arSymptomsNamePositive,
    Languages.spanish: esSymptomsNamePositive,
    Languages.mandarin: zhSymptomsNamePositive,
    Languages.french: frSymptomsNamePositive,
    Languages.bengali: bnSymptomsNamePositive,
    Languages.portuguese: ptSymptomsNamePositive,
    Languages.russian: ruSymptomsNamePositive,
    Languages.japanese: jaSymptomsNamePositive,
    Languages.german: deSymptomsNamePositive,
    Languages.punjabi: paSymptomsNamePositive,
    Languages.javanese: jvSymptomsNamePositive,
    Languages.wuChinese: wuuSymptomsNamePositive,
    Languages.korean: koSymptomsNamePositive,
    Languages.tamil: taSymptomsNamePositive,
    Languages.turkish: trSymptomsNamePositive,
    Languages.urdu: urSymptomsNamePositive,
    Languages.vietnamese: viSymptomsNamePositive,
    Languages.italian: itSymptomsNamePositive,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameColdOrFlu() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameColdOrFlu,
    Languages.hindi: hiSymptomsNameColdOrFlu,
    Languages.arabic: arSymptomsNameColdOrFlu,
    Languages.spanish: esSymptomsNameColdOrFlu,
    Languages.mandarin: zhSymptomsNameColdOrFlu,
    Languages.french: frSymptomsNameColdOrFlu,
    Languages.bengali: bnSymptomsNameColdOrFlu,
    Languages.portuguese: ptSymptomsNameColdOrFlu,
    Languages.russian: ruSymptomsNameColdOrFlu,
    Languages.japanese: jaSymptomsNameColdOrFlu,
    Languages.german: deSymptomsNameColdOrFlu,
    Languages.punjabi: paSymptomsNameColdOrFlu,
    Languages.javanese: jvSymptomsNameColdOrFlu,
    Languages.wuChinese: wuuSymptomsNameColdOrFlu,
    Languages.korean: koSymptomsNameColdOrFlu,
    Languages.tamil: taSymptomsNameColdOrFlu,
    Languages.turkish: trSymptomsNameColdOrFlu,
    Languages.urdu: urSymptomsNameColdOrFlu,
    Languages.vietnamese: viSymptomsNameColdOrFlu,
    Languages.italian: itSymptomsNameColdOrFlu,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameAllergy() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameAllergy,
    Languages.hindi: hiSymptomsNameAllergy,
    Languages.arabic: arSymptomsNameAllergy,
    Languages.spanish: esSymptomsNameAllergy,
    Languages.mandarin: zhSymptomsNameAllergy,
    Languages.french: frSymptomsNameAllergy,
    Languages.bengali: bnSymptomsNameAllergy,
    Languages.portuguese: ptSymptomsNameAllergy,
    Languages.russian: ruSymptomsNameAllergy,
    Languages.japanese: jaSymptomsNameAllergy,
    Languages.german: deSymptomsNameAllergy,
    Languages.punjabi: paSymptomsNameAllergy,
    Languages.javanese: jvSymptomsNameAllergy,
    Languages.wuChinese: wuuSymptomsNameAllergy,
    Languages.korean: koSymptomsNameAllergy,
    Languages.tamil: taSymptomsNameAllergy,
    Languages.turkish: trSymptomsNameAllergy,
    Languages.urdu: urSymptomsNameAllergy,
    Languages.vietnamese: viSymptomsNameAllergy,
    Languages.italian: itSymptomsNameAllergy,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameFever() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameFever,
    Languages.hindi: hiSymptomsNameFever,
    Languages.arabic: arSymptomsNameFever,
    Languages.spanish: esSymptomsNameFever,
    Languages.mandarin: zhSymptomsNameFever,
    Languages.french: frSymptomsNameFever,
    Languages.bengali: bnSymptomsNameFever,
    Languages.portuguese: ptSymptomsNameFever,
    Languages.russian: ruSymptomsNameFever,
    Languages.japanese: jaSymptomsNameFever,
    Languages.german: deSymptomsNameFever,
    Languages.punjabi: paSymptomsNameFever,
    Languages.javanese: jvSymptomsNameFever,
    Languages.wuChinese: wuuSymptomsNameFever,
    Languages.korean: koSymptomsNameFever,
    Languages.tamil: taSymptomsNameFever,
    Languages.turkish: trSymptomsNameFever,
    Languages.urdu: urSymptomsNameFever,
    Languages.vietnamese: viSymptomsNameFever,
    Languages.italian: itSymptomsNameFever,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameUTI() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameUTI,
    Languages.hindi: hiSymptomsNameUTI,
    Languages.arabic: arSymptomsNameUTI,
    Languages.spanish: esSymptomsNameUTI,
    Languages.mandarin: zhSymptomsNameUTI,
    Languages.french: frSymptomsNameUTI,
    Languages.bengali: bnSymptomsNameUTI,
    Languages.portuguese: ptSymptomsNameUTI,
    Languages.russian: ruSymptomsNameUTI,
    Languages.japanese: jaSymptomsNameUTI,
    Languages.german: deSymptomsNameUTI,
    Languages.punjabi: paSymptomsNameUTI,
    Languages.javanese: jvSymptomsNameUTI,
    Languages.wuChinese: wuuSymptomsNameUTI,
    Languages.korean: koSymptomsNameUTI,
    Languages.tamil: taSymptomsNameUTI,
    Languages.turkish: trSymptomsNameUTI,
    Languages.urdu: urSymptomsNameUTI,
    Languages.vietnamese: viSymptomsNameUTI,
    Languages.italian: itSymptomsNameUTI,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSTI() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSTI,
    Languages.hindi: hiSymptomsNameSTI,
    Languages.arabic: arSymptomsNameSTI,
    Languages.spanish: esSymptomsNameSTI,
    Languages.mandarin: zhSymptomsNameSTI,
    Languages.french: frSymptomsNameSTI,
    Languages.bengali: bnSymptomsNameSTI,
    Languages.portuguese: ptSymptomsNameSTI,
    Languages.russian: ruSymptomsNameSTI,
    Languages.japanese: jaSymptomsNameSTI,
    Languages.german: deSymptomsNameSTI,
    Languages.punjabi: paSymptomsNameSTI,
    Languages.javanese: jvSymptomsNameSTI,
    Languages.wuChinese: wuuSymptomsNameSTI,
    Languages.korean: koSymptomsNameSTI,
    Languages.tamil: taSymptomsNameSTI,
    Languages.turkish: trSymptomsNameSTI,
    Languages.urdu: urSymptomsNameSTI,
    Languages.vietnamese: viSymptomsNameSTI,
    Languages.italian: itSymptomsNameSTI,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameGYN() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameGYN,
    Languages.hindi: hiSymptomsNameGYN,
    Languages.arabic: arSymptomsNameGYN,
    Languages.spanish: esSymptomsNameGYN,
    Languages.mandarin: zhSymptomsNameGYN,
    Languages.french: frSymptomsNameGYN,
    Languages.bengali: bnSymptomsNameGYN,
    Languages.portuguese: ptSymptomsNameGYN,
    Languages.russian: ruSymptomsNameGYN,
    Languages.japanese: jaSymptomsNameGYN,
    Languages.german: deSymptomsNameGYN,
    Languages.punjabi: paSymptomsNameGYN,
    Languages.javanese: jvSymptomsNameGYN,
    Languages.wuChinese: wuuSymptomsNameGYN,
    Languages.korean: koSymptomsNameGYN,
    Languages.tamil: taSymptomsNameGYN,
    Languages.turkish: trSymptomsNameGYN,
    Languages.urdu: urSymptomsNameGYN,
    Languages.vietnamese: viSymptomsNameGYN,
    Languages.italian: itSymptomsNameGYN,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNamePAPSmear() {
  final logsByLanguage = {
    Languages.english: enSymptomsNamePAPSmear,
    Languages.hindi: hiSymptomsNamePAPSmear,
    Languages.arabic: arSymptomsNamePAPSmear,
    Languages.spanish: esSymptomsNamePAPSmear,
    Languages.mandarin: zhSymptomsNamePAPSmear,
    Languages.french: frSymptomsNamePAPSmear,
    Languages.bengali: bnSymptomsNamePAPSmear,
    Languages.portuguese: ptSymptomsNamePAPSmear,
    Languages.russian: ruSymptomsNamePAPSmear,
    Languages.japanese: jaSymptomsNamePAPSmear,
    Languages.german: deSymptomsNamePAPSmear,
    Languages.punjabi: paSymptomsNamePAPSmear,
    Languages.javanese: jvSymptomsNamePAPSmear,
    Languages.wuChinese: wuuSymptomsNamePAPSmear,
    Languages.korean: koSymptomsNamePAPSmear,
    Languages.tamil: taSymptomsNamePAPSmear,
    Languages.turkish: trSymptomsNamePAPSmear,
    Languages.urdu: urSymptomsNamePAPSmear,
    Languages.vietnamese: viSymptomsNamePAPSmear,
    Languages.italian: itSymptomsNamePAPSmear,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSTICheckUp() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSTICheckUp,
    Languages.hindi: hiSymptomsNameSTICheckUp,
    Languages.arabic: arSymptomsNameSTICheckUp,
    Languages.spanish: esSymptomsNameSTICheckUp,
    Languages.mandarin: zhSymptomsNameSTICheckUp,
    Languages.french: frSymptomsNameSTICheckUp,
    Languages.bengali: bnSymptomsNameSTICheckUp,
    Languages.portuguese: ptSymptomsNameSTICheckUp,
    Languages.russian: ruSymptomsNameSTICheckUp,
    Languages.japanese: jaSymptomsNameSTICheckUp,
    Languages.german: deSymptomsNameSTICheckUp,
    Languages.punjabi: paSymptomsNameSTICheckUp,
    Languages.javanese: jvSymptomsNameSTICheckUp,
    Languages.wuChinese: wuuSymptomsNameSTICheckUp,
    Languages.korean: koSymptomsNameSTICheckUp,
    Languages.tamil: taSymptomsNameSTICheckUp,
    Languages.turkish: trSymptomsNameSTICheckUp,
    Languages.urdu: urSymptomsNameSTICheckUp,
    Languages.vietnamese: viSymptomsNameSTICheckUp,
    Languages.italian: itSymptomsNameSTICheckUp,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameGeneralCheckUp() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameGeneralCheckUp,
    Languages.hindi: hiSymptomsNameGeneralCheckUp,
    Languages.arabic: arSymptomsNameGeneralCheckUp,
    Languages.spanish: esSymptomsNameGeneralCheckUp,
    Languages.mandarin: zhSymptomsNameGeneralCheckUp,
    Languages.french: frSymptomsNameGeneralCheckUp,
    Languages.bengali: bnSymptomsNameGeneralCheckUp,
    Languages.portuguese: ptSymptomsNameGeneralCheckUp,
    Languages.russian: ruSymptomsNameGeneralCheckUp,
    Languages.japanese: jaSymptomsNameGeneralCheckUp,
    Languages.german: deSymptomsNameGeneralCheckUp,
    Languages.punjabi: paSymptomsNameGeneralCheckUp,
    Languages.javanese: jvSymptomsNameGeneralCheckUp,
    Languages.wuChinese: wuuSymptomsNameGeneralCheckUp,
    Languages.korean: koSymptomsNameGeneralCheckUp,
    Languages.tamil: taSymptomsNameGeneralCheckUp,
    Languages.turkish: trSymptomsNameGeneralCheckUp,
    Languages.urdu: urSymptomsNameGeneralCheckUp,
    Languages.vietnamese: viSymptomsNameGeneralCheckUp,
    Languages.italian: itSymptomsNameGeneralCheckUp,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameVaccination() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameVaccination,
    Languages.hindi: hiSymptomsNameVaccination,
    Languages.arabic: arSymptomsNameVaccination,
    Languages.spanish: esSymptomsNameVaccination,
    Languages.mandarin: zhSymptomsNameVaccination,
    Languages.french: frSymptomsNameVaccination,
    Languages.bengali: bnSymptomsNameVaccination,
    Languages.portuguese: ptSymptomsNameVaccination,
    Languages.russian: ruSymptomsNameVaccination,
    Languages.japanese: jaSymptomsNameVaccination,
    Languages.german: deSymptomsNameVaccination,
    Languages.punjabi: paSymptomsNameVaccination,
    Languages.javanese: jvSymptomsNameVaccination,
    Languages.wuChinese: wuuSymptomsNameVaccination,
    Languages.korean: koSymptomsNameVaccination,
    Languages.tamil: taSymptomsNameVaccination,
    Languages.turkish: trSymptomsNameVaccination,
    Languages.urdu: urSymptomsNameVaccination,
    Languages.vietnamese: viSymptomsNameVaccination,
    Languages.italian: itSymptomsNameVaccination,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameTaken() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameTaken,
    Languages.hindi: hiSymptomsNameTaken,
    Languages.arabic: arSymptomsNameTaken,
    Languages.spanish: esSymptomsNameTaken,
    Languages.mandarin: zhSymptomsNameTaken,
    Languages.french: frSymptomsNameTaken,
    Languages.bengali: bnSymptomsNameTaken,
    Languages.portuguese: ptSymptomsNameTaken,
    Languages.russian: ruSymptomsNameTaken,
    Languages.japanese: jaSymptomsNameTaken,
    Languages.german: deSymptomsNameTaken,
    Languages.punjabi: paSymptomsNameTaken,
    Languages.javanese: jvSymptomsNameTaken,
    Languages.wuChinese: wuuSymptomsNameTaken,
    Languages.korean: koSymptomsNameTaken,
    Languages.tamil: taSymptomsNameTaken,
    Languages.turkish: trSymptomsNameTaken,
    Languages.urdu: urSymptomsNameTaken,
    Languages.vietnamese: viSymptomsNameTaken,
    Languages.italian: itSymptomsNameTaken,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameMissed() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameMissed,
    Languages.hindi: hiSymptomsNameMissed,
    Languages.arabic: arSymptomsNameMissed,
    Languages.spanish: esSymptomsNameMissed,
    Languages.mandarin: zhSymptomsNameMissed,
    Languages.french: frSymptomsNameMissed,
    Languages.bengali: bnSymptomsNameMissed,
    Languages.portuguese: ptSymptomsNameMissed,
    Languages.russian: ruSymptomsNameMissed,
    Languages.japanese: jaSymptomsNameMissed,
    Languages.german: deSymptomsNameMissed,
    Languages.punjabi: paSymptomsNameMissed,
    Languages.javanese: jvSymptomsNameMissed,
    Languages.wuChinese: wuuSymptomsNameMissed,
    Languages.korean: koSymptomsNameMissed,
    Languages.tamil: taSymptomsNameMissed,
    Languages.turkish: trSymptomsNameMissed,
    Languages.urdu: urSymptomsNameMissed,
    Languages.vietnamese: viSymptomsNameMissed,
    Languages.italian: itSymptomsNameMissed,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameLate() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameLate,
    Languages.hindi: hiSymptomsNameLate,
    Languages.arabic: arSymptomsNameLate,
    Languages.spanish: esSymptomsNameLate,
    Languages.mandarin: zhSymptomsNameLate,
    Languages.french: frSymptomsNameLate,
    Languages.bengali: bnSymptomsNameLate,
    Languages.portuguese: ptSymptomsNameLate,
    Languages.russian: ruSymptomsNameLate,
    Languages.japanese: jaSymptomsNameLate,
    Languages.german: deSymptomsNameLate,
    Languages.punjabi: paSymptomsNameLate,
    Languages.javanese: jvSymptomsNameLate,
    Languages.wuChinese: wuuSymptomsNameLate,
    Languages.korean: koSymptomsNameLate,
    Languages.tamil: taSymptomsNameLate,
    Languages.turkish: trSymptomsNameLate,
    Languages.urdu: urSymptomsNameLate,
    Languages.vietnamese: viSymptomsNameLate,
    Languages.italian: itSymptomsNameLate,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameDoubleDose() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameDoubleDose,
    Languages.hindi: hiSymptomsNameDoubleDose,
    Languages.arabic: arSymptomsNameDoubleDose,
    Languages.spanish: esSymptomsNameDoubleDose,
    Languages.mandarin: zhSymptomsNameDoubleDose,
    Languages.french: frSymptomsNameDoubleDose,
    Languages.bengali: bnSymptomsNameDoubleDose,
    Languages.portuguese: ptSymptomsNameDoubleDose,
    Languages.russian: ruSymptomsNameDoubleDose,
    Languages.japanese: jaSymptomsNameDoubleDose,
    Languages.german: deSymptomsNameDoubleDose,
    Languages.punjabi: paSymptomsNameDoubleDose,
    Languages.javanese: jvSymptomsNameDoubleDose,
    Languages.wuChinese: wuuSymptomsNameDoubleDose,
    Languages.korean: koSymptomsNameDoubleDose,
    Languages.tamil: taSymptomsNameDoubleDose,
    Languages.turkish: trSymptomsNameDoubleDose,
    Languages.urdu: urSymptomsNameDoubleDose,
    Languages.vietnamese: viSymptomsNameDoubleDose,
    Languages.italian: itSymptomsNameDoubleDose,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameVaccinationDuplicate() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameVaccinationDuplicate,
    Languages.hindi: hiSymptomsNameVaccinationDuplicate,
    Languages.arabic: arSymptomsNameVaccinationDuplicate,
    Languages.spanish: esSymptomsNameVaccinationDuplicate,
    Languages.mandarin: zhSymptomsNameVaccinationDuplicate,
    Languages.french: frSymptomsNameVaccinationDuplicate,
    Languages.bengali: bnSymptomsNameVaccinationDuplicate,
    Languages.portuguese: ptSymptomsNameVaccinationDuplicate,
    Languages.russian: ruSymptomsNameVaccinationDuplicate,
    Languages.japanese: jaSymptomsNameVaccinationDuplicate,
    Languages.german: deSymptomsNameVaccinationDuplicate,
    Languages.punjabi: paSymptomsNameVaccinationDuplicate,
    Languages.javanese: jvSymptomsNameVaccinationDuplicate,
    Languages.wuChinese: wuuSymptomsNameVaccinationDuplicate,
    Languages.korean: koSymptomsNameVaccinationDuplicate,
    Languages.tamil: taSymptomsNameVaccinationDuplicate,
    Languages.turkish: trSymptomsNameVaccinationDuplicate,
    Languages.urdu: urSymptomsNameVaccinationDuplicate,
    Languages.vietnamese: viSymptomsNameVaccinationDuplicate,
    Languages.italian: itSymptomsNameVaccinationDuplicate,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameThreadChecked() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameThreadChecked,
    Languages.hindi: hiSymptomsNameThreadChecked,
    Languages.arabic: arSymptomsNameThreadChecked,
    Languages.spanish: esSymptomsNameThreadChecked,
    Languages.mandarin: zhSymptomsNameThreadChecked,
    Languages.french: frSymptomsNameThreadChecked,
    Languages.bengali: bnSymptomsNameThreadChecked,
    Languages.portuguese: ptSymptomsNameThreadChecked,
    Languages.russian: ruSymptomsNameThreadChecked,
    Languages.japanese: jaSymptomsNameThreadChecked,
    Languages.german: deSymptomsNameThreadChecked,
    Languages.punjabi: paSymptomsNameThreadChecked,
    Languages.javanese: jvSymptomsNameThreadChecked,
    Languages.wuChinese: wuuSymptomsNameThreadChecked,
    Languages.korean: koSymptomsNameThreadChecked,
    Languages.tamil: taSymptomsNameThreadChecked,
    Languages.turkish: trSymptomsNameThreadChecked,
    Languages.urdu: urSymptomsNameThreadChecked,
    Languages.vietnamese: viSymptomsNameThreadChecked,
    Languages.italian: itSymptomsNameThreadChecked,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameInserted() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameInserted,
    Languages.hindi: hiSymptomsNameInserted,
    Languages.arabic: arSymptomsNameInserted,
    Languages.spanish: esSymptomsNameInserted,
    Languages.mandarin: zhSymptomsNameInserted,
    Languages.french: frSymptomsNameInserted,
    Languages.bengali: bnSymptomsNameInserted,
    Languages.portuguese: ptSymptomsNameInserted,
    Languages.russian: ruSymptomsNameInserted,
    Languages.japanese: jaSymptomsNameInserted,
    Languages.german: deSymptomsNameInserted,
    Languages.punjabi: paSymptomsNameInserted,
    Languages.javanese: jvSymptomsNameInserted,
    Languages.wuChinese: wuuSymptomsNameInserted,
    Languages.korean: koSymptomsNameInserted,
    Languages.tamil: taSymptomsNameInserted,
    Languages.turkish: trSymptomsNameInserted,
    Languages.urdu: urSymptomsNameInserted,
    Languages.vietnamese: viSymptomsNameInserted,
    Languages.italian: itSymptomsNameInserted,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameRemoved() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameRemoved,
    Languages.hindi: hiSymptomsNameRemoved,
    Languages.arabic: arSymptomsNameRemoved,
    Languages.spanish: esSymptomsNameRemoved,
    Languages.mandarin: zhSymptomsNameRemoved,
    Languages.french: frSymptomsNameRemoved,
    Languages.bengali: bnSymptomsNameRemoved,
    Languages.portuguese: ptSymptomsNameRemoved,
    Languages.russian: ruSymptomsNameRemoved,
    Languages.japanese: jaSymptomsNameRemoved,
    Languages.german: deSymptomsNameRemoved,
    Languages.punjabi: paSymptomsNameRemoved,
    Languages.javanese: jvSymptomsNameRemoved,
    Languages.wuChinese: wuuSymptomsNameRemoved,
    Languages.korean: koSymptomsNameRemoved,
    Languages.tamil: taSymptomsNameRemoved,
    Languages.turkish: trSymptomsNameRemoved,
    Languages.urdu: urSymptomsNameRemoved,
    Languages.vietnamese: viSymptomsNameRemoved,
    Languages.italian: itSymptomsNameRemoved,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameMultivitamin() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameMultivitamin,
    Languages.hindi: hiSymptomsNameMultivitamin,
    Languages.arabic: arSymptomsNameMultivitamin,
    Languages.spanish: esSymptomsNameMultivitamin,
    Languages.mandarin: zhSymptomsNameMultivitamin,
    Languages.french: frSymptomsNameMultivitamin,
    Languages.bengali: bnSymptomsNameMultivitamin,
    Languages.portuguese: ptSymptomsNameMultivitamin,
    Languages.russian: ruSymptomsNameMultivitamin,
    Languages.japanese: jaSymptomsNameMultivitamin,
    Languages.german: deSymptomsNameMultivitamin,
    Languages.punjabi: paSymptomsNameMultivitamin,
    Languages.javanese: jvSymptomsNameMultivitamin,
    Languages.wuChinese: wuuSymptomsNameMultivitamin,
    Languages.korean: koSymptomsNameMultivitamin,
    Languages.tamil: taSymptomsNameMultivitamin,
    Languages.turkish: trSymptomsNameMultivitamin,
    Languages.urdu: urSymptomsNameMultivitamin,
    Languages.vietnamese: viSymptomsNameMultivitamin,
    Languages.italian: itSymptomsNameMultivitamin,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameMagnesium() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameMagnesium,
    Languages.hindi: hiSymptomsNameMagnesium,
    Languages.arabic: arSymptomsNameMagnesium,
    Languages.spanish: esSymptomsNameMagnesium,
    Languages.mandarin: zhSymptomsNameMagnesium,
    Languages.french: frSymptomsNameMagnesium,
    Languages.bengali: bnSymptomsNameMagnesium,
    Languages.portuguese: ptSymptomsNameMagnesium,
    Languages.russian: ruSymptomsNameMagnesium,
    Languages.japanese: jaSymptomsNameMagnesium,
    Languages.german: deSymptomsNameMagnesium,
    Languages.punjabi: paSymptomsNameMagnesium,
    Languages.javanese: jvSymptomsNameMagnesium,
    Languages.wuChinese: wuuSymptomsNameMagnesium,
    Languages.korean: koSymptomsNameMagnesium,
    Languages.tamil: taSymptomsNameMagnesium,
    Languages.turkish: trSymptomsNameMagnesium,
    Languages.urdu: urSymptomsNameMagnesium,
    Languages.vietnamese: viSymptomsNameMagnesium,
    Languages.italian: itSymptomsNameMagnesium,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameIron() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameIron,
    Languages.hindi: hiSymptomsNameIron,
    Languages.arabic: arSymptomsNameIron,
    Languages.spanish: esSymptomsNameIron,
    Languages.mandarin: zhSymptomsNameIron,
    Languages.french: frSymptomsNameIron,
    Languages.bengali: bnSymptomsNameIron,
    Languages.portuguese: ptSymptomsNameIron,
    Languages.russian: ruSymptomsNameIron,
    Languages.japanese: jaSymptomsNameIron,
    Languages.german: deSymptomsNameIron,
    Languages.punjabi: paSymptomsNameIron,
    Languages.javanese: jvSymptomsNameIron,
    Languages.wuChinese: wuuSymptomsNameIron,
    Languages.korean: koSymptomsNameIron,
    Languages.tamil: taSymptomsNameIron,
    Languages.turkish: trSymptomsNameIron,
    Languages.urdu: urSymptomsNameIron,
    Languages.vietnamese: viSymptomsNameIron,
    Languages.italian: itSymptomsNameIron,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameVitaminD() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameVitaminD,
    Languages.hindi: hiSymptomsNameVitaminD,
    Languages.arabic: arSymptomsNameVitaminD,
    Languages.spanish: esSymptomsNameVitaminD,
    Languages.mandarin: zhSymptomsNameVitaminD,
    Languages.french: frSymptomsNameVitaminD,
    Languages.bengali: bnSymptomsNameVitaminD,
    Languages.portuguese: ptSymptomsNameVitaminD,
    Languages.russian: ruSymptomsNameVitaminD,
    Languages.japanese: jaSymptomsNameVitaminD,
    Languages.german: deSymptomsNameVitaminD,
    Languages.punjabi: paSymptomsNameVitaminD,
    Languages.javanese: jvSymptomsNameVitaminD,
    Languages.wuChinese: wuuSymptomsNameVitaminD,
    Languages.korean: koSymptomsNameVitaminD,
    Languages.tamil: taSymptomsNameVitaminD,
    Languages.turkish: trSymptomsNameVitaminD,
    Languages.urdu: urSymptomsNameVitaminD,
    Languages.vietnamese: viSymptomsNameVitaminD,
    Languages.italian: itSymptomsNameVitaminD,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameCalcium() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameCalcium,
    Languages.hindi: hiSymptomsNameCalcium,
    Languages.arabic: arSymptomsNameCalcium,
    Languages.spanish: esSymptomsNameCalcium,
    Languages.mandarin: zhSymptomsNameCalcium,
    Languages.french: frSymptomsNameCalcium,
    Languages.bengali: bnSymptomsNameCalcium,
    Languages.portuguese: ptSymptomsNameCalcium,
    Languages.russian: ruSymptomsNameCalcium,
    Languages.japanese: jaSymptomsNameCalcium,
    Languages.german: deSymptomsNameCalcium,
    Languages.punjabi: paSymptomsNameCalcium,
    Languages.javanese: jvSymptomsNameCalcium,
    Languages.wuChinese: wuuSymptomsNameCalcium,
    Languages.korean: koSymptomsNameCalcium,
    Languages.tamil: taSymptomsNameCalcium,
    Languages.turkish: trSymptomsNameCalcium,
    Languages.urdu: urSymptomsNameCalcium,
    Languages.vietnamese: viSymptomsNameCalcium,
    Languages.italian: itSymptomsNameCalcium,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameFolicAcid() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameFolicAcid,
    Languages.hindi: hiSymptomsNameFolicAcid,
    Languages.arabic: arSymptomsNameFolicAcid,
    Languages.spanish: esSymptomsNameFolicAcid,
    Languages.mandarin: zhSymptomsNameFolicAcid,
    Languages.french: frSymptomsNameFolicAcid,
    Languages.bengali: bnSymptomsNameFolicAcid,
    Languages.portuguese: ptSymptomsNameFolicAcid,
    Languages.russian: ruSymptomsNameFolicAcid,
    Languages.japanese: jaSymptomsNameFolicAcid,
    Languages.german: deSymptomsNameFolicAcid,
    Languages.punjabi: paSymptomsNameFolicAcid,
    Languages.javanese: jvSymptomsNameFolicAcid,
    Languages.wuChinese: wuuSymptomsNameFolicAcid,
    Languages.korean: koSymptomsNameFolicAcid,
    Languages.tamil: taSymptomsNameFolicAcid,
    Languages.turkish: trSymptomsNameFolicAcid,
    Languages.urdu: urSymptomsNameFolicAcid,
    Languages.vietnamese: viSymptomsNameFolicAcid,
    Languages.italian: itSymptomsNameFolicAcid,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNamePrenatalVitamins() {
  final logsByLanguage = {
    Languages.english: enSymptomsNamePrenatalVitamins,
    Languages.hindi: hiSymptomsNamePrenatalVitamins,
    Languages.arabic: arSymptomsNamePrenatalVitamins,
    Languages.spanish: esSymptomsNamePrenatalVitamins,
    Languages.mandarin: zhSymptomsNamePrenatalVitamins,
    Languages.french: frSymptomsNamePrenatalVitamins,
    Languages.bengali: bnSymptomsNamePrenatalVitamins,
    Languages.portuguese: ptSymptomsNamePrenatalVitamins,
    Languages.russian: ruSymptomsNamePrenatalVitamins,
    Languages.japanese: jaSymptomsNamePrenatalVitamins,
    Languages.german: deSymptomsNamePrenatalVitamins,
    Languages.punjabi: paSymptomsNamePrenatalVitamins,
    Languages.javanese: jvSymptomsNamePrenatalVitamins,
    Languages.wuChinese: wuuSymptomsNamePrenatalVitamins,
    Languages.korean: koSymptomsNamePrenatalVitamins,
    Languages.tamil: taSymptomsNamePrenatalVitamins,
    Languages.turkish: trSymptomsNamePrenatalVitamins,
    Languages.urdu: urSymptomsNamePrenatalVitamins,
    Languages.vietnamese: viSymptomsNamePrenatalVitamins,
    Languages.italian: itSymptomsNamePrenatalVitamins,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameFrequentUrination() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameFrequentUrination,
    Languages.hindi: hiSymptomsNameFrequentUrination,
    Languages.arabic: arSymptomsNameFrequentUrination,
    Languages.spanish: esSymptomsNameFrequentUrination,
    Languages.mandarin: zhSymptomsNameFrequentUrination,
    Languages.french: frSymptomsNameFrequentUrination,
    Languages.bengali: bnSymptomsNameFrequentUrination,
    Languages.portuguese: ptSymptomsNameFrequentUrination,
    Languages.russian: ruSymptomsNameFrequentUrination,
    Languages.japanese: jaSymptomsNameFrequentUrination,
    Languages.german: deSymptomsNameFrequentUrination,
    Languages.punjabi: paSymptomsNameFrequentUrination,
    Languages.javanese: jvSymptomsNameFrequentUrination,
    Languages.wuChinese: wuuSymptomsNameFrequentUrination,
    Languages.korean: koSymptomsNameFrequentUrination,
    Languages.tamil: taSymptomsNameFrequentUrination,
    Languages.turkish: trSymptomsNameFrequentUrination,
    Languages.urdu: urSymptomsNameFrequentUrination,
    Languages.vietnamese: viSymptomsNameFrequentUrination,
    Languages.italian: itSymptomsNameFrequentUrination,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameBurningSensation() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameBurningSensation,
    Languages.hindi: hiSymptomsNameBurningSensation,
    Languages.arabic: arSymptomsNameBurningSensation,
    Languages.spanish: esSymptomsNameBurningSensation,
    Languages.mandarin: zhSymptomsNameBurningSensation,
    Languages.french: frSymptomsNameBurningSensation,
    Languages.bengali: bnSymptomsNameBurningSensation,
    Languages.portuguese: ptSymptomsNameBurningSensation,
    Languages.russian: ruSymptomsNameBurningSensation,
    Languages.japanese: jaSymptomsNameBurningSensation,
    Languages.german: deSymptomsNameBurningSensation,
    Languages.punjabi: paSymptomsNameBurningSensation,
    Languages.javanese: jvSymptomsNameBurningSensation,
    Languages.wuChinese: wuuSymptomsNameBurningSensation,
    Languages.korean: koSymptomsNameBurningSensation,
    Languages.tamil: taSymptomsNameBurningSensation,
    Languages.turkish: trSymptomsNameBurningSensation,
    Languages.urdu: urSymptomsNameBurningSensation,
    Languages.vietnamese: viSymptomsNameBurningSensation,
    Languages.italian: itSymptomsNameBurningSensation,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameLeaksOrDribbles() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameLeaksOrDribbles,
    Languages.hindi: hiSymptomsNameLeaksOrDribbles,
    Languages.arabic: arSymptomsNameLeaksOrDribbles,
    Languages.spanish: esSymptomsNameLeaksOrDribbles,
    Languages.mandarin: zhSymptomsNameLeaksOrDribbles,
    Languages.french: frSymptomsNameLeaksOrDribbles,
    Languages.bengali: bnSymptomsNameLeaksOrDribbles,
    Languages.portuguese: ptSymptomsNameLeaksOrDribbles,
    Languages.russian: ruSymptomsNameLeaksOrDribbles,
    Languages.japanese: jaSymptomsNameLeaksOrDribbles,
    Languages.german: deSymptomsNameLeaksOrDribbles,
    Languages.punjabi: paSymptomsNameLeaksOrDribbles,
    Languages.javanese: jvSymptomsNameLeaksOrDribbles,
    Languages.wuChinese: wuuSymptomsNameLeaksOrDribbles,
    Languages.korean: koSymptomsNameLeaksOrDribbles,
    Languages.tamil: taSymptomsNameLeaksOrDribbles,
    Languages.turkish: trSymptomsNameLeaksOrDribbles,
    Languages.urdu: urSymptomsNameLeaksOrDribbles,
    Languages.vietnamese: viSymptomsNameLeaksOrDribbles,
    Languages.italian: itSymptomsNameLeaksOrDribbles,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameTravel() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameTravel,
    Languages.hindi: hiSymptomsNameTravel,
    Languages.arabic: arSymptomsNameTravel,
    Languages.spanish: esSymptomsNameTravel,
    Languages.mandarin: zhSymptomsNameTravel,
    Languages.french: frSymptomsNameTravel,
    Languages.bengali: bnSymptomsNameTravel,
    Languages.portuguese: ptSymptomsNameTravel,
    Languages.russian: ruSymptomsNameTravel,
    Languages.japanese: jaSymptomsNameTravel,
    Languages.german: deSymptomsNameTravel,
    Languages.punjabi: paSymptomsNameTravel,
    Languages.javanese: jvSymptomsNameTravel,
    Languages.wuChinese: wuuSymptomsNameTravel,
    Languages.korean: koSymptomsNameTravel,
    Languages.tamil: taSymptomsNameTravel,
    Languages.turkish: trSymptomsNameTravel,
    Languages.urdu: urSymptomsNameTravel,
    Languages.vietnamese: viSymptomsNameTravel,
    Languages.italian: itSymptomsNameTravel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameStress() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameStress,
    Languages.hindi: hiSymptomsNameStress,
    Languages.arabic: arSymptomsNameStress,
    Languages.spanish: esSymptomsNameStress,
    Languages.mandarin: zhSymptomsNameStress,
    Languages.french: frSymptomsNameStress,
    Languages.bengali: bnSymptomsNameStress,
    Languages.portuguese: ptSymptomsNameStress,
    Languages.russian: ruSymptomsNameStress,
    Languages.japanese: jaSymptomsNameStress,
    Languages.german: deSymptomsNameStress,
    Languages.punjabi: paSymptomsNameStress,
    Languages.javanese: jvSymptomsNameStress,
    Languages.wuChinese: wuuSymptomsNameStress,
    Languages.korean: koSymptomsNameStress,
    Languages.tamil: taSymptomsNameStress,
    Languages.turkish: trSymptomsNameStress,
    Languages.urdu: urSymptomsNameStress,
    Languages.vietnamese: viSymptomsNameStress,
    Languages.italian: itSymptomsNameStress,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameAlcohol() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameAlcohol,
    Languages.hindi: hiSymptomsNameAlcohol,
    Languages.arabic: arSymptomsNameAlcohol,
    Languages.spanish: esSymptomsNameAlcohol,
    Languages.mandarin: zhSymptomsNameAlcohol,
    Languages.french: frSymptomsNameAlcohol,
    Languages.bengali: bnSymptomsNameAlcohol,
    Languages.portuguese: ptSymptomsNameAlcohol,
    Languages.russian: ruSymptomsNameAlcohol,
    Languages.japanese: jaSymptomsNameAlcohol,
    Languages.german: deSymptomsNameAlcohol,
    Languages.punjabi: paSymptomsNameAlcohol,
    Languages.javanese: jvSymptomsNameAlcohol,
    Languages.wuChinese: wuuSymptomsNameAlcohol,
    Languages.korean: koSymptomsNameAlcohol,
    Languages.tamil: taSymptomsNameAlcohol,
    Languages.turkish: trSymptomsNameAlcohol,
    Languages.urdu: urSymptomsNameAlcohol,
    Languages.vietnamese: viSymptomsNameAlcohol,
    Languages.italian: itSymptomsNameAlcohol,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameJournaling() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameJournaling,
    Languages.hindi: hiSymptomsNameJournaling,
    Languages.arabic: arSymptomsNameJournaling,
    Languages.spanish: esSymptomsNameJournaling,
    Languages.mandarin: zhSymptomsNameJournaling,
    Languages.french: frSymptomsNameJournaling,
    Languages.bengali: bnSymptomsNameJournaling,
    Languages.portuguese: ptSymptomsNameJournaling,
    Languages.russian: ruSymptomsNameJournaling,
    Languages.japanese: jaSymptomsNameJournaling,
    Languages.german: deSymptomsNameJournaling,
    Languages.punjabi: paSymptomsNameJournaling,
    Languages.javanese: jvSymptomsNameJournaling,
    Languages.wuChinese: wuuSymptomsNameJournaling,
    Languages.korean: koSymptomsNameJournaling,
    Languages.tamil: taSymptomsNameJournaling,
    Languages.turkish: trSymptomsNameJournaling,
    Languages.urdu: urSymptomsNameJournaling,
    Languages.vietnamese: viSymptomsNameJournaling,
    Languages.italian: itSymptomsNameJournaling,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getWeekTitlesSun() {
  final logsByLanguage = {
    Languages.english: enWeekTitlesSun,
    Languages.hindi: hiWeekTitlesSun,
    Languages.arabic: arWeekTitlesSun,
    Languages.spanish: esWeekTitlesSun,
    Languages.mandarin: zhWeekTitlesSun,
    Languages.french: frWeekTitlesSun,
    Languages.bengali: bnWeekTitlesSun,
    Languages.portuguese: ptWeekTitlesSun,
    Languages.russian: ruWeekTitlesSun,
    Languages.japanese: jaWeekTitlesSun,
    Languages.german: deWeekTitlesSun,
    Languages.punjabi: paWeekTitlesSun,
    Languages.javanese: jvWeekTitlesSun,
    Languages.wuChinese: wuuWeekTitlesSun,
    Languages.korean: koWeekTitlesSun,
    Languages.tamil: taWeekTitlesSun,
    Languages.turkish: trWeekTitlesSun,
    Languages.urdu: urWeekTitlesSun,
    Languages.vietnamese: viWeekTitlesSun,
    Languages.italian: itWeekTitlesSun,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getWeekTitlesMon() {
  final logsByLanguage = {
    Languages.english: enWeekTitlesMon,
    Languages.hindi: hiWeekTitlesMon,
    Languages.arabic: arWeekTitlesMon,
    Languages.spanish: esWeekTitlesMon,
    Languages.mandarin: zhWeekTitlesMon,
    Languages.french: frWeekTitlesMon,
    Languages.bengali: bnWeekTitlesMon,
    Languages.portuguese: ptWeekTitlesMon,
    Languages.russian: ruWeekTitlesMon,
    Languages.japanese: jaWeekTitlesMon,
    Languages.german: deWeekTitlesMon,
    Languages.punjabi: paWeekTitlesMon,
    Languages.javanese: jvWeekTitlesMon,
    Languages.wuChinese: wuuWeekTitlesMon,
    Languages.korean: koWeekTitlesMon,
    Languages.tamil: taWeekTitlesMon,
    Languages.turkish: trWeekTitlesMon,
    Languages.urdu: urWeekTitlesMon,
    Languages.vietnamese: viWeekTitlesMon,
    Languages.italian: itWeekTitlesMon,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getWeekTitlesTue() {
  final logsByLanguage = {
    Languages.english: enWeekTitlesTue,
    Languages.hindi: hiWeekTitlesTue,
    Languages.arabic: arWeekTitlesTue,
    Languages.spanish: esWeekTitlesTue,
    Languages.mandarin: zhWeekTitlesTue,
    Languages.french: frWeekTitlesTue,
    Languages.bengali: bnWeekTitlesTue,
    Languages.portuguese: ptWeekTitlesTue,
    Languages.russian: ruWeekTitlesTue,
    Languages.japanese: jaWeekTitlesTue,
    Languages.german: deWeekTitlesTue,
    Languages.punjabi: paWeekTitlesTue,
    Languages.javanese: jvWeekTitlesTue,
    Languages.wuChinese: wuuWeekTitlesTue,
    Languages.korean: koWeekTitlesTue,
    Languages.tamil: taWeekTitlesTue,
    Languages.turkish: trWeekTitlesTue,
    Languages.urdu: urWeekTitlesTue,
    Languages.vietnamese: viWeekTitlesTue,
    Languages.italian: itWeekTitlesTue,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getWeekTitlesWed() {
  final logsByLanguage = {
    Languages.english: enWeekTitlesWed,
    Languages.hindi: hiWeekTitlesWed,
    Languages.arabic: arWeekTitlesWed,
    Languages.spanish: esWeekTitlesWed,
    Languages.mandarin: zhWeekTitlesWed,
    Languages.french: frWeekTitlesWed,
    Languages.bengali: bnWeekTitlesWed,
    Languages.portuguese: ptWeekTitlesWed,
    Languages.russian: ruWeekTitlesWed,
    Languages.japanese: jaWeekTitlesWed,
    Languages.german: deWeekTitlesWed,
    Languages.punjabi: paWeekTitlesWed,
    Languages.javanese: jvWeekTitlesWed,
    Languages.wuChinese: wuuWeekTitlesWed,
    Languages.korean: koWeekTitlesWed,
    Languages.tamil: taWeekTitlesWed,
    Languages.turkish: trWeekTitlesWed,
    Languages.urdu: urWeekTitlesWed,
    Languages.vietnamese: viWeekTitlesWed,
    Languages.italian: itWeekTitlesWed,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getWeekTitlesThu() {
  final logsByLanguage = {
    Languages.english: enWeekTitlesThu,
    Languages.hindi: hiWeekTitlesThu,
    Languages.arabic: arWeekTitlesThu,
    Languages.spanish: esWeekTitlesThu,
    Languages.mandarin: zhWeekTitlesThu,
    Languages.french: frWeekTitlesThu,
    Languages.bengali: bnWeekTitlesThu,
    Languages.portuguese: ptWeekTitlesThu,
    Languages.russian: ruWeekTitlesThu,
    Languages.japanese: jaWeekTitlesThu,
    Languages.german: deWeekTitlesThu,
    Languages.punjabi: paWeekTitlesThu,
    Languages.javanese: jvWeekTitlesThu,
    Languages.wuChinese: wuuWeekTitlesThu,
    Languages.korean: koWeekTitlesThu,
    Languages.tamil: taWeekTitlesThu,
    Languages.turkish: trWeekTitlesThu,
    Languages.urdu: urWeekTitlesThu,
    Languages.vietnamese: viWeekTitlesThu,
    Languages.italian: itWeekTitlesThu,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getWeekTitlesFri() {
  final logsByLanguage = {
    Languages.english: enWeekTitlesFri,
    Languages.hindi: hiWeekTitlesFri,
    Languages.arabic: arWeekTitlesFri,
    Languages.spanish: esWeekTitlesFri,
    Languages.mandarin: zhWeekTitlesFri,
    Languages.french: frWeekTitlesFri,
    Languages.bengali: bnWeekTitlesFri,
    Languages.portuguese: ptWeekTitlesFri,
    Languages.russian: ruWeekTitlesFri,
    Languages.japanese: jaWeekTitlesFri,
    Languages.german: deWeekTitlesFri,
    Languages.punjabi: paWeekTitlesFri,
    Languages.javanese: jvWeekTitlesFri,
    Languages.wuChinese: wuuWeekTitlesFri,
    Languages.korean: koWeekTitlesFri,
    Languages.tamil: taWeekTitlesFri,
    Languages.turkish: trWeekTitlesFri,
    Languages.urdu: urWeekTitlesFri,
    Languages.vietnamese: viWeekTitlesFri,
    Languages.italian: itWeekTitlesFri,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getWeekTitlesSat() {
  final logsByLanguage = {
    Languages.english: enWeekTitlesSat,
    Languages.hindi: hiWeekTitlesSat,
    Languages.arabic: arWeekTitlesSat,
    Languages.spanish: esWeekTitlesSat,
    Languages.mandarin: zhWeekTitlesSat,
    Languages.french: frWeekTitlesSat,
    Languages.bengali: bnWeekTitlesSat,
    Languages.portuguese: ptWeekTitlesSat,
    Languages.russian: ruWeekTitlesSat,
    Languages.japanese: jaWeekTitlesSat,
    Languages.german: deWeekTitlesSat,
    Languages.punjabi: paWeekTitlesSat,
    Languages.javanese: jvWeekTitlesSat,
    Languages.wuChinese: wuuWeekTitlesSat,
    Languages.korean: koWeekTitlesSat,
    Languages.tamil: taWeekTitlesSat,
    Languages.turkish: trWeekTitlesSat,
    Languages.urdu: urWeekTitlesSat,
    Languages.vietnamese: viWeekTitlesSat,
    Languages.italian: itWeekTitlesSat,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCycleDayTitle() {
  final logsByLanguage = {
    Languages.english: enCycleDayTitle,
    Languages.hindi: hiCycleDayTitle,
    Languages.arabic: arCycleDayTitle,
    Languages.spanish: esCycleDayTitle,
    Languages.mandarin: zhCycleDayTitle,
    Languages.french: frCycleDayTitle,
    Languages.bengali: bnCycleDayTitle,
    Languages.portuguese: ptCycleDayTitle,
    Languages.russian: ruCycleDayTitle,
    Languages.japanese: jaCycleDayTitle,
    Languages.german: deCycleDayTitle,
    Languages.punjabi: paCycleDayTitle,
    Languages.javanese: jvCycleDayTitle,
    Languages.wuChinese: wuuCycleDayTitle,
    Languages.korean: koCycleDayTitle,
    Languages.tamil: taCycleDayTitle,
    Languages.turkish: trCycleDayTitle,
    Languages.urdu: urCycleDayTitle,
    Languages.vietnamese: viCycleDayTitle,
    Languages.italian: itCycleDayTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getFeelingTodayTitle() {
  final logsByLanguage = {
    Languages.english: enFeelingTodayTitle,
    Languages.hindi: hiFeelingTodayTitle,
    Languages.arabic: arFeelingTodayTitle,
    Languages.spanish: esFeelingTodayTitle,
    Languages.mandarin: zhFeelingTodayTitle,
    Languages.french: frFeelingTodayTitle,
    Languages.bengali: bnFeelingTodayTitle,
    Languages.portuguese: ptFeelingTodayTitle,
    Languages.russian: ruFeelingTodayTitle,
    Languages.japanese: jaFeelingTodayTitle,
    Languages.german: deFeelingTodayTitle,
    Languages.punjabi: paFeelingTodayTitle,
    Languages.javanese: jvFeelingTodayTitle,
    Languages.wuChinese: wuuFeelingTodayTitle,
    Languages.korean: koFeelingTodayTitle,
    Languages.tamil: taFeelingTodayTitle,
    Languages.turkish: trFeelingTodayTitle,
    Languages.urdu: urFeelingTodayTitle,
    Languages.vietnamese: viFeelingTodayTitle,
    Languages.italian: itFeelingTodayTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getTodayTitle() {
  final logsByLanguage = {
    Languages.english: enTodayTitle,
    Languages.hindi: hiTodayTitle,
    Languages.arabic: arTodayTitle,
    Languages.spanish: esTodayTitle,
    Languages.mandarin: zhTodayTitle,
    Languages.french: frTodayTitle,
    Languages.bengali: bnTodayTitle,
    Languages.portuguese: ptTodayTitle,
    Languages.russian: ruTodayTitle,
    Languages.japanese: jaTodayTitle,
    Languages.german: deTodayTitle,
    Languages.punjabi: paTodayTitle,
    Languages.javanese: jvTodayTitle,
    Languages.wuChinese: wuuTodayTitle,
    Languages.korean: koTodayTitle,
    Languages.tamil: taTodayTitle,
    Languages.turkish: trTodayTitle,
    Languages.urdu: urTodayTitle,
    Languages.vietnamese: viTodayTitle,
    Languages.italian: itTodayTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getYesterdayTitle() {
  final logsByLanguage = {
    Languages.english: enYesterdayTitle,
    Languages.hindi: hiYesterdayTitle,
    Languages.arabic: arYesterdayTitle,
    Languages.spanish: esYesterdayTitle,
    Languages.mandarin: zhYesterdayTitle,
    Languages.french: frYesterdayTitle,
    Languages.bengali: bnYesterdayTitle,
    Languages.portuguese: ptYesterdayTitle,
    Languages.russian: ruYesterdayTitle,
    Languages.japanese: jaYesterdayTitle,
    Languages.german: deYesterdayTitle,
    Languages.punjabi: paYesterdayTitle,
    Languages.javanese: jvYesterdayTitle,
    Languages.wuChinese: wuuYesterdayTitle,
    Languages.korean: koYesterdayTitle,
    Languages.tamil: taYesterdayTitle,
    Languages.turkish: trYesterdayTitle,
    Languages.urdu: urYesterdayTitle,
    Languages.vietnamese: viYesterdayTitle,
    Languages.italian: itYesterdayTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getProtectedData() {
  final logsByLanguage = {
    Languages.english: enProtectedData,
    Languages.hindi: hiProtectedData,
    Languages.arabic: arProtectedData,
    Languages.spanish: esProtectedData,
    Languages.mandarin: zhProtectedData,
    Languages.french: frProtectedData,
    Languages.bengali: bnProtectedData,
    Languages.portuguese: ptProtectedData,
    Languages.russian: ruProtectedData,
    Languages.japanese: jaProtectedData,
    Languages.german: deProtectedData,
    Languages.punjabi: paProtectedData,
    Languages.javanese: jvProtectedData,
    Languages.wuChinese: wuuProtectedData,
    Languages.korean: koProtectedData,
    Languages.tamil: taProtectedData,
    Languages.turkish: trProtectedData,
    Languages.urdu: urProtectedData,
    Languages.vietnamese: viProtectedData,
    Languages.italian: itProtectedData,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getRegularTitle() {
  final logsByLanguage = {
    Languages.english: enRegularTitle,
    Languages.hindi: hiRegularTitle,
    Languages.arabic: arRegularTitle,
    Languages.spanish: esRegularTitle,
    Languages.mandarin: zhRegularTitle,
    Languages.french: frRegularTitle,
    Languages.bengali: bnRegularTitle,
    Languages.portuguese: ptRegularTitle,
    Languages.russian: ruRegularTitle,
    Languages.japanese: jaRegularTitle,
    Languages.german: deRegularTitle,
    Languages.punjabi: paRegularTitle,
    Languages.javanese: jvRegularTitle,
    Languages.wuChinese: wuuRegularTitle,
    Languages.korean: koRegularTitle,
    Languages.tamil: taRegularTitle,
    Languages.turkish: trRegularTitle,
    Languages.urdu: urRegularTitle,
    Languages.vietnamese: viRegularTitle,
    Languages.italian: itRegularTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getNormalTitle() {
  final logsByLanguage = {
    Languages.english: enNormalTitle,
    Languages.hindi: hiNormalTitle,
    Languages.arabic: arNormalTitle,
    Languages.spanish: esNormalTitle,
    Languages.mandarin: zhNormalTitle,
    Languages.french: frNormalTitle,
    Languages.bengali: bnNormalTitle,
    Languages.portuguese: ptNormalTitle,
    Languages.russian: ruNormalTitle,
    Languages.japanese: jaNormalTitle,
    Languages.german: deNormalTitle,
    Languages.punjabi: paNormalTitle,
    Languages.javanese: jvNormalTitle,
    Languages.wuChinese: wuuNormalTitle,
    Languages.korean: koNormalTitle,
    Languages.tamil: taNormalTitle,
    Languages.turkish: trNormalTitle,
    Languages.urdu: urNormalTitle,
    Languages.vietnamese: viNormalTitle,
    Languages.italian: itNormalTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getIrregularTitle() {
  final logsByLanguage = {
    Languages.english: enIrregularTitle,
    Languages.hindi: hiIrregularTitle,
    Languages.arabic: arIrregularTitle,
    Languages.spanish: esIrregularTitle,
    Languages.mandarin: zhIrregularTitle,
    Languages.french: frIrregularTitle,
    Languages.bengali: bnIrregularTitle,
    Languages.portuguese: ptIrregularTitle,
    Languages.russian: ruIrregularTitle,
    Languages.japanese: jaIrregularTitle,
    Languages.german: deIrregularTitle,
    Languages.punjabi: paIrregularTitle,
    Languages.javanese: jvIrregularTitle,
    Languages.wuChinese: wuuIrregularTitle,
    Languages.korean: koIrregularTitle,
    Languages.tamil: taIrregularTitle,
    Languages.turkish: trIrregularTitle,
    Languages.urdu: urIrregularTitle,
    Languages.vietnamese: viIrregularTitle,
    Languages.italian: itIrregularTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getMonth() {
  final logsByLanguage = {
    Languages.english: enMonth,
    Languages.hindi: hiMonth,
    Languages.arabic: arMonth,
    Languages.spanish: esMonth,
    Languages.mandarin: zhMonth,
    Languages.french: frMonth,
    Languages.bengali: bnMonth,
    Languages.portuguese: ptMonth,
    Languages.russian: ruMonth,
    Languages.japanese: jaMonth,
    Languages.german: deMonth,
    Languages.punjabi: paMonth,
    Languages.javanese: jvMonth,
    Languages.wuChinese: wuuMonth,
    Languages.korean: koMonth,
    Languages.tamil: taMonth,
    Languages.turkish: trMonth,
    Languages.urdu: urMonth,
    Languages.vietnamese: viMonth,
    Languages.italian: itMonth,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getWeek() {
  final logsByLanguage = {
    Languages.english: enWeek,
    Languages.hindi: hiWeek,
    Languages.arabic: arWeek,
    Languages.spanish: esWeek,
    Languages.mandarin: zhWeek,
    Languages.french: frWeek,
    Languages.bengali: bnWeek,
    Languages.portuguese: ptWeek,
    Languages.russian: ruWeek,
    Languages.japanese: jaWeek,
    Languages.german: deWeek,
    Languages.punjabi: paWeek,
    Languages.javanese: jvWeek,
    Languages.wuChinese: wuuWeek,
    Languages.korean: koWeek,
    Languages.tamil: taWeek,
    Languages.turkish: trWeek,
    Languages.urdu: urWeek,
    Languages.vietnamese: viWeek,
    Languages.italian: itWeek,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getWeeks() {
  final logsByLanguage = {
    Languages.english: enWeeks,
    Languages.hindi: hiWeeks,
    Languages.arabic: arWeeks,
    Languages.spanish: esWeeks,
    Languages.mandarin: zhWeeks,
    Languages.french: frWeeks,
    Languages.bengali: bnWeeks,
    Languages.portuguese: ptWeeks,
    Languages.russian: ruWeeks,
    Languages.japanese: jaWeeks,
    Languages.german: deWeeks,
    Languages.punjabi: paWeeks,
    Languages.javanese: jvWeeks,
    Languages.wuChinese: wuuWeeks,
    Languages.korean: koWeeks,
    Languages.tamil: taWeeks,
    Languages.turkish: trWeeks,
    Languages.urdu: urWeeks,
    Languages.vietnamese: viWeeks,
    Languages.italian: itWeeks,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}
