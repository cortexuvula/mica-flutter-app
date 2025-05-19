import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/language_comprehension.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/providers/mica_provider.dart';

class PatientInformation extends StatefulWidget {
  const PatientInformation({super.key});

  @override
  _PatientInformationState createState() => _PatientInformationState();
}

class _PatientInformationState extends State<PatientInformation> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  bool rememberAssessor = false;

  int _radioValue = 0;
  DateTime selectedDate = DateTime.now();

//  var format = DateFormat.yMMMMd();
  var format = DateFormat('d MMM y');

  final myPatient = TextEditingController();
  final myAssessor = TextEditingController();

  @override
  void initState() {
    super.initState();
    initFromProvider();
  }

  @override
  void dispose() {
    myPatient.dispose();
    myAssessor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  var router = MaterialPageRoute(
                      builder: (BuildContext context) => Welcome());
                  Navigator.of(context).pushAndRemoveUntil(
                      router, (Route<dynamic> route) => false);
                })
          ],
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
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
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
                              onChanged: (int? value) {
                                _handleRadioValueChange(value ?? 0);
                              },
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
                              onChanged: (int? value) {
                                _handleRadioValueChange(value ?? 0);
                              },
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
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: <Widget>[
                //       Text("Remember Assessor Name: "),
                //       Switch(
                //         value: rememberAssessor,
                //         onChanged: (bool newValue) {
                //           setState(() {
                //             rememberAssessor = newValue;
                //           });
                //         },
                //         activeColor: Colors.green,
                //         activeTrackColor: Colors.white,
                //         inactiveThumbColor: Colors.red,
                //         inactiveTrackColor: Colors.white,
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  width: width * 0.9,
                  child: Card(
                    elevation: 10.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Handedness will be processed in _updateProviderWithPatientInfo
                          if (myPatient.text == "") {
                            myPatient.text = "No Name Provided";
                          }
                          if (myAssessor.text == "") {
                            myAssessor.text = "No Name Provided";
                          }
                          if (_formKey.currentState?.validate() ?? false) {
                            // Save to provider
                            saveToProvider();

                            // The provider is now updated with patient information

                            // Navigate to the next screen
                            var router = MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const LanguageComprehension());
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
                          }
                        },
                        child: Text("Start Testing",
                            style: TextStyle(color: Colors.black)),
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

  void initFromProvider() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);

    // Load patient information from provider
    setState(() {
      myPatient.text = scoreModel.patientName;
      myAssessor.text = scoreModel.assessorName;
      _radioValue = scoreModel.handedness == 'Right' ? 0 : 1;
      selectedDate = scoreModel.assessmentDate;
    });
  }

  // Instead of saving to SharedPreferences, we now update the provider
  void saveToProvider() {
    if (!mounted) return;

    final scoreModel = MicaProviders.getScoreModel(context, listen: false);

    // Update the provider with patient information
    scoreModel.setPatientInfo(
      patientName: myPatient.text,
      assessorName: myAssessor.text,
      handedness: _radioValue == 0 ? 'Right' : 'Left',
      assessmentDate: selectedDate,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
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
