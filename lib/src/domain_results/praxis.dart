import 'package:flutter/material.dart';


class Praxis extends StatefulWidget {


  int workingMemoryVerbalTrial1;

  Praxis({Key key, this.workingMemoryVerbalTrial1}) : super(key: key);

  @override
  _PraxisState createState() => _PraxisState();
}

class _PraxisState extends State<Praxis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            "Praxis",
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
