import '../menstrual_cycle_widget.dart';
import '../widget_languages/widget_base_language.dart';

// Last Id is: 21131
/// Default symptoms data
List<SymptomsCategory> defaultSymptomsData = [
  SymptomsCategory(
    categoryId: 5,
    categoryName: WidgetBaseLanguage.categoryPeriod,
    categoryColor: "FF0000",
    symptomsData: [
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameLight, symptomId: 210342),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameMedium, symptomId: 21043),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameHeavy,
          symptomId: 21044,
          phaseIds: [1]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameSuperHeavy,
          symptomId: 21045),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameDontKnow,
          symptomId: 21046),
    ],
  ),
  SymptomsCategory(
    categoryId: 1,
    categoryName: WidgetBaseLanguage.categoryFeelings,
    categoryColor: "FFA500",
    symptomsData: [
      /*SymptomsData(symptomName: "Sensitive", symptomId: 21001),
      SymptomsData(symptomName: "Not in control", symptomId: 21002),
      SymptomsData(symptomName: "Happy", symptomId: 21003, phaseIds: [2]),
      SymptomsData(symptomName: "Frisky", symptomId: 21004, phaseIds: [3]),
      SymptomsData(
          symptomName: "Mood swings", symptomId: 21005, phaseIds: [1, 4]),
      SymptomsData(
          symptomName: "Irritated", symptomId: 21006, phaseIds: [1, 4]),
      SymptomsData(symptomName: "Sad", symptomId: 21007, phaseIds: [1]),
      SymptomsData(symptomName: "Tension", symptomId: 21008, phaseIds: [4]),
      SymptomsData(symptomName: "Angry", symptomId: 21009),
      SymptomsData(symptomName: "Confident", symptomId: 21131, phaseIds: [3]),
      SymptomsData(symptomName: "Insecure", symptomId: 21010),
      SymptomsData(symptomName: "Grateful", symptomId: 21011),
      SymptomsData(symptomName: "Anxiety", symptomId: 21012, phaseIds: [4]),
      SymptomsData(symptomName: "Excited", symptomId: 21013, phaseIds: [2]),*/
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameSensitive,
          symptomId: 21001),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameNotInControl,
          symptomId: 21002),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameHappy,
          symptomId: 21003,
          phaseIds: [2]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameFrisky,
          symptomId: 21004,
          phaseIds: [3]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameMoodSwings,
          symptomId: 21005,
          phaseIds: [1, 4]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameIrritated,
          symptomId: 21006,
          phaseIds: [1, 4]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameSad,
          symptomId: 21007,
          phaseIds: [1]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameTension,
          symptomId: 21008,
          phaseIds: [4]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameAngry, symptomId: 21009),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameConfident,
          symptomId: 21131,
          phaseIds: [3]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameInsecure,
          symptomId: 21010),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameGrateful,
          symptomId: 21011),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameAnxiety,
          symptomId: 21012,
          phaseIds: [4]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameExcited,
          symptomId: 21013,
          phaseIds: [2]),
    ],
  ),
  SymptomsCategory(
    categoryId: 2,
    categoryName: WidgetBaseLanguage.categoryMind,
    categoryColor: "8B0000",
    symptomsData: [
      /*SymptomsData(symptomName: "Calm", symptomId: 21014, phaseIds: [2]),
      SymptomsData(symptomName: "Distracted", symptomId: 21015),
      SymptomsData(symptomName: "Focused", symptomId: 21016, phaseIds: [2]),
      SymptomsData(symptomName: "Depressed", symptomId: 21017),
      SymptomsData(symptomName: "Confused", symptomId: 21018),
      SymptomsData(symptomName: "Stressed", symptomId: 21019),
      SymptomsData(symptomName: "Motivated", symptomId: 21020, phaseIds: [2]),
      SymptomsData(symptomName: "Unmotivated", symptomId: 21021, phaseIds: [4]),
      SymptomsData(symptomName: "Creative", symptomId: 21022, phaseIds: [2]),
      SymptomsData(symptomName: "Productive", symptomId: 21023, phaseIds: [2]),
      SymptomsData(symptomName: "Unproductive", symptomId: 21024),*/
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameCalm,
          symptomId: 21014,
          phaseIds: [2]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameDistracted,
          symptomId: 21015),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameFocused,
          symptomId: 21016,
          phaseIds: [2]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameDepressed,
          symptomId: 21017),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameConfused,
          symptomId: 21018),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameStressed,
          symptomId: 21019),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameMotivated,
          symptomId: 21020,
          phaseIds: [2]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameUnmotivated,
          symptomId: 21021,
          phaseIds: [4]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameCreative,
          symptomId: 21022,
          phaseIds: [2]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameProductive,
          symptomId: 21023,
          phaseIds: [2]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameUnproductive,
          symptomId: 21024),
    ],
  ),
  SymptomsCategory(
    categoryId: 3,
    categoryName: WidgetBaseLanguage.categorySexualLife,
    categoryColor: "A52A2A",
    symptomsData: [
      /*SymptomsData(symptomName: "No sex", symptomId: 21025),
      SymptomsData(
          symptomName: "Protected sex", symptomId: 21026, phaseIds: [3]),
      SymptomsData(
          symptomName: "Unprotected sex", symptomId: 21027, phaseIds: [3]),
      SymptomsData(symptomName: "Oral sex", symptomId: 21028),
      SymptomsData(symptomName: "Anal sex", symptomId: 21029),
      SymptomsData(symptomName: "Masturbation", symptomId: 21030),
      SymptomsData(symptomName: "High sex drive", symptomId: 21031),
      SymptomsData(symptomName: "Neutral sex drive", symptomId: 21032),
      SymptomsData(symptomName: "Low sex drive", symptomId: 21033),
      SymptomsData(symptomName: "Sex toys", symptomId: 21034),
      SymptomsData(symptomName: "Orgasm", symptomId: 21035),
      SymptomsData(symptomName: "No orgasm", symptomId: 21036),*/
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameNoSex, symptomId: 21025),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameProtectedSex,
          symptomId: 21026,
          phaseIds: [3]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameUnprotectedSex,
          symptomId: 21027,
          phaseIds: [3]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameOralSex,
          symptomId: 21028),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameAnalSex,
          symptomId: 21029),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameMasturbation,
          symptomId: 21030),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameHighSexDrive,
          symptomId: 21031),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameNeutralSexDrive,
          symptomId: 21032),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameLowSexDrive,
          symptomId: 21033),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameSexToys,
          symptomId: 21034),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameOrgasm, symptomId: 21035),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameNoOrgasm,
          symptomId: 21036),
    ],
  ),
  SymptomsCategory(
    categoryId: 4,
    categoryName: WidgetBaseLanguage.categoryEnergy,
    categoryColor: "0000FF",
    symptomsData: [
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameExhausted,
          symptomId: 21037,
          phaseIds: [1]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameTired,
          symptomId: 21038,
          phaseIds: [1]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameOK, symptomId: 21039),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameEnergetic,
          symptomId: 21040,
          phaseIds: [2]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameFullyEnergized,
          symptomId: 21041,
          phaseIds: [2, 3]),
    ],
  ),
  SymptomsCategory(
    categoryId: 6,
    categoryName: WidgetBaseLanguage.categorySymptoms,
    categoryColor: "808080",
    symptomsData: [
      /*SymptomsData(symptomName: "Everything well", symptomId: 21047),
      SymptomsData(symptomName: "Cramps", symptomId: 21048, phaseIds: [1]),
      SymptomsData(
          symptomName: "Tender breasts", symptomId: 21049, phaseIds: [1, 4]),
      SymptomsData(symptomName: "Headache", symptomId: 21050),
      SymptomsData(symptomName: "Acne", symptomId: 21051),
      SymptomsData(symptomName: "Backache", symptomId: 21052, phaseIds: [1, 4]),
      SymptomsData(symptomName: "Abdominal pain", symptomId: 21053),
      SymptomsData(symptomName: "Fatigue", symptomId: 21054, phaseIds: [4]),*/

      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameEverythingWell,
          symptomId: 21047),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameCramps,
          symptomId: 21048,
          phaseIds: [1]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameTenderBreasts,
          symptomId: 21049,
          phaseIds: [1, 4]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameHeadache,
          symptomId: 21050),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameAcne, symptomId: 21051),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameBackache,
          symptomId: 21052,
          phaseIds: [1, 4]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameAbdominalPain,
          symptomId: 21053),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameFatigue,
          symptomId: 21054,
          phaseIds: [4]),
    ],
  ),
  SymptomsCategory(
    categoryId: 7,
    categoryName: WidgetBaseLanguage.categoryPain,
    categoryColor: "800080",
    symptomsData: [
      /*SymptomsData(symptomName: "Pain free", symptomId: 21055),
      SymptomsData(symptomName: "Period cramps", symptomId: 21056),
      SymptomsData(symptomName: "Ovulation", symptomId: 21057),
      SymptomsData(symptomName: "Breast tenderness", symptomId: 21058),
      SymptomsData(symptomName: "Headache", symptomId: 21059, phaseIds: [1]),
      SymptomsData(symptomName: "Migraine", symptomId: 21060, phaseIds: [4]),
      SymptomsData(symptomName: "Migraine with aura", symptomId: 21061),
      SymptomsData(symptomName: "Lower back", symptomId: 21062),
      SymptomsData(symptomName: "Leg", symptomId: 21063),
      SymptomsData(symptomName: "Joint", symptomId: 21064),*/
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNamePainFree,
          symptomId: 21055),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNamePeriodCramps,
          symptomId: 21056),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameOvulation,
          symptomId: 21057),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameBreastTenderness,
          symptomId: 21058),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameHeadache,
          symptomId: 21059,
          phaseIds: [1]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameMigraine,
          symptomId: 21060,
          phaseIds: [4]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameMigraineWithAura,
          symptomId: 21061),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameLowerBack,
          symptomId: 21062),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameLeg, symptomId: 21063),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameJoint, symptomId: 21064),
    ],
  ),
  SymptomsCategory(
    categoryId: 8,
    categoryName: WidgetBaseLanguage.categoryVaginalDischarge,
    categoryColor: "0000FF",
    isVisibleCategory: 0,
    symptomsData: [
      /*SymptomsData(symptomName: "No discharge", symptomId: 21065),
      SymptomsData(
          symptomName: "Light discharge", symptomId: 21130, phaseIds: [2]),
      SymptomsData(symptomName: "Creamy", symptomId: 21066),
      SymptomsData(symptomName: "Watery", symptomId: 21067),
      SymptomsData(symptomName: "Unusual", symptomId: 21068),
      SymptomsData(symptomName: "Spotting", symptomId: 21069),
      SymptomsData(symptomName: "Sticky", symptomId: 21070),
      SymptomsData(symptomName: "Egg white", symptomId: 21071),
      SymptomsData(symptomName: "Gray", symptomId: 21072),*/

      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameNoDischarge,
          symptomId: 21065),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameLightDischarge,
          symptomId: 21130,
          phaseIds: [2]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameCreamy, symptomId: 21066),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameWatery, symptomId: 21067),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameUnusual,
          symptomId: 21068),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameSpotting,
          symptomId: 21069),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameSticky, symptomId: 21070),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameEggWhite,
          symptomId: 21071),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameGray, symptomId: 21072),
    ],
  ),
  SymptomsCategory(
    categoryId: 9,
    categoryName: WidgetBaseLanguage.categoryDigestion,
    categoryColor: "FF0000",
    symptomsData: [
      /*SymptomsData(symptomName: "OK", symptomId: 21073),
      SymptomsData(symptomName: "Gassy", symptomId: 21074, phaseIds: [1, 4]),
      SymptomsData(symptomName: "Bloating", symptomId: 21075, phaseIds: [1, 4]),
      SymptomsData(symptomName: "Heartburn", symptomId: 21076, phaseIds: [4]),
      SymptomsData(symptomName: "Nauseous", symptomId: 21077, phaseIds: [1]),
      SymptomsData(symptomName: "Vomiting", symptomId: 21078),*/
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameOK, symptomId: 21073),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameGassy,
          symptomId: 21074,
          phaseIds: [1, 4]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameBloating,
          symptomId: 21075,
          phaseIds: [1, 4]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameHeartburn,
          symptomId: 21076,
          phaseIds: [4]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameNauseous,
          symptomId: 21077,
          phaseIds: [1]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameVomiting,
          symptomId: 21078),
    ],
  ),
  SymptomsCategory(
    categoryId: 10,
    categoryName: WidgetBaseLanguage.categoryActivity,
    categoryColor: "8B0000",
    symptomsData: [
      /*SymptomsData(symptomName: "Yoga", symptomId: 21079, phaseIds: [2]),
      SymptomsData(symptomName: "Running", symptomId: 21080, phaseIds: [3]),
      SymptomsData(symptomName: "Gym", symptomId: 21081, phaseIds: [3]),
      SymptomsData(symptomName: "Swimming", symptomId: 21082, phaseIds: [3]),
      SymptomsData(symptomName: "Cycling", symptomId: 21083),
      SymptomsData(symptomName: "Walking", symptomId: 21084, phaseIds: [2]),
      SymptomsData(symptomName: "Pilates", symptomId: 21085),
      SymptomsData(
          symptomName: "Strength training", symptomId: 21086, phaseIds: [2]),
      SymptomsData(symptomName: "Stretching", symptomId: 21087),
      SymptomsData(symptomName: "Rest day", symptomId: 21088),
      SymptomsData(symptomName: "Meditation", symptomId: 21089),*/
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameYoga,
          symptomId: 21079,
          phaseIds: [2]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameRunning,
          symptomId: 21080,
          phaseIds: [3]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameGym,
          symptomId: 21081,
          phaseIds: [3]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameSwimming,
          symptomId: 21082,
          phaseIds: [3]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameCycling,
          symptomId: 21083),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameWalking,
          symptomId: 21084,
          phaseIds: [2]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNamePilates,
          symptomId: 21085),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameStrengthTraining,
          symptomId: 21086,
          phaseIds: [2]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameStretching,
          symptomId: 21087),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameRestDay,
          symptomId: 21088),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameMeditation,
          symptomId: 21089),
    ],
  ),
  SymptomsCategory(
    categoryId: 11,
    categoryName: WidgetBaseLanguage.categoryCravings,
    categoryColor: "A52A2A",
    symptomsData: [
      /*SymptomsData(symptomName: "Sweet", symptomId: 21090, phaseIds: [4]),
      SymptomsData(symptomName: "Salty", symptomId: 21091, phaseIds: [4]),
      SymptomsData(symptomName: "Greasy", symptomId: 21092),
      SymptomsData(symptomName: "Spicy", symptomId: 21093),
      SymptomsData(symptomName: "Carbs", symptomId: 21094),*/
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameSweet,
          symptomId: 21090,
          phaseIds: [4]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameSalty,
          symptomId: 21091,
          phaseIds: [4]),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameGreasy, symptomId: 21092),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameSpicy, symptomId: 21093),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameCarbs, symptomId: 21094),
    ],
  ),
  SymptomsCategory(
    categoryId: 12,
    categoryName: WidgetBaseLanguage.categoryTests,
    categoryColor: "0000FF",
    symptomsData: [
      /* SymptomsData(symptomName: "Don't take test", symptomId: 21095),
      SymptomsData(symptomName: "Negative", symptomId: 21096),
      SymptomsData(symptomName: "Positive", symptomId: 21097),*/
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameDontTakeTest,
          symptomId: 21095),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameNegative,
          symptomId: 21096),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNamePositive,
          symptomId: 21097),
    ],
  ),
  SymptomsCategory(
    categoryId: 13,
    categoryName: WidgetBaseLanguage.categoryAilments,
    categoryColor: "FFA500",
    symptomsData: [
      /*SymptomsData(symptomName: "Cold or flu", symptomId: 21098),
      SymptomsData(symptomName: "Allergy", symptomId: 21099),
      SymptomsData(symptomName: "Fever", symptomId: 21100),
      SymptomsData(symptomName: "UTI", symptomId: 21101),
      SymptomsData(symptomName: "STI", symptomId: 21102),*/
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameColdOrFlu,
          symptomId: 21098),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameAllergy,
          symptomId: 21099),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameFever, symptomId: 21100),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameUTI, symptomId: 21101),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameSTI, symptomId: 21102),
    ],
  ),
  SymptomsCategory(
    categoryId: 14,
    categoryName: WidgetBaseLanguage.categoryAppointments,
    categoryColor: "800080",
    symptomsData: [
      /*SymptomsData(symptomName: "GYN", symptomId: 21103),
      SymptomsData(symptomName: "PAP smear", symptomId: 21104),
      SymptomsData(symptomName: "STI check-up", symptomId: 21105),
      SymptomsData(symptomName: "General check-up", symptomId: 21106),
      SymptomsData(symptomName: "Vaccination", symptomId: 21107),*/
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameGYN, symptomId: 21103),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNamePAPSmear,
          symptomId: 21104),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameSTICheckUp,
          symptomId: 21105),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameGeneralCheckUp,
          symptomId: 21106),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameVaccination,
          symptomId: 21107),
    ],
  ),
  SymptomsCategory(
    categoryId: 15,
    categoryName: WidgetBaseLanguage.categoryBirthControlPill,
    categoryColor: "0000FF",
    symptomsData: [
      /*SymptomsData(symptomName: "Taken", symptomId: 21108),
      SymptomsData(symptomName: "Missed", symptomId: 21109),
      SymptomsData(symptomName: "Late", symptomId: 21110),
      SymptomsData(symptomName: "Double dose", symptomId: 21111),
      SymptomsData(symptomName: "Vaccination", symptomId: 21112),*/
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameTaken, symptomId: 21108),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameMissed, symptomId: 21109),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameLate, symptomId: 21110),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameDoubleDose,
          symptomId: 21111),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameVaccinationDuplicate,
          symptomId: 21112),
    ],
  ),
  SymptomsCategory(
    categoryId: 16,
    categoryName: WidgetBaseLanguage.categoryIUD,
    categoryColor: "FF0000",
    symptomsData: [
      /*SymptomsData(symptomName: "Thread checked", symptomId: 21113),
      SymptomsData(symptomName: "Inserted", symptomId: 21114),
      SymptomsData(symptomName: "Removed", symptomId: 21115),*/
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameThreadChecked,
          symptomId: 21113),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameInserted,
          symptomId: 21114),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameRemoved,
          symptomId: 21115),
    ],
  ),
  SymptomsCategory(
    categoryId: 17,
    categoryName: WidgetBaseLanguage.categorySupplements,
    categoryColor: "8B0000",
    symptomsData: [
      /*SymptomsData(symptomName: "Multivitamin", symptomId: 21116),
      SymptomsData(symptomName: "Magnesium", symptomId: 21117),
      SymptomsData(symptomName: "Iron", symptomId: 21118),
      SymptomsData(symptomName: "Vitamin D", symptomId: 21119),
      SymptomsData(symptomName: "Calcium", symptomId: 21120),
      SymptomsData(symptomName: "Folic acid", symptomId: 21121),
      SymptomsData(symptomName: "Prenatal vitamins", symptomId: 21122),*/
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameMultivitamin,
          symptomId: 21116),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameMagnesium,
          symptomId: 21117),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameIron, symptomId: 21118),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameVitaminD,
          symptomId: 21119),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameCalcium,
          symptomId: 21120),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameFolicAcid,
          symptomId: 21121),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNamePrenatalVitamins,
          symptomId: 21122),
    ],
  ),
  SymptomsCategory(
    categoryId: 18,
    categoryName: WidgetBaseLanguage.categoryUrine,
    categoryColor: "0000FF",
    symptomsData: [
      /* SymptomsData(symptomName: "Frequent urination", symptomId: 21123),
      SymptomsData(symptomName: "Burning sensation", symptomId: 21124),
      SymptomsData(symptomName: "Leaks or dribbles", symptomId: 21125),*/
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameFrequentUrination,
          symptomId: 21123),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameBurningSensation,
          symptomId: 21124),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameLeaksOrDribbles,
          symptomId: 21125),
    ],
  ),
  SymptomsCategory(
    categoryId: 19,
    categoryName: WidgetBaseLanguage.categoryOther,
    categoryColor: "c336a7",
    symptomsData: [
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameTravel, symptomId: 21126),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameStress, symptomId: 21127),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameAlcohol,
          symptomId: 21128),
      SymptomsData(
          symptomName: WidgetBaseLanguage.symptomsNameJournaling,
          symptomId: 21129),
      /*SymptomsData(symptomName: "Travel", symptomId: 21126),
      SymptomsData(symptomName: "Stress", symptomId: 21127),
      SymptomsData(symptomName: "Alcohol", symptomId: 21128),
      SymptomsData(symptomName: "Journaling", symptomId: 21129),*/
    ],
  ),
];

/// 2024-06-20
var defaultDateFormat = getDefaultDateFormat();

/// 2024-06-20 12:20:11
var currentDateFormat = getCurrentDateFormat();

getDefaultDateFormat() {
  return CalenderDateUtils.dateFormat;
}

getCurrentDateFormat() {
  return CalenderDateUtils.fullFormatWithTime;
}
