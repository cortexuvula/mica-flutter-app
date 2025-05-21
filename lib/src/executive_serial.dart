import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/shortterm_memory_verbal.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/providers/mica_provider.dart';

class ExecutiveSerial extends StatefulWidget {
  const ExecutiveSerial({super.key});

  @override
  ExecutiveSerialState createState() => ExecutiveSerialState();
}

class ExecutiveSerialState extends State<ExecutiveSerial> {
  final double sizeBoxHeight = 10.0;
  int? _radioValue;
  int score = 0;
  List<String> executiveSerialButtonColor = [];
  
  // Update the provider with serial scores
  void _updateProvider() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setExecutiveSerial(
      score: _radioValue ?? 0,
      count: score,
    );
  }

  Color decembermonthButtonColor = Colors.yellow;
  Color novembermonthButtonColor = Colors.yellow;
  Color octobermonthButtonColor = Colors.yellow;
  Color septembermonthButtonColor = Colors.yellow;
  Color augustmonthButtonColor = Colors.yellow;
  Color julymonthButtonColor = Colors.yellow;

  bool decemberTapped = false;
  bool novemberTapped = false;
  bool octoberTapped = false;
  bool septemberTapped = false;
  bool augustTapped = false;
  bool julyTapped = false;

  @override
  void initState() {
    super.initState();
    initFromProvider();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        
        // Save to provider instead of SharedPreferences
        _updateProvider();
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              app_data.testExecutiveSerial,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              app_data.testExecutiveSerialSubtitle,
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
                  var router = MaterialPageRoute(
                      builder: (BuildContext context) => const Welcome());
                  Navigator.of(context).pushAndRemoveUntil(
                      router, (Route<dynamic> route) => false);
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
                              app_data.testExecutiveSerialToPatient1,
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
                        child: Column(
                          children: <Widget>[
                            Text(
                              app_data.testExecutiveSerialDetails,
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
                      color: Colors.yellowAccent.shade400,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              app_data.testExecutiveSerialToPatient2,
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
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Tap to score",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                            Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              columnWidths: {
                                0: FlexColumnWidth(0.5),
                                1: FlexColumnWidth(0.5),
                              },
                              children: [
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            decembermonthButtonColor,
                                      ),
                                      child: const Text("December"),
                                      onPressed: () {
                                        if (!decemberTapped) {
                                          setState(() {
                                            decembermonthButtonColor =
                                                Colors.green;
                                            decemberTapped = true;
                                            score += 1;
                                          });
                                        } else if (decemberTapped) {
                                          setState(() {
                                            decembermonthButtonColor =
                                                Colors.yellow;
                                            decemberTapped = false;
                                            score -= 1;
                                          });
                                        }
                                        setRadioValue();
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            novembermonthButtonColor,
                                      ),
                                      child: const Text("November"),
                                      onPressed: () {
                                        if (!novemberTapped) {
                                          setState(() {
                                            novembermonthButtonColor =
                                                Colors.green;
                                            novemberTapped = true;
                                            score += 1;
                                          });
                                        } else if (novemberTapped) {
                                          setState(() {
                                            novembermonthButtonColor =
                                                Colors.yellow;
                                            novemberTapped = false;
                                            score -= 1;
                                          });
                                        }
                                        setRadioValue();
                                      },
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            octobermonthButtonColor,
                                      ),
                                      child: const Text("October"),
                                      onPressed: () {
                                        if (!octoberTapped) {
                                          setState(() {
                                            octobermonthButtonColor =
                                                Colors.green;
                                            octoberTapped = true;
                                            score += 1;
                                          });
                                        } else if (octoberTapped) {
                                          setState(() {
                                            octobermonthButtonColor =
                                                Colors.yellow;
                                            octoberTapped = false;
                                            score -= 1;
                                          });
                                        }
                                        setRadioValue();
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            septembermonthButtonColor,
                                      ),
                                      child: const Text("September"),
                                      onPressed: () {
                                        if (!septemberTapped) {
                                          setState(() {
                                            septembermonthButtonColor =
                                                Colors.green;
                                            septemberTapped = true;
                                            score += 1;
                                          });
                                        } else if (septemberTapped) {
                                          setState(() {
                                            septembermonthButtonColor =
                                                Colors.yellow;
                                            septemberTapped = false;
                                            score -= 1;
                                          });
                                        }
                                        setRadioValue();
                                      },
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: augustmonthButtonColor,
                                      ),
                                      child: const Text("August"),
                                      onPressed: () {
                                        if (!augustTapped) {
                                          setState(() {
                                            augustmonthButtonColor =
                                                Colors.green;
                                            augustTapped = true;
                                            score += 1;
                                          });
                                        } else if (augustTapped) {
                                          setState(() {
                                            augustmonthButtonColor =
                                                Colors.yellow;
                                            augustTapped = false;
                                            score -= 1;
                                          });
                                        }
                                        setRadioValue();
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: julymonthButtonColor,
                                      ),
                                      child: const Text("July"),
                                      onPressed: () {
                                        if (!julyTapped) {
                                          setState(() {
                                            julymonthButtonColor = Colors.green;
                                            julyTapped = true;
                                            score += 1;
                                          });
                                        } else if (julyTapped) {
                                          setState(() {
                                            julymonthButtonColor =
                                                Colors.yellow;
                                            julyTapped = false;
                                            score -= 1;
                                          });
                                        }
                                        setRadioValue();
                                      },
                                    ),
                                  ),
                                ])
                              ],
                            )
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
                              app_data.testExecutiveSerialResponse,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Table(
                              border: TableBorder.all(),
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              columnWidths: {
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
                                        groupValue: _radioValue,
                                        onChanged: _handleRadioValueChange,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Normal",
                                        style: const TextStyle(
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
                                        groupValue: _radioValue,
                                        onChanged: _handleRadioValueChange,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Equivocal",
                                        style: const TextStyle(
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
                                        groupValue: _radioValue,
                                        onChanged: _handleRadioValueChange,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Impaired",
                                        style: const TextStyle(
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
                                      app_data.testExecutiveSerialResponseNormal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data.testExecutiveSerialResponseEquivocal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data.testExecutiveSerialResponseImpaired,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
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
                  SizedBox(
                    width: width * 0.9,
                    child: Card(
                      elevation: 10.0,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Update provider with serial scores
                            _updateProvider();
                            
                            var router = MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ShortTermMemoryVerbal());
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
                          },
                          child: const Text("Continue",
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

  void setRadioValue() {
    if (score == 5) {
      setState(() {
        _radioValue = 1;
      });
    }
    if (score == 6) {
      setState(() {
        _radioValue = 0;
      });
    }
    if (score < 5) {
      setState(() {
        _radioValue = 2;
      });
    }
  }

  void initFromProvider() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    
    setState(() {
      // Get base values from the provider
      _radioValue = scoreModel.executiveSerial;
      score = scoreModel.executiveSerialScore;
      
      // Initialize button colors - these would need to be stored in the model
      // if we want to preserve button state between sessions
      executiveSerialButtonColor = List.filled(6, "yellow");
      
      // Reset button colors and tapped states
      decembermonthButtonColor = Colors.yellow;
      novembermonthButtonColor = Colors.yellow;
      octobermonthButtonColor = Colors.yellow;
      septembermonthButtonColor = Colors.yellow;
      augustmonthButtonColor = Colors.yellow;
      julymonthButtonColor = Colors.yellow;

      decemberTapped = false;
      novemberTapped = false;
      octoberTapped = false;
      septemberTapped = false;
      augustTapped = false;
      julyTapped = false;
    });
  }
}
