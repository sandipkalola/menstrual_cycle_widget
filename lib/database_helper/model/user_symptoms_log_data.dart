import '../database_helper.dart';

class UserSymptomsLogData {
  int? id;
  String? userid;
  String? symptomData;
  String? logDate;
  String? createdAt;

  UserSymptomsLogData(
      {this.id, this.userid, this.symptomData, this.logDate, this.createdAt});

  UserSymptomsLogData.fromJson(Map<String, dynamic> json) {
    id = json[MenstrualCycleDbHelper.columnID];
    userid = json['userid'];
    symptomData = json['symptomData'];
    logDate = json['logDate'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userid'] = userid;
    data['symptomData'] = symptomData;
    data['logDate'] = logDate;
    data['createdAt'] = createdAt;
    return data;
  }
}
