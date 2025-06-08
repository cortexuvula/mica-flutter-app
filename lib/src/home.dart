import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/patient_information.dart';
import 'package:mica/src/models/mica_score_model.dart';
import 'package:provider/provider.dart';
import 'package:mica/src/utils/navigation_helper.dart';

class Home extends StatefulWidget {
  final bool? viewedDisclaimer;

  const Home({super.key, this.viewedDisclaimer});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: true,
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              app_data.appName,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0),
              textAlign: TextAlign.start,
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () => debugPrint("info")),
          ],
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 25.0,
                ),
                SizedBox(
                  width: width * 0.9,
                  child: Card(
                    elevation: 10.0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(app_data.appDescription,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14.0,
                              color: Colors.black)),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.9,
                  child: Card(
                    elevation: 10.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Card(
                            elevation: 10.0,
                            color: Colors.deepPurple.shade300,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    app_data.testDescription,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.0,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    app_data.fullTestText,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14.0,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            elevation: 10.0,
                            color: Colors.yellowAccent.shade400,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    app_data.testToPatient,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.0,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    app_data.startTesting,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14.0,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 10.0,
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            onPressed: () {
                              NavigationHelper.navigateAndRemoveUntil(
                                context,
                                PatientInformation(),
                                (Route<dynamic> route) => false,
                              );
                            },
                            child: Text(app_data.fullTestButton,
                                style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Container(
                //   width: _width * 0.9,
                //   child: Card(
                //     elevation: 10.0,
                //     color: Colors.white,
                //     child: Padding(
                //       padding: const EdgeInsets.all(20.0),
                //       child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //           elevation: 10.0,
                //           backgroundColor:
                //               Theme.of(context).colorScheme.secondary,
                //         ),
                //         onPressed: () async {
                //           print("PDF tapped");
                //           _launchURL();
                //         },
                //         child: Text(app_data.resourceButtonBooklet),
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 5.0,
                // ),
                // Container(
                //   width: _width * 0.9,
                //   child: Card(
                //     elevation: 10.0,
                //     color: Colors.white,
                //     child: Padding(
                //       padding: const EdgeInsets.all(20.0),
                //       child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //           elevation: 10.0,
                //           backgroundColor: Theme.of(context).colorScheme.secondary,
                //         ),
                //         onPressed: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => const ResourcePage()));
                //         },
                //         child: Text(app_data.resourceButtonVideo),
                //       ),
                //     ),
                //   ),
                // )
              ],
            )),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initializeModelData();
    });
  }

  void initializeModelData() {
    // Get the model from provider and initialize all values
    final micaScoreModel = Provider.of<MicaScoreModel>(context, listen: false);

    // Initialize all scores in the model
    // These initializations replace all the SharedPreferences.setInt/setBool calls

    // Instead of setting SharedPreferences values, we're initializing the model
    // with default values for all the assessment scores

    // We may need to extend the MicaScoreModel class to store all the necessary data
    // that was previously stored in SharedPreferences

    // For now, we'll initialize all the scores that the model already supports
    micaScoreModel.resetScores();
  }
}
