import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/providers/mica_provider.dart';

class MonthsOfYearBackwards extends StatefulWidget {
  const MonthsOfYearBackwards({super.key});

  @override
  MonthsOfYearBackwardsState createState() => MonthsOfYearBackwardsState();
}

class MonthsOfYearBackwardsState extends State<MonthsOfYearBackwards> {
  int _radioValue = 2; // Default to Impaired
  final List<String> _months = [
    'December',
    'November',
    'October',
    'September',
    'August',
    'July'
  ];
  final Set<String> _tappedMonths = {};

  @override
  void initState() {
    super.initState();
    // Start fresh each time with Impaired selected (no months clicked)
    // Scoring will update automatically as months are tapped
  }

  void _saveToModel() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setExecutiveSerial(
      score: _radioValue,
      count: _tappedMonths.length,
    );
  }

  void _handleRadioValueChange(int? value) {
    if (value != null) {
      setState(() {
        _radioValue = value;
      });
    }
  }

  void _updateScoreBasedOnTappedMonths() {
    // Scoring based on number of correct months tapped:
    // 6 months (no errors) = Normal
    // 5 months (1 error) = Equivocal
    // < 5 months (> 1 error) = Impaired
    if (_tappedMonths.length == 6) {
      _radioValue = 0; // Normal
    } else if (_tappedMonths.length == 5) {
      _radioValue = 1; // Equivocal
    } else {
      _radioValue = 2; // Impaired
    }
  }

  void _toggleMonth(String month) {
    setState(() {
      if (_tappedMonths.contains(month)) {
        _tappedMonths.remove(month);
      } else {
        _tappedMonths.add(month);
      }
      _updateScoreBasedOnTappedMonths();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        _saveToModel();
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Months of the Year Backwards',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _saveToModel();
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            // Yellow instruction card - Say months starting with January
            SizedBox(
              width: width * 0.9,
              child: Card(
                elevation: 10.0,
                color: Colors.yellowAccent.shade400,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    app_data.testExecutiveSerialToPatient1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Purple instruction card - Allow completion
            SizedBox(
              width: width * 0.9,
              child: Card(
                elevation: 10.0,
                color: Colors.deepPurple.shade300,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    app_data.testExecutiveSerialDetails,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Yellow instruction card - Start with December
            SizedBox(
              width: width * 0.9,
              child: Card(
                elevation: 10.0,
                color: Colors.yellowAccent.shade400,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    app_data.testExecutiveSerialToPatient2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Purple card with month buttons
            SizedBox(
              width: width * 0.9,
              child: Card(
                elevation: 10.0,
                color: Colors.deepPurple.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        'Tap to score',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Month buttons in rows of 2
                      for (int i = 0; i < _months.length; i += 2)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          _tappedMonths.contains(_months[i])
                                              ? Colors.green
                                              : Colors.yellowAccent.shade400,
                                      foregroundColor: Colors.black,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                    ),
                                    onPressed: () => _toggleMonth(_months[i]),
                                    child: Text(
                                      _months[i],
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (i + 1 < _months.length)
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: _tappedMonths
                                                .contains(_months[i + 1])
                                            ? Colors.green
                                            : Colors.yellowAccent.shade400,
                                        foregroundColor: Colors.black,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16.0),
                                      ),
                                      onPressed: () =>
                                          _toggleMonth(_months[i + 1]),
                                      child: Text(
                                        _months[i + 1],
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
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
              ),
            ),
            const SizedBox(height: 10),

            // Green scoring card
            SizedBox(
              width: width * 0.9,
              child: Card(
                elevation: 10.0,
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        app_data.testExecutiveSerialResponse,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Scoring table
                      RadioGroup<int>(
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                        child: Table(
                          border: TableBorder.all(
                            color: Colors.black54,
                            width: 1.0,
                          ),
                          children: [
                          TableRow(
                            children: [
                              TableCell(
                                child: InkWell(
                                  onTap: () => _handleRadioValueChange(0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Radio<int>(
                                          value: 0,
                                          fillColor: WidgetStateProperty
                                              .resolveWith<Color>((states) {
                                            if (states.contains(
                                                WidgetState.selected)) {
                                              return Colors.white;
                                            }
                                            return Colors.black;
                                          }),
                                        ),
                                        const SizedBox(width: 4),
                                        const Flexible(
                                          child: Text(
                                            'Normal',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: InkWell(
                                  onTap: () => _handleRadioValueChange(1),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Radio<int>(
                                          value: 1,
                                          fillColor: WidgetStateProperty
                                              .resolveWith<Color>((states) {
                                            if (states.contains(
                                                WidgetState.selected)) {
                                              return Colors.white;
                                            }
                                            return Colors.black;
                                          }),
                                        ),
                                        const SizedBox(width: 4),
                                        const Flexible(
                                          child: Text(
                                            'Equivocal',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: InkWell(
                                  onTap: () => _handleRadioValueChange(2),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Radio<int>(
                                          value: 2,
                                          fillColor: WidgetStateProperty
                                              .resolveWith<Color>((states) {
                                            if (states.contains(
                                                WidgetState.selected)) {
                                              return Colors.white;
                                            }
                                            return Colors.black;
                                          }),
                                        ),
                                        const SizedBox(width: 4),
                                        const Flexible(
                                          child: Text(
                                            'Impaired',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  app_data.testExecutiveSerialResponseNormal,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.0,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  app_data
                                      .testExecutiveSerialResponseEquivocal,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.0,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  app_data.testExecutiveSerialResponseImpaired,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.0,
                                  ),
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
            const SizedBox(height: 20),

            // Task Completed button
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
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    onPressed: () {
                      _saveToModel();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Task Completed',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
