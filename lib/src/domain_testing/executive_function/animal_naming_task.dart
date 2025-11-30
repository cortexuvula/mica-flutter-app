import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/providers/mica_provider.dart';

class AnimalNamingTask extends StatefulWidget {
  const AnimalNamingTask({super.key});

  @override
  AnimalNamingTaskState createState() => AnimalNamingTaskState();
}

class AnimalNamingTaskState extends State<AnimalNamingTask> {
  int _counter = 0;
  int _radioValue = 2; // Default to Impaired
  int _seconds = 0;
  bool _isTimerRunning = false;
  bool _timerCompleted = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadFromModel();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _loadFromModel() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    setState(() {
      _radioValue = scoreModel.executiveAnimalNaming;
      _counter = scoreModel.executiveAnimalNamingCount;
      _updateScoreBasedOnCount();
    });
  }

  void _saveToModel() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setExecutiveAnimalNaming(
      score: _radioValue,
      count: _counter,
    );
  }

  void _startTimer() {
    if (_isTimerRunning) return;

    setState(() {
      _isTimerRunning = true;
      _timerCompleted = false;
      _seconds = 0;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
        if (_seconds >= 60) {
          _timer?.cancel();
          _isTimerRunning = false;
          _timerCompleted = true;
        }
      });
    });
  }

  void _updateScoreBasedOnCount() {
    if (_counter > 14) {
      _radioValue = 0; // Normal
    } else if (_counter >= 12 && _counter <= 14) {
      _radioValue = 1; // Equivocal
    } else {
      _radioValue = 2; // Impaired
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _updateScoreBasedOnCount();
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
        _updateScoreBasedOnCount();
      });
    }
  }

  void _handleRadioValueChange(int? value) {
    if (value != null) {
      setState(() {
        _radioValue = value;
      });
    }
  }

  String _formatTime() {
    int minutes = _seconds ~/ 60;
    int seconds = _seconds % 60;
    return '${minutes.toString()}:${seconds.toString().padLeft(2, '0')}';
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
            'Animal Naming Task',
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
            // Yellow instruction card - Patient
            SizedBox(
              width: width * 0.9,
              child: Card(
                elevation: 10.0,
                color: Colors.yellowAccent.shade400,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    app_data.testExecutiveAnimalNamingToPatient,
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

            // Purple instruction card - Examiner
            SizedBox(
              width: width * 0.9,
              child: Card(
                elevation: 10.0,
                color: Colors.deepPurple.shade300,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    app_data.testExecutiveAnimalNamingDetails,
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

            // Timer card
            SizedBox(
              width: width * 0.9,
              child: Card(
                elevation: 10.0,
                color: Colors.deepPurple.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          _formatTime(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan.shade200,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                          ),
                          onPressed: _isTimerRunning || _timerCompleted
                              ? null
                              : _startTimer,
                          child: Text(
                            _timerCompleted
                                ? 'Complete'
                                : _isTimerRunning
                                    ? 'Running'
                                    : 'Start',
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
                      // Counter section
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 75,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  _counter.toString(),
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 2),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 75,
                              color: Colors.cyan.shade200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Tap to count Words',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.black,
                                          backgroundColor: Colors.cyan.shade200,
                                          padding: const EdgeInsets.all(8.0),
                                        ),
                                        onPressed: _incrementCounter,
                                        child: const Icon(
                                          Icons.add,
                                          size: 24,
                                        ),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.black,
                                          backgroundColor: Colors.cyan.shade200,
                                          padding: const EdgeInsets.all(8.0),
                                        ),
                                        onPressed: _decrementCounter,
                                        child: const Icon(
                                          Icons.remove,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Scoring table
                      Table(
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
                                          groupValue: _radioValue,
                                          onChanged: _handleRadioValueChange,
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
                                          groupValue: _radioValue,
                                          onChanged: _handleRadioValueChange,
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
                                          groupValue: _radioValue,
                                          onChanged: _handleRadioValueChange,
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
                                  app_data
                                      .testExecutiveAnimalNamingResponseNormal,
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
                                      .testExecutiveAnimalNamingResponseEquivocal,
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
                                      .testExecutiveAnimalNamingResponseImpaired,
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
