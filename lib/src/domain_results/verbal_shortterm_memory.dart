import 'package:flutter/material.dart';


class VerbalShortTermMemory extends StatefulWidget {


  int trialTwoScore;
  int trialThreeScore;
  int orientation;
  int tenWordDelay;
  int scoreVerbalRecognitionMemoryTenWords;

  VerbalShortTermMemory({Key key,
    this.trialTwoScore,
    this.trialThreeScore,
    this.orientation,
    this.tenWordDelay,
    this.scoreVerbalRecognitionMemoryTenWords
  }) : super(key: key);

  @override
  _VerbalShortTermMemoryState createState() => _VerbalShortTermMemoryState();
}

class _VerbalShortTermMemoryState extends State<VerbalShortTermMemory> {

  String resultTrial3 = "normal";
  Color resultTrial3Color;

  String resultTrial2 = "normal";
  Color resultTrial2Color;

  String resultOrientation = "normal";
  Color resultOrientationColor;

  String resultDelay = "normal";
  Color resultDelayColor;

  String resultRecon = "normal";
  Color resultReconColor;


  @override
  void initState() {
    super.initState();
    valueTrial2ResultToString(widget.trialTwoScore);
    valueTrial3ResultToString(widget.trialThreeScore);
    valueOrientationResultToString(widget.orientation);
    valueRecallResultToString(widget.tenWordDelay);
    valueRecogResultToString(widget.scoreVerbalRecognitionMemoryTenWords);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            "Verbal Short-Term Memory",
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
            color: resultTrial2Color,
            elevation: 10.0,
            child: ListTile(
              title: Text("Short-term Memory Verbal Trial 2",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
              trailing: Text(resultTrial2,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ),
          Card(
            color: resultTrial3Color,
            elevation: 10.0,
            child: ListTile(
              title: Text("Short-term Memory Verbal Trial 3",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
              trailing: Text(resultTrial3,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ),
          Card(
            color: resultOrientationColor,
            elevation: 10.0,
            child: ListTile(
              title: Text("Orientation",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
              trailing: Text(resultOrientation,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ),
          Card(
            color: resultDelayColor,
            elevation: 10.0,
            child: ListTile(
              title: Text("Short-Term Memory Verbal: Delayed Recall Of 10 Words",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
              trailing: Text(resultDelay,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ),
          Card(
            color: resultReconColor,
            elevation: 10.0,
            child: ListTile(
              title: Text("Short-Term Memory Verbal Recognition: Total Score",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
              trailing: Text(resultRecon,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ),
        ],
      ),
    );
  }

  String valueTrial2ResultToString(int _valueTotal) {
    switch (_valueTotal > 6) {
      case true: {
        setState(() {
          resultTrial2 = "Normal";
          resultTrial2Color = Colors.green;
        });
        break;
      }
      case false: {
        if (_valueTotal < 5) {
          setState(() {
            resultTrial2 = "Impaired";
            resultTrial2Color = Colors.red;
          });
          break;
        }
        setState(() {
          resultTrial2 = "Equivocal";
          resultTrial2Color = Colors.yellow;
        });
        break;
      }

    }
  }

  String valueTrial3ResultToString(int _valueTotal) {
    switch (_valueTotal > 7) {
      case true: {
        setState(() {
          resultTrial3 = "Normal";
          resultTrial3Color = Colors.green;
        });
        break;
      }
      case false: {
        if (_valueTotal < 5) {
          setState(() {
            resultTrial3 = "Impaired";
            resultTrial3Color = Colors.red;
          });
          break;
        }
        setState(() {
          resultTrial3 = "Equivocal";
          resultTrial3Color = Colors.yellow;
        });
        break;
      }

    }
  }

  String valueOrientationResultToString(int _valueTotal) {
    switch (_valueTotal > 4) {
      case true: {
        setState(() {
          resultOrientation = "Normal";
          resultOrientationColor = Colors.green;
        });
        break;
      }
      case false: {
        if (_valueTotal < 4) {
          setState(() {
            resultOrientation = "Impaired";
            resultOrientationColor = Colors.red;
          });
          break;
        }
        setState(() {
          resultOrientation = "Equivocal";
          resultOrientationColor = Colors.yellow;
        });
        break;
      }

    }
  }

  String valueRecallResultToString(int _valueTotal) {
    switch (_valueTotal > 5) {
      case true: {
        setState(() {
          resultDelay = "Normal";
          resultDelayColor = Colors.green;
        });
        break;
      }
      case false: {
        if (_valueTotal < 5) {
          setState(() {
            resultDelay = "Impaired";
            resultDelayColor = Colors.red;
          });
          break;
        }
        setState(() {
          resultDelay = "Equivocal";
          resultDelayColor = Colors.yellow;
        });
        break;
      }

    }
  }
  String valueRecogResultToString(int _valueTotal) {
    switch (_valueTotal > 5) {
      case true: {
        setState(() {
          resultRecon = "Normal";
          resultReconColor = Colors.green;
        });
        break;
      }
      case false: {
        if (_valueTotal < 5) {
          setState(() {
            resultRecon = "Impaired";
            resultReconColor = Colors.red;
          });
          break;
        }
        setState(() {
          resultRecon = "Equivocal";
          resultReconColor = Colors.yellow;
        });
        break;
      }

    }
  }
}
