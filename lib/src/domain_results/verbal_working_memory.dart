import 'package:flutter/material.dart';

class VerbalWorkingMemory extends StatefulWidget {
  final int trialOneScore;

  const VerbalWorkingMemory({
    super.key, 
    required this.trialOneScore
  });

  @override
  State<VerbalWorkingMemory> createState() => _VerbalWorkingMemoryState();
}

class _VerbalWorkingMemoryState extends State<VerbalWorkingMemory> {
  late Color resultColor;
  late String result;

  @override
  void initState() {
    super.initState();
    result = "Normal";
    valueTrial12ResultToString(widget.trialOneScore);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: const Text(
            "Verbal Working Memory",
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
                "Working Memory Verbal Trial 1",
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

  void valueTrial12ResultToString(int valueTotal) {
    switch (valueTotal > 6) {
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
          if (valueTotal < 5) {
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
