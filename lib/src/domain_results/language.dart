import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  final int spokenLanguage;
  final int comprehension;
  final int drawLine;

  const Language(
      {super.key,
      required this.spokenLanguage,
      required this.comprehension,
      required this.drawLine});

  @override
  LanguageState createState() => LanguageState();
}

class LanguageState extends State<Language> {
  late Color cardColorSpokenLanguage;
  late String resultSpokenLanguage;

  late Color cardColorDrawLine;
  late String resultDrawLine;

  late Color cardColorComprehension;
  late String resultComprehension;

  @override
  void initState() {
    super.initState();
    radio3ButtonValueToStringSpokenLanguage(widget.spokenLanguage);
    radio3ButtonValueToStringComprehension(widget.comprehension);
    radio3ButtonValueToStringDrawLine(widget.drawLine);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ListTile(
          title: Text(
            "Language",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.start,
          ),
          subtitle: Text(
            "",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          // Card(
          //   color: cardColorComprehension,
          //   elevation: 10.0,
          //   child: ListTile(
          //     title: const Text(
          //       "Comprehension",
          //       style: TextStyle(
          //         color: Colors.black,
          //         fontWeight: FontWeight.w500,
          //       ),
          //     ),
          //     trailing: Text(
          //       resultComprehension,
          //       style: const TextStyle(
          //         color: Colors.black,
          //         fontWeight: FontWeight.w500,
          //       ),
          //     ),
          //   ),
          // ),
          Card(
            color: cardColorSpokenLanguage,
            elevation: 10.0,
            child: ListTile(
              title: const Text(
                "Naming Line Drawings",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                resultDrawLine,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Card(
            color: cardColorDrawLine,
            elevation: 10.0,
            child: ListTile(
              title: const Text(
                "Spoken Language",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                resultSpokenLanguage,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void radio3ButtonValueToStringSpokenLanguage(int value) {
    switch (value) {
      case 0:
        {
          setState(() {
            cardColorSpokenLanguage = Colors.green;
            resultSpokenLanguage = "Normal";
          });
          break;
        }
      case 1:
        {
          setState(() {
            cardColorSpokenLanguage = Colors.yellow;
            resultSpokenLanguage = "Equivocal";
          });
          break;
        }
      case 2:
        {
          setState(() {
            cardColorSpokenLanguage = Colors.red;
            resultSpokenLanguage = "Impaired";
          });
          break;
        }
    }
  }

  void radio3ButtonValueToStringComprehension(int value) {
    switch (value) {
      case 0:
        {
          setState(() {
            cardColorComprehension = Colors.green;
            resultComprehension = "Normal";
          });
          break;
        }
      case 1:
        {
          setState(() {
            cardColorComprehension = Colors.yellow;
            resultComprehension = "Equivocal";
          });
          break;
        }
      case 2:
        {
          setState(() {
            cardColorComprehension = Colors.red;
            resultComprehension = "Impaired";
          });
          break;
        }
    }
  }

  void radio3ButtonValueToStringDrawLine(int value) {
    switch (value) {
      case 0:
        {
          setState(() {
            cardColorDrawLine = Colors.green;
            resultDrawLine = "Normal";
          });
          break;
        }
      case 1:
        {
          setState(() {
            cardColorDrawLine = Colors.yellow;
            resultDrawLine = "Equivocal";
          });
          break;
        }
      case 2:
        {
          setState(() {
            cardColorDrawLine = Colors.red;
            resultDrawLine = "Impaired";
          });
          break;
        }
    }
  }
}
