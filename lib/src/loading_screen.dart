import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/animated_wave.dart';
import 'package:mica/src/welcome.dart';
import 'package:simple_animations/simple_animations.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    final tween = MultiTrackTween([
      Track("color1").add(Duration(seconds: 3),
          ColorTween(begin: Colors.deepPurple.shade50, end: Color(0xFFaba9e9))),
      Track("color2").add(Duration(seconds: 3),
          ColorTween(begin: Color(0xFFaba9e9), end: Colors.deepPurple.shade50))
    ]);
    return Scaffold(
        body: Stack(children: <Widget>[
          ControlledAnimation(
            playback: Playback.MIRROR,
            tween: tween,
            duration: tween.duration,
            builder: (context, animation) {
              return Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [animation["color1"], animation["color2"]])),
              );
            },
          ),
          //Positioned.fill(child: AnimatedBackground()),
          onBottom(AnimatedWave(
            height: 180,
            speed: 1.0,
          )),
          onBottom(AnimatedWave(
            height: 120,
            speed: 0.9,
            offset: pi,
          )),
          onBottom(AnimatedWave(
            height: 220,
            speed: 1.2,
            offset: pi / 2,
          )),
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Hero(
                    tag: "logo",
                    child: Image.asset(
                      "./images/logo512.png",
                      height: 200.0,
                      width: 200.0,
                    )),
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
                              builder: (BuildContext context) => new Welcome());
                          Navigator.of(context).pushAndRemoveUntil(
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
        ]),
        backgroundColor: Theme.of(context).backgroundColor);
  }

  onBottom(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );
}
