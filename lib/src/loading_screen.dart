import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;

import 'package:mica/src/home.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
          child: Column(

            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Hero(
                tag: "logo",
                child: FlutterLogo(
                  size: 200.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: _width * 0.9,
                child: Card(
                  elevation: 10.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(appData.disclaimer2),
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
                        var router = new MaterialPageRoute(
                            builder: (BuildContext context) =>
                            new Home(
                              viewedDisclaimer: false,
                            ));
                        Navigator.of(context)
                            .pushAndRemoveUntil(
                            router, (Route<dynamic> route) => false);

                      },

                      child: Text("Accept Disclaimer"),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor);
  }

//  @override
//  void afterFirstLayout(BuildContext context) async {
//
//    await Future.delayed(Duration(seconds: 2));
//    var router = new MaterialPageRoute(
//        builder: (BuildContext context) => new Home(
//              viewedDisclaimer: false,
//            ));
//    Navigator.of(context)
//        .pushAndRemoveUntil(router, (Route<dynamic> route) => false);
//  }
}
