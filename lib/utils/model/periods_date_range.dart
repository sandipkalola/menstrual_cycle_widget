class PeriodsDateRange {
  int? id;
  String? periodStartDate;
  String? periodEndDate;
  List<String>? allPeriodDates = [];
  int? periodDuration;
  int? cycleDuration;

  PeriodsDateRange(
      {this.id,
      this.periodStartDate,
      this.periodEndDate,
      this.allPeriodDates,
      this.cycleDuration = 0,
      this.periodDuration});

  PeriodsDateRange.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    periodStartDate = json['period_start_date'];
    periodEndDate = json['period_end_date'];
    cycleDuration = json['cycle_duration'];

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
    data['period_duration'] = periodDuration;
    data['cycle_duration'] = cycleDuration;

    return data;
  }
}
