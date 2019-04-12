import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/executive_animal_naming.dart';
import 'package:mica/src/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Attention extends StatefulWidget {
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

  Attention({
    Key key,
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
  }) : super(key: key);

  @override
  _AttentionState createState() => _AttentionState();
}

class _AttentionState extends State<Attention> {
  Timer timer;

  int _radioValue;
  double sizeBoxHeight = 10.0;
  int sequenceIndex = 0;
  bool sequenceInMotion = false;

  int i = 0;
  String displayLetter = "Letters";

  List<bool> tapCorrect = [];
  List<bool> tapWrong = [];
  List<bool> correctCheck = [];

  List<Color> letterTapButtonColor = [];
  List<Color> letterNoTapButtonColor = [];
  int correctTap = 0;
  int wrongTap = 0;
  var correctSelectedColor = Colors.green;
  var wrongSelectedColor = Colors.red;

  @override
  void initState() {
    super.initState();
    getPrefsData();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: savePrefData,
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              appData.testAttention,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              appData.testAttentionSubtitle,
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
                              appData.testAttentionToPatient,
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
                              appData.testAttentionDetails,
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
                    height: 200.0,
                    child: Card(
                      elevation: 10.0,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: GridView.count(
                            crossAxisCount: 7,
                            childAspectRatio: 1.2,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                            children: List.generate(
                                appData.attentionList.length, (index) {
                              tapCorrect.add(false);
                              tapWrong.add(false);
                              correctCheck.add(false);
                              letterTapButtonColor.add(Colors.cyan.shade200);

                              return Stack(
                                children: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      if (!tapWrong[index] &&
                                          !tapCorrect[index]) {
                                        if (appData.attentionList[index] ==
                                            "A") {
                                          setState(() {
                                            tapCorrect[index] = true;
                                            correctTap += 1;
                                            letterTapButtonColor[index] =
                                                Colors.green;
                                            correctCheck[index] = true;
                                          });
                                        }
                                        if (appData.attentionList[index] !=
                                            "A") {
                                          setState(() {
                                            tapWrong[index] = true;
                                            wrongTap += 1;
                                            letterTapButtonColor[index] =
                                                Colors.red;
                                            if (wrongTap == 1) {
                                              _radioValue = 1;
                                            } else if (wrongTap > 1) {
                                              _radioValue = 2;
                                            } else if (wrongTap < 1) {
                                              _radioValue = 0;
                                            }
                                          });
                                        }
                                      }
                                    },
//                                  onDoubleTap: () {
//                                    setState(() {
//                                      tapWrong[index] = false;
//                                      wrongTap += 1;
//                                      letterTapButtonColor[index] =
//                                          Colors.red;
//                                    });
//                                  },
                                    color: letterTapButtonColor[index],
                                    child:
                                        Text("${appData.attentionList[index]}"),
                                  ),
                                  Center(
                                    child: Container(
                                      child: GestureDetector(
                                        child: tapCorrect[index]
                                            ? Container(
                                                child: Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                ),
                                              )
                                            : Container(),
                                        onTap: () {
                                          print("hello tap");
                                          if (correctCheck[index]) {
                                            setState(() {
                                              correctCheck[index] = true;
                                              tapCorrect[index] = false;
                                              tapWrong[index] = true;
                                              correctTap -= 1;
                                              wrongTap += 1;
                                              letterTapButtonColor[index] =
                                                  Colors.red;
                                              if (wrongTap == 1) {
                                                _radioValue = 1;
                                              } else if (wrongTap > 1) {
                                                _radioValue = 2;
                                              } else if (wrongTap < 1) {
                                                _radioValue = 0;
                                              }
                                            });
                                          }
//                                        setState(() {
//                                          tapCorrect[index] = false;
//                                          correctTap -= 1;
//                                          letterTapButtonColor[index] =
//                                              Colors.cyan.shade200;
//                                        });
                                        },
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      child: GestureDetector(
                                        child: tapWrong[index]
                                            ? Container(
                                                child: Icon(
                                                  Icons.clear,
                                                  color: Colors.white,
                                                ),
                                              )
                                            : Container(),
                                        onTap: () {
                                          setState(() {
                                            tapWrong[index] = false;
                                            wrongTap -= 1;
                                            letterTapButtonColor[index] =
                                                Colors.cyan.shade200;
                                            if (wrongTap == 1) {
                                              _radioValue = 1;
                                            } else if (wrongTap > 1) {
                                              _radioValue = 2;
                                            } else if (wrongTap < 1) {
                                              _radioValue = 0;
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }),
                          ),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Correct: ",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25.0),
                            ),
                            Text(
                              "$correctTap",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25.0),
                            ),
                            Text(
                              "Mistakes: ",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25.0),
                            ),
                            Text(
                              "$wrongTap",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25.0),
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
                              appData.testAttentionResponse,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                            Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              border: TableBorder.all(),
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
                                  )
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData.testAttentionResponseNormal,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData.testAttentionResponseEquivocal,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData.testAttentionResponseImpaired,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                      ),
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
                                    new ExecutiveAnimalNaming(
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
                                      attention: _radioValue,
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

  void getPrefsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int _score1 = prefs.getInt("attention");
    int _score2 = prefs.getInt("correctTap");
    int _score3 = prefs.getInt("wrongTap");

    List<String> tapCorrectList = [];
    List<String> letterTapButtonColorList = [];
    List<String> tapWrongList = [];
    List<String> correctCheckList = [];

    List<bool> _tapCorrect = [];
    List<Color> _letterTapButtonColor = [];
    List<bool> _tapWrong = [];
    List<bool> _correctCheck = [];

    letterTapButtonColorList = prefs.getStringList("letterTapButtonColor");
    tapCorrectList = prefs.getStringList("tapCorrect");
    tapWrongList = prefs.getStringList("tapWrong");
    correctCheckList = prefs.getStringList("correctCheck");

    for (var i = 0; i < 26; i++) {
      if (letterTapButtonColorList[i] == "cyan") {
        _letterTapButtonColor.add(Colors.cyan.shade200);
      } else if (letterTapButtonColorList[i] == "green") {
        _letterTapButtonColor.add(Colors.green);
      } else {
        _letterTapButtonColor.add(Colors.red);
      }
      if (tapCorrectList[i] == "false") {
        _tapCorrect.add(false);
      } else {
        _tapCorrect.add(true);
      }
      if (tapWrongList[i] == "false") {
        _tapWrong.add(false);
      } else {
        _tapWrong.add(true);
      }
      if (correctCheckList[i] == "false") {
        _correctCheck.add(false);
      } else {
        _correctCheck.add(true);
      }
    }
    setState(() {
      _radioValue = _score1;
      correctTap = _score2;
      wrongTap = _score3;
      letterTapButtonColor = _letterTapButtonColor;
      tapCorrect = _tapCorrect;
      tapWrong = _tapWrong;
      correctCheck = _correctCheck;
    });
  }

  Future<bool> savePrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("attention", _radioValue);
    prefs.setInt("correctTap", correctTap);
    prefs.setInt("wrongTap", wrongTap);

    List<String> tapCorrectList = [];
    List<String> letterTapButtonColorList = [];
    List<String> tapWrongList = [];
    List<String> correctCheckList = [];

    for (var i = 0; i < 26; i++) {
      if (letterTapButtonColor[i] == Colors.cyan.shade200) {
        letterTapButtonColorList.add("cyan");
      } else if (letterTapButtonColor[i] == Colors.red) {
        letterTapButtonColorList.add("red");
      } else {
        letterTapButtonColorList.add("green");
      }

      if (tapCorrect[i] == false) {
        tapCorrectList.add("false");
      } else {
        tapCorrectList.add("true");
      }

      if (tapWrong[i] == false) {
        tapWrongList.add("false");
      } else {
        tapWrongList.add("true");
      }

      if (correctCheck[i] == false) {
        correctCheckList.add("false");
      } else {
        correctCheckList.add("true");
      }
    }

    prefs.setStringList("letterTapButtonColor", letterTapButtonColorList);
    prefs.setStringList("tapCorrect", tapCorrectList);
    prefs.setStringList("tapWrong", tapWrongList);
    prefs.setStringList("correctCheck", correctCheckList);

    return true;
  }
}
