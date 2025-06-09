class PhasePercentage {
  String? phaseName;
  double? percentage;

  PhasePercentage({required this.phaseName, required this.percentage});

  PhasePercentage.fromJson(Map<String, dynamic> json) {
    phaseName = json['phaseName'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phaseName'] = phaseName;
    data['percentage'] = percentage;
    return data;
  }
}
