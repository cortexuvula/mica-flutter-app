import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/home.dart';
import 'package:mica/src/praxis.dart';
import 'package:mica/src/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShortTermMemoryVerbal extends StatefulWidget {
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
  final int executiveAnimalNamingCount;
  final int executiveLuria;
  final int executiveLuriaScore;
  final int executiveSerial;
  final int executiveSerialScore;

  const ShortTermMemoryVerbal({
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
    required this.executiveAnimalNaming,
    required this.executiveAnimalNamingCount,
    required this.executiveLuria,
    required this.executiveLuriaScore,
    required this.executiveSerial,
    required this.executiveSerialScore,
  });

  @override
  _ShortTermMemoryVerbalState createState() => _ShortTermMemoryVerbalState();
}

class _ShortTermMemoryVerbalState extends State<ShortTermMemoryVerbal> {
  int _radioValue = 0;
  int score = 0;
  bool _valueDate = false;
  bool _valueMonth = false;
  bool _valueDay = false;
  bool _valuePlace = false;
  bool _valueCity = false;

  @override
  void initState() {
    super.initState();
    getPrefsData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double sizeBoxHeight = 20.0;

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
              appData.testShortTermMemory,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              appData.testShortTermMemorySubtitle,
              style: TextStyle(
                color: Colors.white,
              ),
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
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    left: 12.0,
                    right: 12.0,
                    bottom: 12.0,
                  ),
                  child: Text(
                    appData.testShortTermMemory,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 16.0,
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 120,
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: _valueDate,
                                        onChanged: (bool? value) =>
                                            _valueDateChanged(value ?? false),
                                        activeColor: Colors.green,
                                      ),
                                      const Text(
                                        "Date",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 120,
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: _valueMonth,
                                        onChanged: (bool? value) =>
                                            _valueMonthChanged(value ?? false),
                                        activeColor: Colors.green,
                                      ),
                                      const Text(
                                        "Month",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8), // Vertical spacing
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 120,
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: _valueDay,
                                        onChanged: (bool? value) =>
                                            _valueDayChanged(value ?? false),
                                        activeColor: Colors.green,
                                      ),
                                      const Text(
                                        "Day",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 120,
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: _valuePlace,
                                        onChanged: (bool? value) =>
                                            _valuePlaceChanged(value ?? false),
                                        activeColor: Colors.green,
                                      ),
                                      const Text(
                                        "Place",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 120,
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: _valueCity,
                                        onChanged: (bool? value) =>
                                            _valueCityChanged(value ?? false),
                                        activeColor: Colors.green,
                                      ),
                                      const Text(
                                        "City",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
                          const Text(
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
                            columnWidths: const {
                              0: FlexColumnWidth(0.3),
                              1: FlexColumnWidth(0.3),
                              2: FlexColumnWidth(0.34)
                            },
                            children: [
                              TableRow(
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 0,
                                        groupValue: _radioValue,
                                        onChanged: (int? value) =>
                                            _handleRadioValueChange(value ?? 0),
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
                                      Radio(
                                        value: 1,
                                        groupValue: _radioValue,
                                        onChanged: (int? value) =>
                                            _handleRadioValueChange(value ?? 0),
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
                                      Radio(
                                        value: 2,
                                        groupValue: _radioValue,
                                        onChanged: (int? value) =>
                                            _handleRadioValueChange(value ?? 0),
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
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData.testShortTermMemoryResponseNormal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData
                                          .testShortTermMemoryResponseEquivocal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData
                                          .testShortTermMemoryResponseImpaired,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                ],
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
                              builder: (BuildContext context) => Praxis(
                                    patientName: widget.patientName,
                                    assessorName: widget.assessorName,
                                    handedness: widget.handedness,
                                    assessmentDate: widget.assessmentDate,
                                    languageComprehensionRadioValue:
                                        widget.languageComprehensionRadioValue,
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
                                    attentionMistakes: widget.attentionMistakes,
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
                        child: const Text("Continue"),
                      ),
                    ),
                  ),
                )
              ],
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
    int? score1 = prefs.getInt("shorttermMemoryVerbal");
    int? score2 = prefs.getInt("shorttermMemoryVerbal_score");
    bool? date = prefs.getBool("_valueDate");
    bool? month = prefs.getBool("_valueMonth");
    bool? day = prefs.getBool("_valueDay");
    bool? place = prefs.getBool("_valuePlace");
    bool? city = prefs.getBool("_valueCity");

    setState(() {
      _radioValue = score1 ?? 0;
      _valueDate = date ?? false;
      _valueMonth = month ?? false;
      _valueDay = day ?? false;
      _valuePlace = place ?? false;
      _valueCity = city ?? false;
      score = score2 ?? 0;
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
