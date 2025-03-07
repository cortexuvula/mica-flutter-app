import 'package:flutter/material.dart';

class Gnosis extends StatefulWidget {
  final int visuospatialPraxisImage1;
  final int visuospatialPraxisImage2;
  final int visuospatialPraxisImage3;
  final int anomiaAgnosia;

  const Gnosis({
    super.key,
    required this.visuospatialPraxisImage1,
    required this.visuospatialPraxisImage2,
    required this.visuospatialPraxisImage3,
    required this.anomiaAgnosia,
  });

  @override
  State<Gnosis> createState() => _GnosisState();
}

class _GnosisState extends State<Gnosis> {
  late String result;
  late Color resultColor;

  late Color cardColorAgnosia;
  late String resultAgnosia;

  @override
  void initState() {
    super.initState();
    result = "Normal";
    resultAgnosia = "";

    radio3ButtonValueToStringAgnosia(widget.anomiaAgnosia);
    combineScores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: const Text(
            "Gnosis",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.start,
          ),
          subtitle: const Text(
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
            color: cardColorAgnosia,
            elevation: 10.0,
            child: ListTile(
              title: const Text(
                "Agnosia: Recognition of Line Drawings",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                resultAgnosia,
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
          )
        ],
      ),
    );
  }

  void radio3ButtonValueToStringAgnosia(int value) {
    switch (value) {
      case 0:
        {
          setState(() {
            cardColorAgnosia = Colors.green;
            resultAgnosia = "Normal";
          });
          break;
        }
      case 1:
        {
          setState(() {
            cardColorAgnosia = Colors.yellow;
            resultAgnosia = "Equivocal";
          });
          break;
        }
      case 2:
        {
          setState(() {
            cardColorAgnosia = Colors.red;
            resultAgnosia = "Impaired";
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
