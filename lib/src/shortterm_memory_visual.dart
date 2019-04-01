import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/anomia_agnosia.dart';
import 'package:mica/src/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShortTermMemoryVisual extends StatefulWidget {
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

  ShortTermMemoryVisual(
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
      this.scoreVerbalRecognitionMemoryTenWordsNotInList})
      : super(key: key);

  @override
  _ShortTermMemoryVisualState createState() => _ShortTermMemoryVisualState();
}

class _ShortTermMemoryVisualState extends State<ShortTermMemoryVisual> {
  double sizeBoxHeight = 10.0;

  int _radioValueImageOne;
  int _radioValueImageTwo;
  int _radioValueImageThree;

  double _fontSize = 8.0;

  @override
  void initState() {
    super.initState();
    getPrefsData();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _sizeboxWidth = _width * 0.8 / 5;

    return WillPopScope(
      onWillPop: savePrefData,
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              appData.testShortTermMemoryVisual,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              appData.testShortTermMemoryVisualSubtitle,
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
                              appData.testShortTermMemoryVisualToPatient,
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
                              appData.testShortTermMemoryVisualDetails,
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
                        child: SizedBox(
                          width: _width * 0.9,
                          height: 150.0,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: _width * 0.8 / 3,
                                height: 130.0,
                                child: Image.asset(
                                  "./images/block_one.png",
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              SizedBox(
                                width: _width * 0.8 / 3,
                                height: 130.0,
                                child: Image.asset(
                                  "./images/block_two.png",
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              SizedBox(
                                width: _width * 0.8 / 3,
                                height: 130.0,
                                child: Image.asset(
                                  "./images/block_three.png",
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ],
                          ),
//                        child: ListView(
//                          scrollDirection: Axis.horizontal,
//
//
//                          children: <Widget>[
//                            GestureDetector(
//                              child: Image.asset("./images/block_one.png",
//                              fit: BoxFit.fitWidth,
//                              ),
//                              onTap: () => debugPrint("tapped"),
//                            ),
//                            Image.asset("./images/block_two.png",
//                              fit: BoxFit.fitWidth,
//                            ),
//                            Image.asset("./images/block_three.png",
//                              fit: BoxFit.fitWidth,
//                            ),
//                          ],
//                        ),
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
                            // Text(
                            //   appData.testShortTermMemoryVisualResponse,
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //       color: Colors.black,
                            //       fontWeight: FontWeight.w500,
                            //       fontSize: 15.0),
                            // ),
                            // SizedBox(
                            //   height: 5.0,
                            // ),
                            Table(
                              border: TableBorder.all(),
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              columnWidths: {
                                0: FlexColumnWidth(0.2),
                                1: FlexColumnWidth(0.2),
                                2: FlexColumnWidth(0.2),
                                3: FlexColumnWidth(0.2),
                                4: FlexColumnWidth(0.2),
                              },
                              children: [
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Image",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: _fontSize,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "No Mistakes",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: _fontSize,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Few Omissions",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: _fontSize,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Poor",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: _fontSize,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "No Drawing",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: _fontSize,
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Image 1",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 0,
                                        groupValue: _radioValueImageOne,
                                        onChanged: _handleRadioValueChange1,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "3",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 1,
                                        groupValue: _radioValueImageOne,
                                        onChanged: _handleRadioValueChange1,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "2",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 2,
                                        groupValue: _radioValueImageOne,
                                        onChanged: _handleRadioValueChange1,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 3,
                                        groupValue: _radioValueImageOne,
                                        onChanged: _handleRadioValueChange1,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Image 2",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 0,
                                        groupValue: _radioValueImageTwo,
                                        onChanged: _handleRadioValueChange2,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "3",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 1,
                                        groupValue: _radioValueImageTwo,
                                        onChanged: _handleRadioValueChange2,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "2",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 2,
                                        groupValue: _radioValueImageTwo,
                                        onChanged: _handleRadioValueChange2,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 3,
                                        groupValue: _radioValueImageTwo,
                                        onChanged: _handleRadioValueChange2,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Image 3",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 0,
                                        groupValue: _radioValueImageThree,
                                        onChanged: _handleRadioValueChange3,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "3",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 1,
                                        groupValue: _radioValueImageThree,
                                        onChanged: _handleRadioValueChange3,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "2",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 2,
                                        groupValue: _radioValueImageThree,
                                        onChanged: _handleRadioValueChange3,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 3,
                                        groupValue: _radioValueImageThree,
                                        onChanged: _handleRadioValueChange3,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ])
                              ],
                            ),
//                          Column(
//                            crossAxisAlignment: CrossAxisAlignment.center,
//                            children: <Widget>[
//                              SizedBox(
//                                height: 5.0,
//                              ),
//                              Row(
//                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                children: <Widget>[
//                                  SizedBox(
//                                    width: _sizeboxWidth,
//                                    child: Text(
//                                      "Image",
//                                      style: TextStyle(
//                                        color: Colors.black,
//                                        fontWeight: FontWeight.w500,
//
//                                      ),
//                                    ),
//                                  ),
//
//                                  SizedBox(
//                                    width: _sizeboxWidth,
//                                    child: Text(
//                                      "No Mistakes",
//                                      style: TextStyle(
//                                        color: Colors.black,
//                                        fontSize: _fontSize,
//                                      ),
//                                    ),
//                                  ),
//
//                                  SizedBox(
//                                    width: _sizeboxWidth,
//                                    child: Text(
//                                      "Few Omissions",
//                                      style: TextStyle(
//                                        color: Colors.black,
//                                        fontSize: _fontSize,
//                                      ),
//                                    ),
//                                  ),
//
//                                  SizedBox(
//                                    width: _sizeboxWidth,
//                                    child: Text(
//                                      "Poor",
//                                      style: TextStyle(
//                                        color: Colors.black,
//                                        fontSize: _fontSize,
//                                      ),
//                                    ),
//                                  ),
//
//                                  SizedBox(
//                                    width: _sizeboxWidth,
//                                    child: Text(
//                                      "No Drawing",
//                                      style: TextStyle(
//                                        color: Colors.black,
//                                        fontSize: _fontSize,
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                              Row(
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                children: <Widget>[
//                                  SizedBox(
//                                    width: _sizeboxWidth,
//                                    child: Text(
//                                      "Image 1",
//                                      style: TextStyle(
//                                        color: Colors.black,
//                                      ),
//                                    ),
//                                  ),
//                                  SizedBox(
//                                    width: _sizeboxWidth,
//                                    child: Row(
//                                      children: <Widget>[
//                                        Radio(
//                                          value: 0,
//                                          groupValue: _radioValueImageOne,
//                                          onChanged: _handleRadioValueChange1,
//                                          activeColor: Colors.white,
//                                        ),
//                                        Text(
//                                          "3",
//                                          style: TextStyle(
//                                            color: Colors.black,
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//
//                                  SizedBox(
//                                    width: _sizeboxWidth,
//                                    child: Row(
//                                      children: <Widget>[
//                                        Radio(
//                                          value: 1,
//                                          groupValue: _radioValueImageOne,
//                                          onChanged: _handleRadioValueChange1,
//                                          activeColor: Colors.white,
//                                        ),
//                                        Text(
//                                          "2",
//                                          style: TextStyle(
//                                            color: Colors.black,
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//
//                                  SizedBox(
//                                    width: _sizeboxWidth,
//                                    child: Row(
//                                      children: <Widget>[
//                                        Radio(
//                                          value: 2,
//                                          groupValue: _radioValueImageOne,
//                                          onChanged: _handleRadioValueChange1,
//                                          activeColor: Colors.white,
//                                        ),
//                                        Text(
//                                          "1",
//                                          style: TextStyle(
//                                            color: Colors.black,
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//
//                                  SizedBox(
//                                    width: _sizeboxWidth,
//                                    child: Row(
//                                      children: <Widget>[
//                                        Radio(
//                                          value: 3,
//                                          groupValue: _radioValueImageOne,
//                                          onChanged: _handleRadioValueChange1,
//                                          activeColor: Colors.white,
//                                        ),
//                                        Text(
//                                          "0",
//                                          style: TextStyle(
//                                            color: Colors.black,
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//
//                                ],
//                              ),
//                              Row(
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                children: <Widget>[
//                                  SizedBox(
//                                    width: _sizeboxWidth,
//                                    child: Text(
//                                      "Image 2",
//                                      style: TextStyle(
//                                        color: Colors.black,
//                                      ),
//                                    ),
//                                  ),
//                                  SizedBox(
//                                    width: _sizeboxWidth,
//                                    child: Row(
//                                      children: <Widget>[
//                                        Radio(
//                                          value: 0,
//                                          groupValue: _radioValueImageTwo,
//                                          onChanged: _handleRadioValueChange2,
//                                          activeColor: Colors.white,
//                                        ),
//                                        Text(
//                                          "3",
//                                          style: TextStyle(
//                                            color: Colors.black,
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//
//                                  SizedBox(
//                                    width: _sizeboxWidth,
//                                    child: Row(
//                                      children: <Widget>[
//                                        Radio(
//                                          value: 1,
//                                          groupValue: _radioValueImageTwo,
//                                          onChanged: _handleRadioValueChange2,
//                                          activeColor: Colors.white,
//                                        ),
//                                        Text(
//                                          "2",
//                                          style: TextStyle(
//                                            color: Colors.black,
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//
//                                  SizedBox(
//                                    width: _sizeboxWidth,
//                                    child: Row(
//                                      children: <Widget>[
//                                        Radio(
//                                          value: 2,
//                                          groupValue: _radioValueImageTwo,
//                                          onChanged: _handleRadioValueChange2,
//                                          activeColor: Colors.white,
//                                        ),
//                                        Text(
//                                          "1",
//                                          style: TextStyle(
//                                            color: Colors.black,
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//
//                                  SizedBox(
//                                    width: _sizeboxWidth,
//                                    child: Row(
//                                      children: <Widget>[
//                                        Radio(
//                                          value: 3,
//                                          groupValue: _radioValueImageTwo,
//                                          onChanged: _handleRadioValueChange2,
//                                          activeColor: Colors.white,
//                                        ),
//                                        Text(
//                                          "0",
//                                          style: TextStyle(
//                                            color: Colors.black,
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//
//                                ],
//                              ),
//                              Row(
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                children: <Widget>[
//                                  SizedBox(
//                                    width: _sizeboxWidth,
//                                    child: Text(
//                                      "Image 3",
//                                      style: TextStyle(
//                                        color: Colors.black,
//                                      ),
//                                    ),
//                                  ),
//                                  SizedBox(
//                                    width: _sizeboxWidth,
//                                    child: Row(
//                                      children: <Widget>[
//                                        Radio(
//                                          value: 0,
//                                          groupValue: _radioValueImageThree,
//                                          onChanged: _handleRadioValueChange3,
//                                          activeColor: Colors.white,
//                                        ),
//                                        Text(
//                                          "3",
//                                          style: TextStyle(
//                                            color: Colors.black,
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//
//                                  SizedBox(
//                                    width: _sizeboxWidth,
//                                    child: Row(
//                                      children: <Widget>[
//                                        Radio(
//                                          value: 1,
//                                          groupValue: _radioValueImageThree,
//                                          onChanged: _handleRadioValueChange3,
//                                          activeColor: Colors.white,
//                                        ),
//                                        Text(
//                                          "2",
//                                          style: TextStyle(
//                                            color: Colors.black,
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//
//                                  SizedBox(
//                                    width: _sizeboxWidth,
//                                    child: Row(
//                                      children: <Widget>[
//                                        Radio(
//                                          value: 2,
//                                          groupValue: _radioValueImageThree,
//                                          onChanged: _handleRadioValueChange3,
//                                          activeColor: Colors.white,
//                                        ),
//                                        Text(
//                                          "1",
//                                          style: TextStyle(
//                                            color: Colors.black,
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//
//                                  SizedBox(
//                                    width: _sizeboxWidth,
//                                    child: Row(
//                                      children: <Widget>[
//                                        Radio(
//                                          value: 3,
//                                          groupValue: _radioValueImageThree,
//                                          onChanged: _handleRadioValueChange3,
//                                          activeColor: Colors.white,
//                                        ),
//                                        Text(
//                                          "0",
//                                          style: TextStyle(
//                                            color: Colors.black,
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//
//                                ],
//                              ),
////                              Row(
////                                children: <Widget>[
////                                  Text(
////                                    "Image 1",
////                                    style: TextStyle(
////                                      color: Colors.black,
////                                    ),
////                                  ),
////                                  Radio(
////                                    value: 0,
////                                    groupValue: _radioValueImageOne,
////                                    onChanged: _handleRadioValueChange1,
////                                    activeColor: Colors.white,
////                                  ),
////                                  Text(
////                                    "3",
////                                    style: TextStyle(
////                                      color: Colors.black,
////                                    ),
////                                  ),
////                                  Radio(
////                                    value: 1,
////                                    groupValue: _radioValueImageOne,
////                                    onChanged: _handleRadioValueChange1,
////                                    activeColor: Colors.white,
////                                  ),
////                                  Text(
////                                    "2",
////                                    style: TextStyle(
////                                      color: Colors.black,
////                                    ),
////                                  ),
////                                  Radio(
////                                    value: 2,
////                                    groupValue: _radioValueImageOne,
////                                    onChanged: _handleRadioValueChange1,
////                                    activeColor: Colors.white,
////                                  ),
////                                  Text(
////                                    "1",
////                                    style: TextStyle(
////                                      color: Colors.black,
////                                    ),
////                                  ),
////                                  Radio(
////                                    value: 3,
////                                    groupValue: _radioValueImageOne,
////                                    onChanged: _handleRadioValueChange1,
////                                    activeColor: Colors.white,
////                                  ),
////                                  Text(
////                                    "0",
////                                    style: TextStyle(
////                                      color: Colors.black,
////                                    ),
////                                  ),
////                                ],
////                              ),
////                              Row(
////                                children: <Widget>[
////                                  Text(
////                                    "Image 2",
////                                    style: TextStyle(
////                                      color: Colors.black,
////                                    ),
////                                  ),
////                                  Radio(
////                                    value: 0,
////                                    groupValue: _radioValueImageTwo,
////                                    onChanged: _handleRadioValueChange2,
////                                    activeColor: Colors.white,
////                                  ),
////                                  Text(
////                                    "3",
////                                    style: TextStyle(
////                                      color: Colors.black,
////                                    ),
////                                  ),
////                                  Radio(
////                                    value: 1,
////                                    groupValue: _radioValueImageTwo,
////                                    onChanged: _handleRadioValueChange2,
////                                    activeColor: Colors.white,
////                                  ),
////                                  Text(
////                                    "2",
////                                    style: TextStyle(
////                                      color: Colors.black,
////                                    ),
////                                  ),
////                                  Radio(
////                                    value: 2,
////                                    groupValue: _radioValueImageTwo,
////                                    onChanged: _handleRadioValueChange2,
////                                    activeColor: Colors.white,
////                                  ),
////                                  Text(
////                                    "1",
////                                    style: TextStyle(
////                                      color: Colors.black,
////                                    ),
////                                  ),
////                                  Radio(
////                                    value: 3,
////                                    groupValue: _radioValueImageTwo,
////                                    onChanged: _handleRadioValueChange2,
////                                    activeColor: Colors.white,
////                                  ),
////                                  Text(
////                                    "0",
////                                    style: TextStyle(
////                                      color: Colors.black,
////                                    ),
////                                  ),
////                                ],
////                              ),
////                              Row(
////                                children: <Widget>[
////                                  Text(
////                                    "Image 3",
////                                    style: TextStyle(
////                                      color: Colors.black,
////                                    ),
////                                  ),
////                                  Radio(
////                                    value: 0,
////                                    groupValue: _radioValueImageThree,
////                                    onChanged: _handleRadioValueChange3,
////                                    activeColor: Colors.white,
////                                  ),
////                                  Text(
////                                    "3",
////                                    style: TextStyle(
////                                      color: Colors.black,
////                                    ),
////                                  ),
////                                  Radio(
////                                    value: 1,
////                                    groupValue: _radioValueImageThree,
////                                    onChanged: _handleRadioValueChange3,
////                                    activeColor: Colors.white,
////                                  ),
////                                  Text(
////                                    "2",
////                                    style: TextStyle(
////                                      color: Colors.black,
////                                    ),
////                                  ),
////                                  Radio(
////                                    value: 2,
////                                    groupValue: _radioValueImageThree,
////                                    onChanged: _handleRadioValueChange3,
////                                    activeColor: Colors.white,
////                                  ),
////                                  Text(
////                                    "1",
////                                    style: TextStyle(
////                                      color: Colors.black,
////                                    ),
////                                  ),
////                                  Radio(
////                                    value: 3,
////                                    groupValue: _radioValueImageThree,
////                                    onChanged: _handleRadioValueChange3,
////                                    activeColor: Colors.white,
////                                  ),
////                                  Text(
////                                    "0",
////                                    style: TextStyle(
////                                      color: Colors.black,
////                                    ),
////                                  ),
////                                ],
////                              ),
////                              Text(
////                                appData.testVisuospatialPraxisScoring,
////                                textAlign: TextAlign.center,
////                                style: TextStyle(
////                                    color: Colors.black,
////                                    fontWeight: FontWeight.w500,
////                                    fontSize: 15.0),
////                              ),
////                              Row(
////                                mainAxisAlignment:
////                                MainAxisAlignment.spaceEvenly,
////                                children: <Widget>[
////                                  Text(
////                                    appData
////                                        .testVisuospatialPraxisResponseNormal,
////                                    style: TextStyle(
////                                      color: Colors.black,
////                                      fontSize: 10.0,
////                                    ),
////                                  ),
////                                  Text(
////                                    appData
////                                        .testVisuospatialPraxisResponseEquivocal,
////                                    style: TextStyle(
////                                      color: Colors.black,
////                                      fontSize: 10.0,
////                                    ),
////                                  ),
////                                ],
////                              ),
////                              Row(
////                                mainAxisAlignment:
////                                MainAxisAlignment.spaceEvenly,
////                                children: <Widget>[
////                                  Text(
////                                    appData
////                                        .testVisuospatialPraxisResponseImpaired,
////                                    style: TextStyle(
////                                      color: Colors.black,
////                                      fontSize: 10.0,
////                                    ),
////                                  ),
////                                  Text(
////                                    appData
////                                        .testVisuospatialPraxisResponseFubar,
////                                    style: TextStyle(
////                                      color: Colors.black,
////                                      fontSize: 10.0,
////                                    ),
////                                  ),
////                                ],
////                              ),
//
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
                                    new AnomiaAgnosia(
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
                                      executiveAnimalNaming:
                                          widget.executiveAnimalNaming,
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
                                          _radioValueImageOne,
                                      shorttermMemoryVisualImage2:
                                          _radioValueImageTwo,
                                      shorttermMemoryVisualImage3:
                                          _radioValueImageThree,
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

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValueImageOne = value;
    });
  }

  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValueImageTwo = value;
    });
  }

  void _handleRadioValueChange3(int value) {
    setState(() {
      _radioValueImageThree = value;
    });
  }

  void getPrefsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int _score1 = prefs.getInt("shorttermMemoryVisualImage1");
    int _score2 = prefs.getInt("shorttermMemoryVisualImage2");
    int _score3 = prefs.getInt("shorttermMemoryVisualImage3");

    setState(() {
      _radioValueImageOne = _score1;
      _radioValueImageTwo = _score2;
      _radioValueImageThree = _score3;
    });
  }

  Future<bool> savePrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("shorttermMemoryVisualImage1", _radioValueImageOne);
    prefs.setInt("shorttermMemoryVisualImage2", _radioValueImageTwo);
    prefs.setInt("shorttermMemoryVisualImage3", _radioValueImageThree);

    return true;
  }
}
