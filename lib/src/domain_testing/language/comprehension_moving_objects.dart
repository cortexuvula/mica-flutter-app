import 'package:flutter/material.dart';

class ComprehensionMovingObjects extends StatefulWidget {
  const ComprehensionMovingObjects({super.key});

  @override
  State<ComprehensionMovingObjects> createState() => _ComprehensionMovingObjectsState();
}

class _ComprehensionMovingObjectsState extends State<ComprehensionMovingObjects> {
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comprehension: Moving 3 Objects Task',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15.0,
          ),
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
                'Place 3 objects in front of the patient and name them while they are being placed to exclude naming ability and object agnosia as confounding factors. Common objects such as a coin, keys and a piece of paper can be used. Begin with simple commands and then move to more complex instructions.',
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
              child: Column(
                children: [
                  Text(
                    '"Turn the coin over"',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '"Place the keys on the other side of the paper"',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '"Place the coin between the keys and the paper, and then turn over the paper."',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
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
                  // Radio button table
                  RadioGroup<int>(
                    groupValue: selectedOption,
                    onChanged: (int? value) {
                      if (value != null) {
                        setState(() {
                          selectedOption = value;
                        });
                      }
                    },
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
                              onTap: () {
                                setState(() {
                                  selectedOption = 0;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
                    ],
                  ),
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
                            // TODO: Add comprehension moving objects score to model when available
                            // final scoreModel = MicaProviders.getScoreModel(context, listen: false);
                            // scoreModel.setComprehensionMovingObjects(selectedOption!);
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