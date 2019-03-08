import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/executive_serial.dart';
import 'package:mica/src/home.dart';

class ExecutiveLuria extends StatefulWidget {

  String patientName;
  String assessorName;
  String handedness;
  DateTime assessmentDate;
  int languageComprehensionRadioValue;
  int trialOneScore;
  int trialTwoScore;
  int trialThreeScore;
  int visuospatialPraxis;
  int attention;
  int executiveAnimalNaming;

  ExecutiveLuria(
      {Key key,
        this.patientName,
        this.assessorName,
        this.handedness,
        this.assessmentDate,
        this.languageComprehensionRadioValue,
        this.trialOneScore,
        this.trialTwoScore,
        this.trialThreeScore,
        this.visuospatialPraxis,
        this.attention,
        this.executiveAnimalNaming})
      : super(key: key);

  @override
  _ExecutiveLuriaState createState() => _ExecutiveLuriaState();
}

class _ExecutiveLuriaState extends State<ExecutiveLuria> {
  double sizeBoxHeight = 10.0;
  int _radioValue = 0;


  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var sizeBoxWidth = (_width * 0.8) / 3;
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            appData.testExecutiveLuria,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.start,
          ),
          subtitle: Text(
            appData.testExecutiveLuriaSubtitle,
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
//                Container(
//                  width: _width * 0.9,
//                  child: Card(
//                    elevation: 10.0,
//                    color: Colors.deepPurple.shade300,
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Column(
//                        children: <Widget>[
////                          Text(
////                            appData.testDescription,
////                            textAlign: TextAlign.left,
////                            style: TextStyle(
////                              color: Colors.black,
////                              fontWeight: FontWeight.w500,
////                              fontSize: 20.0,
////                              decoration: TextDecoration.underline,
////                            ),
////                          ),
////                          SizedBox(
////                            height: 5.0,
////                          ),
//                          Text(
//                            appData.testExecutiveLuriaDetails,
//                            textAlign: TextAlign.center,
//                            style: TextStyle(
//                                color: Colors.black,
//                                fontWeight: FontWeight.w500,
//                                fontSize: 15.0),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
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
                            appData.testExecutiveLuriaToPatient,
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
                            appData.testExecutiveLuriaResponse,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: sizeBoxWidth,
                                    child: Row(
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
                                  ),
                                  SizedBox(
                                    width: sizeBoxWidth,
                                    child: Row(
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
                                  ),
                                  SizedBox(
                                    width: sizeBoxWidth,
                                    child: Row(
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
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SizedBox(
                                      width: sizeBoxWidth,
                                      child: Text(
                                        appData
                                            .testExecutiveLuriaResponseNormal,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SizedBox(
                                      width: sizeBoxWidth,
                                      child: Text(
                                        appData
                                            .testExecutiveLuriaResponseEquivocal,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SizedBox(
                                      width: sizeBoxWidth,
                                      child: Text(
                                        appData
                                            .testExecutiveLuriaResponseImpaired,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  ),
                                ],
                              )
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
                              new ExecutiveSerial(
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
                                attention: widget.attention,
                                executiveAnimalNaming: widget.executiveAnimalNaming,
                                executiveLuria: _radioValue,
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
