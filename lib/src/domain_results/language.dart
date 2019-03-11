import 'package:flutter/material.dart';


class Language extends StatefulWidget {


  int spokenLanguage;
  int comprehension;
  int drawLine;

  Language({Key key,
    this.spokenLanguage,
    this.comprehension,
    this.drawLine
  }) : super(key: key);

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {

  Color cardColorSpokenLanguage;
  String resultSpokenLanguage = "";

  Color cardColorDrawLine;
  String resultDrawLine = "";

  Color cardColorComprehension;
  String resultComprehension = "";

  @override
  void initState() {
    super.initState();
    print(("${widget.spokenLanguage}"));
    radio3ButtonValueToStringSpokenLanguage(widget.spokenLanguage);
    radio3ButtonValueToStringComprehension(widget.comprehension);
    radio3ButtonValueToStringDrawLine(widget.drawLine);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
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
          Card(
            color: cardColorComprehension,
            elevation: 10.0,
            child: ListTile(
              title: Text("Comprehension",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
              trailing: Text(resultComprehension,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ),
          Card(
            color: cardColorSpokenLanguage,
            elevation: 10.0,
            child: ListTile(
              title: Text("Naming Line Drawings",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
              trailing: Text(resultDrawLine,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ),
          Card(
            color: cardColorDrawLine,
            elevation: 10.0,
            child: ListTile(
              title: Text("Spoken Language",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
              trailing: Text(resultSpokenLanguage,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            ),
          )
        ],
      ),
    );
  }

  radio3ButtonValueToStringSpokenLanguage (int value) {
    switch (value) {
      case 0: {
        setState(() {
          cardColorSpokenLanguage = Colors.green;
          resultSpokenLanguage = "Normal";
        });
        break;
      }
      case 1: {
        setState(() {
          cardColorSpokenLanguage = Colors.yellow;
          resultSpokenLanguage = "Equivocal";
        });
        break;
      }
      case 2: {
        setState(() {
          cardColorSpokenLanguage = Colors.red;
          resultSpokenLanguage = "Impaired";
        });
        break;
      }
    }
  }

  radio3ButtonValueToStringComprehension (int value) {
    switch (value) {
      case 0: {
        setState(() {
          cardColorComprehension = Colors.green;
          resultComprehension = "Normal";
        });
        break;
      }
      case 1: {
        setState(() {
          cardColorComprehension = Colors.yellow;
          resultComprehension = "Equivocal";
        });
        break;
      }
      case 2: {
        setState(() {
          cardColorComprehension = Colors.red;
          resultComprehension = "Impaired";
        });
        break;
      }
    }
  }

  radio3ButtonValueToStringDrawLine (int value) {
    switch (value) {
      case 0: {
        setState(() {
          cardColorDrawLine = Colors.green;
          resultDrawLine = "Normal";
        });
        break;
      }
      case 1: {
        setState(() {
          cardColorDrawLine = Colors.yellow;
          resultDrawLine = "Equivocal";
        });
        break;
      }
      case 2: {
        setState(() {
          cardColorDrawLine = Colors.red;
          resultDrawLine = "Impaired";
        });
        break;
      }
    }
  }
}
