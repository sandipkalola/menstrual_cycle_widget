import '../database_helper.dart';
import 'symptoms_data.dart';

class UserLogReportData {
  int? id;
  int? cycleDay;
  String? customerId;
  List<SymptomsData>? symptomsData;
  DateTime? logDate;
  String? createdAt;
  String? meditationTime;
  String? sleepTime;
  String? waterValue;
  String? waterUnit;
  String? bodyTemperatureUnit;
  String? weightUnit;
  String? notes;
  String? weight;
  String? bodyTemperature;

  UserLogReportData(
      {this.id,
      this.customerId,
      this.symptomsData,
      this.logDate,
      this.cycleDay,
      this.createdAt,
      this.bodyTemperature,
      this.meditationTime,
      this.notes,
      this.sleepTime,
      this.waterValue,
      this.weight,
      this.waterUnit,
      this.bodyTemperatureUnit,
      this.weightUnit});

  UserLogReportData.fromJson(Map<String, dynamic> json) {
    id = json[MenstrualCycleDbHelper.columnID];
    customerId = json['customerId'];
    symptomsData = json['symptomData'];
    logDate = json['logDate'];
    cycleDay = json['cycleDay'];
    createdAt = json['createdAt'];
    bodyTemperature = json['bodyTemperature'];
    meditationTime = json['meditationTime'];
    notes = json['notes'];
    sleepTime = json['sleepTime'];
    waterValue = json['waterValue'];
    weight = json['weight'];
    waterUnit = json['waterUnit'];
    bodyTemperatureUnit = json['bodyTemperatureUnit'];
    weightUnit = json['weightUnit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customerId'] = customerId;
    data['symptomData'] = symptomsData;
    data['logDate'] = logDate;
    data['cycleDay'] = cycleDay;
    data['createdAt'] = createdAt;
    data['bodyTemperature'] = bodyTemperature;
    data['meditationTime'] = meditationTime;
    data['notes'] = notes;
    data['sleepTime'] = sleepTime;
    data['waterValue'] = waterValue;
    data['waterUnit'] = waterUnit;
    data['bodyTemperatureUnit'] = bodyTemperatureUnit;
    data['weightUnit'] = weightUnit;
    data['weight'] = weight;
    return data;
  }
}
