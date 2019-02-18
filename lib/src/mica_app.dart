import 'package:flutter/material.dart';
import 'package:mica/src/loading_screen.dart';
import 'package:mica/src/patient_information.dart';

class MicaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Midlands Cognitive Assessment",
      home: new LoadingScreen(),
      theme: ThemeData(
          primaryColor: Color(0xFF64638f),
          accentColor: Color(0xFF9795cf),
          splashColor: Color(0xFFaba9e9),
          backgroundColor: Color(0xFFaba9e9),
          scaffoldBackgroundColor: Color(0xFFcbc9ff),
          //ecf4f3
          buttonColor: Color(0xFF9795cf),
          dialogBackgroundColor: Color(0xFFcbc9ff),
          cardColor: Colors.white),
      routes: <String, WidgetBuilder> {
        '/patient_information': (BuildContext context) => PatientInformation(),

      },
    );
  }
}
