import 'package:flutter/material.dart';

class AttentionConcentration extends StatefulWidget {
  final int attention;

  const AttentionConcentration({
    super.key, 
    required this.attention
  });

  @override
  _AttentionConcentrationState createState() => _AttentionConcentrationState();
}

class _AttentionConcentrationState extends State<AttentionConcentration> {
  late Color cardColor;
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
          title: const Text(
            "Attention & Concentration",
            overflow: TextOverflow.ellipsis,
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
            color: cardColor,
            elevation: 10.0,
            child: ListTile(
              title: const Text(
                "Vigilance Test",
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

  void radio3ButtonValueToString(int value) {
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
