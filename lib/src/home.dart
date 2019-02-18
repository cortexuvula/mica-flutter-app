import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:mica/resources/const_data.dart' as appData;

class Home extends StatefulWidget {
  bool viewedDisclaimer;

  Home({Key key, this.viewedDisclaimer}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AfterLayoutMixin<Home> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(appData.appName),
          centerTitle: true,
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
                  width: width * 0.9,
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
                  width: width * 0.9,
                  child: Card(
                    elevation: 10.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          RaisedButton(
                            elevation: 10.0,
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, "/patient_information");
                            },
                            child: Text(appData.fullTestButton),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            appData.fullTestText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14.0,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: width * 0.9,
                  child: Card(
                    elevation: 10.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: RaisedButton(
                        elevation: 10.0,
                        onPressed: () => debugPrint("Clicked pdf button"),
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
    if (!widget.viewedDisclaimer) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                backgroundColor: Colors.white,
                title: Text(
                  "Disclaimer",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                content: Text(appData.disclaimer),
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
