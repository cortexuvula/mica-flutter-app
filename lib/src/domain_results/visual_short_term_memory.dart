import 'package:flutter/material.dart';

class VisualShortTermMemory extends StatefulWidget {
  int shorttermMemoryVisualImage1;
  int shorttermMemoryVisualImage2;
  int shorttermMemoryVisualImage3;

  VisualShortTermMemory({
    Key key,
    this.shorttermMemoryVisualImage1,
    this.shorttermMemoryVisualImage2,
    this.shorttermMemoryVisualImage3,
  }) : super(key: key);

  @override
  _VisualShortTermMemoryState createState() => _VisualShortTermMemoryState();
}

class _VisualShortTermMemoryState extends State<VisualShortTermMemory> {
  String result = "Normal";
  Color resultColor;

  @override
  void initState() {
    super.initState();
    combineScores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            "Visual Short-Term Memory",
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
            color: resultColor,
            elevation: 10.0,
            child: ListTile(
              title: Text(
                "Short-Term Memory Visual: Line Drawing Recall",
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

  combineScores() {
    int score1 = 3 - widget.shorttermMemoryVisualImage1;
    int score2 = 3 - widget.shorttermMemoryVisualImage2;
    int score3 = 3 - widget.shorttermMemoryVisualImage3;

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
