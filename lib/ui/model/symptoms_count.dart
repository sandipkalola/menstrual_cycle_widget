class SymptomsCount {
  SymptomsCount({
    this.name,
    this.occurrences,
  });

  String? name;
  int? occurrences = 0;

  // Convert the object to a JSON-compatible map
  Map<String, dynamic> toJson() {
    return {
      'symptomName': name,
      'occurrences': occurrences,
    };
  }
}
