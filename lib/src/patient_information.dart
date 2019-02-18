import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:mica/resources/const_data.dart' as appData;

class PatientInformation extends StatefulWidget {
  @override
  _PatientInformationState createState() => _PatientInformationState();
}

class _PatientInformationState extends State<PatientInformation> {
  int _radioValue = 0;
  DateTime selectedDate = DateTime.now();
  var format = DateFormat.yMMMMd();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(appData.appName),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 25.0,
                ),
                Text("Patient Details",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500,
                        fontSize: 24.0,
                        color: Colors.black)),
                SizedBox(
                  height: 20.0,
                ),
                Form(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Patient Name:",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              hintText: "Jane Doe"),
                          
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Date of Assessment:",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            FlatButton(
                              color: Colors.white,
                              onPressed: () => _selectDate(context),
                              child: Text(format.format(selectedDate)),
                            ),
//                            RaisedButton(
//                              elevation: 10.0,
//                              onPressed: () => _selectDate(context),
//                              child: Text(format.format(selectedDate)),
//                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Handedness: ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Radio(
                              value: 0,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                              activeColor: Colors.white,
                            ),
                            Text(
                              "Right",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Radio(
                              value: 1,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                              activeColor: Colors.white,
                            ),
                            Text(
                              "Left",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Assessment completed by",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            hintText: "John Doe",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: width * 0.9,
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          RaisedButton(
                              onPressed: () => debugPrint("Start Testing"),
                            elevation: 10.0,
                            child: Text("Start Testing"),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            appData.startTesting,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14.0,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
