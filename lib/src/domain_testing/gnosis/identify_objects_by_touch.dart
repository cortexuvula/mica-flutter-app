import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';

class IdentifyObjectsByTouch extends StatefulWidget {
  const IdentifyObjectsByTouch({super.key});

  @override
  State<IdentifyObjectsByTouch> createState() => _IdentifyObjectsByTouchState();
}

class _IdentifyObjectsByTouchState extends State<IdentifyObjectsByTouch> {
  int? _rightHandRadioValue = 0; // 0 = Normal, 1 = Equivocal, 2 = Impaired
  int? _leftHandRadioValue = 0;  // 0 = Normal, 1 = Equivocal, 2 = Impaired
  
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
          'Identify Objects by Touch',
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
            // Yellow instruction card for patient
            Card(
              elevation: 10.0,
              color: Colors.yellowAccent.shade700,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  '"Please hold out your right hand. I am going to ask you to close your eyes and then I will place an object in your hand. Identify this by touch only."',
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
            
            // Purple instruction card for examiner
            Card(
              elevation: 10.0,
              color: Colors.deepPurple.shade300,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'Place common objects such as keys, coin or pen in the patient\'s right hand. Repeat the same with the left hand. An inability to identify objects by touch is known as astereognosis.',
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
            
            // Green scoring card with table
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
                    Table(
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      border: TableBorder.all(
                        color: Colors.black54,
                        width: 1.0,
                      ),
                      children: [
                        // Header row
                        TableRow(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              child: const Text(
                                '',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              child: const Text(
                                'Normal',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              child: const Text(
                                'Equivocal',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              child: const Text(
                                'Impaired',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        // Right hand row
                        TableRow(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              child: const Text(
                                'Right',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            TableCell(
                              child: InkWell(
                                onTap: () => _handleRightHandRadioValueChange(0),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Radio<int>(
                                    value: 0,
                                    groupValue: _rightHandRadioValue,
                                    onChanged: _handleRightHandRadioValueChange,
                                    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                                      if (states.contains(WidgetState.selected)) {
                                        return Colors.white;
                                      }
                                      return Colors.black;
                                    }),
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: InkWell(
                                onTap: () => _handleRightHandRadioValueChange(1),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Radio<int>(
                                    value: 1,
                                    groupValue: _rightHandRadioValue,
                                    onChanged: _handleRightHandRadioValueChange,
                                    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                                      if (states.contains(WidgetState.selected)) {
                                        return Colors.white;
                                      }
                                      return Colors.black;
                                    }),
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: InkWell(
                                onTap: () => _handleRightHandRadioValueChange(2),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Radio<int>(
                                    value: 2,
                                    groupValue: _rightHandRadioValue,
                                    onChanged: _handleRightHandRadioValueChange,
                                    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                                      if (states.contains(WidgetState.selected)) {
                                        return Colors.white;
                                      }
                                      return Colors.black;
                                    }),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Left hand row
                        TableRow(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              child: const Text(
                                'Left',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            TableCell(
                              child: InkWell(
                                onTap: () => _handleLeftHandRadioValueChange(0),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Radio<int>(
                                    value: 0,
                                    groupValue: _leftHandRadioValue,
                                    onChanged: _handleLeftHandRadioValueChange,
                                    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                                      if (states.contains(WidgetState.selected)) {
                                        return Colors.white;
                                      }
                                      return Colors.black;
                                    }),
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: InkWell(
                                onTap: () => _handleLeftHandRadioValueChange(1),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Radio<int>(
                                    value: 1,
                                    groupValue: _leftHandRadioValue,
                                    onChanged: _handleLeftHandRadioValueChange,
                                    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                                      if (states.contains(WidgetState.selected)) {
                                        return Colors.white;
                                      }
                                      return Colors.black;
                                    }),
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: InkWell(
                                onTap: () => _handleLeftHandRadioValueChange(2),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Radio<int>(
                                    value: 2,
                                    groupValue: _leftHandRadioValue,
                                    onChanged: _handleLeftHandRadioValueChange,
                                    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                                      if (states.contains(WidgetState.selected)) {
                                        return Colors.white;
                                      }
                                      return Colors.black;
                                    }),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Footer row with descriptions
                        TableRow(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              child: const Text(
                                '',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              child: const Text(
                                'No errors',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              child: const Text(
                                'Some difficulty',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              child: const Text(
                                'Clear difficulty',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                ),
                                textAlign: TextAlign.center,
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
  
  void _handleRightHandRadioValueChange(int? value) {
    setState(() {
      _rightHandRadioValue = value;
    });
  }
  
  void _handleLeftHandRadioValueChange(int? value) {
    setState(() {
      _leftHandRadioValue = value;
    });
  }
  
  void saveToModel() {
    // TODO: Add astereognosis scores to the model when model is updated
    // For now, just store the values locally
  }

  void loadFromModel() {
    if (!mounted) return;

    // TODO: Load astereognosis scores from the model when model is updated
    setState(() {
      _rightHandRadioValue = 0; // Default to Normal
      _leftHandRadioValue = 0;  // Default to Normal
    });
  }
}