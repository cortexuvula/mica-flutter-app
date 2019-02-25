import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  bool viewedDisclaimer;

  Home({Key key, this.viewedDisclaimer}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AfterLayoutMixin<Home> {

  String pathPDF = "";


  Future<File> createFileOfPdfUrl() async {
    final url = "https://firebasestorage.googleapis.com/v0/b/verbal-memory-assessment.appspot.com/o/BCA.pdf?alt=media&token=bdec08ab-deca-492c-8553-0139ee5fc6f6";
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }


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

                          Navigator.push(context, MaterialPageRoute(builder: (context) => PDFScreen(pathPDF)));
                        },
//                        onPressed: () => 
//                            Navigator.push(context, MaterialPageRoute(builder: (context) => PDFScreen(pathPDF)),
//                        ),
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

  @override
  void afterFirstLayout(BuildContext context) async {
    createFileOfPdfUrl().then((f) {
      setState(() {
        pathPDF = f.path;
        print(pathPDF);
      });
    });
    if (!widget.viewedDisclaimer) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                //backgroundColor: Colors.white,
                title: Text(
                  "Disclaimer",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                content: Text(appData.disclaimer2),
                actions: <Widget>[
                  FlatButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "I Agree",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            );
          });
    }
  }
}

class PDFScreen extends StatelessWidget {
  String pathPDF = "";
  PDFScreen(this.pathPDF);


  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text("Bedside Cognitive Assessement"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        path: pathPDF);
  }
}