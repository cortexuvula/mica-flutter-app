import 'package:flutter/material.dart';
import 'package:mica/src/attention.dart';
import 'package:mica/src/home.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/show_image.dart';

class VisuospatialPraxis extends StatefulWidget {
  String patientName;
  String assessorName;
  String handedness;
  DateTime assessmentDate;
  int languageComprehensionRadioValue;
  int trialOneScore;
  int trialTwoScore;
  int trialThreeScore;

  VisuospatialPraxis(
      {Key key,
      this.patientName,
      this.assessorName,
      this.handedness,
      this.assessmentDate,
      this.languageComprehensionRadioValue,
      this.trialOneScore,
      this.trialTwoScore,
      this.trialThreeScore})
      : super(key: key);

  @override
  _VisuospatialPraxisState createState() => _VisuospatialPraxisState();
}

class _VisuospatialPraxisState extends State<VisuospatialPraxis> {
  double sizeBoxHeight = 5.0;
  int _radioValueImageOne = 0;
  int _radioValueImageTwo = 0;
  int _radioValueImageThree = 0;

  int imageNumber = 0;

  String displayImage = appData.imageURLPraxis[0];

  bool backButtonActive = false;
  bool forwardButtonActive = true;

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _sizeboxWidth = _width * 0.8 / 5;
    double _fontSize = 8.0;
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            appData.testVisuospatialPraxis,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.start,
          ),
          subtitle: Text(
            appData.testVisuospatialPraxisSubtitle,
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
      body: PageView(
        children: <Widget>[
          Container(
            color: Theme.of(context).backgroundColor,
            child: ListView(
              children: <Widget>[
                Center(
                  child: Column(
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
//                                Text(
//                                  appData.testDescription,
//                                  textAlign: TextAlign.left,
//                                  style: TextStyle(
//                                    color: Colors.black,
//                                    fontWeight: FontWeight.w500,
//                                    fontSize: 20.0,
//                                    decoration: TextDecoration.underline,
//                                  ),
//                                ),
//                                SizedBox(
//                                  height: 5.0,
//                                ),
                                Text(
                                  appData.testVisuospatialPraxisDetails,
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
//                                Text(
//                                  appData.testToPatient,
//                                  textAlign: TextAlign.left,
//                                  style: TextStyle(
//                                    color: Colors.black,
//                                    fontWeight: FontWeight.w500,
//                                    fontSize: 20.0,
//                                    decoration: TextDecoration.underline,
//                                  ),
//                                ),
//                                SizedBox(
//                                  height: 5.0,
//                                ),
                                Text(
                                  appData.testVisuospatialPraxisToPatient,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              iconSize: 40.0,
                              onPressed: backButtonActive ? () {
                                print("tapped");
                                if (imageNumber > 0) {
                                  setState(() {
                                    imageNumber -= 1;
                                    displayImage = appData.imageURLPraxis[imageNumber];
                                  });
                                }
                                if (imageNumber == 0) {
                                  setState(() {
                                    backButtonActive = false;
                                  });
                                }
                                if (imageNumber < 2) {
                                  setState(() {
                                    forwardButtonActive = true;
                                  });
                                }
                              } : null
                          ),
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
                                  var router = new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                      new ShowImage(
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
                              icon: Icon(
                                  Icons.arrow_forward_ios),
                              iconSize: 40.0,
                              onPressed: forwardButtonActive ?  () {
                                print("tapped");
                                if (imageNumber < 2) {
                                  setState(() {
                                    imageNumber += 1;
                                    displayImage = appData.imageURLPraxis[imageNumber];
                                  });
                                }
                                if (imageNumber == 2) {
                                  setState(() {
                                    forwardButtonActive = false;
                                  });
                                }
                                if (imageNumber > 0) {
                                  setState(() {
                                    backButtonActive = true;
                                  });
                                }
                              } : null
                          ),
                        ],
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
//                                Text(
//                                  appData.testResponse,
//                                  textAlign: TextAlign.left,
//                                  style: TextStyle(
//                                    color: Colors.black,
//                                    fontWeight: FontWeight.w500,
//                                    fontSize: 20.0,
//                                    decoration: TextDecoration.underline,
//                                  ),
//                                ),
//                                SizedBox(
//                                  height: 5.0,
//                                ),
//                                Text(
//                                  appData.testVisuospatialPraxisResponse,
//                                  textAlign: TextAlign.center,
//                                  style: TextStyle(
//                                      color: Colors.black,
//                                      fontWeight: FontWeight.w500,
//                                      fontSize: 15.0),
//                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Table(
                                  border: TableBorder.all(),
                                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                  columnWidths: {
                                    0: FlexColumnWidth(0.2),
                                    1: FlexColumnWidth(0.2),
                                    2: FlexColumnWidth(0.2),
                                    3: FlexColumnWidth(0.2),
                                    4: FlexColumnWidth(0.2),
                                  },
                                  children: [
                                    TableRow(
                                      children: [
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
                                      ]
                                    ),
                                    TableRow(
                                      children: [
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
                                      ]
                                    ),
                                    TableRow(
                                      children: [
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
                                      ]
                                    ),
                                    TableRow(
                                      children: [
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
                                      ]
                                    )
                                  ],
                                ),

//                                Row(
//                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                  children: <Widget>[
//                                    SizedBox(
//                                      width: _sizeboxWidth,
//                                      child: Text(
//                                        "Image",
//                                        style: TextStyle(
//                                          color: Colors.black,
//                                          fontWeight: FontWeight.w500,
//
//                                        ),
//                                      ),
//                                    ),
//
//                                    SizedBox(
//                                      width: _sizeboxWidth,
//                                      child: Text(
//                                        "No Mistakes",
//                                        style: TextStyle(
//                                          color: Colors.black,
//                                          fontSize: _fontSize,
//                                        ),
//                                      ),
//                                    ),
//
//                                    SizedBox(
//                                      width: _sizeboxWidth,
//                                      child: Text(
//                                        "Few Omissions",
//                                        style: TextStyle(
//                                          color: Colors.black,
//                                          fontSize: _fontSize,
//                                        ),
//                                      ),
//                                    ),
//
//                                    SizedBox(
//                                      width: _sizeboxWidth,
//                                      child: Text(
//                                        "Poor",
//                                        style: TextStyle(
//                                          color: Colors.black,
//                                          fontSize: _fontSize,
//                                        ),
//                                      ),
//                                    ),
//
//                                    SizedBox(
//                                      width: _sizeboxWidth,
//                                      child: Text(
//                                        "No Drawing",
//                                        style: TextStyle(
//                                          color: Colors.black,
//                                          fontSize: _fontSize,
//                                        ),
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                                Row(
//                                  mainAxisAlignment: MainAxisAlignment.start,
//                                  children: <Widget>[
//                                    SizedBox(
//                                      width: _sizeboxWidth,
//                                      child: Text(
//                                        "Image 1",
//                                        style: TextStyle(
//                                          color: Colors.black,
//                                        ),
//                                      ),
//                                    ),
//                                    SizedBox(
//                                      width: _sizeboxWidth,
//                                      child: Row(
//                                        children: <Widget>[
//                                          Radio(
//                                            value: 0,
//                                            groupValue: _radioValueImageOne,
//                                            onChanged: _handleRadioValueChange1,
//                                            activeColor: Colors.white,
//                                          ),
//                                          Text(
//                                            "3",
//                                            style: TextStyle(
//                                              color: Colors.black,
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//
//                                    SizedBox(
//                                      width: _sizeboxWidth,
//                                      child: Row(
//                                        children: <Widget>[
//                                          Radio(
//                                            value: 1,
//                                            groupValue: _radioValueImageOne,
//                                            onChanged: _handleRadioValueChange1,
//                                            activeColor: Colors.white,
//                                          ),
//                                          Text(
//                                            "2",
//                                            style: TextStyle(
//                                              color: Colors.black,
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//
//                                    SizedBox(
//                                      width: _sizeboxWidth,
//                                      child: Row(
//                                        children: <Widget>[
//                                          Radio(
//                                            value: 2,
//                                            groupValue: _radioValueImageOne,
//                                            onChanged: _handleRadioValueChange1,
//                                            activeColor: Colors.white,
//                                          ),
//                                          Text(
//                                            "1",
//                                            style: TextStyle(
//                                              color: Colors.black,
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//
//                                    SizedBox(
//                                      width: _sizeboxWidth,
//                                      child: Row(
//                                        children: <Widget>[
//                                          Radio(
//                                            value: 3,
//                                            groupValue: _radioValueImageOne,
//                                            onChanged: _handleRadioValueChange1,
//                                            activeColor: Colors.white,
//                                          ),
//                                          Text(
//                                            "0",
//                                            style: TextStyle(
//                                              color: Colors.black,
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//
//                                  ],
//                                ),
//                                Row(
//                                  mainAxisAlignment: MainAxisAlignment.start,
//                                  children: <Widget>[
//                                    SizedBox(
//                                      width: _sizeboxWidth,
//                                      child: Text(
//                                        "Image 2",
//                                        style: TextStyle(
//                                          color: Colors.black,
//                                        ),
//                                      ),
//                                    ),
//                                    SizedBox(
//                                      width: _sizeboxWidth,
//                                      child: Row(
//                                        children: <Widget>[
//                                          Radio(
//                                            value: 0,
//                                            groupValue: _radioValueImageTwo,
//                                            onChanged: _handleRadioValueChange2,
//                                            activeColor: Colors.white,
//                                          ),
//                                          Text(
//                                            "3",
//                                            style: TextStyle(
//                                              color: Colors.black,
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//
//                                    SizedBox(
//                                      width: _sizeboxWidth,
//                                      child: Row(
//                                        children: <Widget>[
//                                          Radio(
//                                            value: 1,
//                                            groupValue: _radioValueImageTwo,
//                                            onChanged: _handleRadioValueChange2,
//                                            activeColor: Colors.white,
//                                          ),
//                                          Text(
//                                            "2",
//                                            style: TextStyle(
//                                              color: Colors.black,
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//
//                                    SizedBox(
//                                      width: _sizeboxWidth,
//                                      child: Row(
//                                        children: <Widget>[
//                                          Radio(
//                                            value: 2,
//                                            groupValue: _radioValueImageTwo,
//                                            onChanged: _handleRadioValueChange2,
//                                            activeColor: Colors.white,
//                                          ),
//                                          Text(
//                                            "1",
//                                            style: TextStyle(
//                                              color: Colors.black,
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//
//                                    SizedBox(
//                                      width: _sizeboxWidth,
//                                      child: Row(
//                                        children: <Widget>[
//                                          Radio(
//                                            value: 3,
//                                            groupValue: _radioValueImageTwo,
//                                            onChanged: _handleRadioValueChange2,
//                                            activeColor: Colors.white,
//                                          ),
//                                          Text(
//                                            "0",
//                                            style: TextStyle(
//                                              color: Colors.black,
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//
//                                  ],
//                                ),
//                                Row(
//                                  mainAxisAlignment: MainAxisAlignment.start,
//                                  children: <Widget>[
//                                    SizedBox(
//                                      width: _sizeboxWidth,
//                                      child: Text(
//                                        "Image 3",
//                                        style: TextStyle(
//                                          color: Colors.black,
//                                        ),
//                                      ),
//                                    ),
//                                    SizedBox(
//                                      width: _sizeboxWidth,
//                                      child: Row(
//                                        children: <Widget>[
//                                          Radio(
//                                            value: 0,
//                                            groupValue: _radioValueImageThree,
//                                            onChanged: _handleRadioValueChange3,
//                                            activeColor: Colors.white,
//                                          ),
//                                          Text(
//                                            "3",
//                                            style: TextStyle(
//                                              color: Colors.black,
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//
//                                    SizedBox(
//                                      width: _sizeboxWidth,
//                                      child: Row(
//                                        children: <Widget>[
//                                          Radio(
//                                            value: 1,
//                                            groupValue: _radioValueImageThree,
//                                            onChanged: _handleRadioValueChange3,
//                                            activeColor: Colors.white,
//                                          ),
//                                          Text(
//                                            "2",
//                                            style: TextStyle(
//                                              color: Colors.black,
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//
//                                    SizedBox(
//                                      width: _sizeboxWidth,
//                                      child: Row(
//                                        children: <Widget>[
//                                          Radio(
//                                            value: 2,
//                                            groupValue: _radioValueImageThree,
//                                            onChanged: _handleRadioValueChange3,
//                                            activeColor: Colors.white,
//                                          ),
//                                          Text(
//                                            "1",
//                                            style: TextStyle(
//                                              color: Colors.black,
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//
//                                    SizedBox(
//                                      width: _sizeboxWidth,
//                                      child: Row(
//                                        children: <Widget>[
//                                          Radio(
//                                            value: 3,
//                                            groupValue: _radioValueImageThree,
//                                            onChanged: _handleRadioValueChange3,
//                                            activeColor: Colors.white,
//                                          ),
//                                          Text(
//                                            "0",
//                                            style: TextStyle(
//                                              color: Colors.black,
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//
//                                  ],
//                                ),
                                Text(
                                  appData.testVisuospatialPraxisScoring,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0),
                                ),
//                                Row(
//                                  mainAxisAlignment:
//                                      MainAxisAlignment.spaceEvenly,
//                                  children: <Widget>[
//                                    Text(
//                                      appData
//                                          .testVisuospatialPraxisResponseNormal,
//                                      style: TextStyle(
//                                        color: Colors.black,
//                                        fontSize: 10.0,
//                                      ),
//                                    ),
//                                    Text(
//                                      appData
//                                          .testVisuospatialPraxisResponseEquivocal,
//                                      style: TextStyle(
//                                        color: Colors.black,
//                                        fontSize: 10.0,
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                                Row(
//                                  mainAxisAlignment:
//                                      MainAxisAlignment.spaceEvenly,
//                                  children: <Widget>[
//                                    Text(
//                                      appData
//                                          .testVisuospatialPraxisResponseImpaired,
//                                      style: TextStyle(
//                                        color: Colors.black,
//                                        fontSize: 10.0,
//                                      ),
//                                    ),
//                                    Text(
//                                      appData
//                                          .testVisuospatialPraxisResponseFubar,
//                                      style: TextStyle(
//                                        color: Colors.black,
//                                        fontSize: 10.0,
//                                      ),
//                                    ),
//                                  ],
//                                ),
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
                                        new Attention(
                                          patientName: widget.patientName,
                                          assessorName: widget.assessorName,
                                          handedness: widget.handedness,
                                          assessmentDate: widget.assessmentDate,
                                          languageComprehensionRadioValue: widget
                                              .languageComprehensionRadioValue,
                                          trialOneScore: widget.trialOneScore,
                                          trialTwoScore: widget.trialTwoScore,
                                          trialThreeScore: widget.trialThreeScore,
                                          visuospatialPraxisImage1: _radioValueImageOne,
                                          visuospatialPraxisImage2: _radioValueImageTwo,
                                          visuospatialPraxisImage3: _radioValueImageThree,
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
                )
              ],
            ),
          ),
//          Container(
//            color: Theme.of(context).backgroundColor,
//            child: Center(
//              child: Column(
//                children: <Widget>[
//                  SizedBox(
//                    height: 20.0,
//                  ),
//                  Text(
//                    "Image 1",
//                    style: TextStyle(
//                      fontWeight: FontWeight.w500,
//                      fontSize: 30.0,
//                      decoration: TextDecoration.underline,
//                    ),
//                  ),
//                  SizedBox(
//                    height: 20.0,
//                  ),
//                  Container(
//                    width: _width * 0.9,
//                    color: Colors.white,
//                    child: Padding(
//                      padding: const EdgeInsets.all(10.0),
//                      child: Image.asset(
//                        "./images/block_one.png",
//                        fit: BoxFit.fitWidth,
//                      ),
//                    ),
//                  )
//                ],
//              ),
//            ),
//          ),
//          Container(
//            color: Theme.of(context).backgroundColor,
//            child: Center(
//              child: Column(
//                children: <Widget>[
//                  SizedBox(
//                    height: 20.0,
//                  ),
//                  Text(
//                    "Image 2",
//                    style: TextStyle(
//                      fontWeight: FontWeight.w500,
//                      fontSize: 30.0,
//                      decoration: TextDecoration.underline,
//                    ),
//                  ),
//                  SizedBox(
//                    height: 20.0,
//                  ),
//                  Container(
//                    width: _width * 0.9,
//                    color: Colors.white,
//                    child: Padding(
//                      padding: const EdgeInsets.all(10.0),
//                      child: Image.asset(
//                        "./images/block_two.png",
//                        fit: BoxFit.fitWidth,
//                      ),
//                    ),
//                  )
//                ],
//              ),
//            ),
//          ),
//          Container(
//            color: Theme.of(context).backgroundColor,
//            child: Center(
//              child: Column(
//                children: <Widget>[
//                  SizedBox(
//                    height: 20.0,
//                  ),
//                  Text(
//                    "Image 3",
//                    style: TextStyle(
//                      fontWeight: FontWeight.w500,
//                      fontSize: 30.0,
//                      decoration: TextDecoration.underline,
//                    ),
//                  ),
//                  SizedBox(
//                    height: 20.0,
//                  ),
//                  Container(
//                    width: _width * 0.9,
//                    color: Colors.white,
//                    child: Padding(
//                      padding: const EdgeInsets.all(10.0),
//                      child: Image.asset(
//                        "./images/block_three.png",
//                        fit: BoxFit.fitWidth,
//                      ),
//                    ),
//                  )
//                ],
//              ),
//            ),
//          ),
        ],
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
}
