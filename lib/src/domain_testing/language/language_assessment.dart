import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/utils/screen_routes.dart';
import 'package:mica/resources/strings/language_strings.dart';
import 'package:mica/src/domain_testing/language/spontaneous_speech.dart';
import 'package:mica/src/domain_testing/language/comprehension_three_stage.dart';
import 'package:mica/src/domain_testing/language/comprehension_moving_objects.dart';
import 'package:mica/src/domain_testing/language/repetition.dart';
import 'package:mica/src/domain_testing/language/naming.dart';
import 'package:mica/src/domain_testing/language/reading.dart';
import 'package:mica/src/domain_testing/language/writing.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/services/persistence_service.dart';

class LanguageAssessment extends StatefulWidget {
  const LanguageAssessment({super.key});

  @override
  State<LanguageAssessment> createState() => _LanguageAssessmentState();
}

class _LanguageAssessmentState extends State<LanguageAssessment> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _saveCurrentScreen();
    });
  }

  void _saveCurrentScreen() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setCurrentScreen(ScreenRoutes.language);
    // Use immediate save to ensure currentScreen is persisted before user exits
    PersistenceService.saveProgressImmediate(scoreModel);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double height = 10.0;
    
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            LanguageStrings.domainTitle,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
            textAlign: TextAlign.start,
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
      body: ListView(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Info card
            SizedBox(
              width: width * 0.9,
              child: Card(
                elevation: 10.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          LanguageStrings.selectAssessmentInstruction,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.black),
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
            // Spontaneous Speech
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
                              const SpontaneousSpeech(),
                              (Route<dynamic> route) => true,
                            );
                          },
                          child: const Text(LanguageStrings.spontaneousSpeechButton,
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
            // Comprehension: 3 Stage Command Task
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
                              const ComprehensionThreeStage(),
                              (Route<dynamic> route) => true,
                            );
                          },
                          child: const Text(LanguageStrings.comprehensionThreeStageButton,
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center),
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
            // Comprehension: Moving 3 Objects Task
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
                              const ComprehensionMovingObjects(),
                              (Route<dynamic> route) => true,
                            );
                          },
                          child: const Text(LanguageStrings.comprehensionMovingObjectsButton,
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center),
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
            // Repetition
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
                              const Repetition(),
                              (Route<dynamic> route) => true,
                            );
                          },
                          child: const Text(LanguageStrings.repetitionButton,
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
            // Naming
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
                              const Naming(),
                              (Route<dynamic> route) => true,
                            );
                          },
                          child: const Text(LanguageStrings.namingButton,
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
            // Reading
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
                              const Reading(),
                              (Route<dynamic> route) => true,
                            );
                          },
                          child: const Text(LanguageStrings.readingButton,
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
            // Writing
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
                              const Writing(),
                              (Route<dynamic> route) => true,
                            );
                          },
                          child: const Text(LanguageStrings.writingButton,
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
      ]),
    );
  }
}