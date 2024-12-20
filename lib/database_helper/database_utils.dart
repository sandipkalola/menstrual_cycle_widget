import 'package:intl/intl.dart';

import '../menstrual_cycle_widget.dart';

// Last Id is: 21131
/// Default symptoms data
List<SymptomsCategory> defaultSymptomsData = [
  SymptomsCategory(
    categoryId: 5,
    categoryName: Strings.categoryPeriod,
    categoryColor: "FF0000",
    symptomsData: [
      SymptomsData(symptomName: "Light", symptomId: 210342),
      SymptomsData(symptomName: "Medium", symptomId: 21043),
      SymptomsData(symptomName: "Heavy", symptomId: 21044, phaseIds: [1]),
      SymptomsData(symptomName: "Super heavy", symptomId: 21045),
      SymptomsData(symptomName: "Don't know", symptomId: 21046),
    ],
  ),
  SymptomsCategory(
    categoryId: 1,
    categoryName: Strings.categoryFeelings,
    categoryColor: "FFA500",
    symptomsData: [
      SymptomsData(symptomName: "Sensitive", symptomId: 21001),
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
      SymptomsData(symptomName: "Excited", symptomId: 21013, phaseIds: [2]),
    ],
  ),
  SymptomsCategory(
    categoryId: 2,
    categoryName: Strings.categoryMind,
    categoryColor: "8B0000",
    symptomsData: [
      SymptomsData(symptomName: "Calm", symptomId: 21014, phaseIds: [2]),
      SymptomsData(symptomName: "Distracted", symptomId: 21015),
      SymptomsData(symptomName: "Focused", symptomId: 21016, phaseIds: [2]),
      SymptomsData(symptomName: "Depressed", symptomId: 21017),
      SymptomsData(symptomName: "Confused", symptomId: 21018),
      SymptomsData(symptomName: "Stressed", symptomId: 21019),
      SymptomsData(symptomName: "Motivated", symptomId: 21020, phaseIds: [2]),
      SymptomsData(symptomName: "Unmotivated", symptomId: 21021, phaseIds: [4]),
      SymptomsData(symptomName: "Creative", symptomId: 21022, phaseIds: [2]),
      SymptomsData(symptomName: "Productive", symptomId: 21023, phaseIds: [2]),
      SymptomsData(symptomName: "Unproductive", symptomId: 21024),
    ],
  ),
  SymptomsCategory(
    categoryId: 3,
    categoryName: Strings.categorySexualLife,
    categoryColor: "A52A2A",
    symptomsData: [
      SymptomsData(symptomName: "No sex", symptomId: 21025),
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
      SymptomsData(symptomName: "No orgasm", symptomId: 21036),
    ],
  ),
  SymptomsCategory(
    categoryId: 4,
    categoryName: Strings.categoryEnergy,
    categoryColor: "0000FF",
    symptomsData: [
      SymptomsData(symptomName: "Exhausted", symptomId: 21037, phaseIds: [1]),
      SymptomsData(symptomName: "Tired", symptomId: 21038, phaseIds: [1]),
      SymptomsData(symptomName: "OK", symptomId: 21039),
      SymptomsData(symptomName: "Energetic", symptomId: 21040, phaseIds: [2]),
      SymptomsData(
          symptomName: "Fully energized", symptomId: 21041, phaseIds: [2, 3]),
    ],
  ),
  SymptomsCategory(
    categoryId: 6,
    categoryName: Strings.categorySymptoms,
    categoryColor: "808080",
    symptomsData: [
      SymptomsData(symptomName: "Everything well", symptomId: 21047),
      SymptomsData(symptomName: "Cramps", symptomId: 21048, phaseIds: [1]),
      SymptomsData(
          symptomName: "Tender breasts", symptomId: 21049, phaseIds: [1, 4]),
      SymptomsData(symptomName: "Headache", symptomId: 21050),
      SymptomsData(symptomName: "Acne", symptomId: 21051),
      SymptomsData(symptomName: "Backache", symptomId: 21052, phaseIds: [1, 4]),
      SymptomsData(symptomName: "Abdominal pain", symptomId: 21053),
      SymptomsData(symptomName: "Fatigue", symptomId: 21054, phaseIds: [4]),
    ],
  ),
  SymptomsCategory(
    categoryId: 7,
    categoryName: Strings.categoryPain,
    categoryColor: "800080",
    symptomsData: [
      SymptomsData(symptomName: "Pain free", symptomId: 21055),
      SymptomsData(symptomName: "Period cramps", symptomId: 21056),
      SymptomsData(symptomName: "Ovulation", symptomId: 21057),
      SymptomsData(symptomName: "Breast tenderness", symptomId: 21058),
      SymptomsData(symptomName: "Headache", symptomId: 21059, phaseIds: [1]),
      SymptomsData(symptomName: "Migraine", symptomId: 21060, phaseIds: [4]),
      SymptomsData(symptomName: "Migraine with aura", symptomId: 21061),
      SymptomsData(symptomName: "Lower back", symptomId: 21062),
      SymptomsData(symptomName: "Leg", symptomId: 21063),
      SymptomsData(symptomName: "Joint", symptomId: 21064),
    ],
  ),
  SymptomsCategory(
    categoryId: 8,
    categoryName: Strings.categoryVaginalDischarge,
    categoryColor: "0000FF",
    isVisibleCategory: 0,
    symptomsData: [
      SymptomsData(symptomName: "No discharge", symptomId: 21065),
      SymptomsData(
          symptomName: "Light discharge", symptomId: 21130, phaseIds: [2]),
      SymptomsData(symptomName: "Creamy", symptomId: 21066),
      SymptomsData(symptomName: "Watery", symptomId: 21067),
      SymptomsData(symptomName: "Unusual", symptomId: 21068),
      SymptomsData(symptomName: "Spotting", symptomId: 21069),
      SymptomsData(symptomName: "Sticky", symptomId: 21070),
      SymptomsData(symptomName: "Egg white", symptomId: 21071),
      SymptomsData(symptomName: "Gray", symptomId: 21072),
    ],
  ),
  SymptomsCategory(
    categoryId: 9,
    categoryName: Strings.categoryDigestion,
    categoryColor: "FF0000",
    symptomsData: [
      SymptomsData(symptomName: "OK", symptomId: 21073),
      SymptomsData(symptomName: "Gassy", symptomId: 21074, phaseIds: [1, 4]),
      SymptomsData(symptomName: "Bloating", symptomId: 21075, phaseIds: [1, 4]),
      SymptomsData(symptomName: "Heartburn", symptomId: 21076, phaseIds: [4]),
      SymptomsData(symptomName: "Nauseous", symptomId: 21077, phaseIds: [1]),
      SymptomsData(symptomName: "Vomiting", symptomId: 21078),
    ],
  ),
  SymptomsCategory(
    categoryId: 10,
    categoryName: Strings.categoryActivity,
    categoryColor: "8B0000",
    symptomsData: [
      SymptomsData(symptomName: "Yoga", symptomId: 21079, phaseIds: [2]),
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
      SymptomsData(symptomName: "Meditation", symptomId: 21089),
    ],
  ),
  SymptomsCategory(
    categoryId: 11,
    categoryName: Strings.categoryCravings,
    categoryColor: "A52A2A",
    symptomsData: [
      SymptomsData(symptomName: "Sweet", symptomId: 21090, phaseIds: [4]),
      SymptomsData(symptomName: "Salty", symptomId: 21091, phaseIds: [4]),
      SymptomsData(symptomName: "Greasy", symptomId: 21092),
      SymptomsData(symptomName: "Spicy", symptomId: 21093),
      SymptomsData(symptomName: "Carbs", symptomId: 21094),
    ],
  ),
  SymptomsCategory(
    categoryId: 12,
    categoryName: Strings.categoryTests,
    categoryColor: "0000FF",
    symptomsData: [
      SymptomsData(symptomName: "Don't take test", symptomId: 21095),
      SymptomsData(symptomName: "Negative", symptomId: 21096),
      SymptomsData(symptomName: "Positive", symptomId: 21097),
    ],
  ),
  SymptomsCategory(
    categoryId: 13,
    categoryName: Strings.categoryAilments,
    categoryColor: "FFA500",
    symptomsData: [
      SymptomsData(symptomName: "Cold or flu", symptomId: 21098),
      SymptomsData(symptomName: "Allergy", symptomId: 21099),
      SymptomsData(symptomName: "Fever", symptomId: 21100),
      SymptomsData(symptomName: "UTI", symptomId: 21101),
      SymptomsData(symptomName: "STI", symptomId: 21102),
    ],
  ),
  SymptomsCategory(
    categoryId: 14,
    categoryName: Strings.categoryAppointments,
    categoryColor: "800080",
    symptomsData: [
      SymptomsData(symptomName: "GYN", symptomId: 21103),
      SymptomsData(symptomName: "PAP smear", symptomId: 21104),
      SymptomsData(symptomName: "STI check-up", symptomId: 21105),
      SymptomsData(symptomName: "General check-up", symptomId: 21106),
      SymptomsData(symptomName: "Vaccination", symptomId: 21107),
    ],
  ),
  SymptomsCategory(
    categoryId: 15,
    categoryName: Strings.categoryBirthControlPill,
    categoryColor: "0000FF",
    symptomsData: [
      SymptomsData(symptomName: "Taken", symptomId: 21108),
      SymptomsData(symptomName: "Missed", symptomId: 21109),
      SymptomsData(symptomName: "Late", symptomId: 21110),
      SymptomsData(symptomName: "Double dose", symptomId: 21111),
      SymptomsData(symptomName: "Vaccination", symptomId: 21112),
    ],
  ),
  SymptomsCategory(
    categoryId: 16,
    categoryName: Strings.categoryIUD,
    categoryColor: "FF0000",
    symptomsData: [
      SymptomsData(symptomName: "Thread checked", symptomId: 21113),
      SymptomsData(symptomName: "Inserted", symptomId: 21114),
      SymptomsData(symptomName: "Removed", symptomId: 21115),
    ],
  ),
  SymptomsCategory(
    categoryId: 17,
    categoryName: Strings.categorySupplements,
    categoryColor: "8B0000",
    symptomsData: [
      SymptomsData(symptomName: "Multivitamin", symptomId: 21116),
      SymptomsData(symptomName: "Magnesium", symptomId: 21117),
      SymptomsData(symptomName: "Iron", symptomId: 21118),
      SymptomsData(symptomName: "Vitamin D", symptomId: 21119),
      SymptomsData(symptomName: "Calcium", symptomId: 21120),
      SymptomsData(symptomName: "Folic acid", symptomId: 21121),
      SymptomsData(symptomName: "Prenatal vitamins", symptomId: 21122),
    ],
  ),
  SymptomsCategory(
    categoryId: 18,
    categoryName: Strings.categoryUrine,
    categoryColor: "0000FF",
    symptomsData: [
      SymptomsData(symptomName: "Frequent urination", symptomId: 21123),
      SymptomsData(symptomName: "Burning sensation", symptomId: 21124),
      SymptomsData(symptomName: "Leaks or dribbles", symptomId: 21125),
    ],
  ),
  SymptomsCategory(
    categoryId: 19,
    categoryName: Strings.categoryOther,
    categoryColor: "c336a7",
    symptomsData: [
      SymptomsData(symptomName: "Travel", symptomId: 21126),
      SymptomsData(symptomName: "Stress", symptomId: 21127),
      SymptomsData(symptomName: "Alcohol", symptomId: 21128),
      SymptomsData(symptomName: "Journaling", symptomId: 21129),
    ],
  ),
];

/// 2024-06-20
var defaultDateFormat = DateFormat('yyyy-MM-dd');

/// 2024-06-20 12:20:11
var currentDateFormat = DateFormat('yyyy-MM-dd hh:mm:ss');
