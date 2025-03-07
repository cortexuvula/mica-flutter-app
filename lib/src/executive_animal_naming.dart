import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/executive_luria.dart';
import 'package:mica/src/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExecutiveAnimalNaming extends StatefulWidget {
  final String patientName;
  final String assessorName;
  final String handedness;
  final DateTime assessmentDate;
  final int languageComprehensionRadioValue;
  final int trialOneScore;
  final int trialTwoScore;
  final int trialThreeScore;
  final int visuospatialPraxisImage1;
  final int visuospatialPraxisImage2;
  final int visuospatialPraxisImage3;
  final int attention;
  final int attentionCorrect;
  final int attentionMistakes;

  const ExecutiveAnimalNaming({
    super.key,
    required this.patientName,
    required this.assessorName,
    required this.handedness,
    required this.assessmentDate,
    required this.languageComprehensionRadioValue,
    required this.trialOneScore,
    required this.trialTwoScore,
    required this.trialThreeScore,
    required this.visuospatialPraxisImage1,
    required this.visuospatialPraxisImage2,
    required this.visuospatialPraxisImage3,
    required this.attention,
    required this.attentionCorrect,
    required this.attentionMistakes,
  });

  @override
  _ExecutiveAnimalNamingState createState() => _ExecutiveAnimalNamingState();
}

class _ExecutiveAnimalNamingState extends State<ExecutiveAnimalNaming>
    with TickerProviderStateMixin {
  double sizeBoxHeight = 10.0;
  int _radioValue = 2; // Default value
  int _counter = 0;
  int startSeconds = 60;

  String buttonText = "Start";

  late AnimationController clockController;

  bool isCountingDown = false;
  bool counterStarted = false;

  String get timerString {
    Duration duration = clockController.duration! * clockController.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    getPrefsData();
    clockController = AnimationController(
      vsync: this,
      duration: Duration(seconds: startSeconds),
    );
  }

  @override
  void dispose() {
    clockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final shouldPop = await savePrefData();
          if (shouldPop && context.mounted) {
            Navigator.of(context).pop();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              appData.testExecutiveAnimalNaming,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              appData.testExecutiveAnimalNamingSubtitle,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  var router = MaterialPageRoute(
                      builder: (BuildContext context) => const Welcome());
                  Navigator.of(context).pushAndRemoveUntil(
                      router, (Route<dynamic> route) => false);
                })
          ],
        ),
        body: ListView(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: sizeBoxHeight,
                  ),
                  SizedBox(
                    width: width * 0.9,
                    child: Card(
                      elevation: 10.0,
                      color: Colors.yellowAccent.shade400,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const <Widget>[
                            Text(
                              appData.testExecutiveAnimalNamingToPatient,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizeBoxHeight,
                  ),
                  SizedBox(
                    width: width * 0.9,
                    child: Card(
                      elevation: 10.0,
                      color: Colors.deepPurple.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const <Widget>[
                            Text(
                              appData.testExecutiveAnimalNamingDetails,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizeBoxHeight,
                  ),
                  SizedBox(
                    width: width * 0.9,
                    child: Card(
                      elevation: 10.0,
                      color: Colors.deepPurple.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: AnimatedBuilder(
                                  animation: clockController,
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return Text(
                                      timerString,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500),
                                    );
                                  }),
                            ),
                            SizedBox(
                              width: 150.0,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.cyan.shade200,
                                  ),
                                  onPressed: () {
                                    if (clockController.isAnimating) {
                                      clockController.stop();
                                      setState(() {
                                        buttonText = "Resume";
                                      });
                                    } else {
                                      clockController.reverse(
                                          from: clockController.value == 0.0
                                              ? 1.0
                                              : clockController.value);
                                      setState(() {
                                        buttonText = "Pause";
                                      });
                                    }
                                  },
                                  child: Text(
                                    buttonText,
                                    style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: width * 0.9,
                    child: Card(
                      elevation: 10.0,
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      height: 75.0,
                                      color: Colors.white,
                                      child: Center(
                                        child: Text(
                                          "$_counter",
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 75.0,
                                    color: Colors.cyan.shade200,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          color: Colors.cyan.shade200,
                                          child: const Text(
                                            "Tap to count Words",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            TextButton(
                                                style: TextButton.styleFrom(
                                                  foregroundColor: Colors.black,
                                                  backgroundColor: Colors.cyan.shade200,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    _counter += 1;
                                                    if (_counter >= 12 &&
                                                        _counter <= 14) {
                                                      _radioValue = 1;
                                                    }
                                                    if (_counter > 14) {
                                                      _radioValue = 0;
                                                    }
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.add,
                                                )),
                                            TextButton(
                                                style: TextButton.styleFrom(
                                                  foregroundColor: Colors.black,
                                                  backgroundColor: Colors.cyan.shade200,
                                                ),
                                                onPressed: () {
                                                  if (_counter > 0) {
                                                    _counter -= 1;
                                                  }
                                                  setState(() {
                                                    if (_counter >= 12 &&
                                                        _counter <= 14) {
                                                      _radioValue = 1;
                                                    }
                                                    if (_counter > 14) {
                                                      _radioValue = 0;
                                                    }
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.remove,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Table(
                              border: TableBorder.all(),
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              columnWidths: const {
                                0: FlexColumnWidth(0.3),
                                1: FlexColumnWidth(0.3),
                                2: FlexColumnWidth(0.34)
                              },
                              children: [
                                TableRow(children: [
                                  Row(
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 0,
                                        groupValue: _radioValue,
                                        onChanged: _handleRadioValueChange,
                                        activeColor: Colors.white,
                                      ),
                                      const Text(
                                        "Normal",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 1,
                                        groupValue: _radioValue,
                                        onChanged: _handleRadioValueChange,
                                        activeColor: Colors.white,
                                      ),
                                      const Text(
                                        "Equivocal",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 2,
                                        groupValue: _radioValue,
                                        onChanged: _handleRadioValueChange,
                                        activeColor: Colors.white,
                                      ),
                                      const Text(
                                        "Impaired",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData
                                          .testExecutiveAnimalNamingResponseNormal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData
                                          .testExecutiveAnimalNamingResponseEquivocal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData
                                          .testExecutiveAnimalNamingResponseImpaired,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                ])
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60.0,
                  ),
                  SizedBox(
                    width: width * 0.6,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan.shade200,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExecutiveLuria(
                              patientName: widget.patientName,
                              assessorName: widget.assessorName,
                              handedness: widget.handedness,
                              assessmentDate: widget.assessmentDate,
                              languageComprehensionRadioValue:
                                  widget.languageComprehensionRadioValue,
                              trialOneScore: widget.trialOneScore,
                              trialTwoScore: widget.trialTwoScore,
                              trialThreeScore: widget.trialThreeScore,
                              visuospatialPraxisImage1: widget.visuospatialPraxisImage1,
                              visuospatialPraxisImage2: widget.visuospatialPraxisImage2,
                              visuospatialPraxisImage3: widget.visuospatialPraxisImage3,
                              attention: widget.attention,
                              attentionCorrect: widget.attentionCorrect,
                              attentionMistakes: widget.attentionMistakes,
                              executiveAnimalNaming: _radioValue,
                              executiveAnimalNamingCount: _counter,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'NEXT',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRadioValueChange(int? value) {
    if (value != null) {
      setState(() {
        _radioValue = value;
      });
    }
  }

  setPrefsData(bool shouldReturnTrue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("executiveAnimalNaming", _radioValue);
    await prefs.setInt("executiveAnimalNamingCount", _counter);
    return shouldReturnTrue;
  }

  Future<bool> savePrefData() async {
    return setPrefsData(true);
  }

  getPrefsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      var execNameVal = prefs.getInt("executiveAnimalNaming");
      var execNameCount = prefs.getInt("executiveAnimalNamingCount");
      if (execNameVal != null) _radioValue = execNameVal;
      if (execNameCount != null) _counter = execNameCount;
    });
  }
}
