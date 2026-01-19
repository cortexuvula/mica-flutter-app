import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/utils/screen_routes.dart';
import 'package:mica/src/services/persistence_service.dart';
import 'package:mica/resources/strings/praxis_strings.dart';
import 'package:mica/resources/strings/common_strings.dart';

class OralApraxia extends StatefulWidget {
  const OralApraxia({super.key});

  @override
  State<OralApraxia> createState() => _OralApraxiaState();
}

class _OralApraxiaState extends State<OralApraxia> {
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
    scoreModel.setCurrentScreen(ScreenRoutes.praxisOral);
    PersistenceService.saveProgressImmediate(scoreModel);
  }

  void _initializeFromProvider() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    setState(() {
      // Initialize with existing score if any
      // Using praxisLeft as the oral apraxia score for now
      _score = scoreModel.praxisLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double height = 10.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          PraxisStrings.oralTitle,
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
                      PraxisStrings.oralExaminerInstruction,
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
                      PraxisStrings.oralPatientInstruction1,
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
                      PraxisStrings.oralPatientInstruction2,
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
              
              // Patient instruction card 3 (yellow)
              SizedBox(
                width: width * 0.9,
                child: Card(
                  elevation: 10.0,
                  color: Colors.yellowAccent.shade400,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      PraxisStrings.oralPatientInstruction3,
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
    // Store the oral apraxia score as praxisLeft for now
    // You may want to add a specific field for oral apraxia in the model
    scoreModel.setPraxisScores(
      right: scoreModel.praxisRight,
      left: _score ?? 0,
    );
  }
}