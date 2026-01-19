import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/utils/screen_routes.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/services/persistence_service.dart';
import 'package:mica/resources/strings/memory_strings.dart';
import 'package:mica/resources/strings/common_strings.dart';

class TenWordVerbalRecall extends StatefulWidget {
  const TenWordVerbalRecall({super.key});

  @override
  State<TenWordVerbalRecall> createState() => _TenWordVerbalRecallState();
}

class _TenWordVerbalRecallState extends State<TenWordVerbalRecall> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _saveCurrentScreen();
    });
  }

  void _saveCurrentScreen() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setCurrentScreen(ScreenRoutes.memoryTenWordRecall);
    PersistenceService.saveProgressImmediate(scoreModel);
  }

  // Memory items
  final List<String> memoryItems = [
    'CARROT',
    'BOAT',
    'LION',
    'EYE',
    'JUG',
    'CAT',
    'SOUP',
    'LEG',
    'HOUSE',
    'TICKET'
  ];

  // Shuffled items for Trial 3
  final List<String> trial3Items = [
    'SOUP',
    'TICKET',
    'BOAT',
    'JUG',
    'EYE',
    'CAT',
    'HOUSE',
    'LION',
    'LEG',
    'CARROT'
  ];

  // Recognition test items (includes distractors)
  final List<Map<String, dynamic>> recognitionItems = [
    {'word': 'CARROT', 'isOriginal': true},
    {'word': 'ONION', 'isOriginal': false},
    {'word': 'BUG', 'isOriginal': false},
    {'word': 'JUG', 'isOriginal': true},
    {'word': 'SHIP', 'isOriginal': false},
    {'word': 'BOAT', 'isOriginal': true},
    {'word': 'LION', 'isOriginal': true},
    {'word': 'WOLF', 'isOriginal': false},
    {'word': 'EYE', 'isOriginal': true},
    {'word': 'EAR', 'isOriginal': false},
    {'word': 'CAT', 'isOriginal': true},
    {'word': 'DOG', 'isOriginal': false},
    {'word': 'SOUP', 'isOriginal': true},
    {'word': 'STEW', 'isOriginal': false},
    {'word': 'LEG', 'isOriginal': true},
    {'word': 'ARM', 'isOriginal': false},
    {'word': 'HOUSE', 'isOriginal': true},
    {'word': 'HOME', 'isOriginal': false},
    {'word': 'TICKET', 'isOriginal': true},
    {'word': 'RECEIPT', 'isOriginal': false},
  ];

  // Track selected items for each trial
  Map<int, List<bool>> trialSelections = {
    1: List.filled(10, false),
    2: List.filled(10, false),
    3: List.filled(10, false),
  };

  // Track scores for each trial
  Map<int, int> trialScores = {
    1: 0,
    2: 0,
    3: 0,
  };

  // Track selected responses for recognition test
  Map<String, bool?> recognitionResponses = {};

  // Current step in the test
  int currentStep = 0;
  // Current trial (1, 2, or 3)
  int currentTrial = 1;
  
  // Track delayed recall selections
  List<bool> delayedRecallSelected = List.filled(10, false);

  String getTitle() {
    if (currentStep == 0 && currentTrial == 1) return MemoryStrings.tenWordWorkingMemoryTitle;
    if (currentStep == 1) return MemoryStrings.tenWordIntermissionTitle;
    if (currentStep == 2 && currentTrial == 2) return MemoryStrings.tenWordShortTermTitle;
    if (currentStep == 3 && currentTrial == 3) return MemoryStrings.tenWordShortTermTitle;
    if (currentStep == 4) return MemoryStrings.tenWordShortTermTitle;
    if (currentStep == 5) return MemoryStrings.tenWordShortTermTitle;
    if (currentStep == 6) return MemoryStrings.tenWordResultsTitle;
    return MemoryStrings.tenWordMemoryTestTitle;
  }

  String getSubtitle() {
    if (currentStep == 0 && currentTrial == 1) return MemoryStrings.tenWordVerbalTrial1;
    if (currentStep == 2 && currentTrial == 2) return MemoryStrings.tenWordVerbalTrial2;
    if (currentStep == 3 && currentTrial == 3) return MemoryStrings.tenWordVerbalTrial3;
    if (currentStep == 4) return MemoryStrings.tenWordDelayedRecall;
    if (currentStep == 5) return MemoryStrings.tenWordRecognition;
    return '';
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              getTitle(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
              ),
            ),
            if (getSubtitle().isNotEmpty)
              Text(
                getSubtitle(),
                style: const TextStyle(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (currentStep == 0) ..._buildTrialStep(width, 1),
                if (currentStep == 1) ..._buildIntermissionStep(width),
                if (currentStep == 2) ..._buildTrialStep(width, 2),
                if (currentStep == 3) ..._buildTrial3Step(width),
                if (currentStep == 4) ..._buildDelayedRecallStep(width),
                if (currentStep == 5) ..._buildRecognitionStep(width),
                if (currentStep == 6) ..._buildResultsStep(width),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTrialStep(double width, int trial) {
    return [
      Container(
        width: width * 0.9,
        constraints: const BoxConstraints(maxWidth: 600),
        child: Column(
          children: [
            // White card containing all instructions
            Card(
              elevation: 10.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      MemoryStrings.tenWordScrollInstruction,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20.0),
                    if (trial == 1) ...[
                      // Yellow instruction card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent.shade700,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          MemoryStrings.tenWordTrial1PatientInstruction,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      // Purple instruction card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade300,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          MemoryStrings.tenWordRepeatWordInstruction,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ] else if (trial == 2) ...[
                      // Purple instruction card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade300,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          MemoryStrings.tenWordReadWordsInstruction,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                    const SizedBox(height: 16.0),
                    // Yellow question card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent.shade700,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        MemoryStrings.tenWordWhatWereThoseWords,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if (trial == 2) ...[
                      const SizedBox(height: 16.0),
                      // Purple instruction card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade300,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          MemoryStrings.tenWordTapRecalledInstruction,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      // Yellow instruction card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent.shade700,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          MemoryStrings.tenWordRememberLaterInstruction,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            // Memory items in grid - make tappable for trials
            ...List.generate((memoryItems.length / 2).ceil(), (rowIndex) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Left item
                    if (rowIndex * 2 < memoryItems.length)
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              trialSelections[trial]![rowIndex * 2] =
                                  !trialSelections[trial]![rowIndex * 2];
                              // Update score
                              trialScores[trial] = trialSelections[trial]!
                                  .where((selected) => selected)
                                  .length;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 6.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 24.0, horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: trialSelections[trial]![rowIndex * 2]
                                  ? Colors.green
                                  : Colors.yellowAccent.shade700,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              memoryItems[rowIndex * 2],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    // Right item
                    if (rowIndex * 2 + 1 < memoryItems.length)
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              trialSelections[trial]![rowIndex * 2 + 1] =
                                  !trialSelections[trial]![rowIndex * 2 + 1];
                              // Update score
                              trialScores[trial] = trialSelections[trial]!
                                  .where((selected) => selected)
                                  .length;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 6.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 24.0, horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: trialSelections[trial]![rowIndex * 2 + 1]
                                  ? Colors.green
                                  : Colors.yellowAccent.shade700,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              memoryItems[rowIndex * 2 + 1],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    if (rowIndex * 2 + 1 >= memoryItems.length)
                      const Expanded(child: SizedBox()),
                  ],
                ),
              );
            }),
            const SizedBox(height: 20.0),
            // Continue button
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
                            setState(() {
                              if (trial == 1) {
                                currentStep = 2; // Go directly to trial 2
                                currentTrial = 2;
                              } else if (trial == 2) {
                                currentStep = 3; // Go to trial 3
                                currentTrial = 3;
                              }
                            });
                          },
                          child: const Text(
                            CommonStrings.continueButton,
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
    ];
  }

  List<Widget> _buildTrial3Step(double width) {
    return [
      Container(
        width: width * 0.9,
        constraints: const BoxConstraints(maxWidth: 600),
        child: Column(
          children: [
            // White card containing all instructions
            Card(
              elevation: 10.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      MemoryStrings.tenWordScrollInstruction,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20.0),
                    // Purple instruction card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade300,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        MemoryStrings.tenWordReadWordsInstruction,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Yellow question card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent.shade700,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        MemoryStrings.tenWordWhatWereThoseWords,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Purple instruction card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade300,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        MemoryStrings.tenWordTapRecalledInstruction,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Yellow instruction card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent.shade700,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        MemoryStrings.tenWordRememberLaterInstruction,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            // Memory items in different order for Trial 3
            ...List.generate((trial3Items.length / 2).ceil(), (rowIndex) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Left item
                    if (rowIndex * 2 < trial3Items.length)
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              // Find index in original list
                              int originalIndex = memoryItems.indexOf(trial3Items[rowIndex * 2]);
                              trialSelections[3]![originalIndex] =
                                  !trialSelections[3]![originalIndex];
                              // Update score
                              trialScores[3] = trialSelections[3]!
                                  .where((selected) => selected)
                                  .length;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 6.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 24.0, horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: trialSelections[3]![
                                      memoryItems.indexOf(trial3Items[rowIndex * 2])]
                                  ? Colors.green
                                  : Colors.yellowAccent.shade700,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              trial3Items[rowIndex * 2],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    // Right item
                    if (rowIndex * 2 + 1 < trial3Items.length)
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              // Find index in original list
                              int originalIndex = memoryItems.indexOf(trial3Items[rowIndex * 2 + 1]);
                              trialSelections[3]![originalIndex] =
                                  !trialSelections[3]![originalIndex];
                              // Update score
                              trialScores[3] = trialSelections[3]!
                                  .where((selected) => selected)
                                  .length;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 6.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 24.0, horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: trialSelections[3]![
                                      memoryItems.indexOf(trial3Items[rowIndex * 2 + 1])]
                                  ? Colors.green
                                  : Colors.yellowAccent.shade700,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              trial3Items[rowIndex * 2 + 1],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    if (rowIndex * 2 + 1 >= trial3Items.length)
                      const Expanded(child: SizedBox()),
                  ],
                ),
              );
            }),
            const SizedBox(height: 20.0),
            // Continue button
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
                            setState(() {
                              currentStep = 1; // Go to intermission before recognition
                            });
                          },
                          child: const Text(
                            CommonStrings.continueButton,
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
    ];
  }

  List<Widget> _buildIntermissionStep(double width) {
    return [
      // Purple instruction card
      Card(
        elevation: 10.0,
        color: Colors.deepPurple.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          width: width * 0.9,
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(24.0),
          child: const Text(
            MemoryStrings.tenWordIntermissionInstruction,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const SizedBox(height: 40.0),
      // Continue button
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
                      setState(() {
                        currentStep = 4; // Go to recognition
                      });
                    },
                    child: const Text(
                      CommonStrings.continueButton,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildDelayedRecallStep(double width) {
    return [
      Container(
        width: width * 0.9,
        constraints: const BoxConstraints(maxWidth: 600),
        child: Column(
          children: [
            // White card containing instruction
            Card(
              elevation: 10.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Yellow instruction card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent.shade700,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        MemoryStrings.tenWordDelayedRecallInstruction,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            // Memory items in grid - make tappable
            ...List.generate((memoryItems.length / 2).ceil(), (rowIndex) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Left item
                    if (rowIndex * 2 < memoryItems.length)
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              delayedRecallSelected[rowIndex * 2] =
                                  !delayedRecallSelected[rowIndex * 2];
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 6.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 24.0, horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: delayedRecallSelected[rowIndex * 2]
                                  ? Colors.green
                                  : Colors.yellowAccent.shade700,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              memoryItems[rowIndex * 2],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    // Right item
                    if (rowIndex * 2 + 1 < memoryItems.length)
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              delayedRecallSelected[rowIndex * 2 + 1] =
                                  !delayedRecallSelected[rowIndex * 2 + 1];
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 6.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 24.0, horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: delayedRecallSelected[rowIndex * 2 + 1]
                                  ? Colors.green
                                  : Colors.yellowAccent.shade700,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              memoryItems[rowIndex * 2 + 1],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    if (rowIndex * 2 + 1 >= memoryItems.length)
                      const Expanded(child: SizedBox()),
                  ],
                ),
              );
            }),
            const SizedBox(height: 20.0),
            // Continue button
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
                            setState(() {
                              currentStep = 5; // Go to recognition
                            });
                          },
                          child: const Text(
                            CommonStrings.continueButton,
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
    ];
  }

  List<Widget> _buildRecognitionStep(double width) {
    return [
      // Instruction card
      Card(
        elevation: 10.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          width: width * 0.9,
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                MemoryStrings.tenWordScrollInstruction,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              // Yellow instruction card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent.shade700,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  MemoryStrings.tenWordRecognitionPatientInstruction,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16.0),
              // Purple instruction card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade300,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  MemoryStrings.tenWordRecognitionExaminerInstruction,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20.0),
      // Recognition items
      Container(
        width: width * 0.9,
        constraints: const BoxConstraints(maxWidth: 600),
        child: Column(
          children: recognitionItems.map((item) {
            String word = item['word'];
            bool isOriginal = item['isOriginal'];
            bool? response = recognitionResponses[word];

            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Card(
                elevation: 5.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          word,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight:
                                isOriginal ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  recognitionResponses[word] = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 12.0),
                                decoration: BoxDecoration(
                                  color: response == true
                                      ? Colors.deepPurple.shade300
                                      : Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  'Yes',
                                  style: TextStyle(
                                    color: response == true
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  recognitionResponses[word] = false;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 12.0),
                                decoration: BoxDecoration(
                                  color: response == false
                                      ? Colors.deepPurple.shade300
                                      : Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  'No',
                                  style: TextStyle(
                                    color: response == false
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
      const SizedBox(height: 40.0),
      // Continue button
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
                      setState(() {
                        currentStep = 6; // Go to results
                      });
                    },
                    child: const Text(
                      CommonStrings.continueButton,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildResultsStep(double width) {
    // Calculate delayed recall score
    int delayedScore = delayedRecallSelected.where((selected) => selected).length;
    
    // Calculate recognition scores
    int correctInList = 0;
    int correctNotInList = 0;
    for (final item in recognitionItems) {
      bool? response = recognitionResponses[item['word']];
      if (response != null) {
        if (item['isOriginal'] && response == true) {
          correctInList++;
        } else if (!item['isOriginal'] && response == false) {
          correctNotInList++;
        }
      }
    }

    return [
      // Score Summary card
      Card(
        elevation: 10.0,
        color: Colors.deepPurple.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          width: width * 0.9,
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Text(
                MemoryStrings.tenWordScoreSummary,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        MemoryStrings.tenWordWorkingMemoryLabel,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Verbal Memory Trial 1: ${trialScores[1]}/10',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        MemoryStrings.tenWordShortTermMemoryLabel,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Verbal Memory Trial 2: ${trialScores[2]}/10',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        'Verbal Memory Trial 3: ${trialScores[3]}/10',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        'Verbal Memory Delayed Recall: $delayedScore/10',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        'Verbal Recognition Memory: ${correctInList + correctNotInList}/20',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        'Verbal Recognition Memory - In List: $correctInList/10',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        'Verbal Recognition Memory - Not In List: $correctNotInList/10',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 40.0),
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

                      // Save recognition test breakdown
                      int totalCorrect = correctInList + correctNotInList;
                      int falsePositives = 10 - correctNotInList; // Words NOT in list incorrectly identified as being in list

                      scoreModel.setMemoryTenWordRecognition(
                        correct: totalCorrect,
                        falsePositive: falsePositives,
                      );

                      // Trial scores are already saved via setTrialScores() during the test

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
    ];
  }
}