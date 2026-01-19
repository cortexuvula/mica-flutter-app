import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/utils/screen_routes.dart';
import 'package:mica/src/services/persistence_service.dart';
import 'package:mica/resources/strings/praxis_strings.dart';
import 'package:mica/resources/strings/common_strings.dart';

class IdeomotorApraxia extends StatefulWidget {
  const IdeomotorApraxia({super.key});

  @override
  State<IdeomotorApraxia> createState() => _IdeomotorApraxiaState();
}

class _IdeomotorApraxiaState extends State<IdeomotorApraxia> {
  int? _rightHandScore;
  int? _leftHandScore;

  @override
  void initState() {
    super.initState();
    // Initialize from provider if needed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeFromProvider();
      _saveCurrentScreen();
    });
  }

  void _saveCurrentScreen() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setCurrentScreen(ScreenRoutes.praxisIdeomotor);
    PersistenceService.saveProgressImmediate(scoreModel);
  }

  void _initializeFromProvider() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    setState(() {
      // Initialize with existing scores if any
      _rightHandScore = scoreModel.praxisRight;
      _leftHandScore = scoreModel.praxisLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double height = 10.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          PraxisStrings.ideomotorTitle,
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
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Examiner instruction card (purple)
              SizedBox(
                width: width * 0.9,
                child: Card(
                  elevation: 10.0,
                  color: Colors.deepPurple.shade300,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      PraxisStrings.ideomotorExaminerInstruction,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height),
              
              // Patient instruction card 1 (yellow)
              SizedBox(
                width: width * 0.9,
                child: Card(
                  elevation: 10.0,
                  color: Colors.yellowAccent.shade400,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      PraxisStrings.ideomotorPatientInstruction1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height),
              
              // Patient instruction card 2 (yellow)
              SizedBox(
                width: width * 0.9,
                child: Card(
                  elevation: 10.0,
                  color: Colors.yellowAccent.shade400,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      PraxisStrings.ideomotorPatientInstruction2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height),
              
              // Scoring card (green)
              SizedBox(
                width: width * 0.9,
                child: Card(
                  elevation: 10.0,
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          CommonStrings.noteResponseAndScore,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        // Right hand scoring row
                        RadioGroup<int>(
                          groupValue: _rightHandScore,
                          onChanged: (value) => _handleRadioChange(true, value),
                          child: Table(
                          border: TableBorder.all(
                            color: Colors.black54,
                            width: 1.0,
                          ),
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          columnWidths: const {
                            0: FlexColumnWidth(0.2),
                            1: FlexColumnWidth(0.27),
                            2: FlexColumnWidth(0.27),
                            3: FlexColumnWidth(0.26),
                          },
                          children: [
                            TableRow(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    PraxisStrings.right,
                                    style: TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                                TableCell(
                                  child: InkWell(
                                    onTap: () => _handleRadioChange(true, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Radio<int>(
                                          value: 0,
                                          fillColor: WidgetStateProperty.resolveWith<Color>(
                                            (states) {
                                              if (states.contains(WidgetState.selected)) {
                                                return Colors.white;
                                              }
                                              return Colors.black;
                                            },
                                          ),
                                        ),
                                        const Text(
                                          CommonStrings.normal,
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: InkWell(
                                    onTap: () => _handleRadioChange(true, 1),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Radio<int>(
                                          value: 1,
                                          fillColor: WidgetStateProperty.resolveWith<Color>(
                                            (states) {
                                              if (states.contains(WidgetState.selected)) {
                                                return Colors.white;
                                              }
                                              return Colors.black;
                                            },
                                          ),
                                        ),
                                        const Text(
                                          CommonStrings.equivocal,
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: InkWell(
                                    onTap: () => _handleRadioChange(true, 2),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Radio<int>(
                                          value: 2,
                                          fillColor: WidgetStateProperty.resolveWith<Color>(
                                            (states) {
                                              if (states.contains(WidgetState.selected)) {
                                                return Colors.white;
                                              }
                                              return Colors.black;
                                            },
                                          ),
                                        ),
                                        const Text(
                                          CommonStrings.impaired,
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                      ],
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
                          groupValue: _leftHandScore,
                          onChanged: (value) => _handleRadioChange(false, value),
                          child: Table(
                          border: TableBorder.all(
                            color: Colors.black54,
                            width: 1.0,
                          ),
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          columnWidths: const {
                            0: FlexColumnWidth(0.2),
                            1: FlexColumnWidth(0.27),
                            2: FlexColumnWidth(0.27),
                            3: FlexColumnWidth(0.26),
                          },
                          children: [
                            TableRow(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    PraxisStrings.left,
                                    style: TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                                TableCell(
                                  child: InkWell(
                                    onTap: () => _handleRadioChange(false, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Radio<int>(
                                          value: 0,
                                          fillColor: WidgetStateProperty.resolveWith<Color>(
                                            (states) {
                                              if (states.contains(WidgetState.selected)) {
                                                return Colors.white;
                                              }
                                              return Colors.black;
                                            },
                                          ),
                                        ),
                                        const Text(
                                          CommonStrings.normal,
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: InkWell(
                                    onTap: () => _handleRadioChange(false, 1),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Radio<int>(
                                          value: 1,
                                          fillColor: WidgetStateProperty.resolveWith<Color>(
                                            (states) {
                                              if (states.contains(WidgetState.selected)) {
                                                return Colors.white;
                                              }
                                              return Colors.black;
                                            },
                                          ),
                                        ),
                                        const Text(
                                          CommonStrings.equivocal,
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: InkWell(
                                    onTap: () => _handleRadioChange(false, 2),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Radio<int>(
                                          value: 2,
                                          fillColor: WidgetStateProperty.resolveWith<Color>(
                                            (states) {
                                              if (states.contains(WidgetState.selected)) {
                                                return Colors.white;
                                              }
                                              return Colors.black;
                                            },
                                          ),
                                        ),
                                        const Text(
                                          CommonStrings.impaired,
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                      ],
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
                          border: TableBorder.all(
                            color: Colors.black54,
                            width: 1.0,
                          ),
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          columnWidths: const {
                            0: FlexColumnWidth(0.2),
                            1: FlexColumnWidth(0.27),
                            2: FlexColumnWidth(0.27),
                            3: FlexColumnWidth(0.26),
                          },
                          children: [
                            const TableRow(
                              children: [
                                TableCell(child: SizedBox(height: 40)),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      PraxisStrings.noErrors,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      PraxisStrings.someDifficulty,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      PraxisStrings.clearDifficulty,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 12.0),
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
              ),
              SizedBox(height: height),
              
              // Task completed button
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
                      ),
                      onPressed: () {
                        // Save scores to provider
                        _saveScores();
                        // Navigate back
                        Navigator.pop(context);
                      },
                      child: const Text(
                        CommonStrings.taskCompleted,
                        style: TextStyle(color: Colors.black),
                      ),
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

  void _handleRadioChange(bool isRightHand, int? value) {
    setState(() {
      if (isRightHand) {
        _rightHandScore = value;
      } else {
        _leftHandScore = value;
      }
    });
    // Save to provider immediately
    _saveScores();
  }

  void _saveScores() {
    if (!mounted) return;
    
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setPraxisScores(
      right: _rightHandScore ?? 0,
      left: _leftHandScore ?? 0,
    );
  }
}