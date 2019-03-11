import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/home.dart';
import 'package:mica/src/summary.dart';

class SpokenLanguage extends StatefulWidget {
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
  int shorttermMemoryVerbal;
  int praxisRight;
  int praxisLeft;
  int tenWordDelay;
  int scoreVerbalRecognitionMemoryTenWords;
  int scoreVerbalRecognitionMemoryTenWordsInList;
  int scoreVerbalRecognitionMemoryTenWordsNotInList;
  int shorttermMemoryVisualImage1;
  int shorttermMemoryVisualImage2;
  int shorttermMemoryVisualImage3;
  int anomiaAgnosia;
  int executive;

  SpokenLanguage(
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
        this.executiveSerial,
        this.shorttermMemoryVerbal,
        this.praxisRight,
        this.praxisLeft,
        this.tenWordDelay,
        this.scoreVerbalRecognitionMemoryTenWords,
        this.scoreVerbalRecognitionMemoryTenWordsInList,
        this.scoreVerbalRecognitionMemoryTenWordsNotInList,
        this.shorttermMemoryVisualImage1,
        this.shorttermMemoryVisualImage2,
        this.shorttermMemoryVisualImage3,
        this.anomiaAgnosia,
        this.executive})
      : super(key: key);

  @override
  _SpokenLanguageState createState() => _SpokenLanguageState();
}

class _SpokenLanguageState extends State<SpokenLanguage> {
  double sizeBoxHeight = 10.0;

  int _radioValue = 0;
  int imageNumber = 0;

  String displayImage = appData.imageURL[0];

  bool backButtonActive = false;
  bool forwardButtonActive = true;

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var sizeBoxWidth = (_width * 0.8) / 3;
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            appData.testSpokenLanguage,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.start,
          ),
          subtitle: Text(
            appData.testSpokenLanguageSubtitle,
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
//                          Text(
//                            appData.testSpokenLanguageDetails,
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
//                SizedBox(
//                  height: sizeBoxHeight,
//                ),
//                Container(
//                  width: _width * 0.9,
//                  child: Card(
//                    elevation: 10.0,
//                    color: Colors.yellowAccent.shade400,
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Column(
//                        children: <Widget>[
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
//                          Text(
//                            appData.testSpokenLanguageToPatient,
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
//
//                SizedBox(
//                  height: sizeBoxHeight,
//                ),
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
                            appData.testSpokenLanguageResponse,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0),
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
                                            .testSpokenLanguageResponseNormal,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        appData
                                            .testSpokenLanguageResponseEquivocal,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        appData
                                            .testSpokenLanguageResponseImpaired,
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
//                                              color: Colors.black,
//                                              fontSize: 10.0),
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
//                                              color: Colors.black,
//                                              fontSize: 10.0),
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
//                                              color: Colors.black,
//                                              fontSize: 10.0),
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
//                                        appData.testSpokenLanguageResponseNormal,
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
//                                            .testSpokenLanguageResponseEquivocal,
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
//                                            .testSpokenLanguageResponseImpaired,
//                                        textAlign: TextAlign.center,
//                                        style: TextStyle(fontSize: 10.0),
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              )
//                            ],
//                          ),
//                          Column(
//                            crossAxisAlignment: CrossAxisAlignment.center,
//                            children: <Widget>[
//                              Row(
//                                mainAxisAlignment:
//                                    MainAxisAlignment.spaceEvenly,
//                                children: <Widget>[
//                                  Text(
//                                    appData.testAttentionResponseNormal,
//                                    style: TextStyle(
//                                      color: Colors.black,
//                                      fontSize: 10.0,
//                                    ),
//                                  ),
//                                  Text(
//                                    appData.testAnomiaAgnosiaResponseEquivocal,
//                                    style: TextStyle(
//                                      color: Colors.black,
//                                      fontSize: 10.0,
//                                    ),
//                                  ),
//                                ],
//                              ),
//                              Row(
//                                mainAxisAlignment:
//                                    MainAxisAlignment.spaceEvenly,
//                                children: <Widget>[
//                                  Text(
//                                    appData.testAnomiaAgnosiaResponseImpaired,
//                                    style: TextStyle(
//                                      color: Colors.black,
//                                      fontSize: 10.0,
//                                    ),
//                                  ),
//                                ],
//                              ),
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
                              new TestSummary(
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
                                praxisRight: widget.praxisRight,
                                praxisLeft: widget.praxisLeft,
                                shorttermMemoryVerbal: widget.shorttermMemoryVerbal,
                                tenWordDelay: widget.tenWordDelay,
                                scoreVerbalRecognitionMemoryTenWords: widget.scoreVerbalRecognitionMemoryTenWords,
                                scoreVerbalRecognitionMemoryTenWordsInList: widget.scoreVerbalRecognitionMemoryTenWordsInList,
                                scoreVerbalRecognitionMemoryTenWordsNotInList: widget.scoreVerbalRecognitionMemoryTenWordsNotInList,
                                shorttermMemoryVisualImage1: widget.shorttermMemoryVisualImage1,
                                shorttermMemoryVisualImage2: widget.shorttermMemoryVisualImage2,
                                shorttermMemoryVisualImage3: widget.shorttermMemoryVisualImage3,
                                anomiaAgnosia: widget.anomiaAgnosia,
                                executive: widget.executive,
                                spokenLanguage: _radioValue,
                              )
                          );
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
