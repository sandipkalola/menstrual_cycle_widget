class LogReport {
  LogReport(
      {this.mainValue = 0,
      this.mainIndex = 0,
      this.type,
      this.subValue = 0,
      this.subIndex = 0,
      this.totalMin = 0,
      this.finalValue = ""});

  int? mainValue;
  int? mainIndex;
  int? subValue;
  int? subIndex;
  String? type;
  String? finalValue;
  int? totalMin;
}
