import 'package:flutter/material.dart';

import '../menstrual_cycle_widget.dart';

// ignore: must_be_immutable
class MenstrualLogPeriodView extends StatefulWidget {
  DateTime? symptomsLogDate;
  Function? onSuccess;
  Function? onError;

  MenstrualLogPeriodView(
      {super.key,
      this.symptomsLogDate,
      required this.onSuccess,
      required this.onError});

  @override
  State<MenstrualLogPeriodView> createState() => _MenstrualLogPeriodViewState();
}

class _MenstrualLogPeriodViewState extends State<MenstrualLogPeriodView> {
  List<Symptoms> symptomsList = [];
  final dbHelper = MenstrualCycleDbHelper.instance;
  final mInstance = MenstrualCycleWidget.instance!;

  String currentDate = "";
  String logDate = "";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  // Regenerate list
  regenerateData() {
    for (int index = 0; index < defaultSymptomsData.length; index++) {
      Symptoms defaultData = defaultSymptomsData[index];
      Symptoms symptoms = Symptoms(symptomsData: []);
      symptoms.categoryId = defaultData.categoryId;
      symptoms.categoryName = defaultData.categoryName;
      symptoms.categoryColor = defaultData.categoryColor;
      List<SymptomsData> listSymptomsData = [];
      for (int indexJ = 0;
          indexJ < defaultSymptomsData[index].symptomsData!.length;
          indexJ++) {
        SymptomsData deSymptomsData =
            defaultSymptomsData[index].symptomsData![indexJ];
        SymptomsData symptomsData = SymptomsData();
        symptomsData.symptomName = deSymptomsData.symptomName;
        symptomsData.symptomId = deSymptomsData.symptomId;
        symptomsData.isSelected = false;
        listSymptomsData.add(symptomsData);
      }
      symptoms.symptomsData!.addAll(listSymptomsData);
      symptomsList.add(symptoms);
    }
  }

  init() async {
    if (widget.symptomsLogDate == null) {
      var now = DateTime.now();
      logDate = defaultDateFormat.format(now);
    } else {
      try {
        logDate = defaultDateFormat.format(widget.symptomsLogDate!);
      } catch (e) {
        throw "Invalid symptoms log date. Date format is yyyy-MM-dd";
      }
    }

    currentDate = currentDateFormat.format(DateTime.now());
    regenerateData();
    setState(() {
      isLoading = false;
    });
  }

  saveTodayLogs() async {
    List<SymptomsData> userLogData = [];
    for (int index = 0; index < symptomsList.length; index++) {
      for (int j = 0; j < symptomsList[index].symptomsData!.length; j++) {
        SymptomsData symptomsData = symptomsList[index].symptomsData![j];
        if (symptomsData.isSelected) {
          printLogs("Selected  Name: ${symptomsData.symptomName}");
          userLogData.add(symptomsData);
        }
      }
    }

    printLogs("Selected Ids: ${userLogData.toString()}");

    final instance = MenstrualCycleWidget.instance!;

    instance.saveSymptomsLogs(
        userSymptomsData: userLogData,
        onError: widget.onError,
        symptomsLogDate: widget.symptomsLogDate,
        onSuccess: widget.onSuccess);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 20),
            child: Column(
              children: [
                GestureDetector(
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    logDate,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                (isLoading)
                    ? const SizedBox(
                        height: 150,
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(8),
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: symptomsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${symptomsList[index].categoryName}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Wrap(
                                      children: symptomsList[index]
                                          .symptomsData!
                                          .map((chip) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 3),
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          FilterChip(
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(50),
                                              ),
                                            ),
                                            key: ValueKey(chip),
                                            side: chip.isSelected
                                                ? BorderSide(
                                                    color: Color(
                                                      int.parse(
                                                          "0xff${symptomsList[index].categoryColor}"),
                                                    ),
                                                  )
                                                : BorderSide.none,
                                            label: Text("${chip.symptomName}"),
                                            padding: const EdgeInsets.all(1),
                                            backgroundColor: chip.isSelected
                                                ? Colors.white
                                                : Color(
                                                    int.parse(
                                                        "0x26${symptomsList[index].categoryColor}"),
                                                  ),
                                            onSelected: (bool value) {
                                              setState(() {
                                                chip.isSelected =
                                                    !chip.isSelected;
                                              });
                                            },
                                          ),
                                          (chip.isSelected)
                                              ? Icon(Icons.check_circle_rounded,
                                                  color: Color(
                                                    int.parse(
                                                        "0xff${symptomsList[index].categoryColor}"),
                                                  ),
                                                  size: 16)
                                              : const SizedBox(),
                                        ],
                                      ),
                                    );
                                  }).toList()),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                GestureDetector(
                  onTap: () {
                    saveTodayLogs();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                      ),
                      color: Colors.green,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    margin: const EdgeInsets.all(10),
                    child: const Center(
                      child: Text(
                        "Save Log",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
