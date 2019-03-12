import 'package:flutter/material.dart';


class Praxis extends StatefulWidget {


  int praxisRight;
  int praxisLeft;
  int visuospatialPraxisImage1;
  int visuospatialPraxisImage2;
  int visuospatialPraxisImage3;

  Praxis({Key key,
    this.praxisRight,
    this.praxisLeft,
    this.visuospatialPraxisImage1,
    this.visuospatialPraxisImage2,
    this.visuospatialPraxisImage3
  }) : super(key: key);

  @override
  _PraxisState createState() => _PraxisState();
}

class _PraxisState extends State<Praxis> {

  Color cardColorPraxisRight;
  String resultPraxisRight = "";

  Color cardColorPraxisLeft;
  String resultPraxisLeft = "";

  String result = "Normal";
  Color resultColor;

  @override
  void initState() {
    super.initState();

    radio3ButtonValueToStringPraxisRight(widget.praxisRight);
    radio3ButtonValueToStringPraxisLeft(widget.praxisLeft);
    combineScores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            "Praxis",
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
            color: cardColorPraxisRight,
            elevation: 10.0,
            child: ListTile(
              title: Text("Praxis: Finger-hand Dexterity: Right",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
              trailing: Text(resultPraxisRight,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ),
          Card(
            color: cardColorPraxisLeft,
            elevation: 10.0,
            child: ListTile(
              title: Text("Praxis: Finger-hand Dexterity: Left",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
              trailing: Text(resultPraxisLeft,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ),
          Card(
            color: resultColor,
            elevation: 10.0,
            child: ListTile(
              title: Text("Visuospatial & Praxis: Line Drawing Copy",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
              trailing: Text(result,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ),

        ],
      ),
    );
  }

  radio3ButtonValueToStringPraxisRight (int value) {
    switch (value) {
      case 0: {
        setState(() {
          cardColorPraxisRight = Colors.green;
          resultPraxisRight = "Normal";
        });
        break;
      }
      case 1: {
        setState(() {
          cardColorPraxisRight = Colors.yellow;
          resultPraxisRight = "Equivocal";
        });
        break;
      }
      case 2: {
        setState(() {
          cardColorPraxisRight = Colors.red;
          resultPraxisRight = "Impaired";
        });
        break;
      }
    }
  }

  radio3ButtonValueToStringPraxisLeft (int value) {
    switch (value) {
      case 0: {
        setState(() {
          cardColorPraxisLeft = Colors.green;
          resultPraxisLeft = "Normal";
        });
        break;
      }
      case 1: {
        setState(() {
          cardColorPraxisLeft = Colors.yellow;
          resultPraxisLeft = "Equivocal";
        });
        break;
      }
      case 2: {
        setState(() {
          cardColorPraxisLeft = Colors.red;
          resultPraxisLeft = "Impaired";
        });
        break;
      }
    }
  }

  combineScores () {
    int score1 = 3 - widget.visuospatialPraxisImage1;
    int score2 = 3 - widget.visuospatialPraxisImage2;
    int score3 = 3 - widget.visuospatialPraxisImage3;

    int _combineScore = score1 + score2 + score3;

    if (_combineScore > 5) {
      setState(() {
        resultColor = Colors.green;
        result = "Normal";
      });
    } else if (_combineScore < 5) {
      setState(() {
        resultColor = Colors.red;
        result = "Impaired";
      });
    } else {
      setState(() {
        resultColor = Colors.yellow;
        result = "Equivocal";
      });
    }
  }
}
