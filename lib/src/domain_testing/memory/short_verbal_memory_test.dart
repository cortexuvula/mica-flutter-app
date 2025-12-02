import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';

class ShortVerbalMemoryTest extends StatefulWidget {
  const ShortVerbalMemoryTest({super.key});

  @override
  State<ShortVerbalMemoryTest> createState() => _ShortVerbalMemoryTestState();
}

class _ShortVerbalMemoryTestState extends State<ShortVerbalMemoryTest> {
  // Memory items
  final List<String> memoryItems = [
    'Peter',
    'Black',
    '25',
    'Market',
    'Close',
    'Northam',
    'Wheatbelt'
  ];

  // Track which items are selected in immediate recall
  List<bool> immediateRecallSelected = List.filled(7, false);

  // Track which items are selected in delayed recall
  List<bool> delayedRecallSelected = List.filled(7, false);

  // Track which alternatives are selected in cued recall
  Map<String, String?> cuedRecallSelections = {
    'name': null,
    'surname': null,
    'number': null,
    'street': null,
    'streetType': null,
    'suburb': null,
    'city': null,
  };

  // Radio button selections for recognition memory
  int? immediateRecognitionScore = 2; // Initialize to Impaired
  int? delayedRecognitionScore = 2; // Initialize to Impaired
  int? cuedRecognitionScore = 2; // Initialize to Impaired

  // Current step in the test
  int currentStep = 0; // 0: immediate, 1: delayed recall, 2: cued recall

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Short Verbal Memory Test',
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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          if (currentStep == 0) ..._buildImmediateRecallStep(width),
          if (currentStep == 1) ..._buildDelayedRecallStep(width),
          if (currentStep == 2) ..._buildCuedRecallStep(width),
        ],
      ),
    );
  }

  List<Widget> _buildImmediateRecallStep(double width) {
    int immediateScore =
        immediateRecallSelected.where((selected) => selected).length;

    return [
      // Yellow instruction card 1
      Card(
        elevation: 10.0,
        color: Colors.yellowAccent.shade400,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '"I would like you to remember a name and address. Listen carefully as I will say it only once. Are you ready?"',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const SizedBox(height: 16.0),

      // Yellow instruction card 2
      Card(
        elevation: 10.0,
        color: Colors.yellowAccent.shade400,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '"Peter Black, 25 Market Close, Northam, Wheatbelt. Can you repeat that?"',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const SizedBox(height: 16.0),

      // Purple card with tappable items
      Card(
        elevation: 10.0,
        color: Colors.deepPurple.shade300,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Tap on words correctly recalled.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              // Memory items in grid
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: List.generate(memoryItems.length, (index) {
                  return SizedBox(
                    width: (width - 80) / 2,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          immediateRecallSelected[index] =
                              !immediateRecallSelected[index];
                          // Update recognition score based on errors
                          int correctCount = immediateRecallSelected
                              .where((selected) => selected)
                              .length;
                          int errors = 7 - correctCount;
                          if (errors == 0) {
                            immediateRecognitionScore = 0; // Normal
                          } else if (errors == 1) {
                            immediateRecognitionScore = 1; // Equivocal
                          } else {
                            immediateRecognitionScore = 2; // Impaired
                          }
                        });
                      },
                      child: Card(
                        elevation: 5.0,
                        color: immediateRecallSelected[index]
                            ? Colors.green
                            : Colors.yellowAccent.shade400,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            memoryItems[index],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Score: $immediateScore/7',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 16.0),

      // Purple instruction card
      Card(
        elevation: 10.0,
        color: Colors.deepPurple.shade300,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'If the patient is able to recall without error then continue. If unable, then the name and address can be repeated up to 3 times asking for recall each time. This is not scored.',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const SizedBox(height: 16.0),

      // Green recognition memory card
      _buildRecognitionMemoryCard(true),
      const SizedBox(height: 16.0),

      // Yellow reminder card
      Card(
        elevation: 10.0,
        color: Colors.yellowAccent.shade400,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '"Remember the name and address as I will ask for it later."',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const SizedBox(height: 16.0),

      // Purple instruction card
      Card(
        elevation: 10.0,
        color: Colors.deepPurple.shade300,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Allow about 5 minutes to pass by using distraction',
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

      // Next button
      SizedBox(
        width: width * 0.9,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 10.0,
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () {
            setState(() {
              currentStep = 1;
            });
          },
          child: const Text(
            'Continue to Delayed Recall',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildDelayedRecallStep(double width) {
    int delayedScore =
        delayedRecallSelected.where((selected) => selected).length;

    return [
      // Yellow instruction card
      Card(
        elevation: 10.0,
        color: Colors.yellowAccent.shade400,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '"Tell me the name and address that you learned earlier."',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const SizedBox(height: 16.0),

      // Purple card with tappable items
      Card(
        elevation: 10.0,
        color: Colors.deepPurple.shade300,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Tap on words correctly recalled.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              // Memory items in grid
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: List.generate(memoryItems.length, (index) {
                  return SizedBox(
                    width: (width - 80) / 2,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          delayedRecallSelected[index] =
                              !delayedRecallSelected[index];
                          // Update recognition score based on errors
                          int correctCount = delayedRecallSelected
                              .where((selected) => selected)
                              .length;
                          int errors = 7 - correctCount;
                          if (errors == 0) {
                            delayedRecognitionScore = 0; // Normal
                          } else if (errors == 1) {
                            delayedRecognitionScore = 1; // Equivocal
                          } else {
                            delayedRecognitionScore = 2; // Impaired
                          }
                        });
                      },
                      child: Card(
                        elevation: 5.0,
                        color: delayedRecallSelected[index]
                            ? Colors.green
                            : Colors.yellowAccent.shade400,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            memoryItems[index],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Score: $delayedScore/7',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 16.0),

      // Green recognition memory card
      _buildRecognitionMemoryCard(false),

      const SizedBox(height: 20.0),

      // Continue button
      SizedBox(
        width: width * 0.9,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 10.0,
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () {
            setState(() {
              currentStep = 2;
            });
          },
          child: const Text(
            'Continue to Cued Recall',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildCuedRecallStep(double width) {
    // Calculate cued recall score
    int cuedScore = 0;
    if (cuedRecallSelections['name'] == 'Peter') cuedScore++;
    if (cuedRecallSelections['surname'] == 'Black') cuedScore++;
    if (cuedRecallSelections['number'] == '25') cuedScore++;
    if (cuedRecallSelections['street'] == 'Market') cuedScore++;
    if (cuedRecallSelections['streetType'] == 'Close') cuedScore++;
    if (cuedRecallSelections['suburb'] == 'Northam') cuedScore++;
    if (cuedRecallSelections['city'] == 'Wheatbelt') cuedScore++;

    return [
      // Purple instruction card
      Card(
        elevation: 10.0,
        color: Colors.deepPurple.shade300,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Test for cued recall by giving alternatives as indicated below.',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const SizedBox(height: 16.0),

      // Yellow instruction card
      Card(
        elevation: 10.0,
        color: Colors.yellowAccent.shade400,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '"Did I ask you to remember...?"',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const SizedBox(height: 16.0),

      // Purple card with alternatives
      Card(
        elevation: 10.0,
        color: Colors.deepPurple.shade300,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Read 2 alternatives and target word.\nTap on words correctly recalled.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              // Name alternatives
              _buildAlternativesRow(
                ['Peter...', 'John...', 'Jack'],
                ['Smith...', 'Black...', 'White'],
                'name',
                'surname',
                width,
              ),
              const SizedBox(height: 10.0),
              // Number and street alternatives
              _buildAlternativesRow(
                ['25...', '28...', '21'],
                ['Church...', 'Long...', 'Market'],
                'number',
                'street',
                width,
              ),
              const SizedBox(height: 10.0),
              // Street type and suburb alternatives
              _buildAlternativesRow(
                ['Close...', 'Drive...', 'Street'],
                ['Northam...', 'Beverley...', 'York'],
                'streetType',
                'suburb',
                width,
              ),
              const SizedBox(height: 10.0),
              // City alternatives (single column)
              SizedBox(
                width: width - 80,
                child: Card(
                  elevation: 5.0,
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: _buildAlternativeButton(
                              'Kimberley...', 'city', 'Kimberley', width),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: _buildAlternativeButton(
                              'Goldfields...', 'city', 'Goldfields', width),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: _buildAlternativeButton(
                              'Wheatbelt', 'city', 'Wheatbelt', width),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Score: $cuedScore/7',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 16.0),

      // Green recognition memory card (bottom)
      _buildRecognitionMemoryCard(false, true),
      const SizedBox(height: 20.0),

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
                      // TODO: Save scores to model
                      // final scoreModel = MicaProviders.getScoreModel(context, listen: false);
                      // scoreModel.setShortVerbalMemoryScores(...);

                      // Pop back to memory assessment menu
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
    ];
  }

  Widget _buildAlternativesRow(
    List<String> leftOptions,
    List<String> rightOptions,
    String leftKey,
    String rightKey,
    double width,
  ) {
    return SizedBox(
      width: width - 80,
      child: Card(
        elevation: 5.0,
        color: Colors.grey.shade300,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: leftOptions.map((option) {
                    String value = option.replaceAll('...', '');
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: _buildAlternativeButton(
                          option, leftKey, value, width),
                    );
                  }).toList(),
                ),
              ),
              Container(
                width: 1,
                height: 100,
                color: Colors.black54,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
              ),
              Expanded(
                child: Column(
                  children: rightOptions.map((option) {
                    String value = option.replaceAll('...', '');
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: _buildAlternativeButton(
                          option, rightKey, value, width),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlternativeButton(
      String text, String key, String value, double width) {
    bool isCorrect = false;
    // Check if this is the correct answer
    if (key == 'name' && value == 'Peter') isCorrect = true;
    if (key == 'surname' && value == 'Black') isCorrect = true;
    if (key == 'number' && value == '25') isCorrect = true;
    if (key == 'street' && value == 'Market') isCorrect = true;
    if (key == 'streetType' && value == 'Close') isCorrect = true;
    if (key == 'suburb' && value == 'Northam') isCorrect = true;
    if (key == 'city' && value == 'Wheatbelt') isCorrect = true;

    // Check if this option is selected
    bool isSelected = cuedRecallSelections[key] == value;

    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          setState(() {
            cuedRecallSelections[key] = value;

            // Calculate cued recall score
            int cuedScore = 0;
            if (cuedRecallSelections['name'] == 'Peter') cuedScore++;
            if (cuedRecallSelections['surname'] == 'Black') cuedScore++;
            if (cuedRecallSelections['number'] == '25') cuedScore++;
            if (cuedRecallSelections['street'] == 'Market') cuedScore++;
            if (cuedRecallSelections['streetType'] == 'Close') cuedScore++;
            if (cuedRecallSelections['suburb'] == 'Northam') cuedScore++;
            if (cuedRecallSelections['city'] == 'Wheatbelt') cuedScore++;

            // Update recognition score based on errors
            int errors = 7 - cuedScore;
            if (errors == 0) {
              cuedRecognitionScore = 0; // Normal
            } else if (errors == 1) {
              cuedRecognitionScore = 1; // Equivocal
            } else {
              cuedRecognitionScore = 2; // Impaired
            }
          });
        },
        child: Card(
          elevation: 3.0,
          color: isSelected && isCorrect
              ? Colors.green.shade700
              : (isSelected
                  ? Colors.red.shade400
                  : Colors.yellowAccent.shade400),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecognitionMemoryCard(bool isImmediate, [bool isCued = false]) {
    int? selectedOption = isCued
        ? cuedRecognitionScore
        : (isImmediate ? immediateRecognitionScore : delayedRecognitionScore);

    return Card(
      elevation: 10.0,
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Name and Address: Recognition Memory',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            RadioGroup<int>(
              groupValue: selectedOption,
              onChanged: (int? value) {}, // Disabled - scores auto-calculated
              child: Table(
              border: TableBorder.all(
                color: Colors.black,
                width: 2.0,
              ),
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Radio<int>(
                              value: 0,
                              fillColor: WidgetStateProperty.resolveWith<Color>(
                                  (states) {
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
                    TableCell(
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Radio<int>(
                              value: 1,
                              fillColor: WidgetStateProperty.resolveWith<Color>(
                                  (states) {
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
                    TableCell(
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Radio<int>(
                              value: 2,
                              fillColor: WidgetStateProperty.resolveWith<Color>(
                                  (states) {
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
                  ],
                ),
                TableRow(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'No errors',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        '1 error',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        '> 1 error',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                        textAlign: TextAlign.center,
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
    );
  }
}
