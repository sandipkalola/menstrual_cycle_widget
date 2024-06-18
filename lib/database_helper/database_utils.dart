import 'package:intl/intl.dart';

import 'model/symptoms_data.dart';

List<Symptoms> defaultSymptomsData = [];

var weekDayNameDayMonth = DateFormat('EEEE, d MMM'); // Sunday, 10 Jun
var defaultDateFormat = DateFormat('yyyy-MM-dd'); // 2024-06-20
var currentDateFormat =
    DateFormat('yyyy-MM-dd hh:mm:ss'); // 2024-06-20 12:20:11
