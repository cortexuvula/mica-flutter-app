import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/resource_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dart_ping/dart_ping.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  bool viewedDisclaimer;

  Home({Key key, this.viewedDisclaimer}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {




  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              appData.appName,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0),
              textAlign: TextAlign.start,
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () => debugPrint("info")),
          ],
        ),
        body: ListView(
          children: <Widget>[

            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  width: _width * 0.9,
                  child: Card(
                    elevation: 10.0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(appData.appDescription,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14.0,
                              color: Colors.black)),
                    ),
                  ),
                ),
                Container(
                  width: _width * 0.9,
                  child: Card(
                    elevation: 10.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Card(
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
                                    appData.fullTestText,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14.0,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Card(
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
                                    appData.startTesting,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14.0,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          RaisedButton(
                            elevation: 10.0,
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, "/patient_information");
                            },
                            child: Text(appData.fullTestButton),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: _width * 0.9,
                  child: Card(
                    elevation: 10.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: RaisedButton(
                        elevation: 10.0,
                        onPressed: () async {
                          print("PDF tapped");
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => PDFScreen()));
                          _launchURL();
                        },
                        child: Text(appData.resourceButtonBooklet),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: _width * 0.9,
                  child: Card(
                    elevation: 10.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: RaisedButton(
                        elevation: 10.0,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResourcePage()));
                        },
                        child: Text(appData.resourceButtonVideo),
                      ),
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    const url =
        'http://neoncortex.net/wp-content/mca/bca.pdf';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    saveInitialData();
  }

  void saveInitialData () async {
//    String patientName;
//    String assessorName;
//    String handedness;
//    DateTime assessmentDate;
//    int languageComprehensionRadioValue;
//    int trialOneScore;
//    int trialTwoScore;
//    int trialThreeScore;
//    int visuospatialPraxisImage1;
//    int visuospatialPraxisImage2;
//    int visuospatialPraxisImage3;
//    int attention;
//    int executiveAnimalNaming;
//    int executiveLuria;
//    int executiveSerial;
//    int shorttermMemoryVerbal;
//    int praxisRight;
//    int praxisLeft;
//    int tenWordDelay;
//    int scoreVerbalRecognitionMemoryTenWords;
//    int scoreVerbalRecognitionMemoryTenWordsInList;
//    int scoreVerbalRecognitionMemoryTenWordsNotInList;
//    int shorttermMemoryVisualImage1;
//    int shorttermMemoryVisualImage2;
//    int shorttermMemoryVisualImage3;
//    int anomiaAgnosia;
//    int executive;
//    int spokenLanguage;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // screen 1
    prefs.setInt("languageComprehensionRadioValue", 0);

    //screen 2
    prefs.setInt("trialOneScore", 0);
    List<String> word1ButtonColor = [];
    for (var i = 0; i < 10; i++) {
      word1ButtonColor.add("yellow");
    }
    prefs.setStringList("trial1wordButtonColor", word1ButtonColor);

    //screen 3
    prefs.setInt("trialTwoScore", 0);
    List<String> word2ButtonColor = [];
    for (var i = 0; i < 10; i++) {
      word2ButtonColor.add("yellow");
    }
    prefs.setStringList("trial2wordButtonColor", word2ButtonColor);

    //screen 4
    prefs.setInt("trialThreeScore", 0);
    List<String> word3ButtonColor = [];
    for (var i = 0; i < 10; i++) {
      word3ButtonColor.add("yellow");
    }
    prefs.setStringList("trial3wordButtonColor", word3ButtonColor);
  }
}
