import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/utils/screen_routes.dart';
import 'package:mica/src/domain_testing/memory/short_verbal_memory_test.dart';
import 'package:mica/src/domain_testing/memory/ten_word_verbal_recall.dart';
import 'package:mica/src/domain_testing/memory/visual_working_memory.dart';
import 'package:mica/src/domain_testing/memory/visual_short_term_memory.dart';
import 'package:mica/src/domain_testing/memory/semantic_memory.dart';
import 'package:mica/resources/strings/memory_strings.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/services/persistence_service.dart';

class MemoryAssessment extends StatefulWidget {
  const MemoryAssessment({super.key});

  @override
  State<MemoryAssessment> createState() => _MemoryAssessmentState();
}

class _MemoryAssessmentState extends State<MemoryAssessment> {
  @override
  void initState() {
    super.initState();
    print('DEBUG MEMORY: initState() called');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('DEBUG MEMORY: postFrameCallback executing');
      _saveCurrentScreen();
    });
  }

  void _saveCurrentScreen() async {
    print('DEBUG MEMORY: _saveCurrentScreen() called');
    try {
      final scoreModel = MicaProviders.getScoreModel(context, listen: false);
      print('DEBUG MEMORY: Got scoreModel, setting currentScreen to: ${ScreenRoutes.memory}');
      scoreModel.setCurrentScreen(ScreenRoutes.memory);
      print('DEBUG MEMORY: Model currentScreen is now: ${scoreModel.currentScreen}');
      // Use immediate save to ensure currentScreen is persisted before user exits
      final saved = await PersistenceService.saveProgressImmediate(scoreModel);
      print('DEBUG MEMORY: Save result: $saved');
    } catch (e, stack) {
      print('DEBUG MEMORY: ERROR in _saveCurrentScreen: $e');
      print('DEBUG MEMORY: Stack: $stack');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('DEBUG MEMORY BUILD: build() method called');
    var width = MediaQuery.of(context).size.width;
    double height = 10.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          MemoryStrings.domainTitle,
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
              })
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Short Verbal Memory Test
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
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            onPressed: () {
                              NavigationHelper.navigateAndRemoveUntil(
                                context,
                                const ShortVerbalMemoryTest(),
                                (Route<dynamic> route) => true,
                              );
                            },
                            child: const Text(MemoryStrings.shortVerbalMemoryButton,
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height,
              ),
              // 10-Word Verbal Recall
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
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            onPressed: () {
                              NavigationHelper.navigateAndRemoveUntil(
                                context,
                                const TenWordVerbalRecall(),
                                (Route<dynamic> route) => true,
                              );
                            },
                            child: const Text(MemoryStrings.tenWordVerbalRecallButton,
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height,
              ),
              // Visual Working Memory
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
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            onPressed: () {
                              NavigationHelper.navigateAndRemoveUntil(
                                context,
                                const VisualWorkingMemory(),
                                (Route<dynamic> route) => true,
                              );
                            },
                            child: const Text(MemoryStrings.visualWorkingMemoryButton,
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height,
              ),
              // Visual Short-Term Memory
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
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            onPressed: () {
                              NavigationHelper.navigateAndRemoveUntil(
                                context,
                                const VisualShortTermMemory(),
                                (Route<dynamic> route) => true,
                              );
                            },
                            child: const Text(MemoryStrings.visualShortTermMemoryButton,
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height,
              ),
              // Semantic memory
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
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            onPressed: () {
                              NavigationHelper.navigateAndRemoveUntil(
                                context,
                                const SemanticMemory(),
                                (Route<dynamic> route) => true,
                              );
                            },
                            child: const Text(MemoryStrings.semanticMemoryButton,
                                style: TextStyle(color: Colors.black)),
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
    );
  }
}