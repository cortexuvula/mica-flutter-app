import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/shortterm_memory_verbal.dart';
import 'package:mica/src/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExecutiveSerial extends StatefulWidget {
  String patientName;
  String assessorName;
  String handedness;
  DateTime assessmentDate;
  int languageComprehensionRadioValue;
  int trialOneScore;
  int trialTwoScore;
  int trialThreeScore;
  int visuospatialPraxisImage1;
  int visuospatialPraxisImage2;
  int visuospatialPraxisImage3;
  int attention;
  int attentionCorrect;
  int attentionMistakes;
  int executiveAnimalNaming;
  int executiveLuria;
  int executiveAnimalNamingCount;

  ExecutiveSerial(
      {Key key,
      this.patientName,
      this.assessorName,
      this.handedness,
      this.assessmentDate,
      this.languageComprehensionRadioValue,
      this.trialOneScore,
      this.trialTwoScore,
      this.trialThreeScore,
      this.visuospatialPraxisImage1,
      this.visuospatialPraxisImage2,
      this.visuospatialPraxisImage3,
      this.attention,
      this.attentionCorrect,
      this.attentionMistakes,
      this.executiveAnimalNaming,
      this.executiveAnimalNamingCount,
      this.executiveLuria})
      : super(key: key);

  @override
  _ExecutiveSerialState createState() => _ExecutiveSerialState();
}

class _ExecutiveSerialState extends State<ExecutiveSerial> {
  double sizeBoxHeight = 10.0;
  int _radioValue;
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
    var _width = MediaQuery.of(context).size.width;
    var sizeBoxWidth = (_width * 0.8) / 3;
    return WillPopScope(
      onWillPop: savePrefData,
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              appData.testExecutiveSerial,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              appData.testExecutiveSerialSubtitle,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  var router = new MaterialPageRoute(
                      builder: (BuildContext context) => new Welcome());
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
                  Container(
                    width: _width * 0.9,
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
                  Container(
                    width: _width * 0.9,
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
                  Container(
                    width: _width * 0.9,
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
                  Container(
                    width: _width * 0.9,
                    child: Card(
                      elevation: 10.0,
                      color: Colors.deepPurple.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Tap to score",
                              style: TextStyle(
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
                                    child: FlatButton(
                                      child: Text("December"),
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
                                      color: decembermonthButtonColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FlatButton(
                                      child: Text("November"),
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
                                      color: novembermonthButtonColor,
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FlatButton(
                                      child: Text("October"),
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
                                      color: octobermonthButtonColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FlatButton(
                                      child: Text("September"),
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
                                      color: septembermonthButtonColor,
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FlatButton(
                                      child: Text("August"),
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
                                      color: augustmonthButtonColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FlatButton(
                                      child: Text("July"),
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
                                      color: julymonthButtonColor,
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
                  Container(
                    width: _width * 0.9,
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
                              style: TextStyle(
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
                                      Radio(
                                        value: 0,
                                        groupValue: _radioValue,
                                        onChanged: _handleRadioValueChange,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
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
                                      Radio(
                                        value: 1,
                                        groupValue: _radioValue,
                                        onChanged: _handleRadioValueChange,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
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
                                      Radio(
                                        value: 2,
                                        groupValue: _radioValue,
                                        onChanged: _handleRadioValueChange,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
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
                                      appData.testExecutiveSerialResponseNormal,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData
                                          .testExecutiveSerialResponseEquivocal,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData
                                          .testExecutiveSerialResponseImpaired,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10.0),
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
                  Container(
                    width: _width * 0.9,
                    child: Card(
                      elevation: 10.0,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: RaisedButton(
                          elevation: 10.0,
                          onPressed: () {
                            var router = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new ShortTermMemoryVerbal(
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
                                      executiveSerial: _radioValue,
                                    ));
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
                          },
                          child: Text("Continue with Testing"),
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

  void _handleRadioValueChange(int value) {
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
    int _score1 = prefs.getInt("executiveSerial");
    int _score2 = prefs.getInt("executiveSerial_score");
    executiveSerialButtonColor =
        prefs.getStringList("executiveSerialButtonColor");

    List<Color> buttonColor = [];
    List<bool> buttonTapped = [];

    for (var i = 0; i < 6; i++) {
      if (executiveSerialButtonColor[i] == "yellow") {
        buttonColor.add(Colors.yellow);
        buttonTapped.add(false);
      } else {
        buttonColor.add(Colors.green);
        buttonTapped.add(true);
      }
    }

    setState(() {
      _radioValue = _score1;
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

      score = _score2;
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

    prefs.setInt("executiveSerial", _radioValue);
    prefs.setInt("executiveSerial_score", score);

    prefs.setStringList("executiveSerialButtonColor", saveButtonColor);

    return true;
  }
}
