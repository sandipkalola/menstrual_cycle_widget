import 'package:intl/intl.dart';

import '../menstrual_cycle_widget.dart';

/// Default symptoms data
List<Symptoms> defaultSymptomsData = [
  Symptoms(
    categoryId: 1,
    categoryName: "Mood",
    categoryColor: "ffaf5d",
    symptomsData: [
      SymptomsData(symptomName: "Calm"),
      SymptomsData(symptomName: "Happy"),
      SymptomsData(symptomName: "Energetic"),
      SymptomsData(symptomName: "Frisky"),
      SymptomsData(symptomName: "Mood swings"),
      SymptomsData(symptomName: "Irritated"),
      SymptomsData(symptomName: "Sad"),
      SymptomsData(symptomName: "Anxious"),
      SymptomsData(symptomName: "Depressed"),
      SymptomsData(symptomName: "Feeling guilty"),
    ],
  ),
  Symptoms(
    categoryId: 2,
    categoryName: "Sexual Life",
    categoryColor: "d5514f",
    symptomsData: [
      SymptomsData(symptomName: "Don't Sex"),
      SymptomsData(symptomName: "Protected Sex"),
      SymptomsData(symptomName: "Unprotected Sex"),
      SymptomsData(symptomName: "Masturbation"),
      SymptomsData(symptomName: "High Sex"),
    ],
  ),
  Symptoms(
    categoryId: 3,
    categoryName: "Symptoms",
    categoryColor: "b43dab",
    symptomsData: [
      SymptomsData(symptomName: "Everything well"),
      SymptomsData(symptomName: "Cramps"),
      SymptomsData(symptomName: "Tender breasts"),
      SymptomsData(symptomName: "Headache"),
      SymptomsData(symptomName: "Acne"),
    ],
  ),
  Symptoms(
    categoryId: 4,
    categoryName: "Vaginal Discharge",
    categoryColor: "946bec",
    isVisibleCategory: 0,
    symptomsData: [
      SymptomsData(symptomName: "No discharge"),
      SymptomsData(symptomName: "Creamy"),
      SymptomsData(symptomName: "Watery"),
      SymptomsData(symptomName: "Sticky"),
      SymptomsData(symptomName: "Egg white"),
    ],
  ),
  Symptoms(
    categoryId: 5,
    categoryName: "Digestion",
    categoryColor: "c336a7",
    symptomsData: [
      SymptomsData(symptomName: "Nausea"),
      SymptomsData(symptomName: "Bloating"),
      SymptomsData(symptomName: "Constipation"),
    ],
  ),
  Symptoms(
    categoryId: 6,
    categoryName: "Activity",
    categoryColor: "c336a7",
    symptomsData: [
      SymptomsData(symptomName: "Yoga"),
      SymptomsData(symptomName: "Gym"),
      SymptomsData(symptomName: "Constipation"),
    ],
  ),
  Symptoms(
    categoryId: 7,
    categoryName: "Other",
    categoryColor: "c336a7",
    symptomsData: [
      SymptomsData(symptomName: "Other 1"),
      SymptomsData(symptomName: "Other 2"),
      SymptomsData(symptomName: "Other 3"),
    ],
  ),
];


/// 2024-06-20
var defaultDateFormat = DateFormat('yyyy-MM-dd');

/// 2024-06-20 12:20:11
var currentDateFormat = DateFormat('yyyy-MM-dd hh:mm:ss');

