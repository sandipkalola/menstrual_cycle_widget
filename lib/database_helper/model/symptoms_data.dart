class Symptoms {
  int? categoryId;
  int? isVisibleCategory;
  String? categoryName;
  String? categoryColor;
  int? isCustomType;
  List<SymptomsData>? symptomsData;

  Symptoms(
      {this.categoryId = 0,
      this.categoryName,
      this.symptomsData,
      this.categoryColor = "#000000",
      this.isVisibleCategory = 1,
      this.isCustomType = 0});

  Symptoms.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    isVisibleCategory = json['isVisibleCategory'];
    categoryName = json['categoryName'];
    categoryColor = json['categoryColor'];
    isCustomType = json['isCustomType'];
    if (json['symptomsData'] != null) {
      symptomsData = <SymptomsData>[];
      json['symptomsData'].forEach((v) {
        symptomsData!.add(SymptomsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryId'] = categoryId;
    data['categoryName'] = categoryName;
    data['isVisibleCategory'] = isVisibleCategory;
    data['categoryColor'] = categoryColor;
    data['isCustomType'] = isCustomType;
    if (symptomsData != null) {
      data['symptomsData'] = symptomsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SymptomsData {
  int? id;
  int? symptomId;
  String? symptomName;
  bool isSelected = false;

  SymptomsData({
    this.id = 0,
    this.symptomName,
    this.symptomId = 0,
    this.isSelected = false,
  });

  SymptomsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symptomName = json['symptomName'];
    isSelected = json['isSelected'];
    symptomId = json['symptomId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symptomName'] = symptomName;
    data['symptomId'] = symptomId;
    data['isSelected'] = isSelected;

    return data;
  }
}
