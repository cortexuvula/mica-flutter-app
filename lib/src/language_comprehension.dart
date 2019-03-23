import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/home.dart';
import 'package:mica/src/ten_word_recall_task_trial_one.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  int _radioValue;
  double sizeBoxHeight = 10.0;

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
              appData.testLanguageComprehension,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              appData.testLanguageComprehensionSubtitle,
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
                              appData.testLanguageComprehensionResponse,
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
                              columnWidths: {
                                0: FlexColumnWidth(0.33),
                                1: FlexColumnWidth(0.33),
                                2: FlexColumnWidth(0.34),
                              },
                              children: [
                                TableRow(
                                  children: [
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
                                              fontSize: 10.0
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
                                              fontSize: 10.0
                                          ),

                                          overflow: TextOverflow.ellipsis,
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
                                              fontSize: 10.0
                                          ),

                                        ),
                                      ],
                                    ),
                                  ]
                                ),
                                TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        appData
                                            .testLanguageComprehensionResponseNormal,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        appData
                                            .testLanguageComprehensionResponseEquivocal,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        appData
                                            .testLanguageComprehensionResponseImpaired,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  ]
                                )
                              ],
                            ),
//                          Column(
//
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              Row(
//
//                                children: <Widget>[
//                                  SizedBox(
//                                    width: sizeBoxWidth,
//                                    child: Row(
//                                      children: <Widget>[
//                                        Radio(
//                                          value: 0,
//                                          groupValue: _radioValue,
//                                          onChanged: _handleRadioValueChange,
//                                          activeColor: Colors.white,
//                                        ),
//                                        Text(
//                                          "Normal",
//                                          style: TextStyle(
//                                            color: Colors.black,
//                                              fontSize: 10.0
//                                          ),
//
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                  SizedBox(
//                                    width: sizeBoxWidth,
//                                    child: Row(
//                                      children: <Widget>[
//                                        Radio(
//                                          value: 1,
//                                          groupValue: _radioValue,
//                                          onChanged: _handleRadioValueChange,
//                                          activeColor: Colors.white,
//                                        ),
//                                        Text(
//                                          "Equivocal",
//                                          style: TextStyle(
//                                            color: Colors.black,
//                                            fontSize: 10.0
//                                          ),
//
//                                          overflow: TextOverflow.ellipsis,
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                  SizedBox(
//                                    width: sizeBoxWidth,
//                                    child: Row(
//                                      children: <Widget>[
//                                        Radio(
//                                          value: 2,
//                                          groupValue: _radioValue,
//                                          onChanged: _handleRadioValueChange,
//                                          activeColor: Colors.white,
//                                        ),
//                                        Text(
//                                          "Impaired",
//                                          style: TextStyle(
//                                            color: Colors.black,
//                                              fontSize: 10.0
//                                          ),
//
//                                        ),
//                                      ],
//                                    ),
//                                  )
//                                ],
//                              ),
//                              Row(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: <Widget>[
//                                  Padding(
//                                    padding: const EdgeInsets.all(2.0),
//                                    child: SizedBox(
//                                      width: sizeBoxWidth,
//                                      child: Text(
//                                        appData
//                                            .testLanguageComprehensionResponseNormal,
//                                        textAlign: TextAlign.center,
//                                        style: TextStyle(fontSize: 10.0),
//                                      ),
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.all(2.0),
//                                    child: SizedBox(
//                                      width: sizeBoxWidth,
//                                      child: Text(
//                                        appData
//                                            .testLanguageComprehensionResponseEquivocal,
//                                        textAlign: TextAlign.center,
//                                        style: TextStyle(fontSize: 10.0),
//                                      ),
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.all(2.0),
//                                    child: SizedBox(
//                                      width: sizeBoxWidth,
//                                      child: Text(
//                                        appData
//                                            .testLanguageComprehensionResponseImpaired,
//                                        textAlign: TextAlign.center,
//                                        style: TextStyle(fontSize: 10.0),
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              )
//                            ],
//                          ),
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
                                    new TenWordRecallTrialOne(
                                      patientName: widget.patientName,
                                      assessorName: widget.assessorName,
                                      handedness: widget.handedness,
                                      assessmentDate: widget.assessmentDate,
                                      languageComprehensionRadioValue:
                                          _radioValue,
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

  @override
  void initState() {
    super.initState();
    getPrefsData();
  }

  void getPrefsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int _setRadioPref = prefs.getInt("languageComprehensionRadioValue");
    setState(() {
      _radioValue = _setRadioPref;
    });
  }

  Future<bool> savePrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("languageComprehensionRadioValue", _radioValue);

    return true;
  }

}
