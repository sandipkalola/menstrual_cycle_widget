import '../menstrual_cycle_widget.dart';
import 'languages.dart';

/// return language code
getLanguageCode() {
  if (MenstrualCycleWidget.currentLanguage == Languages.english) {
    return "en";
  }
  if (MenstrualCycleWidget.currentLanguage == Languages.hindi) {
    return "hi";
  }
  if (MenstrualCycleWidget.currentLanguage == Languages.arabic) {
    return "ar";
  }
  return "en";
}

getSaveLogsTitle() {
  final logsByLanguage = {
    Languages.english: enSaveLogs,
    Languages.hindi: hiSaveLogs,
    Languages.arabic: arSaveLogs,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSecretKeyLabel() {
  final secretKeyLabels = {
    Languages.english: enSecretKeyLabel,
    Languages.hindi: hiSecretKeyLabel,
    Languages.arabic: arSecretKeyLabel,
  };
  return secretKeyLabels[MenstrualCycleWidget.currentLanguage];
}

getIvKeyLabel() {
  final ivKeyLabels = {
    Languages.english: enIvKeyLabel,
    Languages.hindi: hiIvKeyLabel,
    Languages.arabic: arIvKeyLabel,
  };
  return ivKeyLabels[MenstrualCycleWidget.currentLanguage];
}

getTotalCycleDaysLabel() {
  final totalCycleDaysLabels = {
    Languages.english: enTotalCycleDaysLabel,
    Languages.hindi: hiTotalCycleDaysLabel,
    Languages.arabic: arTotalCycleDaysLabel,
  };
  return totalCycleDaysLabels[MenstrualCycleWidget.currentLanguage];
}

getTotalPeriodDaysLabel() {
  final totalPeriodDaysLabels = {
    Languages.english: enTotalPeriodDaysLabel,
    Languages.hindi: hiTotalPeriodDaysLabel,
    Languages.arabic: arTotalPeriodDaysLabel,
  };
  return totalPeriodDaysLabels[MenstrualCycleWidget.currentLanguage];
}

getPrintLogLabel() {
  final logsByLanguage = {
    Languages.english: enPrintLogLabel,
    Languages.hindi: hiPrintLogLabel,
    Languages.arabic: arPrintLogLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSaveLabel() {
  final logsByLanguage = {
    Languages.english: enSaveLabel,
    Languages.hindi: hiSaveLabel,
    Languages.arabic: arSaveLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCancelLabel() {
  final logsByLanguage = {
    Languages.english: enCancelLabel,
    Languages.hindi: hiCancelLabel,
    Languages.arabic: arCancelLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getEditPeriodDateLabel() {
  final logsByLanguage = {
    Languages.english: enEditPeriodDateLabel,
    Languages.hindi: hiEditPeriodDateLabel,
    Languages.arabic: arEditPeriodDateLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPeriodLabel() {
  final logsByLanguage = {
    Languages.english: enPeriodLabel,
    Languages.hindi: hiPeriodLabel,
    Languages.arabic: arPeriodLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPredictOvulationDateLabel() {
  final logsByLanguage = {
    Languages.english: enPredictOvulationDateLabel,
    Languages.hindi: hiPredictOvulationDateLabel,
    Languages.arabic: arPredictOvulationDateLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPredictPeriodDateLabel() {
  final logsByLanguage = {
    Languages.english: enPredictPeriodDateLabel,
    Languages.hindi: hiPredictPeriodDateLabel,
    Languages.arabic: arPredictPeriodDateLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSelectedDateLabel() {
  final logsByLanguage = {
    Languages.english: enSelectedDateLabel,
    Languages.hindi: hiSelectedDateLabel,
    Languages.arabic: arSelectedDateLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getTodayLabel() {
  final logsByLanguage = {
    Languages.english: enTodayLabel,
    Languages.hindi: hiTodayLabel,
    Languages.arabic: arTodayLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getMenstruationLabel() {
  final logsByLanguage = {
    Languages.english: enMenstruationLabel,
    Languages.hindi: hiMenstruationLabel,
    Languages.arabic: arMenstruationLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getThirdTrimesterName() {
  final logsByLanguage = {
    Languages.english: enThirdTrimesterName,
    Languages.hindi: hiThirdTrimesterName,
    Languages.arabic: arThirdTrimesterName,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSecondTrimesterName() {
  final logsByLanguage = {
    Languages.english: enSecondTrimesterName,
    Languages.hindi: hiSecondTrimesterName,
    Languages.arabic: arSecondTrimesterName,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getFirstTrimesterName() {
  final logsByLanguage = {
    Languages.english: enFirstTrimesterName,
    Languages.hindi: hiFirstTrimesterName,
    Languages.arabic: arFirstTrimesterName,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getFollicularPhaseLabel() {
  final logsByLanguage = {
    Languages.english: enFollicularPhaseLabel,
    Languages.hindi: hiFollicularPhaseLabel,
    Languages.arabic: arFollicularPhaseLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getOvulationLabel() {
  final logsByLanguage = {
    Languages.english: enOvulationLabel,
    Languages.hindi: hiOvulationLabel,
    Languages.arabic: arOvulationLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLutealPhaseLabel() {
  final logsByLanguage = {
    Languages.english: enLutealPhaseLabel,
    Languages.hindi: hiLutealPhaseLabel,
    Languages.arabic: arLutealPhaseLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLatePeriodLabel() {
  final logsByLanguage = {
    Languages.english: enLatePeriod,
    Languages.hindi: hiLatePeriod,
    Languages.arabic: arLatePeriod,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getDayLabel() {
  final logsByLanguage = {
    Languages.english: enDayLabel,
    Languages.hindi: hiDayLabel,
    Languages.arabic: arDayLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLogPeriodLabel() {
  final logsByLanguage = {
    Languages.english: enLogPeriodLabel,
    Languages.hindi: hiLogPeriodLabel,
    Languages.arabic: arLogPeriodLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPastCycleLabel() {
  final logsByLanguage = {
    Languages.english: enPastCycleLabel,
    Languages.hindi: hiPastCycleLabel,
    Languages.arabic: arPastCycleLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCircleDaysLateLabel() {
  final logsByLanguage = {
    Languages.english: enCircleDaysLateLabel,
    Languages.hindi: hiCircleDaysLateLabel,
    Languages.arabic: arCircleDaysLateLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCircleDayLateLabel() {
  final logsByLanguage = {
    Languages.english: enCircleDayLateLabel,
    Languages.hindi: hiCircleDayLateLabel,
    Languages.arabic: arCircleDayLateLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLateLabel() {
  final logsByLanguage = {
    Languages.english: enLateLabel,
    Languages.hindi: hiLateLabel,
    Languages.arabic: arLateLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getTimeForPregnancyTestLabel() {
  final logsByLanguage = {
    Languages.english: enTimeForPregnancyTestLabel,
    Languages.hindi: hiTimeForPregnancyTestLabel,
    Languages.arabic: arTimeForPregnancyTestLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getTimeForPregnancyTestTitleLabel() {
  final logsByLanguage = {
    Languages.english: enTimeForPregnancyTestTitleLabel,
    Languages.hindi: hiTimeForPregnancyTestTitleLabel,
    Languages.arabic: arTimeForPregnancyTestTitleLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getTimeForPregnancyTestTitleLabel2() {
  final logsByLanguage = {
    Languages.english: enTimeForPregnancyTestTitleLabel2,
    Languages.hindi: hiTimeForPregnancyTestTitleLabel2,
    Languages.arabic: arTimeForPregnancyTestTitleLabel2,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getTimeForPregnancyTestTitleLabel4() {
  final logsByLanguage = {
    Languages.english: enTimeForPregnancyTestTitleLabel4,
    Languages.hindi: hiTimeForPregnancyTestTitleLabel4,
    Languages.arabic: arTimeForPregnancyTestTitleLabel4,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getTimeForPregnancyTestTitleLabel3() {
  final logsByLanguage = {
    Languages.english: enTimeForPregnancyTestTitleLabel3,
    Languages.hindi: hiTimeForPregnancyTestTitleLabel3,
    Languages.arabic: arTimeForPregnancyTestTitleLabel3,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPredictPeriodLabel() {
  final logsByLanguage = {
    Languages.english: enPredictPeriodLabel,
    Languages.hindi: hiPredictPeriodLabel,
    Languages.arabic: arPredictPeriodLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getConceiveLabel() {
  final logsByLanguage = {
    Languages.english: enConceiveLabel,
    Languages.hindi: hiConceiveLabel,
    Languages.arabic: arConceiveLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getConceiveLabel2() {
  final logsByLanguage = {
    Languages.english: enConceiveLabel2,
    Languages.hindi: hiConceiveLabel2,
    Languages.arabic: arConceiveLabel2,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPeriodPhaseLabel() {
  final logsByLanguage = {
    Languages.english: enPeriodPhaseLabel,
    Languages.hindi: hiPeriodPhaseLabel,
    Languages.arabic: arPeriodPhaseLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPhaseDayLabel() {
  final logsByLanguage = {
    Languages.english: enPhaseDayLabel,
    Languages.hindi: hiPhaseDayLabel,
    Languages.arabic: arPhaseDayLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPhaseDaysLabel() {
  final logsByLanguage = {
    Languages.english: enPhaseDaysLabel,
    Languages.hindi: hiPhaseDaysLabel,
    Languages.arabic: arPhaseDaysLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPregnancyChanceMsg1() {
  final logsByLanguage = {
    Languages.english: enPregnancyChanceMsg1,
    Languages.hindi: hiPregnancyChanceMsg1,
    Languages.arabic: arPregnancyChanceMsg1,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPregnancyChanceMsg2() {
  final logsByLanguage = {
    Languages.english: enPregnancyChanceMsg2,
    Languages.hindi: hiPregnancyChanceMsg2,
    Languages.arabic: arPregnancyChanceMsg2,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPregnancyChanceMsg3() {
  final logsByLanguage = {
    Languages.english: enPregnancyChanceMsg3,
    Languages.hindi: hiPregnancyChanceMsg3,
    Languages.arabic: arPregnancyChanceMsg3,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPregnancyChanceMsg4() {
  final logsByLanguage = {
    Languages.english: enPregnancyChanceMsg4,
    Languages.hindi: hiPregnancyChanceMsg4,
    Languages.arabic: arPregnancyChanceMsg4,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getOvulationDayMsg1() {
  final logsByLanguage = {
    Languages.english: enOvulationDayMsg1,
    Languages.hindi: hiOvulationDayMsg1,
    Languages.arabic: arOvulationDayMsg1,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getOvulationDayTitle() {
  final logsByLanguage = {
    Languages.english: enOvulationDayTitle,
    Languages.hindi: hiOvulationDayTitle,
    Languages.arabic: arOvulationDayTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPredictPeriodDayStartLabel() {
  final logsByLanguage = {
    Languages.english: enPredictPeriodDayStartLabel,
    Languages.hindi: hiPredictPeriodDayStartLabel,
    Languages.arabic: arPredictPeriodDayStartLabel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPredictPeriodDayStartLabel2() {
  final logsByLanguage = {
    Languages.english: enPredictPeriodDayStartLabel2,
    Languages.hindi: hiPredictPeriodDayStartLabel2,
    Languages.arabic: arPredictPeriodDayStartLabel2,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getPredictPeriodDayStartLabel1() {
  final logsByLanguage = {
    Languages.english: enPredictPeriodDayStartLabel1,
    Languages.hindi: hiPredictPeriodDayStartLabel1,
    Languages.arabic: arPredictPeriodDayStartLabel1,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getErrorInvalidSize() {
  final logsByLanguage = {
    Languages.english: enErrorInvalidSize,
    Languages.hindi: hiErrorInvalidSize,
    Languages.arabic: arErrorInvalidSize,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getErrorInvalidCount() {
  final logsByLanguage = {
    Languages.english: enErrorInvalidCount,
    Languages.hindi: hiErrorInvalidCount,
    Languages.arabic: arErrorInvalidCount,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getErrorInvalidMenstruationDayCount() {
  final logsByLanguage = {
    Languages.english: enErrorInvalidMenstruationDayCount,
    Languages.hindi: hiErrorInvalidMenstruationDayCount,
    Languages.arabic: arErrorInvalidMenstruationDayCount,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getErrorInvalidFollicularDayCount() {
  final logsByLanguage = {
    Languages.english: enErrorInvalidFollicularDayCount,
    Languages.hindi: hiErrorInvalidFollicularDayCount,
    Languages.arabic: arErrorInvalidFollicularDayCount,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getErrorInvalidOvulationDayCount() {
  final logsByLanguage = {
    Languages.english: enErrorInvalidOvulationDayCount,
    Languages.hindi: hiErrorInvalidOvulationDayCount,
    Languages.arabic: arErrorInvalidOvulationDayCount,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getErrorInvalidSymptomsLogDate() {
  final logsByLanguage = {
    Languages.english: enErrorInvalidSymptomsLogDate,
    Languages.hindi: hiErrorInvalidSymptomsLogDate,
    Languages.arabic: arErrorInvalidSymptomsLogDate,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCycleTitle() {
  final logsByLanguage = {
    Languages.english: enGraphCycleTitle,
    Languages.hindi: hiGraphCycleTitle,
    Languages.arabic: arGraphCycleTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCycleDaysPeriod() {
  final logsByLanguage = {
    Languages.english: enGraphCycleDaysPeriod,
    Languages.hindi: hiGraphCycleDaysPeriod,
    Languages.arabic: arGraphCycleDaysPeriod,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCycleDaysCycle() {
  final logsByLanguage = {
    Languages.english: enGraphCycleDaysCycle,
    Languages.hindi: hiGraphCycleDaysCycle,
    Languages.arabic: arGraphCycleDaysCycle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCycleNowTitle() {
  final logsByLanguage = {
    Languages.english: enGraphCycleNowTitle,
    Languages.hindi: hiGraphCycleNowTitle,
    Languages.arabic: arGraphCycleNowTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCycleViewAllTitle() {
  final logsByLanguage = {
    Languages.english: enGraphCycleViewAllTitle,
    Languages.hindi: hiGraphCycleViewAllTitle,
    Languages.arabic: arGraphCycleViewAllTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCycleStartDate() {
  final logsByLanguage = {
    Languages.english: enGraphCycleStartDate,
    Languages.hindi: hiGraphCycleStartDate,
    Languages.arabic: arGraphCycleStartDate,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLoading() {
  final logsByLanguage = {
    Languages.english: enLoading,
    Languages.hindi: hiLoading,
    Languages.arabic: arLoading,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCycleTrends() {
  final logsByLanguage = {
    Languages.english: enGraphCycleTrends,
    Languages.hindi: hiGraphCycleTrends,
    Languages.arabic: arGraphCycleTrends,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCycleLengthDays() {
  final logsByLanguage = {
    Languages.english: enGraphCycleLengthDays,
    Languages.hindi: hiGraphCycleLengthDays,
    Languages.arabic: arGraphCycleLengthDays,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCycleNormalDays() {
  final logsByLanguage = {
    Languages.english: enGraphCycleNormalDays,
    Languages.hindi: hiGraphCycleNormalDays,
    Languages.arabic: arGraphCycleNormalDays,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCyclePeriodDay() {
  final logsByLanguage = {
    Languages.english: enGraphCyclePeriodDay,
    Languages.hindi: hiGraphCyclePeriodDay,
    Languages.arabic: arGraphCyclePeriodDay,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphCycleOtherDay() {
  final logsByLanguage = {
    Languages.english: enGraphCycleOtherDay,
    Languages.hindi: hiGraphCycleOtherDay,
    Languages.arabic: arGraphCycleOtherDay,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getOptionsDownloadImage() {
  final logsByLanguage = {
    Languages.english: enOptionsDownloadImage,
    Languages.hindi: hiOptionsDownloadImage,
    Languages.arabic: arOptionsDownloadImage,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getOptionsDownloadPDF() {
  final logsByLanguage = {
    Languages.english: enOptionsDownloadPDF,
    Languages.hindi: hiOptionsDownloadPDF,
    Languages.arabic: arOptionsDownloadPDF,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getOptionsViewLandscape() {
  final logsByLanguage = {
    Languages.english: enOptionsViewLandscape,
    Languages.hindi: hiOptionsViewLandscape,
    Languages.arabic: arOptionsViewLandscape,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getToolTip() {
  final logsByLanguage = {
    Languages.english: enToolTip,
    Languages.hindi: hiToolTip,
    Languages.arabic: arToolTip,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getNoDataFound() {
  final logsByLanguage = {
    Languages.english: enNoDataFound,
    Languages.hindi: hiNoDataFound,
    Languages.arabic: arNoDataFound,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphBodyTempDate() {
  final logsByLanguage = {
    Languages.english: enGraphBodyTempDate,
    Languages.hindi: hiGraphBodyTempDate,
    Languages.arabic: arGraphBodyTempDate,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphBodyTempTitle() {
  final logsByLanguage = {
    Languages.english: enGraphBodyTempTitle,
    Languages.hindi: hiGraphBodyTempTitle,
    Languages.arabic: arGraphBodyTempTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWaterDrinkDate() {
  final logsByLanguage = {
    Languages.english: enGraphWaterDrinkDate,
    Languages.hindi: hiGraphWaterDrinkDate,
    Languages.arabic: arGraphWaterDrinkDate,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWaterUnitTitle() {
  final logsByLanguage = {
    Languages.english: enGraphWaterUnitTitle,
    Languages.hindi: hiGraphWaterUnitTitle,
    Languages.arabic: arGraphWaterUnitTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWaterUnitLiter() {
  final logsByLanguage = {
    Languages.english: enGraphWaterUnitLiter,
    Languages.hindi: hiGraphWaterUnitLiter,
    Languages.arabic: arGraphWaterUnitLiter,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getBodyTempC() {
  final logsByLanguage = {
    Languages.english: enBodyTempC,
    Languages.hindi: hiBodyTempC,
    Languages.arabic: arBodyTempC,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getWeightKg() {
  final logsByLanguage = {
    Languages.english: enWeightKg,
    Languages.hindi: hiWeightKg,
    Languages.arabic: arWeightKg,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getBodyTempF() {
  final logsByLanguage = {
    Languages.english: enBodyTempF,
    Languages.hindi: hiBodyTempF,
    Languages.arabic: arBodyTempF,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getErrorInvalidSymptomsDate() {
  final logsByLanguage = {
    Languages.english: enErrorInvalidSymptomsDate,
    Languages.hindi: hiErrorInvalidSymptomsDate,
    Languages.arabic: arErrorInvalidSymptomsDate,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblDone() {
  final logsByLanguage = {
    Languages.english: enLblDone,
    Languages.hindi: hiLblDone,
    Languages.arabic: arLblDone,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblWeight() {
  final logsByLanguage = {
    Languages.english: enLblWeight,
    Languages.hindi: hiLblWeight,
    Languages.arabic: arLblWeight,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblWeightTitle() {
  final logsByLanguage = {
    Languages.english: enLblWeightTitle,
    Languages.hindi: hiLblWeightTitle,
    Languages.arabic: arLblWeightTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblBodyTemp() {
  final logsByLanguage = {
    Languages.english: enLblBodyTemp,
    Languages.hindi: hiLblBodyTemp,
    Languages.arabic: arLblBodyTemp,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblBodyTempTitle() {
  final logsByLanguage = {
    Languages.english: enLblBodyTempTitle,
    Languages.hindi: hiLblBodyTempTitle,
    Languages.arabic: arLblBodyTempTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblSleep() {
  final logsByLanguage = {
    Languages.english: enLblSleep,
    Languages.hindi: hiLblSleep,
    Languages.arabic: arLblSleep,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblSleepAm() {
  final logsByLanguage = {
    Languages.english: enLblSleepAm,
    Languages.hindi: hiLblSleepAm,
    Languages.arabic: arLblSleepAm,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblSleepPm() {
  final logsByLanguage = {
    Languages.english: enLblSleepPm,
    Languages.hindi: hiLblSleepPm,
    Languages.arabic: arLblSleepPm,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblSleepTitle() {
  final logsByLanguage = {
    Languages.english: enLblSleepTitle,
    Languages.hindi: hiLblSleepTitle,
    Languages.arabic: arLblSleepTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblMeditation() {
  final logsByLanguage = {
    Languages.english: enLblMeditation,
    Languages.hindi: hiLblMeditation,
    Languages.arabic: arLblMeditation,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblMeditationTitle() {
  final logsByLanguage = {
    Languages.english: enLblMeditationTitle,
    Languages.hindi: hiLblMeditationTitle,
    Languages.arabic: arLblMeditationTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblWater() {
  final logsByLanguage = {
    Languages.english: enLblWater,
    Languages.hindi: hiLblWater,
    Languages.arabic: arLblWater,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLblWaterTitle() {
  final logsByLanguage = {
    Languages.english: enLblWaterTitle,
    Languages.hindi: hiLblWaterTitle,
    Languages.arabic: arLblWaterTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphSleepTitle() {
  final logsByLanguage = {
    Languages.english: enGraphSleepTitle,
    Languages.hindi: hiGraphSleepTitle,
    Languages.arabic: arGraphSleepTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphSleepDate() {
  final logsByLanguage = {
    Languages.english: enGraphSleepDate,
    Languages.hindi: hiGraphSleepDate,
    Languages.arabic: arGraphSleepDate,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWeightUnitTitle() {
  final logsByLanguage = {
    Languages.english: enGraphWeightUnitTitle,
    Languages.hindi: hiGraphWeightUnitTitle,
    Languages.arabic: arGraphWeightUnitTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWeightLogDate() {
  final logsByLanguage = {
    Languages.english: enGraphWeightLogDate,
    Languages.hindi: hiGraphWeightLogDate,
    Languages.arabic: arGraphWeightLogDate,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryFeelings() {
  final logsByLanguage = {
    Languages.english: enCategoryFeelings,
    Languages.hindi: hiCategoryFeelings,
    Languages.arabic: arCategoryFeelings,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryMind() {
  final logsByLanguage = {
    Languages.english: enCategoryMind,
    Languages.hindi: hiCategoryMind,
    Languages.arabic: arCategoryMind,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategorySexualLife() {
  final logsByLanguage = {
    Languages.english: enCategorySexualLife,
    Languages.hindi: hiCategorySexualLife,
    Languages.arabic: arCategorySexualLife,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryEnergy() {
  final logsByLanguage = {
    Languages.english: enCategoryEnergy,
    Languages.hindi: hiCategoryEnergy,
    Languages.arabic: arCategoryEnergy,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryPeriod() {
  final logsByLanguage = {
    Languages.english: enCategoryPeriod,
    Languages.hindi: hiCategoryPeriod,
    Languages.arabic: arCategoryPeriod,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategorySymptoms() {
  final logsByLanguage = {
    Languages.english: enCategorySymptoms,
    Languages.hindi: hiCategorySymptoms,
    Languages.arabic: arCategorySymptoms,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryPain() {
  final logsByLanguage = {
    Languages.english: enCategoryPain,
    Languages.hindi: hiCategoryPain,
    Languages.arabic: arCategoryPain,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryVaginalDischarge() {
  final logsByLanguage = {
    Languages.english: enCategoryVaginalDischarge,
    Languages.hindi: hiCategoryVaginalDischarge,
    Languages.arabic: arCategoryVaginalDischarge,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryDigestion() {
  final logsByLanguage = {
    Languages.english: enCategoryDigestion,
    Languages.hindi: hiCategoryDigestion,
    Languages.arabic: arCategoryDigestion,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryActivity() {
  final logsByLanguage = {
    Languages.english: enCategoryActivity,
    Languages.hindi: hiCategoryActivity,
    Languages.arabic: arCategoryActivity,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryCravings() {
  final logsByLanguage = {
    Languages.english: enCategoryCravings,
    Languages.hindi: hiCategoryCravings,
    Languages.arabic: arCategoryCravings,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryTests() {
  final logsByLanguage = {
    Languages.english: enCategoryTests,
    Languages.hindi: hiCategoryTests,
    Languages.arabic: arCategoryTests,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryAilments() {
  final logsByLanguage = {
    Languages.english: enCategoryAilments,
    Languages.hindi: hiCategoryAilments,
    Languages.arabic: arCategoryAilments,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryAppointments() {
  final logsByLanguage = {
    Languages.english: enCategoryAppointments,
    Languages.hindi: hiCategoryAppointments,
    Languages.arabic: arCategoryAppointments,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryBirthControlPill() {
  final logsByLanguage = {
    Languages.english: enCategoryBirthControlPill,
    Languages.hindi: hiCategoryBirthControlPill,
    Languages.arabic: arCategoryBirthControlPill,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryIUD() {
  final logsByLanguage = {
    Languages.english: enCategoryIUD,
    Languages.hindi: hiCategoryIUD,
    Languages.arabic: arCategoryIUD,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategorySupplements() {
  final logsByLanguage = {
    Languages.english: enCategorySupplements,
    Languages.hindi: hiCategorySupplements,
    Languages.arabic: arCategorySupplements,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryUrine() {
  final logsByLanguage = {
    Languages.english: enCategoryUrine,
    Languages.hindi: hiCategoryUrine,
    Languages.arabic: arCategoryUrine,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCategoryOther() {
  final logsByLanguage = {
    Languages.english: enCategoryOther,
    Languages.hindi: hiCategoryOther,
    Languages.arabic: arCategoryOther,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphMeditationTitle() {
  final logsByLanguage = {
    Languages.english: enGraphMeditationTitle,
    Languages.hindi: hiGraphMeditationTitle,
    Languages.arabic: arGraphMeditationTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphMeditationDate() {
  final logsByLanguage = {
    Languages.english: enGraphMeditationDate,
    Languages.hindi: hiGraphMeditationDate,
    Languages.arabic: arGraphMeditationDate,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphMeditationMin() {
  final logsByLanguage = {
    Languages.english: enGraphMeditationMin,
    Languages.hindi: hiGraphMeditationMin,
    Languages.arabic: arGraphMeditationMin,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphMeditationMinTitle() {
  final logsByLanguage = {
    Languages.english: enGraphMeditationMinTitle,
    Languages.hindi: hiGraphMeditationMinTitle,
    Languages.arabic: arGraphMeditationMinTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWaterUnitCup() {
  final logsByLanguage = {
    Languages.english: enGraphWaterUnitCup,
    Languages.hindi: hiGraphWaterUnitCup,
    Languages.arabic: arGraphWaterUnitCup,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWaterUnitFlOz() {
  final logsByLanguage = {
    Languages.english: enGraphWaterUnitFlOz,
    Languages.hindi: hiGraphWaterUnitFlOz,
    Languages.arabic: arGraphWaterUnitFlOz,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWaterUnitImperialGallons() {
  final logsByLanguage = {
    Languages.english: enGraphWaterUnitImperialGallons,
    Languages.hindi: hiGraphWaterUnitImperialGallons,
    Languages.arabic: arGraphWaterUnitImperialGallons,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWaterUnitUSGallon() {
  final logsByLanguage = {
    Languages.english: enGraphWaterUnitUSGallon,
    Languages.hindi: hiGraphWaterUnitUSGallon,
    Languages.arabic: arGraphWaterUnitUSGallon,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWaterUnitMl() {
  final logsByLanguage = {
    Languages.english: enGraphWaterUnitMl,
    Languages.hindi: hiGraphWaterUnitMl,
    Languages.arabic: arGraphWaterUnitMl,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWeightKg() {
  final logsByLanguage = {
    Languages.english: enGraphWeightKg,
    Languages.hindi: hiGraphWeightKg,
    Languages.arabic: arGraphWeightKg,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getGraphWeighLb() {
  final logsByLanguage = {
    Languages.english: enGraphWeighLb,
    Languages.hindi: hiGraphWeighLb,
    Languages.arabic: arGraphWeighLb,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLogPeriodBedtime() {
  final logsByLanguage = {
    Languages.english: enLogPeriodBedtime,
    Languages.hindi: hiLogPeriodBedtime,
    Languages.arabic: arLogPeriodBedtime,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLogPeriodWakeUpTime() {
  final logsByLanguage = {
    Languages.english: enLogPeriodWakeUpTime,
    Languages.hindi: hiLogPeriodWakeUpTime,
    Languages.arabic: arLogPeriodWakeUpTime,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLogPeriodWakeUpTimeLog() {
  final logsByLanguage = {
    Languages.english: enLogPeriodWakeUpTimeLog,
    Languages.hindi: hiLogPeriodWakeUpTimeLog,
    Languages.arabic: arLogPeriodWakeUpTimeLog,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getLogPeriodBedTimeLog() {
  final logsByLanguage = {
    Languages.english: enLogPeriodBedTimeLog,
    Languages.hindi: hiLogPeriodBedTimeLog,
    Languages.arabic: arLogPeriodBedTimeLog,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameLight() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameLight,
    Languages.hindi: hiSymptomsNameLight,
    Languages.arabic: arSymptomsNameLight,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameMedium() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameMedium,
    Languages.hindi: hiSymptomsNameMedium,
    Languages.arabic: arSymptomsNameMedium,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameHeavy() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameHeavy,
    Languages.hindi: hiSymptomsNameHeavy,
    Languages.arabic: arSymptomsNameHeavy,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSuperHeavy() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSuperHeavy,
    Languages.hindi: hiSymptomsNameSuperHeavy,
    Languages.arabic: arSymptomsNameSuperHeavy,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameDontKnow() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameDontKnow,
    Languages.hindi: hiSymptomsNameDontKnow,
    Languages.arabic: arSymptomsNameDontKnow,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameExhausted() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameExhausted,
    Languages.hindi: hiSymptomsNameExhausted,
    Languages.arabic: arSymptomsNameExhausted,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameTired() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameTired,
    Languages.hindi: hiSymptomsNameTired,
    Languages.arabic: arSymptomsNameTired,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameOK() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameOK,
    Languages.hindi: hiSymptomsNameOK,
    Languages.arabic: arSymptomsNameOK,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameEnergetic() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameEnergetic,
    Languages.hindi: hiSymptomsNameEnergetic,
    Languages.arabic: arSymptomsNameEnergetic,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameFullyEnergized() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameFullyEnergized,
    Languages.hindi: hiSymptomsNameFullyEnergized,
    Languages.arabic: arSymptomsNameFullyEnergized,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSensitive() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSensitive,
    Languages.hindi: hiSymptomsNameSensitive,
    Languages.arabic: arSymptomsNameSensitive,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameNotInControl() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameNotInControl,
    Languages.hindi: hiSymptomsNameNotInControl,
    Languages.arabic: arSymptomsNameNotInControl,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameHappy() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameHappy,
    Languages.hindi: hiSymptomsNameHappy,
    Languages.arabic: arSymptomsNameHappy,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameFrisky() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameFrisky,
    Languages.hindi: hiSymptomsNameFrisky,
    Languages.arabic: arSymptomsNameFrisky,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameMoodSwings() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameMoodSwings,
    Languages.hindi: hiSymptomsNameMoodSwings,
    Languages.arabic: arSymptomsNameMoodSwings,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameIrritated() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameIrritated,
    Languages.hindi: hiSymptomsNameIrritated,
    Languages.arabic: arSymptomsNameIrritated,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSad() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSad,
    Languages.hindi: hiSymptomsNameSad,
    Languages.arabic: arSymptomsNameSad,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameTension() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameTension,
    Languages.hindi: hiSymptomsNameTension,
    Languages.arabic: arSymptomsNameTension,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameAngry() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameAngry,
    Languages.hindi: hiSymptomsNameAngry,
    Languages.arabic: arSymptomsNameAngry,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameConfident() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameConfident,
    Languages.hindi: hiSymptomsNameConfident,
    Languages.arabic: arSymptomsNameConfident,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameInsecure() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameInsecure,
    Languages.hindi: hiSymptomsNameInsecure,
    Languages.arabic: arSymptomsNameInsecure,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameGrateful() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameGrateful,
    Languages.hindi: hiSymptomsNameGrateful,
    Languages.arabic: arSymptomsNameGrateful,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameAnxiety() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameAnxiety,
    Languages.hindi: hiSymptomsNameAnxiety,
    Languages.arabic: arSymptomsNameAnxiety,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameExcited() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameExcited,
    Languages.hindi: hiSymptomsNameExcited,
    Languages.arabic: arSymptomsNameExcited,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameCalm() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameCalm,
    Languages.hindi: hiSymptomsNameCalm,
    Languages.arabic: arSymptomsNameCalm,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameDistracted() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameDistracted,
    Languages.hindi: hiSymptomsNameDistracted,
    Languages.arabic: arSymptomsNameDistracted,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameFocused() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameFocused,
    Languages.hindi: hiSymptomsNameFocused,
    Languages.arabic: arSymptomsNameFocused,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameDepressed() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameDepressed,
    Languages.hindi: hiSymptomsNameDepressed,
    Languages.arabic: arSymptomsNameDepressed,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameConfused() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameConfused,
    Languages.hindi: hiSymptomsNameConfused,
    Languages.arabic: arSymptomsNameConfused,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameStressed() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameStressed,
    Languages.hindi: hiSymptomsNameStressed,
    Languages.arabic: arSymptomsNameStressed,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameMotivated() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameMotivated,
    Languages.hindi: hiSymptomsNameMotivated,
    Languages.arabic: arSymptomsNameMotivated,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameUnmotivated() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameUnmotivated,
    Languages.hindi: hiSymptomsNameUnmotivated,
    Languages.arabic: arSymptomsNameUnmotivated,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameCreative() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameCreative,
    Languages.hindi: hiSymptomsNameCreative,
    Languages.arabic: arSymptomsNameCreative,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameProductive() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameProductive,
    Languages.hindi: hiSymptomsNameProductive,
    Languages.arabic: arSymptomsNameProductive,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameUnproductive() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameUnproductive,
    Languages.hindi: hiSymptomsNameUnproductive,
    Languages.arabic: arSymptomsNameUnproductive,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameNoSex() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameNoSex,
    Languages.hindi: hiSymptomsNameNoSex,
    Languages.arabic: arSymptomsNameNoSex,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameProtectedSex() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameProtectedSex,
    Languages.hindi: hiSymptomsNameProtectedSex,
    Languages.arabic: arSymptomsNameProtectedSex,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameUnprotectedSex() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameUnprotectedSex,
    Languages.hindi: hiSymptomsNameUnprotectedSex,
    Languages.arabic: arSymptomsNameUnprotectedSex,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameOralSex() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameOralSex,
    Languages.hindi: hiSymptomsNameOralSex,
    Languages.arabic: arSymptomsNameOralSex,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameAnalSex() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameAnalSex,
    Languages.hindi: hiSymptomsNameAnalSex,
    Languages.arabic: arSymptomsNameAnalSex,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameMasturbation() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameMasturbation,
    Languages.hindi: hiSymptomsNameMasturbation,
    Languages.arabic: arSymptomsNameMasturbation,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameHighSexDrive() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameHighSexDrive,
    Languages.hindi: hiSymptomsNameHighSexDrive,
    Languages.arabic: arSymptomsNameHighSexDrive,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameNeutralSexDrive() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameNeutralSexDrive,
    Languages.hindi: hiSymptomsNameNeutralSexDrive,
    Languages.arabic: arSymptomsNameNeutralSexDrive,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameLowSexDrive() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameLowSexDrive,
    Languages.hindi: hiSymptomsNameLowSexDrive,
    Languages.arabic: arSymptomsNameLowSexDrive,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSexToys() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSexToys,
    Languages.hindi: hiSymptomsNameSexToys,
    Languages.arabic: arSymptomsNameSexToys,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameOrgasm() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameOrgasm,
    Languages.hindi: hiSymptomsNameOrgasm,
    Languages.arabic: arSymptomsNameOrgasm,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameNoOrgasm() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameNoOrgasm,
    Languages.hindi: hiSymptomsNameNoOrgasm,
    Languages.arabic: arSymptomsNameNoOrgasm,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameEverythingWell() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameEverythingWell,
    Languages.hindi: hiSymptomsNameEverythingWell,
    Languages.arabic: arSymptomsNameEverythingWell,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameCramps() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameCramps,
    Languages.hindi: hiSymptomsNameCramps,
    Languages.arabic: arSymptomsNameCramps,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameTenderBreasts() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameTenderBreasts,
    Languages.hindi: hiSymptomsNameTenderBreasts,
    Languages.arabic: arSymptomsNameTenderBreasts,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameHeadache() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameHeadache,
    Languages.hindi: hiSymptomsNameHeadache,
    Languages.arabic: arSymptomsNameHeadache,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameAcne() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameAcne,
    Languages.hindi: hiSymptomsNameAcne,
    Languages.arabic: arSymptomsNameAcne,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameBackache() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameBackache,
    Languages.hindi: hiSymptomsNameBackache,
    Languages.arabic: arSymptomsNameBackache,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameAbdominalPain() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameAbdominalPain,
    Languages.hindi: hiSymptomsNameAbdominalPain,
    Languages.arabic: arSymptomsNameAbdominalPain,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameFatigue() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameFatigue,
    Languages.hindi: hiSymptomsNameFatigue,
    Languages.arabic: arSymptomsNameFatigue,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNamePainFree() {
  final logsByLanguage = {
    Languages.english: enSymptomsNamePainFree,
    Languages.hindi: hiSymptomsNamePainFree,
    Languages.arabic: arSymptomsNamePainFree,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNamePeriodCramps() {
  final logsByLanguage = {
    Languages.english: enSymptomsNamePeriodCramps,
    Languages.hindi: hiSymptomsNamePeriodCramps,
    Languages.arabic: arSymptomsNamePeriodCramps,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameOvulation() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameOvulation,
    Languages.hindi: hiSymptomsNameOvulation,
    Languages.arabic: arSymptomsNameOvulation,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameBreastTenderness() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameBreastTenderness,
    Languages.hindi: hiSymptomsNameBreastTenderness,
    Languages.arabic: arSymptomsNameBreastTenderness,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameMigraine() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameMigraine,
    Languages.hindi: hiSymptomsNameMigraine,
    Languages.arabic: arSymptomsNameMigraine,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameMigraineWithAura() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameMigraineWithAura,
    Languages.hindi: hiSymptomsNameMigraineWithAura,
    Languages.arabic: arSymptomsNameMigraineWithAura,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameLowerBack() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameLowerBack,
    Languages.hindi: hiSymptomsNameLowerBack,
    Languages.arabic: arSymptomsNameLowerBack,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameLeg() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameLeg,
    Languages.hindi: hiSymptomsNameLeg,
    Languages.arabic: arSymptomsNameLeg,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameJoint() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameJoint,
    Languages.hindi: hiSymptomsNameJoint,
    Languages.arabic: arSymptomsNameJoint,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameNoDischarge() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameNoDischarge,
    Languages.hindi: hiSymptomsNameNoDischarge,
    Languages.arabic: arSymptomsNameNoDischarge,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameLightDischarge() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameLightDischarge,
    Languages.hindi: hiSymptomsNameLightDischarge,
    Languages.arabic: arSymptomsNameLightDischarge,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameCreamy() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameCreamy,
    Languages.hindi: hiSymptomsNameCreamy,
    Languages.arabic: arSymptomsNameCreamy,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameWatery() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameWatery,
    Languages.hindi: hiSymptomsNameWatery,
    Languages.arabic: arSymptomsNameWatery,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameUnusual() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameUnusual,
    Languages.hindi: hiSymptomsNameUnusual,
    Languages.arabic: arSymptomsNameUnusual,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSpotting() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSpotting,
    Languages.hindi: hiSymptomsNameSpotting,
    Languages.arabic: arSymptomsNameSpotting,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSticky() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSticky,
    Languages.hindi: hiSymptomsNameSticky,
    Languages.arabic: arSymptomsNameSticky,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameEggWhite() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameEggWhite,
    Languages.hindi: hiSymptomsNameEggWhite,
    Languages.arabic: arSymptomsNameEggWhite,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameGray() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameGray,
    Languages.hindi: hiSymptomsNameGray,
    Languages.arabic: arSymptomsNameGray,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameGassy() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameGassy,
    Languages.hindi: hiSymptomsNameGassy,
    Languages.arabic: arSymptomsNameGassy,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameBloating() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameBloating,
    Languages.hindi: hiSymptomsNameBloating,
    Languages.arabic: arSymptomsNameBloating,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameHeartburn() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameHeartburn,
    Languages.hindi: hiSymptomsNameHeartburn,
    Languages.arabic: arSymptomsNameHeartburn,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameNauseous() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameNauseous,
    Languages.hindi: hiSymptomsNameNauseous,
    Languages.arabic: arSymptomsNameNauseous,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameVomiting() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameVomiting,
    Languages.hindi: hiSymptomsNameVomiting,
    Languages.arabic: arSymptomsNameVomiting,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameYoga() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameYoga,
    Languages.hindi: hiSymptomsNameYoga,
    Languages.arabic: arSymptomsNameYoga,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameRunning() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameRunning,
    Languages.hindi: hiSymptomsNameRunning,
    Languages.arabic: arSymptomsNameRunning,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameGym() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameGym,
    Languages.hindi: hiSymptomsNameGym,
    Languages.arabic: arSymptomsNameGym,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSwimming() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSwimming,
    Languages.hindi: hiSymptomsNameSwimming,
    Languages.arabic: arSymptomsNameSwimming,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameCycling() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameCycling,
    Languages.hindi: hiSymptomsNameCycling,
    Languages.arabic: arSymptomsNameCycling,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameWalking() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameWalking,
    Languages.hindi: hiSymptomsNameWalking,
    Languages.arabic: arSymptomsNameWalking,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNamePilates() {
  final logsByLanguage = {
    Languages.english: enSymptomsNamePilates,
    Languages.hindi: hiSymptomsNamePilates,
    Languages.arabic: arSymptomsNamePilates,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameStrengthTraining() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameStrengthTraining,
    Languages.hindi: hiSymptomsNameStrengthTraining,
    Languages.arabic: arSymptomsNameStrengthTraining,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameStretching() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameStretching,
    Languages.hindi: hiSymptomsNameStretching,
    Languages.arabic: arSymptomsNameStretching,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameRestDay() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameRestDay,
    Languages.hindi: hiSymptomsNameRestDay,
    Languages.arabic: arSymptomsNameRestDay,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameMeditation() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameMeditation,
    Languages.hindi: hiSymptomsNameMeditation,
    Languages.arabic: arSymptomsNameMeditation,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSweet() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSweet,
    Languages.hindi: hiSymptomsNameSweet,
    Languages.arabic: arSymptomsNameSweet,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSalty() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSalty,
    Languages.hindi: hiSymptomsNameSalty,
    Languages.arabic: arSymptomsNameSalty,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameGreasy() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameGreasy,
    Languages.hindi: hiSymptomsNameGreasy,
    Languages.arabic: arSymptomsNameGreasy,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSpicy() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSpicy,
    Languages.hindi: hiSymptomsNameSpicy,
    Languages.arabic: arSymptomsNameSpicy,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameCarbs() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameCarbs,
    Languages.hindi: hiSymptomsNameCarbs,
    Languages.arabic: arSymptomsNameCarbs,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameDontTakeTest() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameDontTakeTest,
    Languages.hindi: hiSymptomsNameDontTakeTest,
    Languages.arabic: arSymptomsNameDontTakeTest,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameNegative() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameNegative,
    Languages.hindi: hiSymptomsNameNegative,
    Languages.arabic: arSymptomsNameNegative,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNamePositive() {
  final logsByLanguage = {
    Languages.english: enSymptomsNamePositive,
    Languages.hindi: hiSymptomsNamePositive,
    Languages.arabic: arSymptomsNamePositive,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameColdOrFlu() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameColdOrFlu,
    Languages.hindi: hiSymptomsNameColdOrFlu,
    Languages.arabic: arSymptomsNameColdOrFlu,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameAllergy() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameAllergy,
    Languages.hindi: hiSymptomsNameAllergy,
    Languages.arabic: arSymptomsNameAllergy,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameFever() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameFever,
    Languages.hindi: hiSymptomsNameFever,
    Languages.arabic: arSymptomsNameFever,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameUTI() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameUTI,
    Languages.hindi: hiSymptomsNameUTI,
    Languages.arabic: arSymptomsNameUTI,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSTI() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSTI,
    Languages.hindi: hiSymptomsNameSTI,
    Languages.arabic: arSymptomsNameSTI,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameGYN() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameGYN,
    Languages.hindi: hiSymptomsNameGYN,
    Languages.arabic: arSymptomsNameGYN,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNamePAPSmear() {
  final logsByLanguage = {
    Languages.english: enSymptomsNamePAPSmear,
    Languages.hindi: hiSymptomsNamePAPSmear,
    Languages.arabic: arSymptomsNamePAPSmear,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameSTICheckUp() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameSTICheckUp,
    Languages.hindi: hiSymptomsNameSTICheckUp,
    Languages.arabic: arSymptomsNameSTICheckUp,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameGeneralCheckUp() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameGeneralCheckUp,
    Languages.hindi: hiSymptomsNameGeneralCheckUp,
    Languages.arabic: arSymptomsNameGeneralCheckUp,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameVaccination() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameVaccination,
    Languages.hindi: hiSymptomsNameVaccination,
    Languages.arabic: arSymptomsNameVaccination,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameTaken() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameTaken,
    Languages.hindi: hiSymptomsNameTaken,
    Languages.arabic: arSymptomsNameTaken,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameMissed() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameMissed,
    Languages.hindi: hiSymptomsNameMissed,
    Languages.arabic: arSymptomsNameMissed,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameLate() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameLate,
    Languages.hindi: hiSymptomsNameLate,
    Languages.arabic: arSymptomsNameLate,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameDoubleDose() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameDoubleDose,
    Languages.hindi: hiSymptomsNameDoubleDose,
    Languages.arabic: arSymptomsNameDoubleDose,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameVaccinationDuplicate() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameVaccinationDuplicate,
    Languages.hindi: hiSymptomsNameVaccinationDuplicate,
    Languages.arabic: arSymptomsNameVaccinationDuplicate,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameThreadChecked() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameThreadChecked,
    Languages.hindi: hiSymptomsNameThreadChecked,
    Languages.arabic: arSymptomsNameThreadChecked,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameInserted() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameInserted,
    Languages.hindi: hiSymptomsNameInserted,
    Languages.arabic: arSymptomsNameInserted,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameRemoved() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameRemoved,
    Languages.hindi: hiSymptomsNameRemoved,
    Languages.arabic: arSymptomsNameRemoved,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameMultivitamin() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameMultivitamin,
    Languages.hindi: hiSymptomsNameMultivitamin,
    Languages.arabic: arSymptomsNameMultivitamin,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameMagnesium() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameMagnesium,
    Languages.hindi: hiSymptomsNameMagnesium,
    Languages.arabic: arSymptomsNameMagnesium,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameIron() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameIron,
    Languages.hindi: hiSymptomsNameIron,
    Languages.arabic: arSymptomsNameIron,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameVitaminD() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameVitaminD,
    Languages.hindi: hiSymptomsNameVitaminD,
    Languages.arabic: arSymptomsNameVitaminD,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameCalcium() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameCalcium,
    Languages.hindi: hiSymptomsNameCalcium,
    Languages.arabic: arSymptomsNameCalcium,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameFolicAcid() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameFolicAcid,
    Languages.hindi: hiSymptomsNameFolicAcid,
    Languages.arabic: arSymptomsNameFolicAcid,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNamePrenatalVitamins() {
  final logsByLanguage = {
    Languages.english: enSymptomsNamePrenatalVitamins,
    Languages.hindi: hiSymptomsNamePrenatalVitamins,
    Languages.arabic: arSymptomsNamePrenatalVitamins,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameFrequentUrination() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameFrequentUrination,
    Languages.hindi: hiSymptomsNameFrequentUrination,
    Languages.arabic: arSymptomsNameFrequentUrination,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameBurningSensation() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameBurningSensation,
    Languages.hindi: hiSymptomsNameBurningSensation,
    Languages.arabic: arSymptomsNameBurningSensation,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameLeaksOrDribbles() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameLeaksOrDribbles,
    Languages.hindi: hiSymptomsNameLeaksOrDribbles,
    Languages.arabic: arSymptomsNameLeaksOrDribbles,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameTravel() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameTravel,
    Languages.hindi: hiSymptomsNameTravel,
    Languages.arabic: arSymptomsNameTravel,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameStress() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameStress,
    Languages.hindi: hiSymptomsNameStress,
    Languages.arabic: arSymptomsNameStress,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameAlcohol() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameAlcohol,
    Languages.hindi: hiSymptomsNameAlcohol,
    Languages.arabic: arSymptomsNameAlcohol,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getSymptomsNameJournaling() {
  final logsByLanguage = {
    Languages.english: enSymptomsNameJournaling,
    Languages.hindi: hiSymptomsNameJournaling,
    Languages.arabic: arSymptomsNameJournaling,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getWeekTitlesSun() {
  final logsByLanguage = {
    Languages.english: enWeekTitlesSun,
    Languages.hindi: hiWeekTitlesSun,
    Languages.arabic: arWeekTitlesSun,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getWeekTitlesMon() {
  final logsByLanguage = {
    Languages.english: enWeekTitlesMon,
    Languages.hindi: hiWeekTitlesMon,
    Languages.arabic: arWeekTitlesMon,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getWeekTitlesTue() {
  final logsByLanguage = {
    Languages.english: enWeekTitlesTue,
    Languages.hindi: hiWeekTitlesTue,
    Languages.arabic: arWeekTitlesTue,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getWeekTitlesWed() {
  final logsByLanguage = {
    Languages.english: enWeekTitlesWed,
    Languages.hindi: hiWeekTitlesWed,
    Languages.arabic: arWeekTitlesWed,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getWeekTitlesThu() {
  final logsByLanguage = {
    Languages.english: enWeekTitlesThu,
    Languages.hindi: hiWeekTitlesThu,
    Languages.arabic: arWeekTitlesThu,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getWeekTitlesFri() {
  final logsByLanguage = {
    Languages.english: enWeekTitlesFri,
    Languages.hindi: hiWeekTitlesFri,
    Languages.arabic: arWeekTitlesFri,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getWeekTitlesSat() {
  final logsByLanguage = {
    Languages.english: enWeekTitlesSat,
    Languages.hindi: hiWeekTitlesSat,
    Languages.arabic: arWeekTitlesSat,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getCycleDayTitle() {
  final logsByLanguage = {
    Languages.english: enCycleDayTitle,
    Languages.hindi: hiCycleDayTitle,
    Languages.arabic: arCycleDayTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getFeelingTodayTitle() {
  final logsByLanguage = {
    Languages.english: enFeelingTodayTitle,
    Languages.hindi: hiFeelingTodayTitle,
    Languages.arabic: arFeelingTodayTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getTodayTitle() {
  final logsByLanguage = {
    Languages.english: enTodayTitle,
    Languages.hindi: hiTodayTitle,
    Languages.arabic: arTodayTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getYesterdayTitle() {
  final logsByLanguage = {
    Languages.english: enYesterdayTitle,
    Languages.hindi: hiYesterdayTitle,
    Languages.arabic: arYesterdayTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getProtectedData() {
  final logsByLanguage = {
    Languages.english: enProtectedData,
    Languages.hindi: hiProtectedData,
    Languages.arabic: arProtectedData,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getRegularTitle() {
  final logsByLanguage = {
    Languages.english: enRegularTitle,
    Languages.hindi: hiRegularTitle,
    Languages.arabic: arRegularTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getNormalTitle() {
  final logsByLanguage = {
    Languages.english: enNormalTitle,
    Languages.hindi: hiNormalTitle,
    Languages.arabic: arNormalTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}

getIrregularTitle() {
  final logsByLanguage = {
    Languages.english: enIrregularTitle,
    Languages.hindi: hiIrregularTitle,
    Languages.arabic: arIrregularTitle,
  };

  return logsByLanguage[MenstrualCycleWidget.currentLanguage];
}
