import 'package:flutter/material.dart';


class AttentionConcentration extends StatefulWidget {


  int workingMemoryVerbalTrial1;

  AttentionConcentration({Key key, this.workingMemoryVerbalTrial1}) : super(key: key);

  @override
  _AttentionConcentrationState createState() => _AttentionConcentrationState();
}

class _AttentionConcentrationState extends State<AttentionConcentration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            "Attention & Concentration",
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
              title: Text("Vigilance Test",style: TextStyle(
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
