import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/utils/screen_routes.dart';
import 'package:mica/src/domain_testing/gnosis/identify_objects_visually.dart';
import 'package:mica/src/domain_testing/gnosis/identify_objects_by_touch.dart';
import 'package:mica/src/domain_testing/gnosis/finger_perception_test.dart';
import 'package:mica/src/domain_testing/gnosis/clock_drawing_test.dart';
import 'package:mica/resources/strings/gnosis_strings.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/services/persistence_service.dart';

class GnosisAssessment extends StatefulWidget {
  const GnosisAssessment({super.key});

  @override
  State<GnosisAssessment> createState() => _GnosisAssessmentState();
}

class _GnosisAssessmentState extends State<GnosisAssessment> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _saveCurrentScreen();
    });
  }

  void _saveCurrentScreen() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setCurrentScreen(ScreenRoutes.gnosis);
    // Use immediate save to ensure currentScreen is persisted before user exits
    PersistenceService.saveProgressImmediate(scoreModel);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          GnosisStrings.domainTitle,
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
              // Identify Objects Visually
              _buildGnosisOption(
                context,
                width,
                GnosisStrings.identifyObjectsVisually,
                () {
                  NavigationHelper.navigateTo(
                    context,
                    const IdentifyObjectsVisually(),
                  );
                }
              ),
              const SizedBox(height: 10.0),

              // Identify Objects by Touch
              _buildGnosisOption(
                context,
                width,
                GnosisStrings.identifyObjectsByTouch,
                () {
                  NavigationHelper.navigateTo(
                    context,
                    const IdentifyObjectsByTouch(),
                  );
                }
              ),
              const SizedBox(height: 10.0),

              // Finger Perception Test
              _buildGnosisOption(
                context,
                width,
                GnosisStrings.fingerPerceptionTest,
                () {
                  NavigationHelper.navigateTo(
                    context,
                    const FingerPerceptionTest(),
                  );
                }
              ),
              const SizedBox(height: 10.0),

              // Clock Drawing Test
              _buildGnosisOption(
                context,
                width,
                GnosisStrings.clockDrawingTest,
                () {
                  NavigationHelper.navigateTo(
                    context,
                    const ClockDrawingTest(),
                  );
                }
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildGnosisOption(BuildContext context, double width, String title, VoidCallback onPressed) {
    return SizedBox(
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
                  onPressed: onPressed,
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}