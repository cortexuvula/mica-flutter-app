import 'package:flutter/material.dart';

class VisualShortTermMemory extends StatefulWidget {
  final int shorttermMemoryVisualImage1;
  final int shorttermMemoryVisualImage2;
  final int shorttermMemoryVisualImage3;

  const VisualShortTermMemory({
    super.key,
    required this.shorttermMemoryVisualImage1,
    required this.shorttermMemoryVisualImage2,
    required this.shorttermMemoryVisualImage3,
  });

  @override
  State<VisualShortTermMemory> createState() => _VisualShortTermMemoryState();
}

class _VisualShortTermMemoryState extends State<VisualShortTermMemory> {
  late String result;
  late Color resultColor;

  @override
  void initState() {
    super.initState();
    result = "Normal";
    combineScores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: const Text(
            "Visual Short-Term Memory",
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
            color: resultColor,
            elevation: 10.0,
            child: ListTile(
              title: const Text(
                "Short-Term Memory Visual: Line Drawing Recall",
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

  void combineScores() {
    int score1 = 3 - widget.shorttermMemoryVisualImage1;
    int score2 = 3 - widget.shorttermMemoryVisualImage2;
    int score3 = 3 - widget.shorttermMemoryVisualImage3;

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
