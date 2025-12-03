import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/providers/mica_provider.dart';

class SemanticMemory extends StatefulWidget {
  const SemanticMemory({super.key});

  @override
  State<SemanticMemory> createState() => _SemanticMemoryState();
}

class _SemanticMemoryState extends State<SemanticMemory> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What was the name of the British princess who died in a car accident in 1997?',
      'answer': 'Princess Diana',
      'isCorrect': null,
    },
    {
      'question': 'When was the second World War?',
      'answer': '1939-1945',
      'isCorrect': null,
    },
    {
      'question': 'Name the city where the Twin Towers terrorist attack occurred?',
      'answer': 'New York',
      'isCorrect': null,
    },
    {
      'question': 'What is the name of the first man on the moon?',
      'answer': 'Neil Armstrong',
      'isCorrect': null,
    },
    {
      'question': 'Name the USA president who was assassinated in the 1960s?',
      'answer': 'Kennedy',
      'isCorrect': null,
    },
  ];

  int get score {
    return questions.where((q) => q['isCorrect'] == true).length;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Semantic memory',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15.0,
          ),
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
            child: Container(
              width: width * 0.9,
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Build question cards
                  ...questions.map((question) => _buildQuestionCard(question)),
                  // Score card
                  Card(
                    elevation: 10.0,
                    color: Colors.deepPurple.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            'Score: $score/5',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            'Most people will be able to give a correct answer for 3 or more of the questions.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
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
                                  scoreModel.setMemorySemanticScore(score);

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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionCard(Map<String, dynamic> question) {
    return Column(
      children: [
        // Yellow question card
        Card(
          elevation: 10.0,
          color: Colors.yellowAccent.shade400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '"${question['question']}"',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                height: 1.4,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        // Purple answer card with buttons
        Card(
          elevation: 10.0,
          color: Colors.deepPurple.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  'Tap on the button to log answer',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Answer: ${question['answer']}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                          backgroundColor: question['isCorrect'] == true 
                              ? Colors.green 
                              : Colors.yellowAccent.shade400,
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                        ),
                        onPressed: () {
                          setState(() {
                            question['isCorrect'] = true;
                          });
                        },
                        child: Text(
                          'Correct',
                          style: TextStyle(
                            color: question['isCorrect'] == true 
                                ? Colors.white 
                                : Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                          backgroundColor: question['isCorrect'] == false 
                              ? Colors.red 
                              : Colors.yellowAccent.shade400,
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                        ),
                        onPressed: () {
                          setState(() {
                            question['isCorrect'] = false;
                          });
                        },
                        child: Text(
                          'Incorrect',
                          style: TextStyle(
                            color: question['isCorrect'] == false 
                                ? Colors.white 
                                : Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}