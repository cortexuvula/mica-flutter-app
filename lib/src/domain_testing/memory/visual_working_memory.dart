import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';

class VisualWorkingMemory extends StatefulWidget {
  const VisualWorkingMemory({super.key});

  @override
  State<VisualWorkingMemory> createState() => _VisualWorkingMemoryState();
}

class _VisualWorkingMemoryState extends State<VisualWorkingMemory> {
  Map<String, int> selectedScores = {
    'image1': 3,
    'image2': 3,
    'image3': 3,
  }; // Default scores
  int currentShapeIndex = 0; // Track which shape to display
  
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
              'Visual Working Memory',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
              ),
            ),
            Text(
              'Visual - Copy',
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
                        'Prepare by having available 3 sheets of blank paper. The patient draws each figure on a separate sheet. Tap on the picture below to enlarge.',
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
                    color: Colors.yellowAccent.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: const Text(
                        '"I will show you a sketch for 10 seconds. Try to memorise it during this time. I will then remove it and we will wait 10 seconds. Then draw what you can remember. Ready?"',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  // Drawing display area
                  Card(
                    elevation: 10.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Shape display with navigation arrows
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back_ios),
                                onPressed: currentShapeIndex > 0
                                    ? () {
                                        setState(() {
                                          currentShapeIndex--;
                                        });
                                      }
                                    : null,
                              ),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    _showFullscreenImage(context);
                                  },
                                  child: Container(
                                    width: 200,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 3.0,
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset(
                                        shapeImages[currentShapeIndex],
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.arrow_forward_ios),
                                onPressed: currentShapeIndex < 2
                                    ? () {
                                        setState(() {
                                          currentShapeIndex++;
                                        });
                                      }
                                    : null,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Column(
                            children: [
                              Text(
                                'Shape ${currentShapeIndex + 1} of 3',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: const Text(
                                  'Tap image to enlarge',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
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
                          const Text(
                            'Visuospatial Working Memory',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          // Score table
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
                                        '',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0,
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
                              // Image 1 row
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
                              // Image 2 row
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
                              // Image 3 row
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
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
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
                                  // TODO: Save score to model
                                  // final scoreModel = MicaProviders.getScoreModel(context, listen: false);
                                  // int totalScore = selectedScores['image1']! + selectedScores['image2']! + selectedScores['image3']!;
                                  // scoreModel.setVisualWorkingMemoryScore(totalScore);

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

  void _showFullscreenImage(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        barrierColor: Colors.black87,
        pageBuilder: (BuildContext context, _, __) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  // Fullscreen image
                  Center(
                    child: InteractiveViewer(
                      minScale: 0.5,
                      maxScale: 4.0,
                      child: Image.asset(
                        shapeImages[currentShapeIndex],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // Close button
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 16,
                    right: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                  // Navigation hint
                  Positioned(
                    bottom: MediaQuery.of(context).padding.bottom + 16,
                    left: 0,
                    right: 0,
                    child: const Center(
                      child: Text(
                        'Tap anywhere or press X to close',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          shadows: [
                            Shadow(
                              blurRadius: 4.0,
                              color: Colors.black,
                              offset: Offset(1.0, 1.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
            groupValue: selectedScores[imageKey],
            onChanged: (int? newValue) {
              setState(() {
                selectedScores[imageKey] = newValue!;
              });
            },
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