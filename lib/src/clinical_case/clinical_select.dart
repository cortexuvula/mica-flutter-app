import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;

class ClinicalSelect extends StatefulWidget {
  @override
  _ClinicalSelectState createState() => _ClinicalSelectState();
}

class _ClinicalSelectState extends State<ClinicalSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            appData.appName,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
            textAlign: TextAlign.start,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () => debugPrint("info")),
        ],
      ),
    );
  }
}
