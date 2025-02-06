class SymptomsPattern {
  String? symptomsName;
  int? numberOfCount;
  List<CycleData>? cycleData;

  SymptomsPattern({this.symptomsName, this.numberOfCount, this.cycleData});

  SymptomsPattern.fromJson(Map<String, dynamic> json) {
    symptomsName = json['symptomsName'];
    numberOfCount = json['numberOfCount'];
    if (json['cycleData'] != null) {
      cycleData = <CycleData>[];
      json['cycleData'].forEach((v) {
        cycleData!.add(CycleData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symptomsName'] = symptomsName;
    data['numberOfCount'] = numberOfCount;
    if (cycleData != null) {
      data['cycleData'] = cycleData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CycleData {
  String? cycleStartDate;
  String? cycleEndDate;
  bool? isCurrentCycle;
  List<CycleDates>? cycleDates;

  CycleData(
      {this.cycleStartDate,
      this.cycleEndDate,
      this.isCurrentCycle,
      this.cycleDates});

  CycleData.fromJson(Map<String, dynamic> json) {
    cycleStartDate = json['cycleStartDate'];
    cycleEndDate = json['cycleEndDate'];
    isCurrentCycle = json['isCurrentCycle'];
    if (json['cycleDates'] != null) {
      cycleDates = <CycleDates>[];
      json['cycleDates'].forEach((v) {
        cycleDates!.add(CycleDates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cycleStartDate'] = cycleStartDate;
    data['cycleEndDate'] = cycleEndDate;
    data['isCurrentCycle'] = isCurrentCycle;
    if (cycleDates != null) {
      data['cycleDates'] = cycleDates!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CycleDates {
  String? cycleDay;
  String? cycleDate;
  bool? isPeriodDay;
  bool? isOvulationDay;
  bool? isFoundSymptoms;

  CycleDates(
      {this.cycleDay,
      this.cycleDate,
      this.isPeriodDay,
      this.isOvulationDay,
      this.isFoundSymptoms});

  CycleDates.fromJson(Map<String, dynamic> json) {
    cycleDay = json['cycleDay'];
    cycleDate = json['cycleDate'];
    isPeriodDay = json['isPeriodDay'];
    isOvulationDay = json['isOvulationDay'];
    isFoundSymptoms = json['isFoundSymptoms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cycleDay'] = cycleDay;
    data['cycleDate'] = cycleDate;
    data['isPeriodDay'] = isPeriodDay;
    data['isOvulationDay'] = isOvulationDay;
    data['isFoundSymptoms'] = isFoundSymptoms;
    return data;
  }
}
