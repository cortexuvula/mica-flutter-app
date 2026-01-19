import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/utils/screen_routes.dart';
import 'package:mica/src/services/persistence_service.dart';
import 'package:mica/resources/strings/gnosis_strings.dart';
import 'package:mica/resources/strings/common_strings.dart';

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
      _saveCurrentScreen();
    });
  }

  void _saveCurrentScreen() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setCurrentScreen(ScreenRoutes.gnosisIdentifyByTouch);
    PersistenceService.saveProgressImmediate(scoreModel);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          GnosisStrings.identifyObjectsByTouch,
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
                  GnosisStrings.touchIdentificationPatientInstruction,
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
                  GnosisStrings.touchIdentificationExaminerInstruction,
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
                      CommonStrings.noteResponseAndScore,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16.0),
                    // Header row
                    Table(
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      border: TableBorder.all(
                        color: Colors.black54,
                        width: 1.0,
                      ),
                      children: [
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
                                CommonStrings.normal,
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
                                CommonStrings.equivocal,
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
                                CommonStrings.impaired,
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
                      ],
                    ),
                    // Right hand scoring row
                    RadioGroup<int>(
                      groupValue: _rightHandRadioValue,
                      onChanged: _handleRightHandRadioValueChange,
                      child: Table(
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      border: TableBorder.all(
                        color: Colors.black54,
                        width: 1.0,
                      ),
                      children: [
                        TableRow(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              child: const Text(
                                GnosisStrings.touchIdentificationRightHand,
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
                      ],
                    ),
                    ),
                    // Left hand scoring row
                    RadioGroup<int>(
                      groupValue: _leftHandRadioValue,
                      onChanged: _handleLeftHandRadioValueChange,
                      child: Table(
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      border: TableBorder.all(
                        color: Colors.black54,
                        width: 1.0,
                      ),
                      children: [
                        TableRow(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              child: const Text(
                                GnosisStrings.touchIdentificationLeftHand,
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
                      ],
                    ),
                    ),
                    // Footer row
                    Table(
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      border: TableBorder.all(
                        color: Colors.black54,
                        width: 1.0,
                      ),
                      children: [
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
                                GnosisStrings.touchIdentificationNoErrors,
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
                                GnosisStrings.touchIdentificationSomeDifficulty,
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
                                GnosisStrings.touchIdentificationClearDifficulty,
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
    if (!mounted) return;

    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setGnosisAstereognosis(
      rightHand: _rightHandRadioValue ?? 0,
      leftHand: _leftHandRadioValue ?? 0,
    );
  }

  void loadFromModel() {
    if (!mounted) return;

    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    setState(() {
      _rightHandRadioValue = scoreModel.gnosisAstereognosisRight;
      _leftHandRadioValue = scoreModel.gnosisAstereognosisLeft;
    });
  }
}