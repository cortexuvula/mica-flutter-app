import 'package:flutter/material.dart';

class ComprehensionThreeStage extends StatefulWidget {
  const ComprehensionThreeStage({super.key});

  @override
  State<ComprehensionThreeStage> createState() => _ComprehensionThreeStageState();
}

class _ComprehensionThreeStageState extends State<ComprehensionThreeStage> {
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Language',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
              ),
            ),
            Text(
              'Comprehension',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          // Purple instruction card
          Card(
            elevation: 10.0,
            color: Colors.deepPurple.shade300,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Evaluate comprehension by using a 3-stage command. Intact basic comprehension ensures good compliance with any test procedures that follow.',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          
          // Yellow patient instruction card
          Card(
            elevation: 10.0,
            color: Colors.yellowAccent.shade400,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '"Can you point with your finger to the ceiling, the floor and the door."',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          
          // Green scoring card
          Card(
            elevation: 10.0,
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Note the response of the patient and score as below.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  // Radio button table with descriptions
                  Table(
                    border: TableBorder.all(
                      color: Colors.black54,
                      width: 1.0,
                    ),
                    children: [
                      // Header row with radio buttons
                      TableRow(
                        children: [
                          TableCell(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedOption = 0;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Radio<int>(
                                      value: 0,
                                      groupValue: selectedOption,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedOption = value;
                                        });
                                      },
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
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedOption = 1;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Radio<int>(
                                      value: 1,
                                      groupValue: selectedOption,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedOption = value;
                                        });
                                      },
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
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedOption = 2;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Radio<int>(
                                      value: 2,
                                      groupValue: selectedOption,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedOption = value;
                                        });
                                      },
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
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Description row
                      TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: const Text(
                                '3 stages complete without an error',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: const Text(
                                'Some difficulty',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: const Text(
                                '1 or more clear errors',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                ),
                                textAlign: TextAlign.center,
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
          const SizedBox(height: 30.0),
          
          // Task Completed button
          SizedBox(
            width: width * 0.9,
            child: Card(
              elevation: 10.0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: width * 0.8,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10.0,
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                        ),
                        onPressed: () {
                          // Save the score if selected
                          if (selectedOption != null) {
                            // TODO: Add comprehension 3 stage score to model when available
                            // final scoreModel = MicaProviders.getScoreModel(context, listen: false);
                            // scoreModel.setComprehensionThreeStage(selectedOption!);
                          }
                          // Pop back to language assessment
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Task Completed',
                          style: TextStyle(color: Colors.black),
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
    );
  }
}