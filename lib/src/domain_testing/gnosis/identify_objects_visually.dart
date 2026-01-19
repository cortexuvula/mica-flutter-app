import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/utils/screen_routes.dart';
import 'package:mica/src/services/persistence_service.dart';
import 'package:mica/resources/strings/gnosis_strings.dart';
import 'package:mica/resources/strings/common_strings.dart';

class IdentifyObjectsVisually extends StatefulWidget {
  const IdentifyObjectsVisually({super.key});

  @override
  State<IdentifyObjectsVisually> createState() => _IdentifyObjectsVisuallyState();
}

class _IdentifyObjectsVisuallyState extends State<IdentifyObjectsVisually> {
  int? _radioValue = 0; // 0 = Normal, 1 = Equivocal, 2 = Impaired
  
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
    scoreModel.setCurrentScreen(ScreenRoutes.gnosisIdentifyVisually);
    PersistenceService.saveProgressImmediate(scoreModel);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          GnosisStrings.identifyObjectsVisually,
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
            // Purple instruction card for examiner
            Card(
              elevation: 10.0,
              color: Colors.deepPurple.shade300,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  GnosisStrings.visualIdentificationExaminerInstruction,
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
            
            // Yellow instruction card for patient
            Card(
              elevation: 10.0,
              color: Colors.yellowAccent.shade700,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  GnosisStrings.visualIdentificationPatientInstruction,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            
            // Purple detailed instruction card
            Card(
              elevation: 10.0,
              color: Colors.deepPurple.shade300,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: const [
                    Text(
                      GnosisStrings.visualIdentificationCommonObjects,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      GnosisStrings.visualIdentificationUncommonObjects,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      GnosisStrings.visualIdentificationDistinguishing,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            
            // Green scoring card
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
                    RadioGroup<int>(
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
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
                                onTap: () => _handleRadioValueChange(0),
                                child: Container(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 0,
                                        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
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
                                onTap: () => _handleRadioValueChange(1),
                                child: Container(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 1,
                                        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
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
                                onTap: () => _handleRadioValueChange(2),
                                child: Container(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 2,
                                        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
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
  
  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value;
    });
  }
  
  void saveToModel() {
    if (!mounted) return;

    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    // Note: Current implementation uses single score - saved to nominalDysphasia field
    // Future enhancement: Refactor test to separately assess nominal dysphasia vs visual agnosia
    scoreModel.setGnosisVisualIdentification(
      nominalDysphasia: _radioValue ?? 0,
      visualAgnosia: 0, // Not separately assessed in current implementation
    );
  }

  void loadFromModel() {
    if (!mounted) return;

    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    setState(() {
      _radioValue = scoreModel.gnosisVisualNominalDysphasia;
    });
  }
}