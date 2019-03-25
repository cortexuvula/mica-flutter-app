import 'package:flutter/material.dart';

class Gnosis extends StatefulWidget {
  int visuospatialPraxisImage1;
  int visuospatialPraxisImage2;
  int visuospatialPraxisImage3;
  int anomiaAgnosia;

  Gnosis(
      {Key key,
      this.visuospatialPraxisImage1,
      this.visuospatialPraxisImage2,
      this.visuospatialPraxisImage3,
      this.anomiaAgnosia})
      : super(key: key);

  @override
  _GnosisState createState() => _GnosisState();
}

class _GnosisState extends State<Gnosis> {
  String result = "Normal";
  Color resultColor;

  Color cardColorAgnosia;
  String resultAgnosia = "";

  @override
  void initState() {
    super.initState();

    radio3ButtonValueToStringAgnosia(widget.anomiaAgnosia);
    combineScores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            "Gnosis",
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
            color: cardColorAgnosia,
            elevation: 10.0,
            child: ListTile(
              title: Text(
                "Agnosia: Recognition of Line Drawings",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                resultAgnosia,
                style: TextStyle(
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
              title: Text(
                "Visuospatial & Praxis: Line Drawing Copy",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                result,
                style: TextStyle(
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

  radio3ButtonValueToStringAgnosia(int value) {
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

  combineScores() {
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
