import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';

class ClockDrawingTest extends StatefulWidget {
  const ClockDrawingTest({super.key});

  @override
  State<ClockDrawingTest> createState() => _ClockDrawingTestState();
}

class _ClockDrawingTestState extends State<ClockDrawingTest> {
  int? _radioValue = 0; // 0 = Normal, 1 = Equivocal, 2 = Impaired
  
  @override
  void initState() {
    super.initState();
    // Load any saved data if needed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadFromModel();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Clock Drawing Test',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              NavigationHelper.navigateAndRemoveUntil(
                context,
                const Welcome(),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.deepPurple.shade200,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            // Purple explanation card about cognitive domains
            Card(
              elevation: 10.0,
              color: Colors.deepPurple.shade300,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'Drawing a clock requires a number of cognitive domains to work together. Guiding the hand involves praxis. Planning the task is executive functioning. Monitoring the result visually is gnosis.',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            
            // Yellow instruction card for patient
            Card(
              elevation: 10.0,
              color: Colors.yellowAccent.shade700,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  '"Draw a clock face with the time set to 10 past five. It must have all the numbers and hands so that a child can read the time"',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            
            // Purple scoring criteria card
            Card(
              elevation: 10.0,
              color: Colors.deepPurple.shade300,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'The instructions may be repeated once if required. A total of five points are awarded.\nMost people would be able to score full marks.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '- Score one point if the outer circle is present.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      '- Score one point if all the numbers are present, in the correct order and in the appropriate quadrant. No other numbers or letters are allowed.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      '- Score one point if all the hands are present. The minute hand must be longer than the hour hand.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      '- Score one point if the time is correctly indicated.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      '- Score one point for good overall planning (starts with a circle and plans the writing of the numbers in appropriate quadrants).',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            
            // Green scoring card
            Card(
              elevation: 10.0,
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    const Text(
                      'Note the response of the patient and score as below.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16.0),
                    RadioGroup<int>(
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                      child: Table(
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
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
                                child: Container(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 0,
                                        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                                          if (states.contains(WidgetState.selected)) {
                                            return Colors.white;
                                          }
                                          return Colors.black;
                                        }),
                                      ),
                                      const Text(
                                        'Normal',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0,
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
                                child: Container(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 1,
                                        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                                          if (states.contains(WidgetState.selected)) {
                                            return Colors.white;
                                          }
                                          return Colors.black;
                                        }),
                                      ),
                                      const Text(
                                        'Equivocal',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0,
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
                                child: Container(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 2,
                                        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                                          if (states.contains(WidgetState.selected)) {
                                            return Colors.white;
                                          }
                                          return Colors.black;
                                        }),
                                      ),
                                      const Text(
                                        'Impaired',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ],
                                  ),
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
            const SizedBox(height: 20.0),
            
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
                      // Save the score to the model
                      saveToModel();
                      
                      // Navigate back
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Task Completed',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
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
  
  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value;
    });
  }
  
  void saveToModel() {
    // TODO: Add clock drawing scores to the model when model is updated
    // For now, just store the value locally
  }

  void loadFromModel() {
    if (!mounted) return;

    // TODO: Load clock drawing scores from the model when model is updated
    setState(() {
      _radioValue = 0; // Default to Normal
    });
  }
}