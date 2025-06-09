import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/domain_testing/attention_concentration/domain_attention_concentration.dart';
import 'package:mica/src/domain_testing/language/language_assessment.dart';
import 'package:mica/src/domain_testing/memory/memory_assessment.dart';
import 'package:mica/src/domain_testing/praxis/praxis_assessment.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/utils/navigation_helper.dart';

class DomainSelect extends StatefulWidget {
  const DomainSelect({super.key});

  @override
  DomainSelectState createState() => DomainSelectState();
}

class DomainSelectState extends State<DomainSelect> {
  @override
  void initState() {
    super.initState();
    // Defer model initialization to after the build phase
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initializeModelData();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double height = 10.0;
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            app_data.domainSelect,
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
                          app_data.domainSelectInfo.toUpperCase(),
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
                              AttentionConcentration(),
                              (Route<dynamic> route) => true,
                            );
                          },
                          child: Text(app_data.domainSelectButton1,
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
                              const LanguageAssessment(),
                              (Route<dynamic> route) => true,
                            );
                          },
                          child: Text(app_data.domainSelectButton2,
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
                              const MemoryAssessment(),
                              (Route<dynamic> route) => true,
                            );
                          },
                          child: Text(app_data.domainSelectButton3,
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
                              const PraxisAssessment(),
                              (Route<dynamic> route) => true,
                            );
                          },
                          child: Text(app_data.domainSelectButton4,
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
                              const Welcome(),
                              (Route<dynamic> route) => true,
                            );
                          },
                          child: Text(app_data.domainSelectButton5,
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
                              const Welcome(),
                              (Route<dynamic> route) => true,
                            );
                          },
                          child: Text(app_data.domainSelectButton6,
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

  void initializeModelData() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);

    // Initialize attention scores in the model
    scoreModel.setAttention(score: 0, correct: 0, mistakes: 0);

    // No need to initialize UI state variables like button colors
    // These are handled in each screen's initState method
  }
}
