import 'package:flutter/material.dart';

class VerbalWorkingMemory extends StatefulWidget {
  int trialOneScore;

  VerbalWorkingMemory({Key key, this.trialOneScore}) : super(key: key);

  @override
  _VerbalWorkingMemoryState createState() => _VerbalWorkingMemoryState();
}

class _VerbalWorkingMemoryState extends State<VerbalWorkingMemory> {
  Color resultColor;
  String result = "Normal";

  @override
  void initState() {
    super.initState();
    valueTrial12ResultToString(widget.trialOneScore);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            "Verbal Working Memory",
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
                "Working Memory Verbal Trial 1",
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

  String valueTrial12ResultToString(int _valueTotal) {
    switch (_valueTotal > 6) {
      case true:
        {
          setState(() {
            result = "Normal";
            resultColor = Colors.green;
          });
          break;
        }
      case false:
        {
          if (_valueTotal < 5) {
            setState(() {
              result = "Impaired";
              resultColor = Colors.red;
            });
            break;
          }
          setState(() {
            result = "Equivocal";
            resultColor = Colors.yellow;
          });
          break;
        }
    }
  }
}
