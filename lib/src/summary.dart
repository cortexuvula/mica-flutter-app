import 'package:flutter/material.dart';
import 'package:mica/src/home.dart';
import 'package:mica/resources/const_data.dart' as appData;


class TestSummary extends StatefulWidget {

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
  int executiveLuria;
  int executiveSerial;
  int shorttermMemoryVerbal;
  int praxis;
  int tenWordDelay;
  int scoreVerbalRecognitionMemoryTenWords;
  int scoreVerbalRecognitionMemoryTenWordsInList;
  int scoreVerbalRecognitionMemoryTenWordsNotInList;
  int shorttermMemoryVisual;
  int anomiaAgnosia;
  int executive;
  int spokenLanguage;

  TestSummary(
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
        this.executiveAnimalNaming,
        this.executiveLuria,
        this.executiveSerial,
        this.shorttermMemoryVerbal,
        this.praxis,
        this.tenWordDelay,
        this.scoreVerbalRecognitionMemoryTenWords,
        this.scoreVerbalRecognitionMemoryTenWordsInList,
        this.scoreVerbalRecognitionMemoryTenWordsNotInList,
        this.shorttermMemoryVisual,
        this.anomiaAgnosia,
        this.executive,
        this.spokenLanguage})
      : super(key: key);

  @override
  _TestSummaryState createState() => _TestSummaryState();
}

class _TestSummaryState extends State<TestSummary> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            appData.summary,
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
//        actions: <Widget>[
//          IconButton(
//              icon: Icon(Icons.clear),
//              onPressed: () {
//                var router = new MaterialPageRoute(
//                    builder: (BuildContext context) => new Home(
//                      viewedDisclaimer: true,
//                    ));
//                Navigator.of(context).pushAndRemoveUntil(
//                    router, (Route<dynamic> route) => false);
//              })
//        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Summary Page"),
            SizedBox(
              height: 20.0,
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
                          builder: (BuildContext context) => new Home(
                            viewedDisclaimer: true,
                          ));
                      Navigator.of(context).pushAndRemoveUntil(
                          router, (Route<dynamic> route) => false);
                    },
                    child: Text("Take My Home"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
