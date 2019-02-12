import 'dart:async';


import 'package:flutter/material.dart';

import 'package:after_layout/after_layout.dart';
import 'package:mica/src/home.dart';




class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with AfterLayoutMixin<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
//          Image.asset("images/neon_brain_android.png", height: 200.0, width: 200.0,),
//          Padding(
//            padding: const EdgeInsets.all(16.0),
//            child: Text(appData.appName, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),),
//          ),
//          Padding(
//              padding: const EdgeInsets.all(32.0),
//              child: SpinKitWave(
//                color: Theme.of(context).primaryColor,
//                size: 50.0,
//                type: SpinKitWaveType.center,
//              )),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor
    );
  }

  @override
  void afterFirstLayout(BuildContext context) async {
//    Timer _timer = new Timer(const Duration(seconds: 2), () {
//      Navigator.of(context).pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
//    });
    await Future.delayed(Duration(seconds: 2));
    var router = new MaterialPageRoute(builder: (BuildContext context) => new Home(viewedDisclaimer: false,));
    Navigator.of(context).pushAndRemoveUntil(
        router, (Route<dynamic> route) => false);
//    Navigator.of(context).pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
  }
}
