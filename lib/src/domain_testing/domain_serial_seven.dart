import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/welcome.dart';

class SerialSeven extends StatefulWidget {
  @override
  _SerialSevenState createState() => _SerialSevenState();
}

class _SerialSevenState extends State<SerialSeven> {
  double sizeBoxHeight = 10.0;
  int _radioValue = 0;

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            appData.domain_serial_title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
            textAlign: TextAlign.start,
          ),
          // subtitle: Text(
          //   appData.domain_attention_subtitle,
          //   style: TextStyle(
          //       color: Colors.white,
          //       fontWeight: FontWeight.w500,
          //       fontSize: 15.0),
          //   textAlign: TextAlign.start,
          // ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                var router = new MaterialPageRoute(
                    builder: (BuildContext context) => new Welcome());
                Navigator.of(context).pushAndRemoveUntil(
                    router, (Route<dynamic> route) => false);
              })
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: sizeBoxHeight,
          ),
          Container(
            width: _width * 0.9,
            child: Card(
              elevation: 10.0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Serial 7's",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 35.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: sizeBoxHeight,
          ),
          Container(
            width: _width * 0.9,
            child: Card(
              elevation: 10.0,
              color: Colors.yellowAccent.shade400,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      appData.domain_serial_seven_patient,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: sizeBoxHeight,
          ),
          Container(
            width: _width * 0.9,
            child: Card(
              elevation: 10.0,
              color: Colors.deepPurple.shade300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      appData.domain_serial_seven_examiner,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: sizeBoxHeight,
          ),
          Container(
            width: _width * 0.9,
            child: Card(
              elevation: 10.0,
              color: Colors.yellowAccent.shade400,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      appData.domain_serial_seven_patinet2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: sizeBoxHeight,
          ),
          Container(
            width: _width * 0.9,
            child: Card(
              elevation: 10.0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Serial 3's",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 35.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: sizeBoxHeight,
          ),
          Container(
            width: _width * 0.9,
            child: Card(
              elevation: 10.0,
              color: Colors.yellowAccent.shade400,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      appData.domain_serial_three_patient,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: sizeBoxHeight,
          ),
          Container(
            width: _width * 0.9,
            child: Card(
              elevation: 10.0,
              color: Colors.deepPurple.shade300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      appData.domain_serial_three_examiner,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: sizeBoxHeight,
          ),
          Container(
            width: _width * 0.9,
            child: Card(
              elevation: 10.0,
              color: Colors.yellowAccent.shade400,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      appData.domain_serial_three_patinet2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: sizeBoxHeight,
          ),
          Container(
            width: _width * 0.9,
            child: Card(
              elevation: 10.0,
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    // Text(
                    //   appData.testAttentionResponse,
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.w500,
                    //       fontSize: 15.0),
                    // ),
                    Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      border: TableBorder.all(),
                      columnWidths: {
                        0: FlexColumnWidth(0.3),
                        1: FlexColumnWidth(0.3),
                        2: FlexColumnWidth(0.34)
                      },
                      children: [
                        TableRow(children: [
                          Row(
                            children: <Widget>[
                              Radio(
                                value: 0,
                                groupValue: _radioValue,
                                onChanged: _handleRadioValueChange,
                                activeColor: Colors.white,
                              ),
                              Text(
                                "Normal",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Radio(
                                value: 1,
                                groupValue: _radioValue,
                                onChanged: _handleRadioValueChange,
                                activeColor: Colors.white,
                              ),
                              Text(
                                "Equivocal",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Radio(
                                value: 2,
                                groupValue: _radioValue,
                                onChanged: _handleRadioValueChange,
                                activeColor: Colors.white,
                              ),
                              Text(
                                "Impaired",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.0,
                                ),
                              ),
                            ],
                          )
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              appData.testAttentionResponseNormal,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              appData.testAttentionResponseEquivocal,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              appData.testAttentionResponseImpaired,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ])
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: sizeBoxHeight,
          ),
          Container(
            width: _width * 0.9,
            child: Card(
              elevation: 10.0,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: RaisedButton(
                  elevation: 10.0,
                  onPressed: () {
                    var router = new MaterialPageRoute(
                        builder: (BuildContext context) => new Welcome());
                    Navigator.of(context).pushAndRemoveUntil(
                        router, (Route<dynamic> route) => true);
                  },
                  child: Text("Testing Completed"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }
}
