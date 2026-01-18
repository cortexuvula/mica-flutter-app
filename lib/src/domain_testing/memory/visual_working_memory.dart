import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/resources/strings/memory_strings.dart';
import 'package:mica/resources/strings/common_strings.dart';

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
              MemoryStrings.visualWorkingTitle,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
              ),
            ),
            Text(
              MemoryStrings.visualWorkingSubtitle,
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
                        MemoryStrings.visualWorkingPrepareInstruction,
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
                        MemoryStrings.visualWorkingPatientInstruction,
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
                                  MemoryStrings.visualWorkingTapToEnlarge,
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
                            MemoryStrings.visualWorkingVisuospatialTitle,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12.0),
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
                                        '',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  _buildHeaderCell(MemoryStrings.visualMemoryNoMistakes, '3'),
                                  _buildHeaderCell(MemoryStrings.visualMemoryFewOmissions, '2'),
                                  _buildHeaderCell(MemoryStrings.visualMemoryPoor, '1'),
                                  _buildHeaderCell(MemoryStrings.visualMemoryNoDrawing, '0'),
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
                                        MemoryStrings.visualMemoryImage1,
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
                                        MemoryStrings.visualMemoryImage2,
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
                                        MemoryStrings.visualMemoryImage3,
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
                                  final scoreModel = MicaProviders.getScoreModel(context, listen: false);
                                  scoreModel.setMemoryVisualWorking(
                                    image1: selectedScores['image1'] ?? 0,
                                    image2: selectedScores['image2'] ?? 0,
                                    image3: selectedScores['image3'] ?? 0,
                                  );

                                  // Pop back to memory assessment menu
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  CommonStrings.taskCompleted,
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
                        MemoryStrings.visualWorkingCloseHint,
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