import 'phases_percentage.dart';

class SymptomsPatterns {
  SymptomsPatterns({this.name, this.percentageOfCycles, this.phases});

  String? name;
  int? percentageOfCycles = 0;
  List<PhasePercentage>? phases;

  // Convert the object to a JSON-compatible map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symptom_name'] = name;
    data['percentage_of_cycles'] = percentageOfCycles;
    if (phases != null) {
      data['phases'] = phases!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
