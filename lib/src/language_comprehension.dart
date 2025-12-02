import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/ten_word_recall_task_trial_one.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/patient_information.dart';
import 'package:mica/src/utils/navigation_helper.dart';

class LanguageComprehension extends StatefulWidget {
  const LanguageComprehension({super.key});

  @override
  LanguageComprehensionState createState() => LanguageComprehensionState();
}

class LanguageComprehensionState extends State<LanguageComprehension> {
  var format = DateFormat.yMMMMd();
  int? _radioValue;
  double sizeBoxHeight = 10.0;

  @override
  void initState() {
    super.initState();
    initFromProvider();
  }

  // Update the provider with the language comprehension score
  void _updateProvider() {
    if (_radioValue != null) {
      final scoreModel = MicaProviders.getScoreModel(context, listen: false);
      scoreModel.setLanguageComprehension(_radioValue!);
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }

        // Update provider before navigation
        _updateProvider();

        // Navigate back to PatientInformation screen
        // This will show the previously entered information because the PatientInformation screen
        // loads data from the Provider in its initState method
        NavigationHelper.navigateTo(context, PatientInformation());
      },
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              app_data.testLanguageComprehension,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              app_data.testLanguageComprehensionSubtitle,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  NavigationHelper.navigateAndRemoveUntil(
                      context, Welcome(), (Route<dynamic> route) => false);
                })
          ],
        ),
        body: ListView(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: sizeBoxHeight,
                  ),
                  SizedBox(
                    width: width * 0.9,
                    child: Card(
                      elevation: 10.0,
                      color: Colors.deepPurple.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              app_data.testLanguageComprehensionDetails,
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
                  SizedBox(
                    width: width * 0.9,
                    child: Card(
                      elevation: 10.0,
                      color: Colors.yellowAccent.shade400,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              app_data.testLanguageComprehensionToPatient,
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
                  SizedBox(
                    width: width * 0.9,
                    child: Card(
                      elevation: 10.0,
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              app_data.testLanguageComprehensionResponse,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            RadioGroup<int>(
                              groupValue: _radioValue,
                              onChanged: (int? value) {
                                _handleRadioValueChange(value);
                              },
                              child: Table(
                                border: TableBorder.all(),
                                columnWidths: {
                                  0: FlexColumnWidth(0.33),
                                  1: FlexColumnWidth(0.33),
                                  2: FlexColumnWidth(0.34),
                                },
                                children: [
                                  TableRow(children: [
                                    Row(
                                      children: <Widget>[
                                        Radio(
                                          value: 0,
                                          activeColor: Colors.white,
                                        ),
                                      Text(
                                        "Normal",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.0),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 1,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Equivocal",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.0),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 2,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Impaired",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.0),
                                      ),
                                    ],
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data
                                          .testLanguageComprehensionResponseNormal,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data
                                          .testLanguageComprehensionResponseEquivocal,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data
                                          .testLanguageComprehensionResponseImpaired,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                ])
                              ],
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizeBoxHeight,
                  ),
                  SizedBox(
                    width: width * 0.9,
                    child: Card(
                      elevation: 10.0,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Update the provider with the language comprehension score
                            _updateProvider();

                            NavigationHelper.navigateAndRemoveUntil(
                                context,
                                const TenWordRecallTrialOne(),
                                (Route<dynamic> route) => true);
                          },
                          child: Text("Continue",
                              style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value;
    });
  }

  // initState method moved to the top of the class

  void initFromProvider() {
    if (!mounted) return;

    final scoreModel = MicaProviders.getScoreModel(context, listen: false);

    setState(() {
      _radioValue = scoreModel.languageComprehensionRadioValue;
    });
  }
}
