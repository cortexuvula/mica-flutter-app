import 'package:flutter/material.dart';


class VerbalShortTermMemory extends StatefulWidget {


  int workingMemoryVerbalTrial1;

  VerbalShortTermMemory({Key key, this.workingMemoryVerbalTrial1}) : super(key: key);

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
              title: Text("Working Memory Verbal Trial 1",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
              trailing: Text("8/10",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            ),
          )
        ],
      ),
    );
  }
}
