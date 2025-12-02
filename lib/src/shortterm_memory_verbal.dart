import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/praxis.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/utils/navigation_helper.dart';

class ShortTermMemoryVerbal extends StatefulWidget {
  const ShortTermMemoryVerbal({super.key});

  @override
  ShortTermMemoryVerbalState createState() => ShortTermMemoryVerbalState();
}

class ShortTermMemoryVerbalState extends State<ShortTermMemoryVerbal> {
  bool _valueDate = false;
  bool _valueDay = false;
  bool _valueMonth = false;
  bool _valueYear = false;
  bool _valueCity = false;
  bool _valuePlace = false;
  int? _radioValue = 0;
  int score = 0;

  // Calculate verbal score based on checkboxes
  int get verbalScore {
    int total = 0;
    if (_valueDate) total++;
    if (_valueDay) total++;
    if (_valueMonth) total++;
    if (_valueYear) total++;
    if (_valueCity) total++;
    if (_valuePlace) total++;
    return total;
  }

  // Update the provider with shortterm memory verbal scores
  void _updateProvider() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setShorttermMemoryVerbal(_radioValue ?? 0, verbalScore);
  }

  @override
  void initState() {
    super.initState();
    initStateFromProvider();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double sizeBoxHeight = 20.0;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }

        // Update provider before navigation
        _updateProvider();
        NavigationHelper.navigateTo(context, const Welcome());
      },
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              app_data.testShortTermMemory,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              app_data.testShortTermMemorySubtitle,
              style: TextStyle(
                color: Colors.white,
              ),
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
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    left: 12.0,
                    right: 12.0,
                    bottom: 12.0,
                  ),
                  child: Text(
                    app_data.testShortTermMemory,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 16.0,
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: 120,
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: _valueDate,
                                        onChanged: (bool? value) =>
                                            _valueDateChanged(value ?? false),
                                        activeColor: Colors.green,
                                      ),
                                      const Text(
                                        "Date",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: _valueMonth,
                                        onChanged: (bool? value) =>
                                            _valueMonthChanged(value ?? false),
                                        activeColor: Colors.green,
                                      ),
                                      const Text(
                                        "Month",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8), // Vertical spacing
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: 120,
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: _valueDay,
                                        onChanged: (bool? value) =>
                                            _valueDayChanged(value ?? false),
                                        activeColor: Colors.green,
                                      ),
                                      const Text(
                                        "Day",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: _valueYear,
                                        onChanged: (bool? value) =>
                                            _valueYearChanged(value ?? false),
                                        activeColor: Colors.green,
                                      ),
                                      const Text(
                                        "Year",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8), // Vertical spacing
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: 120,
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: _valuePlace,
                                        onChanged: (bool? value) =>
                                            _valuePlaceChanged(value ?? false),
                                        activeColor: Colors.green,
                                      ),
                                      const Text(
                                        "Place",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: _valueCity,
                                        onChanged: (bool? value) =>
                                            _valueCityChanged(value ?? false),
                                        activeColor: Colors.green,
                                      ),
                                      const Text(
                                        "City",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
                          const Text(
                            app_data.testShortTermMemoryResponse,
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
                              TableRow(
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Radio(
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
                                      Radio(
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
                                      Radio(
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
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data
                                          .testShortTermMemoryResponseNormal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data
                                          .testShortTermMemoryResponseEquivocal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data
                                          .testShortTermMemoryResponseImpaired,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                ],
                              ),
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
                        onPressed: () {
                          // Make final update to the provider before navigation
                          _updateProvider();

                          // Now that Praxis has been updated to use Provider pattern,
                          // we can navigate directly without passing parameters
                          if (mounted) {
                            NavigationHelper.navigateTo(
                                context, const Praxis());
                          }
                        },
                        child: const Text("Continue",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                )
              ],
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
    _updateProvider();
  }

  void _valueDateChanged(bool value) {
    setState(() {
      _valueDate = value;
    });
    _updateProvider();
  }

  void _valueDayChanged(bool value) {
    setState(() {
      _valueDay = value;
    });
    _updateProvider();
  }

  void _valueMonthChanged(bool value) {
    setState(() {
      _valueMonth = value;
    });
    _updateProvider();
  }

  void _valueCityChanged(bool value) {
    setState(() {
      _valueCity = value;
    });
    _updateProvider();
  }

  void _valuePlaceChanged(bool value) {
    setState(() {
      _valuePlace = value;
    });
    _updateProvider();
  }

  void _valueYearChanged(bool value) {
    setState(() {
      _valueYear = value;
    });
    _updateProvider();
  }

  void setRadioToScore() {
    int newRadioValue;
    if (verbalScore == 5) {
      newRadioValue = 1;
    } else if (verbalScore > 5) {
      newRadioValue = 0;
    } else {
      newRadioValue = 2;
    }

    setState(() {
      _radioValue = newRadioValue;
    });
    _updateProvider();
  }

  void initStateFromProvider() {
    // Get data from provider instead of SharedPreferences
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    final int storedScore = scoreModel.shorttermMemoryVerbal;
    final int storedVerbalScore = scoreModel.shorttermMemoryVerbalScore;

    // Initialize UI state based on provider data
    // Since we don't have individual flags stored in the provider,
    // we'll reset them all and set _radioValue from the provider
    setState(() {
      _valueDate = false;
      _valueMonth = false;
      _valueDay = false;
      _valueYear = false;
      _valuePlace = false;
      _valueCity = false;
      _radioValue = storedScore;
      score = storedVerbalScore;
    });
  }
}
