import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/home.dart';

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
  String displayLetter = "Letters will diplay here.";

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
        title: Text(
          "${appData.testAttention} - ${widget.patientName}",
          style: TextStyle(
            fontSize: 15.0,
          ),
          overflow: TextOverflow.clip,
        ),
        centerTitle: true,
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
                Container(
                  width: _width * 0.9,
                  child: Card(
                    elevation: 10.0,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            displayLetter,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 30.0,
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {
                              setState(() {
                                sequenceInMotion = !sequenceInMotion;
                              });
                              _startStopSequence(sequenceInMotion);
                            },
                            child: sequenceInMotion
                                ? Text("Pause")
                                : Text("Start / Restart Sequence"),
                            color: Colors.red,
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

  void _startStopSequence(bool _sequenceInMotion) {
    if (_sequenceInMotion) {
      timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
        //print("Letters are running $i");
        if (i < 26) {
          setState(() {
            displayLetter = appData.attentionList[i];
          });
          i += 1;
        } else {
          //print("Letters are stopped");
          timer?.cancel();
          setState(() {
            sequenceInMotion = false;
            displayLetter = "Test completed";
            i = 0;
          });
        }
      });
    } else if (!_sequenceInMotion) {
      //print("Letters are stopped");
      timer?.cancel();
    }
  }
}
