import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/home.dart';
import 'package:mica/src/praxis.dart';

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
  int executiveAnimalNaming;
  int executiveLuria;
  int executiveSerial;

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
      this.executiveAnimalNaming,
      this.executiveLuria,
      this.executiveSerial})
      : super(key: key);

  @override
  _ShortTermMemoryVerbalState createState() => _ShortTermMemoryVerbalState();
}

class _ShortTermMemoryVerbalState extends State<ShortTermMemoryVerbal> {
  double sizeBoxHeight = 10.0;
  int _radioValue = 0;

  bool _valueDate = false;
  bool _valueDay = false;
  bool _valueMonth = false;
  bool _valueCity = false;
  bool _valuePlace = false;

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var sizeBoxWidth = (_width * 0.8) / 3;
    return Scaffold(
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
                            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                            columnWidths: {
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
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        appData
                                            .testShortTermMemoryResponseNormal,
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
                                  ]
                              )
                            ],
                          ),
//                          Column(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              Row(
//                                mainAxisAlignment: MainAxisAlignment.center,
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
//                                            fontSize: 10.0,
//                                          ),
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
//                                            fontSize: 10.0,
//                                          ),
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
//                                              fontSize: 10.0,
//                                          ),
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
//                                            .testShortTermMemoryResponseNormal,
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
//                                            .testShortTermMemoryResponseEquivocal,
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
//                                            .testShortTermMemoryResponseImpaired,
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
                          int score = 0;
                          if (_valueDate) {
                            score += 1;
                          }
                          if (_valueDay) {
                            score += 1;
                          }
                          if (_valueMonth) {
                            score += 1;
                          }
                          if (_valueCity) {
                            score += 1;
                          }
                          if (_valuePlace) {
                            score += 1;
                          }
                          var router = new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new Praxis(
                                    patientName: widget.patientName,
                                    assessorName: widget.assessorName,
                                    handedness: widget.handedness,
                                    assessmentDate: widget.assessmentDate,
                                    languageComprehensionRadioValue: widget
                                        .languageComprehensionRadioValue,
                                    trialOneScore: widget.trialOneScore,
                                    trialTwoScore: widget.trialTwoScore,
                                    trialThreeScore: widget.trialThreeScore,
                                    visuospatialPraxisImage1: widget.visuospatialPraxisImage1,
                                    visuospatialPraxisImage2: widget.visuospatialPraxisImage2,
                                    visuospatialPraxisImage3: widget.visuospatialPraxisImage3,
                                    attention: widget.attention,
                                    executiveAnimalNaming: widget.executiveAnimalNaming,
                                    executiveLuria: widget.executiveLuria,
                                    executiveSerial: widget.executiveSerial,
                                    shorttermMemoryVerbal: score,
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

  void _valueDateChanged(bool value) => setState(() => _valueDate = value);

  void _valueDayChanged(bool value) => setState(() => _valueDay = value);

  void _valueMonthChanged(bool value) => setState(() => _valueMonth = value);

  void _valueCityChanged(bool value) => setState(() => _valueCity = value);

  void _valuePlaceChanged(bool value) => setState(() => _valuePlace = value);
}
