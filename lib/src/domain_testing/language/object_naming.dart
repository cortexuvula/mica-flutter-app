import 'package:flutter/material.dart';

class ObjectNaming extends StatefulWidget {
  const ObjectNaming({super.key});

  @override
  State<ObjectNaming> createState() => _ObjectNamingState();
}

class _ObjectNamingState extends State<ObjectNaming> {
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Naming',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15.0,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          // Purple instruction card
          Card(
            elevation: 10.0,
            color: Colors.deepPurple.shade300,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Point towards the following objects and ask the patient to name it. Inability to name objects (nominal dysphasia) must be distinguished from visual object agnosia.',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          
          // Yellow patient instruction card
          Card(
            elevation: 10.0,
            color: Colors.yellowAccent.shade400,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '"Can you tell me what this is?"',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          
          // Purple detailed instruction card
          Card(
            elevation: 10.0,
            color: Colors.deepPurple.shade300,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Point to a watch, pen, tissue, button, shoe, and shirt.',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Less common objects are: knuckles, ring finger, eyebrow, winder of a watch, and collar.',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'To distinguish between nominal aphasia and visual object agnosia, ask the patient to describe the object or its use. If this can be done adequately then visual perception might be normal and the deficit is more likely language based. Language deficits can be further examined by providing the patient with language cues by saying either a part of the word or giving a phonetic clue. For example, say "col..." for collar or say it sounds like "dollar" Some patients may then be able to progress and say the word, the deficit is then more likely to be nominal aphasia.',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          
          // Green scoring card
          Card(
            elevation: 10.0,
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Note the response of the patient and score as below.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  // Radio button table
                  RadioGroup<int>(
                    groupValue: selectedOption,
                    onChanged: (int? value) {
                      if (value != null) {
                        setState(() {
                          selectedOption = value;
                        });
                      }
                    },
                    child: Table(
                    border: TableBorder.all(
                      color: Colors.black54,
                      width: 1.0,
                    ),
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedOption = 0;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
                                      'Normal',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedOption = 1;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
                                      'Equivocal',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedOption = 2;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
                                      'Impaired',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
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
          const SizedBox(height: 30.0),
          
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
                          // Save the score if selected
                          if (selectedOption != null) {
                            // TODO: Add object naming score to model when available
                            // final scoreModel = MicaProviders.getScoreModel(context, listen: false);
                            // scoreModel.setObjectNaming(selectedOption!);
                          }
                          // Pop back to naming menu
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Task Completed',
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
    );
  }
}