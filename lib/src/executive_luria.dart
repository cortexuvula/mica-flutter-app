import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/executive_serial.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/utils/screen_routes.dart';
import 'package:mica/src/services/persistence_service.dart';

class ExecutiveLuria extends StatefulWidget {
  const ExecutiveLuria({super.key});

  @override
  ExecutiveLuriaState createState() => ExecutiveLuriaState();
}

class ExecutiveLuriaState extends State<ExecutiveLuria> {
  final double sizeBoxHeight = 10.0;
  int _radioValue = 2; // Default initialization
  int _counter = 0;

  // Update the provider with Luria scores
  void _updateProvider() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setExecutiveLuria(
      score: _radioValue,
      count: _counter,
    );
  }

  @override
  void initState() {
    super.initState();
    initFromProvider();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _saveCurrentScreen();
    });
  }

  void _saveCurrentScreen() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setCurrentScreen(ScreenRoutes.executiveLuria);
    PersistenceService.saveProgressImmediate(scoreModel);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        // Save data to provider instead of SharedPreferences
        _updateProvider();
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              app_data.testExecutiveLuria,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              app_data.testExecutiveLuriaSubtitle,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  NavigationHelper.navigateAndRemoveUntil(context,
                      const Welcome(), (Route<dynamic> route) => false);
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
                      color: Colors.yellowAccent.shade400,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              app_data.testExecutiveLuriaToPatient,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
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
                      color: Colors.deepPurple.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: width * 0.8,
                            child: Image.asset(
                              "./images/hands.png",
                              fit: BoxFit.contain,
                            )),
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      height: 75.0,
                                      color: Colors.white,
                                      child: Center(
                                        child: Text(
                                          "$_counter",
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 75.0,
                                    color: Colors.cyan.shade200,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          color: Colors.cyan.shade200,
                                          child: const Text(
                                            "Tap to count Cycles",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            TextButton(
                                                style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.cyan.shade200,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    _counter += 1;
                                                    if (_counter >= 0 &&
                                                        _counter <= 2) {
                                                      _radioValue = 1;
                                                    }
                                                    if (_counter > 2) {
                                                      _radioValue = 0;
                                                    }
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.add,
                                                )),
                                            TextButton(
                                                style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.cyan.shade200,
                                                ),
                                                onPressed: () {
                                                  if (_counter > 0) {
                                                    _counter -= 1;
                                                  }
                                                  setState(() {
                                                    if (_counter >= 1 &&
                                                        _counter <= 2) {
                                                      _radioValue = 1;
                                                    }
                                                    if (_counter > 2) {
                                                      _radioValue = 0;
                                                    }
                                                    if (_counter == 0) {
                                                      _radioValue = 2;
                                                    }
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.remove,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              app_data.testExecutiveLuriaResponse,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                            RadioGroup<int>(
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                              child: Table(
                                border: TableBorder.all(),
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                columnWidths: const {
                                  0: FlexColumnWidth(0.3),
                                  1: FlexColumnWidth(0.3),
                                  2: FlexColumnWidth(0.34)
                                },
                                children: [
                                  TableRow(children: [
                                    Row(
                                      children: <Widget>[
                                        Radio<int>(
                                          value: 0,
                                          activeColor: Colors.white,
                                        ),
                                      const Text(
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
                                      Radio<int>(
                                        value: 1,
                                        activeColor: Colors.white,
                                      ),
                                      const Text(
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
                                      Radio<int>(
                                        value: 2,
                                        activeColor: Colors.white,
                                      ),
                                      const Text(
                                        "Impaired",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data.testExecutiveLuriaResponseNormal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data
                                          .testExecutiveLuriaResponseEquivocal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data
                                          .testExecutiveLuriaResponseImpaired,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
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
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10.0,
                          ),
                          onPressed: () {
                            // Update provider with Luria scores
                            _updateProvider();

                            NavigationHelper.navigateTo(
                                context, const ExecutiveSerial());
                          },
                          child: const Text("Continue",
                              style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRadioValueChange(int? value) {
    if (value != null) {
      setState(() {
        _radioValue = value;
      });
    }
  }

  void initFromProvider() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);

    setState(() {
      _radioValue = scoreModel.executiveLuria;
      _counter = scoreModel.executiveLuriaScore;
    });
  }

  // Provider update is now handled directly by _updateProvider method
}
