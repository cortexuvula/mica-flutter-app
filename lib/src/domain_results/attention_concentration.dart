import 'package:flutter/material.dart';

class AttentionConcentration extends StatefulWidget {
  int attention;

  AttentionConcentration({Key key, this.attention}) : super(key: key);

  @override
  _AttentionConcentrationState createState() => _AttentionConcentrationState();
}

class _AttentionConcentrationState extends State<AttentionConcentration> {
  Color cardColor;
  String result = "";

  @override
  void initState() {
    super.initState();
    radio3ButtonValueToString(widget.attention);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            "Attention & Concentration",
            overflow: TextOverflow.ellipsis,
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
            color: cardColor,
            elevation: 10.0,
            child: ListTile(
              title: Text(
                "Vigilance Test",
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

  radio3ButtonValueToString(int value) {
    switch (value) {
      case 0:
        {
          setState(() {
            cardColor = Colors.green;
            result = "Normal";
          });
          break;
        }
      case 1:
        {
          setState(() {
            cardColor = Colors.yellow;
            result = "Equivocal";
          });
          break;
        }
      case 2:
        {
          setState(() {
            cardColor = Colors.red;
            result = "Impaired";
          });
          break;
        }
    }
  }
}
