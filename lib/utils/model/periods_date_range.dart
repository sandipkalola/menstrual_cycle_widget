class PeriodsDateRange {
  int? id;
  String? periodStartDate;
  String? cycleStartDate;
  String? cycleEndDate;
  String? periodEndDate;
  List<String>? allPeriodDates = [];
  int? periodDuration;
  int? cycleLength;

  PeriodsDateRange(
      {this.id,
      this.periodStartDate,
      this.periodEndDate,
      this.cycleEndDate,
      this.cycleStartDate,
      this.allPeriodDates,
      this.cycleLength = 0,
      this.periodDuration = 0});

  PeriodsDateRange.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    periodStartDate = json['period_start_date'];
    cycleEndDate = json['cycle_end_date'];
    cycleStartDate = json['cycle_start_date'];
    periodEndDate = json['period_end_date'];
    cycleLength = json['cycle_length'];
    allPeriodDates = (json['all_period_dates'] != null)
        ? json['all_period_dates'].cast<String>()
        : [];
    periodDuration = json['period_duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['period_start_date'] = periodStartDate;
    data['period_end_date'] = periodEndDate;
    data['all_period_dates'] = allPeriodDates;
    data['cycle_end_date'] = cycleEndDate;
    data['cycle_start_date'] = cycleStartDate;
    data['period_duration'] = periodDuration;
    data['cycle_length'] = cycleLength;

    return data;
  }
}
