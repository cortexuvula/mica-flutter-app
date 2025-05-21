import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/animated_wave.dart';
import 'package:mica/src/welcome.dart';
import 'package:simple_animations/simple_animations.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    final movie = MovieTween()
      ..scene(
        begin: Duration.zero,
        duration: const Duration(seconds: 3),
      ).tween(
          'color1',
          ColorTween(
              begin: Colors.deepPurple.shade50, end: const Color(0xFFaba9e9)))
      ..scene(
        begin: Duration.zero,
        duration: const Duration(seconds: 3),
      ).tween(
          'color2',
          ColorTween(
              begin: const Color(0xFFaba9e9), end: Colors.deepPurple.shade50));

    return Scaffold(
        body: Stack(children: <Widget>[
          CustomAnimationBuilder<Movie>(
            tween: movie,
            duration: const Duration(seconds: 3),
            builder: (context, value, child) {
              return Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [value.get('color1'), value.get('color2')])),
              );
            },
          ),
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
                const SizedBox(
                  height: 50.0,
                ),
                Hero(
                    tag: "logo",
                    child: Image.asset(
                      "./images/logo512.png",
                      height: 200.0,
                      width: 200.0,
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: width * 0.9,
                  child: Card(
                    elevation: 10.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(app_data.disclaimer2),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.9,
                  child: Card(
                    elevation: 10.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10.0,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                        ),
                        onPressed: () {
                          var router = MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const Welcome());
                          Navigator.of(context).pushAndRemoveUntil(
                              router, (Route<dynamic> route) => false);
                        },
                        child: const Text(
                          "Accept Disclaimer",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
        backgroundColor: Theme.of(context).colorScheme.surface);
  }

  Widget onBottom(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );
}
