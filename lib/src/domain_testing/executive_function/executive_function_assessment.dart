import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/domain_testing/executive_function/luria_alternating_hand_movements.dart';
import 'package:mica/src/domain_testing/executive_function/luria_fist_edge_palm_movement.dart';
import 'package:mica/src/domain_testing/executive_function/animal_naming_task.dart';

class ExecutiveFunctionAssessment extends StatefulWidget {
  const ExecutiveFunctionAssessment({super.key});

  @override
  ExecutiveFunctionAssessmentState createState() =>
      ExecutiveFunctionAssessmentState();
}

class ExecutiveFunctionAssessmentState
    extends State<ExecutiveFunctionAssessment> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Executive Functions',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
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
          _buildTestButton(
            context,
            width,
            'Luria Alternating Hand Movements',
            () {
              NavigationHelper.navigateAndRemoveUntil(
                context,
                const LuriaAlternatingHandMovements(),
                (Route<dynamic> route) => true,
              );
            },
          ),
          const SizedBox(height: 10),
          _buildTestButton(
            context,
            width,
            'Luria Fist-Edge-Palm Movement',
            () {
              NavigationHelper.navigateAndRemoveUntil(
                context,
                const LuriaFistEdgePalmMovement(),
                (Route<dynamic> route) => true,
              );
            },
          ),
          const SizedBox(height: 10),
          _buildTestButton(
            context,
            width,
            'Animal Naming Task',
            () {
              NavigationHelper.navigateAndRemoveUntil(
                context,
                const AnimalNamingTask(),
                (Route<dynamic> route) => true,
              );
            },
          ),
          const SizedBox(height: 10),
          _buildTestButton(
            context,
            width,
            'Lexical Fluency Test',
            () {
              // TODO: Navigate to Lexical Fluency Test
            },
          ),
          const SizedBox(height: 10),
          _buildTestButton(
            context,
            width,
            'Design Fluency Task',
            () {
              // TODO: Navigate to Design Fluency Task
            },
          ),
          const SizedBox(height: 10),
          _buildTestButton(
            context,
            width,
            'Finger-Nose Task',
            () {
              // TODO: Navigate to Finger-Nose Task
            },
          ),
          const SizedBox(height: 10),
          _buildTestButton(
            context,
            width,
            'Tap Task',
            () {
              // TODO: Navigate to Tap Task
            },
          ),
          const SizedBox(height: 10),
          _buildTestButton(
            context,
            width,
            'Alternating Sequences',
            () {
              // TODO: Navigate to Alternating Sequences test
            },
          ),
          const SizedBox(height: 10),
          _buildTestButton(
            context,
            width,
            'Months of the Year Backwards',
            () {
              // TODO: Navigate to Months of the Year Backwards test
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTestButton(
    BuildContext context,
    double width,
    String text,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: width * 0.9,
      child: Card(
        elevation: 10.0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: width * 0.8,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10.0,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: onPressed,
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}