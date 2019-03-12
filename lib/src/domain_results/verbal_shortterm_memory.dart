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
            color: Colors.green,
            elevation: 10.0,
            child: ListTile(
              title: Text("Short-term Memory Verbal Trial 2",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
              trailing: Text("${widget.trialTwoScore}",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ),
          Card(
            color: Colors.green,
            elevation: 10.0,
            child: ListTile(
              title: Text("Short-term Memory Verbal Trial 3",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
              trailing: Text("${widget.trialThreeScore}",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ),
          Card(
            color: Colors.green,
            elevation: 10.0,
            child: ListTile(
              title: Text("Orientation",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
              trailing: Text("${widget.orientation}",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ),
          Card(
            color: Colors.green,
            elevation: 10.0,
            child: ListTile(
              title: Text("Short-Term Memory Verbal: Delayed Recall Of 10 Words",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
              trailing: Text("${widget.tenWordDelay}",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ),
          Card(
            color: Colors.green,
            elevation: 10.0,
            child: ListTile(
              title: Text("Short-Term Memory Verbal Recognition: Total Score",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
              trailing: Text("${widget.scoreVerbalRecognitionMemoryTenWords}",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
