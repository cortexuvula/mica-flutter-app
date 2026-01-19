import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/utils/screen_routes.dart';
import 'package:mica/src/services/persistence_service.dart';
import 'package:mica/resources/strings/gnosis_strings.dart';
import 'package:mica/resources/strings/common_strings.dart';

class FingerPerceptionTest extends StatefulWidget {
  const FingerPerceptionTest({super.key});

  @override
  State<FingerPerceptionTest> createState() => _FingerPerceptionTestState();
}

class _FingerPerceptionTestState extends State<FingerPerceptionTest> {
  // Radio values for each test pattern (0 = Normal, 1 = Equivocal, 2 = Impaired)
  final List<int?> _patternScores = List.filled(10, 0); // 10 different patterns
  int? _summaryScore = 0; // Overall summary score

  @override
  void initState() {
    super.initState();
    // Load any saved data if needed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadFromModel();
      _saveCurrentScreen();
    });
  }

  void _saveCurrentScreen() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setCurrentScreen(ScreenRoutes.gnosisFingerPerception);
    PersistenceService.saveProgressImmediate(scoreModel);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          GnosisStrings.fingerPerceptionTest,
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
                  GnosisStrings.fingerPerceptionPatientInstruction1,
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

            // Purple instruction card for first pattern
            Card(
              elevation: 10.0,
              color: Colors.deepPurple.shade300,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  GnosisStrings.fingerPerceptionExaminerInstruction1,
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

            // First hand diagram placeholder
            _buildHandDiagram(0),
            const SizedBox(height: 16.0),

            // Yellow instruction for eyes closed
            Card(
              elevation: 10.0,
              color: Colors.yellowAccent.shade700,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  GnosisStrings.fingerPerceptionPatientInstruction2,
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

            // Purple instruction for continuing test
            Card(
              elevation: 10.0,
              color: Colors.deepPurple.shade300,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  GnosisStrings.fingerPerceptionExaminerInstruction2,
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

            // Build remaining test patterns
            for (int i = 1; i < 7; i++) ...[
              _buildHandDiagram(i),
              _buildScoringTable(i),
              const SizedBox(height: 20.0),
            ],

            // Green summary card
            Card(
              elevation: 10.0,
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    const Text(
                      GnosisStrings.fingerPerceptionSummaryNote,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      GnosisStrings.fingerPerceptionSummaryScore,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12.0),
                    _buildSummaryScoreTable(),
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
                      // Save the scores to the model
                      saveToModel();

                      // Navigate back
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      CommonStrings.taskCompleted,
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

  Widget _buildHandDiagram(int index) {
    // Use actual hand diagram images
    // We have 7 images, so we'll cycle through them for indices 7-9
    String imagePath;
    if (index < 7) {
      imagePath = 'images/handdiagram${index + 1}.png';
    } else {
      // For patterns 8-10, reuse images 1-3
      imagePath = 'images/handdiagram${((index - 7) % 7) + 1}.png';
    }

    return Card(
      elevation: 5.0,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        height: 200.0,
        child: Center(
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              // Fallback if image fails to load
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    '${GnosisStrings.fingerPerceptionHandDiagram} ${index + 1}',
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildScoringTable(int patternIndex) {
    return Card(
      elevation: 10.0,
      color: Colors.green,
      child: RadioGroup<int>(
        groupValue: _patternScores[patternIndex],
        onChanged: (value) => _handlePatternScoreChange(patternIndex, value),
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
                  onTap: () => _handlePatternScoreChange(patternIndex, 0),
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio<int>(
                          value: 0,
                          fillColor:
                              WidgetStateProperty.resolveWith<Color>((states) {
                            if (states.contains(WidgetState.selected)) {
                              return Colors.white;
                            }
                            return Colors.black;
                          }),
                        ),
                        const Text(
                          CommonStrings.normal,
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
                  onTap: () => _handlePatternScoreChange(patternIndex, 1),
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio<int>(
                          value: 1,
                          fillColor:
                              WidgetStateProperty.resolveWith<Color>((states) {
                            if (states.contains(WidgetState.selected)) {
                              return Colors.white;
                            }
                            return Colors.black;
                          }),
                        ),
                        const Text(
                          CommonStrings.equivocal,
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
                  onTap: () => _handlePatternScoreChange(patternIndex, 2),
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio<int>(
                          value: 2,
                          fillColor:
                              WidgetStateProperty.resolveWith<Color>((states) {
                            if (states.contains(WidgetState.selected)) {
                              return Colors.white;
                            }
                            return Colors.black;
                          }),
                        ),
                        const Text(
                          CommonStrings.impaired,
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
    );
  }

  Widget _buildSummaryScoreTable() {
    return RadioGroup<int>(
      groupValue: _summaryScore,
      onChanged: _handleSummaryScoreChange,
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
                onTap: () => _handleSummaryScoreChange(0),
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                        value: 0,
                        fillColor:
                            WidgetStateProperty.resolveWith<Color>((states) {
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
                onTap: () => _handleSummaryScoreChange(1),
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                        value: 1,
                        fillColor:
                            WidgetStateProperty.resolveWith<Color>((states) {
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
                onTap: () => _handleSummaryScoreChange(2),
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                        value: 2,
                        fillColor:
                            WidgetStateProperty.resolveWith<Color>((states) {
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
    );
  }

  void _handlePatternScoreChange(int patternIndex, int? value) {
    setState(() {
      _patternScores[patternIndex] = value;
      // Update summary score based on individual scores
      _updateSummaryScore();
    });
  }

  void _handleSummaryScoreChange(int? value) {
    setState(() {
      _summaryScore = value;
    });
  }

  void _updateSummaryScore() {
    // Logic to calculate summary score based on individual pattern scores
    int impairedCount = _patternScores.where((score) => score == 2).length;
    int equivocalCount = _patternScores.where((score) => score == 1).length;

    if (impairedCount >= 2) {
      _summaryScore = 2; // Impaired
    } else if (impairedCount == 1 || equivocalCount >= 3) {
      _summaryScore = 1; // Equivocal
    } else {
      _summaryScore = 0; // Normal
    }
  }

  void saveToModel() {
    if (!mounted) return;

    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setGnosisFingerPerception(
      pattern1: _patternScores[0] ?? 0,
      pattern2: _patternScores[1] ?? 0,
      pattern3: _patternScores[2] ?? 0,
      pattern4: _patternScores[3] ?? 0,
      pattern5: _patternScores[4] ?? 0,
      pattern6: _patternScores[5] ?? 0,
      pattern7: _patternScores[6] ?? 0,
    );
  }

  void loadFromModel() {
    if (!mounted) return;

    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    setState(() {
      _patternScores[0] = scoreModel.gnosisFingerPerceptionPattern1;
      _patternScores[1] = scoreModel.gnosisFingerPerceptionPattern2;
      _patternScores[2] = scoreModel.gnosisFingerPerceptionPattern3;
      _patternScores[3] = scoreModel.gnosisFingerPerceptionPattern4;
      _patternScores[4] = scoreModel.gnosisFingerPerceptionPattern5;
      _patternScores[5] = scoreModel.gnosisFingerPerceptionPattern6;
      _patternScores[6] = scoreModel.gnosisFingerPerceptionPattern7;
    });
  }
}
