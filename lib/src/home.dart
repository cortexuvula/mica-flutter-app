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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Container(
            child: Text("Midland Cognitive Assessment"),
          ),
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
                title: Text(
                  "Disclaimer",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                content: Text(appData.disclaimer),
                actions: <Widget>[
                  FlatButton(
                      color: Colors.white,
                      textColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () {

                        Navigator.of(context).pop();
                      },
                      child: Text("I Agree")),
                ],
              ),
            );
          });
    }
  }
}
