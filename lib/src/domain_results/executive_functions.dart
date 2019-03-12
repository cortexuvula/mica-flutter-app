import 'package:flutter/material.dart';


class ExecutiveFunctions extends StatefulWidget {


  int executiveAnimalNaming;

  ExecutiveFunctions({Key key, this.executiveAnimalNaming}) : super(key: key);

  @override
  _ExecutiveFunctionsState createState() => _ExecutiveFunctionsState();
}

class _ExecutiveFunctionsState extends State<ExecutiveFunctions> {

  Color cardColorAnimalNaming;
  String resultAnimalNaming = "";

  @override
  void initState() {
    super.initState();

    radio3ButtonValueToStringAnimalNaming(widget.executiveAnimalNaming);
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            "Executive Function",
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
            color: cardColorAnimalNaming,
            elevation: 10.0,
            child: ListTile(
              title: Text("Executive: Animal Naming Task",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
              trailing: Text(resultAnimalNaming,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            ),
          )
        ],
      ),
    );
  }

  radio3ButtonValueToStringAnimalNaming (int value) {
    switch (value) {
      case 0: {
        setState(() {
          cardColorAnimalNaming = Colors.green;
          resultAnimalNaming = "Normal";
        });
        break;
      }
      case 1: {
        setState(() {
          cardColorAnimalNaming = Colors.yellow;
          resultAnimalNaming = "Equivocal";
        });
        break;
      }
      case 2: {
        setState(() {
          cardColorAnimalNaming = Colors.red;
          resultAnimalNaming = "Impaired";
        });
        break;
      }
    }
  }

}
