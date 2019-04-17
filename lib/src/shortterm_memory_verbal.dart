import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/home.dart';
import 'package:mica/src/praxis.dart';
import 'package:mica/src/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShortTermMemoryVerbal extends StatefulWidget {
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
  int executiveAnimalNamingCount;
  int executiveLuria;
  int executiveLuriaScore;
  int executiveSerial;
  int executiveSerialScore;

  ShortTermMemoryVerbal(
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
      this.executiveLuria,
      this.executiveLuriaScore,
      this.executiveSerial,
      this.executiveSerialScore})
      : super(key: key);

  @override
  _ShortTermMemoryVerbalState createState() => _ShortTermMemoryVerbalState();
}

class _ShortTermMemoryVerbalState extends State<ShortTermMemoryVerbal> {
  double sizeBoxHeight = 10.0;
  int _radioValue;
  int score;

  bool _valueDate = false;
  bool _valueDay = false;
  bool _valueMonth = false;
  bool _valueCity = false;
  bool _valuePlace = false;

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
              appData.testShortTermMemory,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              appData.testShortTermMemorySubtitle,
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
                      color: Colors.deepPurple.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              appData.testShortTermMemoryDetails,
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
                              appData.testShortTermMemoryToPatient,
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
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: _valueDate,
                                      onChanged: _valueDateChanged,
                                      activeColor: Colors.green,
                                    ),
                                    Text(
                                      "Date",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: _valueMonth,
                                      onChanged: _valueMonthChanged,
                                      activeColor: Colors.green,
                                    ),
                                    Text(
                                      "Month",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: _valueDay,
                                      onChanged: _valueDayChanged,
                                      activeColor: Colors.green,
                                    ),
                                    Text(
                                      "Day",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: _valuePlace,
                                      onChanged: _valuePlaceChanged,
                                      activeColor: Colors.green,
                                    ),
                                    Text(
                                      "Place",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: _valueCity,
                                  onChanged: _valueCityChanged,
                                  activeColor: Colors.green,
                                ),
                                Text(
                                  "City",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
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
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              appData.testShortTermMemoryResponse,
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
                                      appData.testShortTermMemoryResponseNormal,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData
                                          .testShortTermMemoryResponseEquivocal,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData
                                          .testShortTermMemoryResponseImpaired,
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
                                builder: (BuildContext context) => new Praxis(
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
                                      executiveSerial: widget.executiveSerial,
                                      executiveSerialScore:
                                          widget.executiveSerialScore,
                                      shorttermMemoryVerbal: _radioValue,
                                      shorttermMemoryVerbalScore: score,
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

  void _valueDateChanged(bool value) {
    if (value) {
      score += 1;
    } else if (!value) {
      score -= 1;
    }
    setRadioToScore();
    setState(() {
      _valueDate = value;
    });
  }

  void _valueDayChanged(bool value) {
    if (value) {
      score += 1;
    } else if (!value) {
      score -= 1;
    }
    setRadioToScore();
    setState(() {
      _valueDay = value;
    });
  }

  void _valueMonthChanged(bool value) {
    if (value) {
      score += 1;
    } else if (!value) {
      score -= 1;
    }
    setRadioToScore();
    setState(() {
      _valueMonth = value;
    });
  }

  void _valueCityChanged(bool value) {
    if (value) {
      score += 1;
    } else if (!value) {
      score -= 1;
    }
    setRadioToScore();
    setState(() {
      _valueCity = value;
    });
  }

  void _valuePlaceChanged(bool value) {
    if (value) {
      score += 1;
    } else if (!value) {
      score -= 1;
    }
    setRadioToScore();
    setState(() {
      _valuePlace = value;
    });
  }

  void setRadioToScore() {
    if (score == 4) {
      setState(() {
        _radioValue = 1;
      });
    } else if (score > 4) {
      setState(() {
        _radioValue = 0;
      });
    } else {
      setState(() {
        _radioValue = 2;
      });
    }
  }

  void getPrefsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int _score1 = prefs.getInt("shorttermMemoryVerbal");
    int _score2 = prefs.getInt("shorttermMemoryVerbal_score");
    bool date = prefs.getBool("_valueDate");
    bool month = prefs.getBool("_valueMonth");
    bool day = prefs.getBool("_valueDay");
    bool place = prefs.getBool("_valuePlace");
    bool city = prefs.getBool("_valueCity");

    setState(() {
      _radioValue = _score1;
      _valueDate = date;
      _valueMonth = month;
      _valueDay = day;
      _valuePlace = place;
      _valueCity = city;
      score = _score2;
    });
  }

  Future<bool> savePrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("shorttermMemoryVerbal", _radioValue);
    prefs.setInt("shorttermMemoryVerbal_score", score);
    prefs.setBool("_valueDate", _valueDate);
    prefs.setBool("_valueMonth", _valueMonth);
    prefs.setBool("_valueDay", _valueDay);
    prefs.setBool("_valuePlace", _valuePlace);
    prefs.setBool("_valueCity", _valueCity);

    return true;
  }
}
