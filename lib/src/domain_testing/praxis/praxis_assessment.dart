import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/domain_testing/praxis/limb_kinetic_apraxia.dart';
import 'package:mica/src/domain_testing/praxis/ideomotor_apraxia.dart';
import 'package:mica/src/domain_testing/praxis/ideational_apraxia.dart';
import 'package:mica/src/domain_testing/praxis/oral_apraxia.dart';
import 'package:mica/src/domain_testing/praxis/dressing_apraxia.dart';
import 'package:mica/src/domain_testing/praxis/line_drawing.dart';

class PraxisAssessment extends StatefulWidget {
  const PraxisAssessment({super.key});

  @override
  State<PraxisAssessment> createState() => _PraxisAssessmentState();
}

class _PraxisAssessmentState extends State<PraxisAssessment> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Praxis',
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
              // Limb-kinetic Apraxia
              _buildPraxisOption(
                context, 
                width, 
                'Limb-kinetic Apraxia',
                () {
                  NavigationHelper.navigateTo(
                    context,
                    const LimbKineticApraxia(),
                  );
                }
              ),
              const SizedBox(height: 10.0),
              
              // Ideomotor Apraxia
              _buildPraxisOption(
                context, 
                width, 
                'Ideomotor Apraxia',
                () {
                  NavigationHelper.navigateTo(
                    context,
                    const IdeomotorApraxia(),
                  );
                }
              ),
              const SizedBox(height: 10.0),
              
              // Ideational Apraxia
              _buildPraxisOption(
                context, 
                width, 
                'Ideational Apraxia',
                () {
                  NavigationHelper.navigateTo(
                    context,
                    const IdeationalApraxia(),
                  );
                }
              ),
              const SizedBox(height: 10.0),
              
              // Oral Apraxia
              _buildPraxisOption(
                context, 
                width, 
                'Oral Apraxia',
                () {
                  NavigationHelper.navigateTo(
                    context,
                    const OralApraxia(),
                  );
                }
              ),
              const SizedBox(height: 10.0),
              
              // Dressing Apraxia
              _buildPraxisOption(
                context, 
                width, 
                'Dressing Apraxia',
                () {
                  NavigationHelper.navigateTo(
                    context,
                    const DressingApraxia(),
                  );
                }
              ),
              const SizedBox(height: 10.0),
              
              // Line Drawing
              _buildPraxisOption(
                context, 
                width, 
                'Line Drawing',
                () {
                  NavigationHelper.navigateTo(
                    context,
                    const LineDrawing(),
                  );
                }
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildPraxisOption(BuildContext context, double width, String title, VoidCallback onPressed) {
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