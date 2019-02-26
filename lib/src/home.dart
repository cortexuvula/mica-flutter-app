import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'pdf_screen.dart';

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
            SizedBox(
              height: 25.0,
            ),
            Hero(
              tag: "logo",
              child: FlutterLogo(
                size: 50.0,
              ),
            ),
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PDFScreen()));
                        },
                        child: Text(appData.bookletButton),
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
}
