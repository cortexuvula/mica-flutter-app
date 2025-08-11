import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/utils/navigation_helper.dart';

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
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Identify Objects Visually',
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
                  'Point towards the following objects and ask the patient to name it. Inability to name objects (nominal dysphasia) must be distinguished from visual object agnosia.',
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
                  '"Can you tell me what this is?"',
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
                      'Point to a watch, pen, tissue, button, shoe, and shirt.',
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
                      'Less common objects are: knuckles, ring finger, eyebrow, winder of a watch, and collar.',
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
                      'To distinguish between nominal aphasia and visual object agnosia, ask the patient to describe the object or its use. If this can be done adequately then visual perception might be normal and the deficit is more likely language based. Language deficits can be further examined by providing the patient with language cues by saying either a part of the word or giving a phonetic clue. For example, say "col..." for collar or say it sounds like "dollar" Some patients may then be able to progress and say the word, the deficit is then more likely to be nominal aphasia.',
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
                      'Note the response of the patient and score as below.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16.0),
                    Table(
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
                                        groupValue: _radioValue,
                                        onChanged: _handleRadioValueChange,
                                        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
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
                                onTap: () => _handleRadioValueChange(1),
                                child: Container(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 1,
                                        groupValue: _radioValue,
                                        onChanged: _handleRadioValueChange,
                                        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
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
                                onTap: () => _handleRadioValueChange(2),
                                child: Container(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 2,
                                        groupValue: _radioValue,
                                        onChanged: _handleRadioValueChange,
                                        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
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
                      'Task Completed',
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
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    // TODO: Add gnosis scores to the model when model is updated
    // For now, just store the value locally
  }
  
  void loadFromModel() {
    if (!mounted) return;
    
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    // TODO: Load gnosis scores from the model when model is updated
    setState(() {
      _radioValue = 0; // Default to Normal
    });
  }
}