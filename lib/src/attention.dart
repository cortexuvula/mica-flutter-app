import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/home.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Attention extends StatefulWidget {
  String patientName;
  String assessorName;
  String handedness;
  DateTime assessmentDate;
  int languageComprehensionRadioValue;
  int trialOneScore;
  int trialTwoScore;
  int visuospatialPraxis;

  Attention(
      {Key key,
      this.patientName,
      this.assessorName,
      this.handedness,
      this.assessmentDate,
      this.languageComprehensionRadioValue,
      this.trialOneScore,
      this.trialTwoScore,
      this.visuospatialPraxis})
      : super(key: key);

  @override
  _AttentionState createState() => _AttentionState();
}

class _AttentionState extends State<Attention> {
  Timer timer;

  int _radioValue = 0;
  double sizeBoxHeight = 10.0;
  int sequenceIndex = 0;
  bool sequenceInMotion = false;

  int i = 0;
  String displayLetter = "Letters";

  bool _value1correct = false;
  bool _value1wrong = false;

  List<Color> letterTapButtonColor = [];
  List<Color> letterNoTapButtonColor = [];
  int correctTap = 0;
  int wrongTap = 0;
  var correctSelectedColor = Colors.green;
  var wrongSelectedColor = Colors.red;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < appData.attentionList.length; i++) {
      letterTapButtonColor.add(Colors.white);
    }
    for (var i = 0; i < appData.attentionList.length; i++) {
      letterNoTapButtonColor.add(Colors.white);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            appData.testAttention,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                var router = new MaterialPageRoute(
                    builder: (BuildContext context) => new Home(
                          viewedDisclaimer: true,
                        ));
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
                            appData.testDescription,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
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
                  child: Card(
                    elevation: 10.0,
                    color: Colors.yellowAccent.shade400,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            appData.testToPatient,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
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
//                Container(
//                  width: _width * 0.9,
//                  child: Card(
//                    elevation: 10.0,
//                    color: Colors.white,
//                    child: Padding(
//                      padding: EdgeInsets.all(8.0),
//                      child: Column(
//                        children: <Widget>[
//                          Row(
//                            children: <Widget>[
//                              SizedBox(
//                                width: _width * 0.8 / 2,
//                                height: 50.0,
//                                child: sequenceInMotion
//                                    ? ScaleAnimatedTextKit(
//                                        isRepeatingAnimation: false,
//                                        text: appData.attentionList,
//                                        textStyle: TextStyle(
//                                          color: Colors.black,
//                                          fontWeight: FontWeight.w500,
//                                          fontSize: 40.0,
//                                        ),
//                                        alignment: Alignment.center,
//                                      )
//                                    : Text(
//                                        displayLetter,
//                                        style: TextStyle(
//                                          color: Colors.black,
//                                          fontWeight: FontWeight.w500,
//                                          fontSize: 40.0,
//                                        ),
//                                        textAlign: TextAlign.center,
//                                      ),
//                              ),
//                              SizedBox(
//                                width: _width * 0.8 / 2,
//                                height: 50.0,
//                                child: FlatButton(
//                                  onPressed: () {
//                                    setState(() {
//                                      sequenceInMotion = !sequenceInMotion;
//                                    });
//                                    //_startStopSequence(sequenceInMotion);
//                                  },
//                                  child: sequenceInMotion
//                                      ? Text("Reset")
//                                      : Text("Start"),
//                                  color: Colors.red,
//                                ),
//                              )
//                            ],
//                          ),
////                          SizedBox(
////                            width: 250.0,
////                            child: Center(
////                              child: sequenceInMotion
////                                  ? ScaleAnimatedTextKit(
////
////                                      text: appData.attentionList,
////                                      textStyle: TextStyle(
////                                        fontSize: 25.0,
////                                      ),
////                                    )
////                                  : Text(
////                                      displayLetter,
////                                      style: TextStyle(
////                                        color: Colors.black,
////                                        fontWeight: FontWeight.w500,
////                                        fontSize: 25.0,
////                                      ),
////                                    ),
////                            ),
////                          ),
////                          RaisedButton(
////                            onPressed: () {
////                              setState(() {
////                                sequenceInMotion = !sequenceInMotion;
////                              });
////                              //_startStopSequence(sequenceInMotion);
////                            },
////                            child: sequenceInMotion
////                                ? Text("Pause")
////                                : Text("Start Sequence"),
////                            color: Colors.red,
////                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
                Container(
                  width: _width * 0.9,
                  height: 200.0,
                  child: Card(
                      elevation: 10.0,
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: appData.attentionList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 5.0,
                            color: Colors.blueGrey.shade300,
                            child: ListTile(
                              title: Text(
                                appData.attentionList[index],
                                style: TextStyle(fontSize: 30.0),
                              ),
                              trailing: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      if (appData.attentionList[index] == "A" &&
                                          letterTapButtonColor[index] ==
                                              Colors.white) {
                                        if (letterNoTapButtonColor[index] ==
                                            Colors.red) {
                                          setState(() {
                                            wrongTap -= 1;
                                          });
                                        }
                                        setState(() {
                                          correctTap += 1;
                                          letterTapButtonColor[index] =
                                              correctSelectedColor;
                                          letterNoTapButtonColor[index] =
                                              Colors.white;
                                        });
                                        return;
                                      }
                                      if (appData.attentionList[index] != "A" &&
                                          letterTapButtonColor[index] ==
                                              Colors.white) {
                                        if (letterNoTapButtonColor[index] ==
                                            Colors.green) {
                                          setState(() {
                                            correctTap -= 1;
                                          });
                                        }
                                        setState(() {
                                          wrongTap += 1;
                                          letterTapButtonColor[index] =
                                              wrongSelectedColor;
                                          letterNoTapButtonColor[index] =
                                              Colors.white;
                                        });
                                        return;
                                      }

                                      if (letterTapButtonColor[index] ==
                                          Colors.green) {
                                        setState(() {
                                          correctTap -= 1;
                                          letterTapButtonColor[index] =
                                              Colors.white;
                                          letterNoTapButtonColor[index] =
                                              Colors.white;
                                        });
                                      }
                                      if (letterTapButtonColor[index] ==
                                          Colors.red) {
                                        setState(() {
                                          wrongTap -= 1;
                                          letterTapButtonColor[index] =
                                              Colors.white;
                                          letterNoTapButtonColor[index] =
                                              Colors.white;
                                        });
                                      }
                                    },
                                    child: Text("Tap"),
                                    color: letterTapButtonColor[index],
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      if (appData.attentionList[index] == "A" &&
                                          letterNoTapButtonColor[index] ==
                                              Colors.white) {
                                        if (letterTapButtonColor[index] ==
                                            Colors.green) {
                                          setState(() {
                                            correctTap -= 1;
                                          });
                                        }
                                        setState(() {
                                          wrongTap += 1;
                                          letterNoTapButtonColor[index] =
                                              wrongSelectedColor;
                                          letterTapButtonColor[index] =
                                              Colors.white;
                                        });
                                        return;
                                      }
                                      if (appData.attentionList[index] != "A" &&
                                          letterNoTapButtonColor[index] ==
                                              Colors.white) {
                                        if (letterTapButtonColor[index] ==
                                            Colors.red) {
                                          setState(() {
                                            wrongTap -= 1;
                                          });
                                        }
                                        setState(() {
                                          correctTap += 1;
                                          letterNoTapButtonColor[index] =
                                              correctSelectedColor;
                                          letterTapButtonColor[index] =
                                              Colors.white;
                                        });
                                        return;
                                      }

                                      if (letterNoTapButtonColor[index] ==
                                          Colors.green) {
                                        setState(() {
                                          correctTap -= 1;
                                          letterNoTapButtonColor[index] =
                                              Colors.white;
                                          letterTapButtonColor[index] =
                                              Colors.white;
                                        });
                                      }
                                      if (letterNoTapButtonColor[index] ==
                                          Colors.red) {
                                        setState(() {
                                          wrongTap -= 1;
                                          letterNoTapButtonColor[index] =
                                              Colors.white;
                                          letterTapButtonColor[index] =
                                              Colors.white;
                                        });
                                      }
                                    },
                                    child: Text("No Tap"),
                                    color: letterNoTapButtonColor[index],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )),
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
                            appData.testResponse,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            appData.testAttentionResponse,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0),
                          ),
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
                                ),
                              ),
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
                                ),
                              ),
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
                                ),
                              ),
                            ],
                          ),
                          Text(
                            appData.testAttentionResponseNormal,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            appData.testAttentionResponseEquivocal,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            appData.testAttentionResponseImpaired,
                            style: TextStyle(
                              color: Colors.black,
                            ),
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
//                          var router = new MaterialPageRoute(
//                              builder: (BuildContext context) =>
//                              new TenWordRecallTrialOne(
//
//                              ));
//                          Navigator.of(context).pushAndRemoveUntil(
//                              router, (Route<dynamic> route) => false);
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
    );
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  void _value1ChangedCorrect(bool value) =>
      setState(() => _value1correct = value);

  void _value1ChangedWrong(bool value) => setState(() => _value1wrong = value);

  void _startStopSequence(bool _sequenceInMotion) {
//    if (_sequenceInMotion) {
//      timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
//        //print("Letters are running $i");
//        if (i < 26) {
//          setState(() {
//            displayLetter = appData.attentionList[i];
//          });
//          i += 1;
//        } else {
//          //print("Letters are stopped");
//          timer?.cancel();
//          setState(() {
//            sequenceInMotion = false;
//            displayLetter = "Test completed";
//            i = 0;
//          });
//        }
//      });
//    } else if (!_sequenceInMotion) {
//      //print("Letters are stopped");
//      timer?.cancel();
//    }
  }
}
