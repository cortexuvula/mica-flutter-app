import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/language_comprehension.dart';
import 'package:mica/src/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    getPrefs();
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Remember Assessor Name: "),
                      Switch(
                        value: rememberAssessor,
                        onChanged: (bool newValue) {
                          setState(() {
                            rememberAssessor = newValue;
                          });
                        },
                        activeColor: Colors.green,
                        activeTrackColor: Colors.white,
                        inactiveThumbColor: Colors.red,
                        inactiveTrackColor: Colors.white,
                      ),
                    ],
                  ),
                ),
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
                            // If the form is valid, display a snackbar. In the real world, you'd
                            // often want to call a server or save the information in a database
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')));

                            // Save to SharedPreferences
                            setPrefs();
                            
                            // Update the provider with patient information
                            _updateProviderWithPatientInfo();
                            
                            // Navigate to the next screen
                            var router = MaterialPageRoute(
                                builder: (BuildContext context) => const LanguageComprehension());
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
  
  /// Update the provider with patient information
  void _updateProviderWithPatientInfo() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    
    // Get handedness string
    String handed = _radioValue == 0 ? "Right" : "Left";
    
    // Update provider with patient information
    scoreModel.setPatientInfo(
      patientName: myPatient.text,
      assessorName: myAssessor.text,
      handedness: handed,
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

  void getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String? assessor = prefs.getString("assessor");
      bool? remember = prefs.getBool("rememberAssessor");
      if (assessor != null) {
        if (remember == true) {
          setState(() {
            myAssessor.text = assessor;
            rememberAssessor = remember!;
          });
        } else if (remember == false) {
          setState(() {
            rememberAssessor = remember!;
          });
        }
      }

      print("Retrieved Assessor Name $assessor");
    } catch (e) {
      print("failed to get assessor name");
    }
  }

  void setPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      if (rememberAssessor) {
        prefs.setString("assessor", myAssessor.text);
        prefs.setBool("rememberAssessor", rememberAssessor);
        print("Saved ${myAssessor.text}");
      } else if (!rememberAssessor) {
        prefs.setString("assessor", "");
        prefs.setBool("rememberAssessor", rememberAssessor);
      }
    } catch (e) {
      print("Failed to save assessor");
    }
  }
}
