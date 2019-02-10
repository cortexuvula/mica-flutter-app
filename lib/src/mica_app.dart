import 'package:flutter/material.dart';
import 'package:mica/src/home.dart';

class MicaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Midlands Cognitive Assessment",
      home: new Home(),
    );
  }
}
