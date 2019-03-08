import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/executive_animal_naming.dart';
import 'package:mica/src/home.dart';

class Attention extends StatefulWidget {
  String patientName;
  String assessorName;
  String handedness;
  DateTime assessmentDate;
  int languageComprehensionRadioValue;
  int trialOneScore;
  int trialTwoScore;
  int trialThreeScore;
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
        this.trialThreeScore,
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
//                          Text(
//                            appData.testDescription,
//                            textAlign: TextAlign.left,
//                            style: TextStyle(
//                              color: Colors.black,
//                              fontWeight: FontWeight.w500,
//                              fontSize: 20.0,
//                              decoration: TextDecoration.underline,
//                            ),
//                          ),
//                          SizedBox(
//                            height: 5.0,
//                          ),
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
//                          Text(
//                            appData.testToPatient,
//                            textAlign: TextAlign.left,
//                            style: TextStyle(
//                              color: Colors.black,
//                              fontWeight: FontWeight.w500,
//                              fontSize: 20.0,
//                              decoration: TextDecoration.underline,
//                            ),
//                          ),
//                          SizedBox(
//                            height: 5.0,
//                          ),
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
                          children: List.generate(appData.attentionList.length,
                              (index) {
                            tapCorrect.add(false);
                            tapWrong.add(false);
                            correctCheck.add(false);
                            letterTapButtonColor.add(Colors.cyan.shade200);

                            return Stack(
                              children: <Widget>[

//                                Container(
//                                  color: letterTapButtonColor[index],
//                                ),
//                                GestureDetector(
//                                  onTap: () {
//                                    if (!tapWrong[index] &&
//                                        !tapCorrect[index]) {
//                                      if (appData.attentionList[index] == "A") {
//                                        setState(() {
//                                          tapCorrect[index] = true;
//                                          correctTap += 1;
//                                          letterTapButtonColor[index] =
//                                              Colors.green;
//                                        });
//                                      }
//                                      if (appData.attentionList[index] != "A") {
//                                        setState(() {
//                                          tapWrong[index] = true;
//                                          wrongTap += 1;
//                                          letterTapButtonColor[index] =
//                                              Colors.red;
//                                        });
//                                      }
//                                    }
//                                  },
////                                  onDoubleTap: () {
////                                      setState(() {
////                                        tapWrong[index] = true;
////                                        wrongTap += 1;
////                                        letterTapButtonColor[index] =
////                                            Colors.red;
////                                      });
////                                  },
//
//                                  child:
//                                  Center(
//                                    child: Container(
//                                        color: letterTapButtonColor[index],
//                                        child: Text("${appData.attentionList[index]}")),
//                                  ),
//
//                                ),
                                FlatButton(
                                  onPressed: () {
                                    if (!tapWrong[index] &&
                                        !tapCorrect[index]) {
                                      if (appData.attentionList[index] == "A") {
                                        setState(() {
                                          tapCorrect[index] = true;
                                          correctTap += 1;
                                          letterTapButtonColor[index] =
                                              Colors.green;
                                          correctCheck[index] = true;
                                        });
                                      }
                                      if (appData.attentionList[index] != "A") {
                                        setState(() {
                                          tapWrong[index] = true;
                                          wrongTap += 1;
                                          letterTapButtonColor[index] =
                                              Colors.red;
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
//                      ListView.builder(
//                        itemCount: appData.attentionList.length,
//                        itemBuilder: (BuildContext context, int index) {
//                          return Card(
//                            elevation: 5.0,
//                            color: Colors.blueGrey.shade300,
//                            child:
//                            ListTile(
//                              title: Text(
//                                appData.attentionList[index],
//                                style: TextStyle(fontSize: 30.0),
//                              ),
//                              trailing: Row(
//                                mainAxisAlignment:
//                                    MainAxisAlignment.spaceEvenly,
//                                children: <Widget>[
//                                  FlatButton(
//                                    onPressed: () {
//                                      if (appData.attentionList[index] == "A" &&
//                                          letterTapButtonColor[index] ==
//                                              Colors.white) {
//                                        if (letterNoTapButtonColor[index] ==
//                                            Colors.red) {
//                                          setState(() {
//                                            wrongTap -= 1;
//                                          });
//                                        }
//                                        setState(() {
//                                          correctTap += 1;
//                                          letterTapButtonColor[index] =
//                                              correctSelectedColor;
//                                          letterNoTapButtonColor[index] =
//                                              Colors.white;
//                                        });
//                                        return;
//                                      }
//                                      if (appData.attentionList[index] != "A" &&
//                                          letterTapButtonColor[index] ==
//                                              Colors.white) {
//                                        if (letterNoTapButtonColor[index] ==
//                                            Colors.green) {
//                                          setState(() {
//                                            correctTap -= 1;
//                                          });
//                                        }
//                                        setState(() {
//                                          wrongTap += 1;
//                                          letterTapButtonColor[index] =
//                                              wrongSelectedColor;
//                                          letterNoTapButtonColor[index] =
//                                              Colors.white;
//                                        });
//                                        return;
//                                      }
//
//                                      if (letterTapButtonColor[index] ==
//                                          Colors.green) {
//                                        setState(() {
//                                          correctTap -= 1;
//                                          letterTapButtonColor[index] =
//                                              Colors.white;
//                                          letterNoTapButtonColor[index] =
//                                              Colors.white;
//                                        });
//                                      }
//                                      if (letterTapButtonColor[index] ==
//                                          Colors.red) {
//                                        setState(() {
//                                          wrongTap -= 1;
//                                          letterTapButtonColor[index] =
//                                              Colors.white;
//                                          letterNoTapButtonColor[index] =
//                                              Colors.white;
//                                        });
//                                      }
//                                    },
//                                    child: Text("Tap"),
//                                    color: letterTapButtonColor[index],
//                                  ),
//                                  FlatButton(
//                                    onPressed: () {
//                                      if (appData.attentionList[index] == "A" &&
//                                          letterNoTapButtonColor[index] ==
//                                              Colors.white) {
//                                        if (letterTapButtonColor[index] ==
//                                            Colors.green) {
//                                          setState(() {
//                                            correctTap -= 1;
//                                          });
//                                        }
//                                        setState(() {
//                                          wrongTap += 1;
//                                          letterNoTapButtonColor[index] =
//                                              wrongSelectedColor;
//                                          letterTapButtonColor[index] =
//                                              Colors.white;
//                                        });
//                                        return;
//                                      }
//                                      if (appData.attentionList[index] != "A" &&
//                                          letterNoTapButtonColor[index] ==
//                                              Colors.white) {
//                                        if (letterTapButtonColor[index] ==
//                                            Colors.red) {
//                                          setState(() {
//                                            wrongTap -= 1;
//                                          });
//                                        }
//                                        setState(() {
//                                          correctTap += 1;
//                                          letterNoTapButtonColor[index] =
//                                              correctSelectedColor;
//                                          letterTapButtonColor[index] =
//                                              Colors.white;
//                                        });
//                                        return;
//                                      }
//
//                                      if (letterNoTapButtonColor[index] ==
//                                          Colors.green) {
//                                        setState(() {
//                                          correctTap -= 1;
//                                          letterNoTapButtonColor[index] =
//                                              Colors.white;
//                                          letterTapButtonColor[index] =
//                                              Colors.white;
//                                        });
//                                      }
//                                      if (letterNoTapButtonColor[index] ==
//                                          Colors.red) {
//                                        setState(() {
//                                          wrongTap -= 1;
//                                          letterNoTapButtonColor[index] =
//                                              Colors.white;
//                                          letterTapButtonColor[index] =
//                                              Colors.white;
//                                        });
//                                      }
//                                    },
//                                    child: Text("No Tap"),
//                                    color: letterNoTapButtonColor[index],
//                                  ),
//                                ],
//                              ),
//                            ),
//                          );
//                        },
//                      )
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
//                          Text(
//                            appData.testResponse,
//                            textAlign: TextAlign.left,
//                            style: TextStyle(
//                              color: Colors.black,
//                              fontWeight: FontWeight.w500,
//                              fontSize: 20.0,
//                              decoration: TextDecoration.underline,
//                            ),
//                          ),
//                          SizedBox(
//                            height: 5.0,
//                          ),
                          Text(
                            appData.testAttentionResponse,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                          Text(
                            appData.testAttentionResponseNormal,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.0,
                            ),
                          ),
                          Text(
                            appData.testAttentionResponseEquivocal,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.0,
                            ),
                          ),
                          Text(
                            appData.testAttentionResponseImpaired,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.0,
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
                                    visuospatialPraxis: widget.visuospatialPraxis,
                                    attention: _radioValue,
                                  ));
                          Navigator.of(context).pushAndRemoveUntil(
                              router, (Route<dynamic> route) => false);
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
}
