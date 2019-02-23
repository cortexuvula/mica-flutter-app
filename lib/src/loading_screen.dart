import 'dart:async';

import 'package:flutter/material.dart';

import 'package:after_layout/after_layout.dart';
import 'package:mica/src/home.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with AfterLayoutMixin<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Hero(
//                tag: "logo",
//                child: FlutterLogo(
//                  size: 200.0,
//                ),
//              )
//            ],
//          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor);
  }

  @override
  void afterFirstLayout(BuildContext context) async {
//    Timer _timer = new Timer(const Duration(seconds: 2), () {
//      Navigator.of(context).pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
//    });
    await Future.delayed(Duration(seconds: 2));
    var router = new MaterialPageRoute(
        builder: (BuildContext context) => new Home(
              viewedDisclaimer: false,
            ));
    Navigator.of(context)
        .pushAndRemoveUntil(router, (Route<dynamic> route) => false);
//    Navigator.of(context).pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
  }
}
