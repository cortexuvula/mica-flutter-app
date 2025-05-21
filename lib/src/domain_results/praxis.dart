import 'package:flutter/material.dart';

class Praxis extends StatefulWidget {
  final int praxisRight;
  final int praxisLeft;
  final int visuospatialPraxisImage1;
  final int visuospatialPraxisImage2;
  final int visuospatialPraxisImage3;

  const Praxis({
    super.key,
    required this.praxisRight,
    required this.praxisLeft,
    required this.visuospatialPraxisImage1,
    required this.visuospatialPraxisImage2,
    required this.visuospatialPraxisImage3,
  });

  @override
  PraxisState createState() => PraxisState();
}

class PraxisState extends State<Praxis> {
  late Color cardColorPraxisRight;
  late String resultPraxisRight;

  late Color cardColorPraxisLeft;
  late String resultPraxisLeft;

  late String result;
  late Color resultColor;

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
        title: const ListTile(
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
              title: const Text(
                "Praxis: Finger-hand Dexterity: Right",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                resultPraxisRight,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Card(
            color: cardColorPraxisLeft,
            elevation: 10.0,
            child: ListTile(
              title: const Text(
                "Praxis: Finger-hand Dexterity: Left",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                resultPraxisLeft,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Card(
            color: resultColor,
            elevation: 10.0,
            child: ListTile(
              title: const Text(
                "Visuospatial & Praxis: Line Drawing Copy",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                result,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void radio3ButtonValueToStringPraxisRight(int value) {
    switch (value) {
      case 0:
        {
          setState(() {
            cardColorPraxisRight = Colors.green;
            resultPraxisRight = "Normal";
          });
          break;
        }
      case 1:
        {
          setState(() {
            cardColorPraxisRight = Colors.yellow;
            resultPraxisRight = "Equivocal";
          });
          break;
        }
      case 2:
        {
          setState(() {
            cardColorPraxisRight = Colors.red;
            resultPraxisRight = "Impaired";
          });
          break;
        }
    }
  }

  void radio3ButtonValueToStringPraxisLeft(int value) {
    switch (value) {
      case 0:
        {
          setState(() {
            cardColorPraxisLeft = Colors.green;
            resultPraxisLeft = "Normal";
          });
          break;
        }
      case 1:
        {
          setState(() {
            cardColorPraxisLeft = Colors.yellow;
            resultPraxisLeft = "Equivocal";
          });
          break;
        }
      case 2:
        {
          setState(() {
            cardColorPraxisLeft = Colors.red;
            resultPraxisLeft = "Impaired";
          });
          break;
        }
    }
  }

  void combineScores() {
    int score1 = 3 - widget.visuospatialPraxisImage1;
    int score2 = 3 - widget.visuospatialPraxisImage2;
    int score3 = 3 - widget.visuospatialPraxisImage3;

    int combineScore = score1 + score2 + score3;

    if (combineScore > 5) {
      setState(() {
        resultColor = Colors.green;
        result = "Normal";
      });
    } else if (combineScore < 5) {
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
