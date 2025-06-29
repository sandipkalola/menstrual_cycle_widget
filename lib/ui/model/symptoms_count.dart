class SymptomsCount {
  SymptomsCount({this.name, this.occurrences, this.accuracy});

  String? name;
  int? occurrences = 0;
  double? accuracy = 0.0;

  // Convert the object to a JSON-compatible map
  Map<String, dynamic> toJson() {
    return {
      'symptomName': name,
      'occurrences': occurrences,
      'accuracy': accuracy,
    };
  }
}
