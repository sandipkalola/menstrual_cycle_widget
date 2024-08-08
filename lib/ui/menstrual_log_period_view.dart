import 'package:flutter/cupertino.dart';
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

  int wholePart = 36;
  int fractionalPart = 4;

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

  saveBodyTempLog() {}

  saveMeditationLog() {}

  saveSleepLog() {}

  saveWaterLog() {}

  saveWeightLog() {}

  saveTodayLogs() async {
    List<SymptomsData> userLogData = [];
    for (int index = 0; index < symptomsList.length; index++) {
      for (int j = 0; j < symptomsList[index].symptomsData!.length; j++) {
        SymptomsData symptomsData = symptomsList[index].symptomsData![j];
        if (symptomsData.isSelected) {
          //printLogs("Selected  Name: ${symptomsData.symptomName}");
          userLogData.add(symptomsData);
        }
      }
    }
    //printLogs("Selected Ids: ${userLogData.toString()}");
    final instance = MenstrualCycleWidget.instance!;

    instance.saveSymptomsLogs(
        userSymptomsData: userLogData,
        onError: widget.onError,
        symptomsLogDate: widget.symptomsLogDate,
        onSuccess: widget.onSuccess);

    Navigator.pop(context);
  }

  void _showBottomSheetView(
      {required BuildContext context,
      required String title,
      required String type,
      required Function onClick,
      required Widget childView}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  childView,
                  Text(
                    type,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  onClick.call();
                  Navigator.pop(context);
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
                      "Done",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildWaterPicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPicker(
          value: wholePart,
          minValue: 0,
          maxValue: 20,
          onSelectedItemChanged: (index) {
            /* setState(() {
              wholePart = 35 + index;
            });*/
          },
        ),
      ],
    );
  }

  Widget _buildTemperaturePicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPicker(
          value: wholePart,
          minValue: 35,
          maxValue: 40,
          onSelectedItemChanged: (index) {
            /* setState(() {
              wholePart = 35 + index;
            });*/
          },
        ),
        const Text(
          '.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        _buildPicker(
          value: fractionalPart,
          minValue: 1,
          maxValue: 99,
          onSelectedItemChanged: (index) {
            /* setState(() {
              fractionalPart = index;
            });*/
          },
        ),
      ],
    );
  }

  Widget _buildSleepPicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPicker(
          value: wholePart,
          minValue: 0,
          maxValue: 23,
          onSelectedItemChanged: (index) {
            /* setState(() {
              wholePart = 35 + index;
            });*/
          },
        ),
        const Text(
          'h',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        _buildPicker(
          value: fractionalPart,
          minValue: 0,
          maxValue: 60,
          onSelectedItemChanged: (index) {
            /* setState(() {
              fractionalPart = index;
            });*/
          },
        ),
        const Text(
          'm',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildWeightPicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPicker(
          value: wholePart,
          minValue: 20,
          maxValue: 300,
          onSelectedItemChanged: (index) {
            /* setState(() {
              wholePart = 35 + index;
            });*/
          },
        ),
        const Text(
          '.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        _buildPicker(
          value: fractionalPart,
          minValue: 0,
          isForWeight: true,
          maxValue: 9,
          onSelectedItemChanged: (index) {
            /* setState(() {
              fractionalPart = index;
            });*/
          },
        ),
      ],
    );
  }

  Widget _buildPicker({
    required int value,
    required int minValue,
    required int maxValue,
    required ValueChanged<int> onSelectedItemChanged,
    bool isForWeight = false,
  }) {
    return SizedBox(
      height: 150,
      width: 80,
      child: CupertinoPicker(
        magnification: 1.4,
        squeeze: 0.8,
        useMagnifier: true,
        scrollController: FixedExtentScrollController(),
        itemExtent: 32.0,
        onSelectedItemChanged: onSelectedItemChanged,
        children: List.generate(maxValue - minValue + 1, (index) {
          return Center(
            child: (isForWeight)
                ? Text(
                    (minValue + index).toString(),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  )
                : ((minValue + index) > 9)
                    ? Text(
                        (minValue + index).toString(),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )
                    : Text(
                        "0${(minValue + index)}",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
          );
        }),
      ),
    );
  }

  Widget logView({
    required String image,
    required String title,
    required String hintText,
    required Widget addIcon,
    required Widget removeIcon,
    required Function onAddClick,
    required Function onRemoveClick,
    required String typeString,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        image,
                        package: flutterPackageName,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Row(
                    children: [
                      ClipOval(
                        child: Material(
                          color: Colors.grey, // Button color
                          child: InkWell(
                            splashColor: Colors.black26, // Splash color
                            onTap: () {
                              onRemoveClick.call();
                            },
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: removeIcon,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ClipOval(
                        child: Material(
                          color: Colors.grey, // Button color
                          child: InkWell(
                            splashColor: Colors.black26, // Splash color
                            onTap: () {
                              onAddClick.call();
                            },
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: addIcon,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      onAddClick.call();
                    },
                    child: Text(
                      hintText,
                      style: const TextStyle(fontSize: 40, color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      typeString,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Text(
                      logDate,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    GestureDetector(
                      child: const Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 30,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                logView(
                    title: "Weight",
                    addIcon: const Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    hintText: "000",
                    image: weightImage,
                    onAddClick: () {
                      _showBottomSheetView(
                          context: context,
                          type: Strings.weightKg,
                          onClick: saveWeightLog,
                          childView: _buildWeightPicker(),
                          title: "Log your weight");
                    },
                    onRemoveClick: () {},
                    removeIcon: const Icon(
                      Icons.delete,
                      size: 20,
                    ),
                    typeString: "/ ${Strings.weightKg}"),
                logView(
                    title: "Body Temperature",
                    addIcon: const Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    hintText: "000",
                    image: temperatureImage,
                    onAddClick: () {
                      _showBottomSheetView(
                          context: context,
                          title: "Log body temperature",
                          childView: _buildTemperaturePicker(),
                          onClick: saveBodyTempLog,
                          type: "°${Strings.bodyTempC}");
                    },
                    onRemoveClick: () {},
                    removeIcon: const Icon(
                      Icons.delete,
                      size: 20,
                    ),
                    typeString: "/ °${Strings.bodyTempC}"),
                logView(
                    title: "Sleep",
                    addIcon: const Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    hintText: "00 h:00 m",
                    image: sleepImage,
                    onAddClick: () {
                      _showBottomSheetView(
                          context: context,
                          type: "",
                          onClick: saveSleepLog,
                          childView: _buildSleepPicker(),
                          title: "Log your sleep time");
                    },
                    onRemoveClick: () {},
                    removeIcon: const Icon(
                      Icons.delete,
                      size: 20,
                    ),
                    typeString: ""),
                logView(
                    title: "Meditation",
                    addIcon: const Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    hintText: "00 h:00 m",
                    image: yogaImage,
                    onAddClick: () {
                      _showBottomSheetView(
                          context: context,
                          type: "",
                          onClick: saveMeditationLog,
                          childView: _buildSleepPicker(),
                          title: "Log your meditation time");
                    },
                    onRemoveClick: () {},
                    removeIcon: const Icon(
                      Icons.delete,
                      size: 20,
                    ),
                    typeString: ""),
                logView(
                    title: "Water",
                    addIcon: const Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    hintText: "00",
                    image: drinkWaterImage,
                    onAddClick: () {
                      _showBottomSheetView(
                          context: context,
                          title: "Log your drink water",
                          childView: _buildWaterPicker(),
                          onClick: saveWaterLog,
                          type: Strings.graphWaterUnitLiter);
                    },
                    onRemoveClick: () {},
                    removeIcon: const Icon(
                      Icons.delete,
                      size: 20,
                    ),
                    typeString: "/ ${Strings.graphWaterUnitLiter}"),
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
                        Strings.saveLogs,
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
