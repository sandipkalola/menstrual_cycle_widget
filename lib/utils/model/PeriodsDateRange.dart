class PeriodsDateRange {
  int? id;
  String? periodStartDate;
  String? periodEndDate;
  List<String>? allPeriodDates = [];
  int? periodDuration;

  PeriodsDateRange(
      {this.id,
      this.periodStartDate,
      this.periodEndDate,
      this.allPeriodDates,
      this.periodDuration});

  PeriodsDateRange.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    periodStartDate = json['period_start_date'];
    periodEndDate = json['period_end_date'];
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
    return data;
  }
}
