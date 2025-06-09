import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/providers/mica_provider.dart';

class DressingApraxia extends StatefulWidget {
  const DressingApraxia({super.key});

  @override
  State<DressingApraxia> createState() => _DressingApraxiaState();
}

class _DressingApraxiaState extends State<DressingApraxia> {
  int? _score;

  @override
  void initState() {
    super.initState();
    // Initialize from provider if needed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeFromProvider();
    });
  }

  void _initializeFromProvider() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    setState(() {
      // Initialize with existing score if any
      // Using praxisRight as the dressing apraxia score for now
      _score = scoreModel.praxisRight;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double height = 10.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dressing Apraxia',
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
                      'This task involves limb-kinetic, ideomotor, and to some extent ideational praxis. It is assessed by asking the patient to put on a hospital gown or other suitable piece of clothing such as a cardigan. Observe if the patient is able to put their hands and arms through the sleeves correctly and is able to fasten the buttons.',
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
                          'Note the response of the patient and score as below.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        // Table for scoring
                        Table(
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
                                            groupValue: _score,
                                            onChanged: _handleRadioChange,
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
                                            'Normal',
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
                                            groupValue: _score,
                                            onChanged: _handleRadioChange,
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
                                            'Equivocal',
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
                                            groupValue: _score,
                                            onChanged: _handleRadioChange,
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
                                            'Impaired',
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
                        'Task Completed',
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
    // Store the dressing apraxia score as praxisRight for now
    // You may want to add a specific field for dressing apraxia in the model
    scoreModel.setPraxisScores(
      right: _score ?? 0,
      left: scoreModel.praxisLeft,
    );
  }
}