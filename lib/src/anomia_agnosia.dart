import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/executive.dart';
import 'package:mica/src/show_image_anomia.dart';
import 'package:mica/src/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnomiaAgnosia extends StatefulWidget {
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
  int attentionCorrect;
  int attentionMistakes;
  int executiveAnimalNaming;
  int executiveAnimalNamingCount;
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

  AnomiaAgnosia({
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
    this.attention,
    this.attentionCorrect,
    this.attentionMistakes,
    this.executiveAnimalNaming,
    this.executiveAnimalNamingCount,
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
  }) : super(key: key);

  @override
  _AnomiaAgnosiaState createState() => _AnomiaAgnosiaState();
}

class _AnomiaAgnosiaState extends State<AnomiaAgnosia> {
  double sizeBoxHeight = 10.0;

  int _radioValue;
  int _radioValue2;
  int imageNumber = 0;

  String displayImage = appData.imageURL[0];

  bool backButtonActive = false;
  bool forwardButtonActive = true;

  @override
  void initState() {
    super.initState();
    getPrefsData();
  }

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
              appData.testAnomiaAgnosia,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              appData.testAnomiaAgnosiaSubtitle,
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
                              appData.testAnomiaAgnosiaToPatient,
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
                              appData.testAnomiaAgnosiaDetails,
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
                    width: _width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            iconSize: 40.0,
                            onPressed: backButtonActive
                                ? () {
                                    print("tapped");
                                    if (imageNumber > 0) {
                                      setState(() {
                                        imageNumber -= 1;
                                        displayImage =
                                            appData.imageURL[imageNumber];
                                      });
                                    }
                                    if (imageNumber == 0) {
                                      setState(() {
                                        backButtonActive = false;
                                      });
                                    }
                                    if (imageNumber < 4) {
                                      setState(() {
                                        forwardButtonActive = true;
                                      });
                                    }
                                  }
                                : null),
                        SizedBox(
                          width: 20.0,
                        ),
                        Card(
                          elevation: 10.0,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                debugPrint("tapped picture");
                                var router = new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new ShowImageAnomia(
                                          imageURL: displayImage,
                                          imageNumber: imageNumber,
                                        ));
                                Navigator.of(context).pushAndRemoveUntil(
                                    router, (Route<dynamic> route) => true);
                              },
                              child: SizedBox(
                                width: 150.0,
                                height: 150.0,
                                child: Image.asset(
                                  displayImage,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            iconSize: 40.0,
                            onPressed: forwardButtonActive
                                ? () {
                                    print("tapped");
                                    if (imageNumber < 4) {
                                      setState(() {
                                        imageNumber += 1;
                                        displayImage =
                                            appData.imageURL[imageNumber];
                                      });
                                    }
                                    if (imageNumber == 4) {
                                      setState(() {
                                        forwardButtonActive = false;
                                      });
                                    }
                                    if (imageNumber > 0) {
                                      setState(() {
                                        backButtonActive = true;
                                      });
                                    }
                                  }
                                : null),
                      ],
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
                              appData.testAnomiaAgnosiaResponse,
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
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
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
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData.testAnomiaAgnosiaResponseNormal,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData
                                          .testAnomiaAgnosiaResponseEquivocal,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData.testAnomiaAgnosiaResponseImpaired,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                ])
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              appData.testAnomiaAgnosiaResponse2,
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
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
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
                                        groupValue: _radioValue2,
                                        onChanged: _handleRadioValueChange2,
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
                                        groupValue: _radioValue2,
                                        onChanged: _handleRadioValueChange2,
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
                                        groupValue: _radioValue2,
                                        onChanged: _handleRadioValueChange2,
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
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData.testAnomiaAgnosiaResponseNormal,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData
                                          .testAnomiaAgnosiaResponseEquivocal,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData.testAnomiaAgnosiaResponseImpaired,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10.0),
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
                                    new Executive(
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
                                      attention: widget.attention,
                                      attentionCorrect: widget.attentionCorrect,
                                      attentionMistakes:
                                          widget.attentionMistakes,
                                      executiveAnimalNaming:
                                          widget.executiveAnimalNaming,
                                      executiveAnimalNamingCount:
                                          widget.executiveAnimalNamingCount,
                                      executiveLuria: widget.executiveLuria,
                                      executiveSerial: widget.executiveSerial,
                                      praxisRight: widget.praxisRight,
                                      praxisLeft: widget.praxisLeft,
                                      shorttermMemoryVerbal:
                                          widget.shorttermMemoryVerbal,
                                      tenWordDelay: widget.tenWordDelay,
                                      scoreVerbalRecognitionMemoryTenWords: widget
                                          .scoreVerbalRecognitionMemoryTenWords,
                                      scoreVerbalRecognitionMemoryTenWordsInList:
                                          widget
                                              .scoreVerbalRecognitionMemoryTenWordsInList,
                                      scoreVerbalRecognitionMemoryTenWordsNotInList:
                                          widget
                                              .scoreVerbalRecognitionMemoryTenWordsNotInList,
                                      shorttermMemoryVisualImage1:
                                          widget.shorttermMemoryVisualImage1,
                                      shorttermMemoryVisualImage2:
                                          widget.shorttermMemoryVisualImage2,
                                      shorttermMemoryVisualImage3:
                                          widget.shorttermMemoryVisualImage3,
                                      anomiaAgnosia: _radioValue,
                                      agnosia: _radioValue2,
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

  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;
    });
  }

  void getPrefsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int anomia = prefs.getInt("anomiaAgnosia");
    int agnosia = prefs.getInt("agnosia");

    setState(() {
      _radioValue = anomia;
      _radioValue2 = agnosia;
    });
  }

  Future<bool> savePrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("anomiaAgnosia", _radioValue);
    prefs.setInt("agnosia", _radioValue2);

    return true;
  }
}
