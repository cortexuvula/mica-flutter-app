import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/shortterm_memory_verbal.dart';
import 'package:mica/src/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExecutiveSerial extends StatefulWidget {
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
  final int executiveAnimalNaming;
  final int executiveLuria;
  final int executiveLuriaScore;
  final int executiveAnimalNamingCount;

  const ExecutiveSerial(
      {super.key,
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
      required this.executiveAnimalNaming,
      required this.executiveAnimalNamingCount,
      required this.executiveLuria,
      required this.executiveLuriaScore});

  @override
  _ExecutiveSerialState createState() => _ExecutiveSerialState();
}

class _ExecutiveSerialState extends State<ExecutiveSerial> {
  final double sizeBoxHeight = 10.0;
  int? _radioValue;
  int score = 0;
  List<String> executiveSerialButtonColor = [];

  Color decembermonthButtonColor = Colors.yellow;
  Color novembermonthButtonColor = Colors.yellow;
  Color octobermonthButtonColor = Colors.yellow;
  Color septembermonthButtonColor = Colors.yellow;
  Color augustmonthButtonColor = Colors.yellow;
  Color julymonthButtonColor = Colors.yellow;

  bool decemberTapped = false;
  bool novemberTapped = false;
  bool octoberTapped = false;
  bool septemberTapped = false;
  bool augustTapped = false;
  bool julyTapped = false;

  @override
  void initState() {
    super.initState();
    getPrefsData();
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
              appData.testExecutiveSerial,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              appData.testExecutiveSerialSubtitle,
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
                          children: <Widget>[
                            Text(
                              appData.testExecutiveSerialToPatient1,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
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
                          children: <Widget>[
                            Text(
                              appData.testExecutiveSerialDetails,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
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
                      color: Colors.yellowAccent.shade400,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              appData.testExecutiveSerialToPatient2,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
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
                          children: <Widget>[
                            Text(
                              "Tap to score",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                            Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              columnWidths: {
                                0: FlexColumnWidth(0.5),
                                1: FlexColumnWidth(0.5),
                              },
                              children: [
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            decembermonthButtonColor,
                                      ),
                                      child: const Text("December"),
                                      onPressed: () {
                                        if (!decemberTapped) {
                                          setState(() {
                                            decembermonthButtonColor =
                                                Colors.green;
                                            decemberTapped = true;
                                            score += 1;
                                          });
                                        } else if (decemberTapped) {
                                          setState(() {
                                            decembermonthButtonColor =
                                                Colors.yellow;
                                            decemberTapped = false;
                                            score -= 1;
                                          });
                                        }
                                        setRadioValue();
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            novembermonthButtonColor,
                                      ),
                                      child: const Text("November"),
                                      onPressed: () {
                                        if (!novemberTapped) {
                                          setState(() {
                                            novembermonthButtonColor =
                                                Colors.green;
                                            novemberTapped = true;
                                            score += 1;
                                          });
                                        } else if (novemberTapped) {
                                          setState(() {
                                            novembermonthButtonColor =
                                                Colors.yellow;
                                            novemberTapped = false;
                                            score -= 1;
                                          });
                                        }
                                        setRadioValue();
                                      },
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            octobermonthButtonColor,
                                      ),
                                      child: const Text("October"),
                                      onPressed: () {
                                        if (!octoberTapped) {
                                          setState(() {
                                            octobermonthButtonColor =
                                                Colors.green;
                                            octoberTapped = true;
                                            score += 1;
                                          });
                                        } else if (octoberTapped) {
                                          setState(() {
                                            octobermonthButtonColor =
                                                Colors.yellow;
                                            octoberTapped = false;
                                            score -= 1;
                                          });
                                        }
                                        setRadioValue();
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            septembermonthButtonColor,
                                      ),
                                      child: const Text("September"),
                                      onPressed: () {
                                        if (!septemberTapped) {
                                          setState(() {
                                            septembermonthButtonColor =
                                                Colors.green;
                                            septemberTapped = true;
                                            score += 1;
                                          });
                                        } else if (septemberTapped) {
                                          setState(() {
                                            septembermonthButtonColor =
                                                Colors.yellow;
                                            septemberTapped = false;
                                            score -= 1;
                                          });
                                        }
                                        setRadioValue();
                                      },
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: augustmonthButtonColor,
                                      ),
                                      child: const Text("August"),
                                      onPressed: () {
                                        if (!augustTapped) {
                                          setState(() {
                                            augustmonthButtonColor =
                                                Colors.green;
                                            augustTapped = true;
                                            score += 1;
                                          });
                                        } else if (augustTapped) {
                                          setState(() {
                                            augustmonthButtonColor =
                                                Colors.yellow;
                                            augustTapped = false;
                                            score -= 1;
                                          });
                                        }
                                        setRadioValue();
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: julymonthButtonColor,
                                      ),
                                      child: const Text("July"),
                                      onPressed: () {
                                        if (!julyTapped) {
                                          setState(() {
                                            julymonthButtonColor = Colors.green;
                                            julyTapped = true;
                                            score += 1;
                                          });
                                        } else if (julyTapped) {
                                          setState(() {
                                            julymonthButtonColor =
                                                Colors.yellow;
                                            julyTapped = false;
                                            score -= 1;
                                          });
                                        }
                                        setRadioValue();
                                      },
                                    ),
                                  ),
                                ])
                              ],
                            )
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
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              appData.testExecutiveSerialResponse,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Table(
                              border: TableBorder.all(),
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              columnWidths: {
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
                                      Text(
                                        "Normal",
                                        style: const TextStyle(
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
                                      Text(
                                        "Equivocal",
                                        style: const TextStyle(
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
                                      Text(
                                        "Impaired",
                                        style: const TextStyle(
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
                                      appData.testExecutiveSerialResponseNormal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData
                                          .testExecutiveSerialResponseEquivocal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData
                                          .testExecutiveSerialResponseImpaired,
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
                  SizedBox(
                    height: sizeBoxHeight,
                  ),
                  SizedBox(
                    width: width * 0.9,
                    child: Card(
                      elevation: 10.0,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            var router = MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ShortTermMemoryVerbal(
                                      patientName: widget.patientName,
                                      assessorName: widget.assessorName,
                                      handedness: widget.handedness,
                                      assessmentDate: widget.assessmentDate,
                                      languageComprehensionRadioValue: widget
                                          .languageComprehensionRadioValue,
                                      trialOneScore: widget.trialOneScore,
                                      trialTwoScore: widget.trialTwoScore,
                                      trialThreeScore: widget.trialThreeScore,
                                      visuospatialPraxisImage1:
                                          widget.visuospatialPraxisImage1,
                                      visuospatialPraxisImage2:
                                          widget.visuospatialPraxisImage2,
                                      visuospatialPraxisImage3:
                                          widget.visuospatialPraxisImage3,
                                      attention: widget.attention,
                                      attentionCorrect: widget.attentionCorrect,
                                      attentionMistakes:
                                          widget.attentionMistakes,
                                      executiveAnimalNaming:
                                          widget.executiveAnimalNaming,
                                      executiveAnimalNamingCount:
                                          widget.executiveAnimalNamingCount,
                                      executiveLuria: widget.executiveLuria,
                                      executiveLuriaScore:
                                          widget.executiveLuriaScore,
                                      executiveSerial: _radioValue ?? 0,
                                      executiveSerialScore: score,
                                    ));
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
                          },
                          child: const Text("Continue"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value;
    });
  }

  void setRadioValue() {
    if (score == 5) {
      setState(() {
        _radioValue = 1;
      });
    }
    if (score == 6) {
      setState(() {
        _radioValue = 0;
      });
    }
    if (score < 5) {
      setState(() {
        _radioValue = 2;
      });
    }
  }

  void getPrefsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? score1 = prefs.getInt("executiveSerial");
    int? score2 = prefs.getInt("executiveSerial_score");
    List<String>? buttonColors =
        prefs.getStringList("executiveSerialButtonColor");

    if (buttonColors != null) {
      executiveSerialButtonColor = buttonColors;
    } else {
      executiveSerialButtonColor = List.filled(6, "yellow");
    }

    List<Color> buttonColor = [];
    List<bool> buttonTapped = [];

    for (var i = 0; i < 6; i++) {
      if (i < executiveSerialButtonColor.length &&
          executiveSerialButtonColor[i] == "yellow") {
        buttonColor.add(Colors.yellow);
        buttonTapped.add(false);
      } else {
        buttonColor.add(Colors.green);
        buttonTapped.add(true);
      }
    }

    setState(() {
      _radioValue = score1;
      decembermonthButtonColor = buttonColor[0];
      novembermonthButtonColor = buttonColor[1];
      octobermonthButtonColor = buttonColor[2];
      septembermonthButtonColor = buttonColor[3];
      augustmonthButtonColor = buttonColor[4];
      julymonthButtonColor = buttonColor[5];

      decemberTapped = buttonTapped[0];
      novemberTapped = buttonTapped[1];
      octoberTapped = buttonTapped[2];
      septemberTapped = buttonTapped[3];
      augustTapped = buttonTapped[4];
      julyTapped = buttonTapped[5];

      score = score2 ?? 0;
    });
  }

  Future<bool> savePrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> saveButtonColor = [];

    if (decembermonthButtonColor == Colors.yellow) {
      saveButtonColor.add("yellow");
    } else {
      saveButtonColor.add("green");
    }
    if (novembermonthButtonColor == Colors.yellow) {
      saveButtonColor.add("yellow");
    } else {
      saveButtonColor.add("green");
    }
    if (octobermonthButtonColor == Colors.yellow) {
      saveButtonColor.add("yellow");
    } else {
      saveButtonColor.add("green");
    }
    if (septembermonthButtonColor == Colors.yellow) {
      saveButtonColor.add("yellow");
    } else {
      saveButtonColor.add("green");
    }
    if (augustmonthButtonColor == Colors.yellow) {
      saveButtonColor.add("yellow");
    } else {
      saveButtonColor.add("green");
    }
    if (julymonthButtonColor == Colors.yellow) {
      saveButtonColor.add("yellow");
    } else {
      saveButtonColor.add("green");
    }

    prefs.setInt("executiveSerial", _radioValue ?? 0);
    prefs.setInt("executiveSerial_score", score);

    prefs.setStringList("executiveSerialButtonColor", saveButtonColor);

    return true;
  }
}
