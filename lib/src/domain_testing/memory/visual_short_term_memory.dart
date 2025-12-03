import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/providers/mica_provider.dart';

class VisualShortTermMemory extends StatefulWidget {
  const VisualShortTermMemory({super.key});

  @override
  State<VisualShortTermMemory> createState() => _VisualShortTermMemoryState();
}

class _VisualShortTermMemoryState extends State<VisualShortTermMemory> {
  Map<String, int> selectedScores = {
    'image1': 3,
    'image2': 3,
    'image3': 3,
  }; // Default scores
  
  final List<String> shapeImages = [
    'images/visual_memory_shape1.png',
    'images/visual_memory_shape2.png',
    'images/visual_memory_shape3.png',
  ];
  
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              'Visual Short-Term Memory',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
              ),
            ),
            Text(
              'Visual - 3 Shapes',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
        centerTitle: true,
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
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: width * 0.9,
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Purple instruction card
                  Card(
                    elevation: 10.0,
                    color: Colors.deepPurple.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: const Text(
                        'Allow 5 minutes or more to pass before testing recall of the line drawings shown in Visual Working Memory.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Yellow instruction card
                  Card(
                    elevation: 10.0,
                    color: Colors.yellowAccent.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: const Text(
                        '"Earlier I showed you some drawings to test your memory. Can you still remember them? Please draw what you can remember here."',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Purple instruction to provide blank paper
                  Card(
                    elevation: 10.0,
                    color: Colors.deepPurple.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: const Text(
                        'Provide the patient with a blank sheet of paper.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Three shape images in a row
                  Card(
                    elevation: 10.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int i = 0; i < 3; i++)
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(
                                  shapeImages[i],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Score selection
                  Card(
                    elevation: 10.0,
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          // Header table
                          Table(
                            border: TableBorder.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                            children: [
                              // Header row
                              TableRow(
                                children: [
                                  const TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Image',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  _buildHeaderCell('No Mistakes', '3'),
                                  _buildHeaderCell('Few Omissions', '2'),
                                  _buildHeaderCell('Poor', '1'),
                                  _buildHeaderCell('No Drawing', '0'),
                                ],
                              ),
                            ],
                          ),
                          // Image 1 scoring table
                          RadioGroup<int>(
                            groupValue: selectedScores['image1'],
                            onChanged: (value) {
                              setState(() {
                                selectedScores['image1'] = value!;
                              });
                            },
                            child: Table(
                            border: TableBorder.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                            children: [
                              TableRow(
                                children: [
                                  const TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Image 1',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  _buildScoreCell('image1', 3),
                                  _buildScoreCell('image1', 2),
                                  _buildScoreCell('image1', 1),
                                  _buildScoreCell('image1', 0),
                                ],
                              ),
                            ],
                          ),
                          ),
                          // Image 2 scoring table
                          RadioGroup<int>(
                            groupValue: selectedScores['image2'],
                            onChanged: (value) {
                              setState(() {
                                selectedScores['image2'] = value!;
                              });
                            },
                            child: Table(
                            border: TableBorder.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                            children: [
                              TableRow(
                                children: [
                                  const TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Image 2',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  _buildScoreCell('image2', 3),
                                  _buildScoreCell('image2', 2),
                                  _buildScoreCell('image2', 1),
                                  _buildScoreCell('image2', 0),
                                ],
                              ),
                            ],
                          ),
                          ),
                          // Image 3 scoring table
                          RadioGroup<int>(
                            groupValue: selectedScores['image3'],
                            onChanged: (value) {
                              setState(() {
                                selectedScores['image3'] = value!;
                              });
                            },
                            child: Table(
                            border: TableBorder.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                            children: [
                              TableRow(
                                children: [
                                  const TableCell(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Image 3',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  _buildScoreCell('image3', 3),
                                  _buildScoreCell('image3', 2),
                                  _buildScoreCell('image3', 1),
                                  _buildScoreCell('image3', 0),
                                ],
                              ),
                            ],
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
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
                                  final scoreModel = MicaProviders.getScoreModel(context, listen: false);

                                  // Visual short-term memory uses the existing setter
                                  scoreModel.setShorttermMemoryVisualImages(
                                    image1: selectedScores['image1'] ?? 0,
                                    image2: selectedScores['image2'] ?? 0,
                                    image3: selectedScores['image3'] ?? 0,
                                  );

                                  // Pop back to memory assessment menu
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
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String label, String score) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              '($score)',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 11.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreCell(String imageKey, int value) {
    return TableCell(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedScores[imageKey] = value;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Radio<int>(
            value: value,
            fillColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (states.contains(WidgetState.selected)) {
                return Colors.white;
              }
              return Colors.black;
            }),
          ),
        ),
      ),
    );
  }
}