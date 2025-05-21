import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/executive_luria.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/providers/mica_provider.dart';

class ExecutiveAnimalNaming extends StatefulWidget {
  const ExecutiveAnimalNaming({super.key});

  @override
  ExecutiveAnimalNamingState createState() => ExecutiveAnimalNamingState();
}

class ExecutiveAnimalNamingState extends State<ExecutiveAnimalNaming>
    with TickerProviderStateMixin {
  double sizeBoxHeight = 10.0;
  int _radioValue = 2; // Default value
  int _counter = 0;
  int startSeconds = 60;
  
  // Update the provider with animal naming scores
  void _updateProvider() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setExecutiveAnimalNaming(
      score: _radioValue,
      count: _counter,
    );
  }

  String buttonText = "Start";

  late AnimationController clockController;

  bool isCountingDown = false;
  bool counterStarted = false;

  String get timerString {
    Duration duration = clockController.duration! * clockController.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    initFromProvider();
    clockController = AnimationController(
      vsync: this,
      duration: Duration(seconds: startSeconds),
    );
  }

  @override
  void dispose() {
    clockController.dispose();
    super.dispose();
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
              app_data.testExecutiveAnimalNaming,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              app_data.testExecutiveAnimalNamingSubtitle,
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
                  // Update the provider
                  _updateProvider();
                  var router = MaterialPageRoute(
                      builder: (BuildContext context) => const Welcome());
                  Navigator.of(context).pushAndRemoveUntil(
                      router, (Route<dynamic> route) => true);
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
                          children: const <Widget>[
                            Text(
                              app_data.testExecutiveAnimalNamingToPatient,
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
                      color: Colors.deepPurple.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const <Widget>[
                            Text(
                              app_data.testExecutiveAnimalNamingDetails,
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
                      color: Colors.deepPurple.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: AnimatedBuilder(
                                  animation: clockController,
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return Text(
                                      timerString,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500),
                                    );
                                  }),
                            ),
                            SizedBox(
                              width: 150.0,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.cyan.shade200,
                                  ),
                                  onPressed: () {
                                    if (clockController.isAnimating) {
                                      clockController.stop();
                                      setState(() {
                                        buttonText = "Resume";
                                      });
                                    } else {
                                      clockController.reverse(
                                          from: clockController.value == 0.0
                                              ? 1.0
                                              : clockController.value);
                                      setState(() {
                                        buttonText = "Pause";
                                      });
                                    }
                                  },
                                  child: Text(
                                    buttonText,
                                    style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
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
                                            "Tap to count Words",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            TextButton(
                                                style: TextButton.styleFrom(
                                                  foregroundColor: Colors.black,
                                                  backgroundColor:
                                                      Colors.cyan.shade200,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    _counter += 1;
                                                    if (_counter >= 12 &&
                                                        _counter <= 14) {
                                                      _radioValue = 1;
                                                    }
                                                    if (_counter > 14) {
                                                      _radioValue = 0;
                                                    }
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.add,
                                                )),
                                            TextButton(
                                                style: TextButton.styleFrom(
                                                  foregroundColor: Colors.black,
                                                  backgroundColor:
                                                      Colors.cyan.shade200,
                                                ),
                                                onPressed: () {
                                                  if (_counter > 0) {
                                                    _counter -= 1;
                                                  }
                                                  setState(() {
                                                    if (_counter >= 12 &&
                                                        _counter <= 14) {
                                                      _radioValue = 1;
                                                    }
                                                    if (_counter > 14) {
                                                      _radioValue = 0;
                                                    }
                                                    if (_counter < 12) {
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
                            Table(
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
                                        groupValue: _radioValue,
                                        onChanged: _handleRadioValueChange,
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
                                        groupValue: _radioValue,
                                        onChanged: _handleRadioValueChange,
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
                                        groupValue: _radioValue,
                                        onChanged: _handleRadioValueChange,
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
                                      app_data
                                          .testExecutiveAnimalNamingResponseNormal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data
                                          .testExecutiveAnimalNamingResponseEquivocal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data
                                          .testExecutiveAnimalNamingResponseImpaired,
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
                  const SizedBox(
                    height: 60.0,
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
                            // Update the provider
                            _updateProvider();
                            var router = MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ExecutiveLuria());
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
                          },
                          child: const Text(
                            'Continue',
                            style: TextStyle(color: Colors.black),
                          ),
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

  // Initialize data from provider instead of SharedPreferences
  void initFromProvider() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    setState(() {
      _radioValue = scoreModel.executiveAnimalNaming;
      _counter = scoreModel.executiveAnimalNamingCount;
    });
  }
}
