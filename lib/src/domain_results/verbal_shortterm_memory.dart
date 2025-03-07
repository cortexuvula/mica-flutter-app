import 'package:flutter/material.dart';

class VerbalShortTermMemory extends StatefulWidget {
  final int trialTwoScore;
  final int trialThreeScore;
  final int orientation;
  final int tenWordDelay;
  final int scoreVerbalRecognitionMemoryTenWords;

  const VerbalShortTermMemory({
    super.key,
    required this.trialTwoScore,
    required this.trialThreeScore,
    required this.orientation,
    required this.tenWordDelay,
    required this.scoreVerbalRecognitionMemoryTenWords,
  });

  @override
  _VerbalShortTermMemoryState createState() => _VerbalShortTermMemoryState();
}

class _VerbalShortTermMemoryState extends State<VerbalShortTermMemory> {
  late String resultTrial3;
  late Color resultTrial3Color;

  late String resultTrial2;
  late Color resultTrial2Color;

  late String resultOrientation;
  late Color resultOrientationColor;

  late String resultDelay;
  late Color resultDelayColor;

  late String resultRecon;
  late Color resultReconColor;

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
          title: const Text(
            "Verbal Short-Term Memory",
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
            color: resultTrial2Color,
            elevation: 10.0,
            child: ListTile(
              title: const Text(
                "Short-term Memory Verbal Trial 2",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                resultTrial2,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Card(
            color: resultTrial3Color,
            elevation: 10.0,
            child: ListTile(
              title: const Text(
                "Short-term Memory Verbal Trial 3",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                resultTrial3,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Card(
            color: resultOrientationColor,
            elevation: 10.0,
            child: ListTile(
              title: const Text(
                "Orientation",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                resultOrientation,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Card(
            color: resultDelayColor,
            elevation: 10.0,
            child: ListTile(
              title: const Text(
                "Short-Term Memory Verbal: Delayed Recall Of 10 Words",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                resultDelay,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Card(
            color: resultReconColor,
            elevation: 10.0,
            child: ListTile(
              title: const Text(
                "Short-Term Memory Verbal Recognition: Total Score",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                resultRecon,
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

  void valueTrial2ResultToString(int valueTotal) {
    switch (valueTotal > 6) {
      case true:
        {
          setState(() {
            resultTrial2 = "Normal";
            resultTrial2Color = Colors.green;
          });
          break;
        }
      case false:
        {
          if (valueTotal < 5) {
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

  void valueTrial3ResultToString(int valueTotal) {
    switch (valueTotal > 7) {
      case true:
        {
          setState(() {
            resultTrial3 = "Normal";
            resultTrial3Color = Colors.green;
          });
          break;
        }
      case false:
        {
          if (valueTotal < 5) {
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

  void valueOrientationResultToString(int valueTotal) {
    switch (valueTotal) {
      case 0:
        {
          setState(() {
            resultOrientation = "Normal";
            resultOrientationColor = Colors.green;
          });
          break;
        }
      case 2:
        {
          setState(() {
            resultOrientation = "Impaired";
            resultOrientationColor = Colors.red;
          });
          break;
        }
      case 1:
        {
          setState(() {
            resultOrientation = "Equivocal";
            resultOrientationColor = Colors.yellow;
          });
          break;
        }
    }
  }

  void valueRecallResultToString(int valueTotal) {
    switch (valueTotal > 5) {
      case true:
        {
          setState(() {
            resultDelay = "Normal";
            resultDelayColor = Colors.green;
          });
          break;
        }
      case false:
        {
          if (valueTotal < 5) {
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

  void valueRecogResultToString(int valueTotal) {
    switch (valueTotal > 5) {
      case true:
        {
          setState(() {
            resultRecon = "Normal";
            resultReconColor = Colors.green;
          });
          break;
        }
      case false:
        {
          if (valueTotal < 5) {
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
