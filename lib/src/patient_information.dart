import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/language_comprehension.dart';

class PatientInformation extends StatefulWidget {
  @override
  _PatientInformationState createState() => _PatientInformationState();
}

class _PatientInformationState extends State<PatientInformation> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();

  int _radioValue = 0;
  DateTime selectedDate = DateTime.now();

//  var format = DateFormat.yMMMMd();
  var format = DateFormat('d MMM y');

  final myPatient = TextEditingController();
  final myAssessor = TextEditingController();

  @override
  void dispose() {
    myPatient.dispose();
    myAssessor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffoldState,
        appBar: AppBar(
          title: ListTile(
            title: Text(
              appData.appName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
          ),
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
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: myPatient,

//                          validator: (value) {
//                            if (value.isEmpty) {
//                              return 'Please enter patient full name';
//                            }
//                          },
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
                            SizedBox(
                              width: 10.0,
                            ),
                            FlatButton(
                              color: Colors.white,
                              onPressed: () => _selectDate(context),
                              child: Text(format.format(selectedDate)),
                            ),
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
                          controller: myAssessor,

//                          validator: (value) {
//                            if (value.isEmpty) {
//                              return 'Please enter name of assessor';
//                            }
//                          },
                          decoration: InputDecoration(
                            labelText: "Assessment completed by:",
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
                  width: _width * 0.9,
                  child: Card(
                    elevation: 10.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: () {
                          String _handed;
                          if (_radioValue == 0) {
                            _handed = "Right";
                          } else {
                            _handed = "Left";
                          }
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a snackbar. In the real world, you'd
                            // often want to call a server or save the information in a database
                            _scaffoldState.currentState.showSnackBar(
                                SnackBar(content: Text('Processing Data')));

                            var router = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new LanguageComprehension(
                                      patientName: myPatient.text,
                                      assessorName: myAssessor.text,
                                      handedness: _handed,
                                      assessmentDate: selectedDate,
                                    ));
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => false);
                          }
                        },
                        elevation: 10.0,
                        child: Text("Start Testing"),
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
