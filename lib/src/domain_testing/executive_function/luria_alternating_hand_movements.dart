import 'package:flutter/material.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/utils/screen_routes.dart';
import 'package:mica/src/services/persistence_service.dart';
import 'package:mica/resources/strings/executive_strings.dart';
import 'package:mica/resources/strings/common_strings.dart';

class LuriaAlternatingHandMovements extends StatefulWidget {
  const LuriaAlternatingHandMovements({super.key});

  @override
  LuriaAlternatingHandMovementsState createState() =>
      LuriaAlternatingHandMovementsState();
}

class LuriaAlternatingHandMovementsState
    extends State<LuriaAlternatingHandMovements> {
  int cycleCount = 0;
  int? selectedScore;
  
  @override
  void initState() {
    super.initState();
    // Initialize with Impaired selected (count = 0)
    selectedScore = 2;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _saveCurrentScreen();
    });
  }

  void _saveCurrentScreen() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setCurrentScreen(ScreenRoutes.executiveLuriaAlternating);
    PersistenceService.saveProgressImmediate(scoreModel);
  }
  
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ExecutiveStrings.luriaAlternatingTitle,
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
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          // Yellow instruction card
          SizedBox(
            width: width * 0.9,
            child: Card(
              elevation: 10.0,
              color: Colors.yellowAccent.shade400,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  ExecutiveStrings.luriaAlternatingPatientInstruction,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          // Purple card with hand movement images
          SizedBox(
            width: width * 0.9,
            child: Card(
              elevation: 10.0,
              color: Colors.deepPurple.shade300,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2.0),
                  ),
                  child: Image.asset(
                    'images/hands.png',
                    fit: BoxFit.contain,
                    height: 120,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          
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
                    // Cycle counter
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 80,
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                cycleCount.toString(),
                                style: const TextStyle(
                                  fontSize: 36,
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
                            height: 80,
                            color: Colors.lightBlueAccent.shade100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  ExecutiveStrings.tapToCountCycles,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        size: 32,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          cycleCount++;
                                          _updateScoreBasedOnCount();
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.remove,
                                        size: 32,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (cycleCount > 0) cycleCount--;
                                          _updateScoreBasedOnCount();
                                        });
                                      },
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
                    RadioGroup<int>(
                      groupValue: selectedScore,
                      onChanged: (int? value) {}, // Disabled - scores auto-calculated
                      child: Table(
                      border: TableBorder.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      children: [
                        TableRow(
                          children: [
                            _buildScoreCell(CommonStrings.normal, 0, ExecutiveStrings.fiveCyclesNoMistakes),
                            _buildScoreCell(CommonStrings.equivocal, 1, ExecutiveStrings.oneMistake),
                            _buildScoreCell(CommonStrings.impaired, 2, ExecutiveStrings.twoOrMoreMistakes),
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
                    _saveScore();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    CommonStrings.taskCompleted,
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
    );
  }
  
  Widget _buildScoreCell(String label, int value, String description) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.green,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<int>(
                value: value,
                fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.selected)) {
                    return Colors.white;
                  }
                  return Colors.black54; // Slightly grayed out when not selected
                }),
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  
  void _updateScoreBasedOnCount() {
    if (cycleCount == 0) {
      selectedScore = 2; // Impaired
    } else if (cycleCount >= 1 && cycleCount <= 4) {
      selectedScore = 1; // Equivocal
    } else {
      selectedScore = 0; // Normal (>= 5)
    }
  }
  
  void _saveScore() {
    if (selectedScore != null) {
      final scoreModel = MicaProviders.getScoreModel(context, listen: false);
      scoreModel.setExecutiveLuria(
        score: selectedScore!,
        count: cycleCount,
      );
    }
  }
}