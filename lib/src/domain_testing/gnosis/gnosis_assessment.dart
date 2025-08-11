import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/domain_testing/gnosis/identify_objects_visually.dart';
import 'package:mica/src/domain_testing/gnosis/identify_objects_by_touch.dart';

class GnosisAssessment extends StatefulWidget {
  const GnosisAssessment({super.key});

  @override
  State<GnosisAssessment> createState() => _GnosisAssessmentState();
}

class _GnosisAssessmentState extends State<GnosisAssessment> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gnosis',
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
                'Identify Objects Visually',
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
                'Identify Objects by Touch',
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
                'Finger Perception Test',
                () {
                  // TODO: Navigate to finger perception test
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Finger Perception Test - Coming Soon'),
                    ),
                  );
                }
              ),
              const SizedBox(height: 10.0),
              
              // Clock Drawing Test
              _buildGnosisOption(
                context, 
                width, 
                'Clock Drawing Test',
                () {
                  // TODO: Navigate to clock drawing test
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Clock Drawing Test - Coming Soon'),
                    ),
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