import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/home.dart';
import 'package:mica/src/ten_word_recall_task_trial_one.dart';

class LanguageComprehension extends StatefulWidget {
  String patientName;
  String assessorName;
  String handedness;
  DateTime assessmentDate;

  LanguageComprehension(
      {Key key,
      this.patientName,
      this.assessorName,
      this.handedness,
      this.assessmentDate})
      : super(key: key);

  @override
  _LanguageComprehensionState createState() => _LanguageComprehensionState();
}

class _LanguageComprehensionState extends State<LanguageComprehension> {
  var format = DateFormat.yMMMMd();
  int _radioValue = 0;
  double sizeBoxHeight = 10.0;

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${appData.testLanguageComprehension} - ${widget.patientName}",
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
//                Container(
//                  width: _width * 0.9,
//                  child: Card(
//                    elevation: 10.0,
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Text(
//                        widget.patientName,
//                        textAlign: TextAlign.center,
//                        style: TextStyle(
//                            color: Colors.black,
//                            fontWeight: FontWeight.w500,
//                            fontSize: 35.0),
//                      ),
//                    ),
//                  ),
//                ),
//                SizedBox(
//                  height: sizeBoxHeight,
//                ),
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
                            appData.testLanguageComprehensionDetails,
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
                            appData.testLanguageComprehensionToPatient,
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
                            appData.testLanguageComprehensionResponse,
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
                            appData.testLanguageComprehensionResponseNormal,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            appData.testLanguageComprehensionResponseEquivocal,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            appData.testLanguageComprehensionResponseImpaired,
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
                          var router = new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new TenWordRecallTrialOne(
                                    patientName: widget.patientName,
                                    assessorName: widget.assessorName,
                                    handedness: widget.handedness,
                                    assessmentDate: widget.assessmentDate,
                                    languageComprehensionRadioValue:
                                        _radioValue,
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
