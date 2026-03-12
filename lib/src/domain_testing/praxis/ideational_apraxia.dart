import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/utils/screen_routes.dart';
import 'package:mica/src/services/persistence_service.dart';
import 'package:mica/resources/strings/praxis_strings.dart';
import 'package:mica/resources/strings/common_strings.dart';

class IdeationalApraxia extends StatefulWidget {
  const IdeationalApraxia({super.key});

  @override
  State<IdeationalApraxia> createState() => _IdeationalApraxiaState();
}

class _IdeationalApraxiaState extends State<IdeationalApraxia> {
  int? _score;

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
    scoreModel.setCurrentScreen(ScreenRoutes.praxisIdeational);
    PersistenceService.saveProgressImmediate(scoreModel);
  }

  void _initializeFromProvider() {
    if (!mounted) return;
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    setState(() {
      _score = scoreModel.praxisIdeational;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double height = 10.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          PraxisStrings.ideationalTitle,
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
              // Examiner instruction card 1 (purple)
              SizedBox(
                width: width * 0.9,
                child: Card(
                  elevation: 10.0,
                  color: Colors.deepPurple.shade300,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      PraxisStrings.ideationalExaminerInstruction1,
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
              
              // Patient instruction card (yellow)
              SizedBox(
                width: width * 0.9,
                child: Card(
                  elevation: 10.0,
                  color: Colors.yellowAccent.shade400,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      PraxisStrings.ideationalPatientInstruction,
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
              
              // Examiner instruction card 2 (purple)
              SizedBox(
                width: width * 0.9,
                child: Card(
                  elevation: 10.0,
                  color: Colors.deepPurple.shade300,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      PraxisStrings.ideationalExaminerInstruction2,
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
                        // Table for scoring
                        RadioGroup<int>(
                          groupValue: _score,
                          onChanged: _handleRadioChange,
                          child: Table(
                          border: TableBorder.all(
                            color: Colors.black54,
                            width: 1.0,
                          ),
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          columnWidths: const {
                            0: FlexColumnWidth(1),
                            1: FlexColumnWidth(1),
                            2: FlexColumnWidth(1),
                          },
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: InkWell(
                                    onTap: () => _handleRadioChange(0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
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
                                          const SizedBox(width: 8.0),
                                          const Text(
                                            CommonStrings.normal,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
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
                                    onTap: () => _handleRadioChange(1),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
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
                                          const SizedBox(width: 8.0),
                                          const Text(
                                            CommonStrings.equivocal,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
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
                                    onTap: () => _handleRadioChange(2),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
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
                                          const SizedBox(width: 8.0),
                                          const Text(
                                            CommonStrings.impaired,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
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
                        // Save score to provider
                        _saveScore();
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

  void _handleRadioChange(int? value) {
    setState(() {
      _score = value;
    });
    // Save to provider immediately
    _saveScore();
  }

  void _saveScore() {
    if (!mounted) return;
    
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setPraxisIdeational(_score ?? 0);
  }
}