import 'package:flutter/material.dart';
import 'package:mica/src/providers/mica_provider.dart';

class LuriaFistEdgePalmMovement extends StatefulWidget {
  const LuriaFistEdgePalmMovement({super.key});

  @override
  LuriaFistEdgePalmMovementState createState() =>
      LuriaFistEdgePalmMovementState();
}

class LuriaFistEdgePalmMovementState
    extends State<LuriaFistEdgePalmMovement> {
  int rightHandCycleCount = 0;
  int leftHandCycleCount = 0;
  int? rightHandScore;
  int? leftHandScore;
  bool showExaminerInstructions = true;
  
  @override
  void initState() {
    super.initState();
    // Initialize with Impaired selected for both hands (count = 0)
    rightHandScore = 2;
    leftHandScore = 2;
  }
  
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Luria Fist-Edge-Palm Movement',
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
          // Purple examiner instruction card (conditionally shown)
          if (showExaminerInstructions)
            SizedBox(
              width: width * 0.9,
              child: Card(
                elevation: 10.0,
                color: Colors.deepPurple.shade300,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'The examiner performs alternating movements with the right hand by making a fist, then opening the hand with the edge touching the surface, and then the palm touching the surface. The patient is first asked to imitate the series and then continue on his/her own.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          if (showExaminerInstructions) const SizedBox(height: 16),
          
          // Yellow patient instruction card
          SizedBox(
            width: width * 0.9,
            child: Card(
              elevation: 10.0,
              color: Colors.yellowAccent.shade400,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '"Can you see what I am doing? Please join me and do the same."',
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
          
          // Purple instruction card
          SizedBox(
            width: width * 0.9,
            child: Card(
              elevation: 10.0,
              color: Colors.deepPurple.shade300,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'The patient should be able to perform 5 cycles correctly. Test both hands.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          // Purple card with hand movement image
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
                    'images/handmovement.png',
                    fit: BoxFit.contain,
                    height: 120,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          // Right Hand scoring card
          _buildHandScoringCard(
            'Right Hand',
            rightHandCycleCount,
            rightHandScore!,
            (increment) {
              setState(() {
                if (increment) {
                  rightHandCycleCount++;
                } else {
                  if (rightHandCycleCount > 0) rightHandCycleCount--;
                }
                _updateRightHandScore();
              });
            },
          ),
          const SizedBox(height: 16),
          
          // Left Hand scoring card
          _buildHandScoringCard(
            'Left Hand',
            leftHandCycleCount,
            leftHandScore!,
            (increment) {
              setState(() {
                if (increment) {
                  leftHandCycleCount++;
                } else {
                  if (leftHandCycleCount > 0) leftHandCycleCount--;
                }
                _updateLeftHandScore();
              });
            },
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
    );
  }
  
  Widget _buildHandScoringCard(
    String handLabel,
    int cycleCount,
    int selectedScore,
    Function(bool) onCountChanged,
  ) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        elevation: 10.0,
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                handLabel,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
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
                            'Tap to count Cycles',
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
                                onPressed: () => onCountChanged(true),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.remove,
                                  size: 32,
                                  color: Colors.black,
                                ),
                                onPressed: () => onCountChanged(false),
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
                      _buildScoreCell('Normal', 0, selectedScore, '5 cycles without any mistakes'),
                      _buildScoreCell('Equivocal', 1, selectedScore, '1 mistake'),
                      _buildScoreCell('Impaired', 2, selectedScore, '2 or more mistakes'),
                    ],
                  ),
                ],
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildScoreCell(String label, int value, int selectedScore, String description) {
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
                  return Colors.black54;
                }),
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  
  void _updateRightHandScore() {
    if (rightHandCycleCount == 0) {
      rightHandScore = 2; // Impaired
    } else if (rightHandCycleCount > 0 && rightHandCycleCount < 5) {
      rightHandScore = 1; // Equivocal
    } else {
      rightHandScore = 0; // Normal (>= 5)
    }
  }
  
  void _updateLeftHandScore() {
    if (leftHandCycleCount == 0) {
      leftHandScore = 2; // Impaired
    } else if (leftHandCycleCount > 0 && leftHandCycleCount < 5) {
      leftHandScore = 1; // Equivocal
    } else {
      leftHandScore = 0; // Normal (>= 5)
    }
  }
  
  void _saveScore() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);

    // Calculate average score from both hands
    // If one hand has no cycles, it defaults to 0 (Normal)
    int averageScore = ((rightHandScore ?? 0) + (leftHandScore ?? 0)) ~/ 2;
    int totalCycles = rightHandCycleCount + leftHandCycleCount;

    scoreModel.setExecutiveLuria(
      score: averageScore,
      count: totalCycles,
    );
  }
}