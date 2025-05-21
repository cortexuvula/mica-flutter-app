import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/visuospatial_praxis.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/providers/mica_provider.dart';

class TenWordRecallTrialThree extends StatefulWidget {
  const TenWordRecallTrialThree({super.key});

  @override
  _TenWordRecallTrialThreeState createState() =>
      _TenWordRecallTrialThreeState();
}

class _TenWordRecallTrialThreeState extends State<TenWordRecallTrialThree> {
  List<Color> wordButtonColor = [];
  List<String> wordColor = [];
  late int scoreTenWordRecallTrialThree = 0;
  bool activeContinueButton = true;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 10; i++) {
      wordButtonColor.add(Colors.yellowAccent.shade100);
      wordColor.add('yellow');
    }
    initFromProvider();
  }

  // Update the provider with the trial three score
  void _updateProvider() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setTrialThreeScore(scoreTenWordRecallTrialThree);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var screenHeightInfo =
        (MediaQuery.of(context).size.height * 0.3).floorToDouble();
    var screenHeightWords =
        (MediaQuery.of(context).size.height * 0.45).floorToDouble();
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        // Update provider before navigation
        _updateProvider();

        if (context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              app_data.testTenWordRecallTrialThree,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              app_data.testTenWordRecallTrialThreeSubtitle,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  var router = MaterialPageRoute(
                      builder: (BuildContext context) => Welcome());
                  Navigator.of(context).pushAndRemoveUntil(
                      router, (Route<dynamic> route) => false);
                })
          ],
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: screenHeightInfo,
              child: ListView(
                padding: EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 8.0),
                children: <Widget>[
                  Card(
                    elevation: 10.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
//                        Padding(padding: EdgeInsets.all(8.0)),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: <Widget>[
//                            Text(
//                              "Instructions",
//                              style: TextStyle(
//                                  fontSize: 18.0,
//                                  fontWeight: FontWeight.w500,
//                                  decoration: TextDecoration.underline),
//                            ),
//                          ],
//                        ),
//                        Padding(padding: EdgeInsets.all(4.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Scroll down to reveal more instructions",
                                style: TextStyle(
                                    fontSize: 10.0, color: Colors.black38),
                              ),
                            ],
                          ),
//                        Padding(padding: EdgeInsets.all(8.0)),
                          Card(
                            elevation: 10.0,
                            color: Colors.deepPurple.shade300,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                app_data
                                    .instructionsTenWordRecallTrialThreeHealthworker1,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Card(
                            elevation: 10.0,
                            color: Colors.yellowAccent.shade400,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                app_data
                                    .instructionsTenWordRecallTrialThreePatient1,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Card(
                            elevation: 10.0,
                            color: Colors.deepPurple.shade300,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                app_data
                                    .instructionsTenWordRecallTrialThreeHealthworker2,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Card(
                            elevation: 10.0,
                            color: Colors.yellowAccent.shade400,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                app_data
                                    .instructionsTenWordRecallTrialThreePatient2,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenHeightWords,
              child: Scrollbar(
                child: GridView.count(
                    addRepaintBoundaries: true,
                    crossAxisCount: 2,
                    childAspectRatio: 4.5,
                    padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 0.0),
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    children: List.generate(10, (index) {
                      return TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: wordButtonColor[index],
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            if (wordButtonColor[index] ==
                                Colors.yellowAccent.shade100) {
                              wordButtonColor[index] = Colors.green;
                              scoreTenWordRecallTrialThree += 1;
                            } else if (wordButtonColor[index] == Colors.green) {
                              wordButtonColor[index] =
                                  Colors.yellowAccent.shade100;
                              scoreTenWordRecallTrialThree -= 1;
                            }

                            if (scoreTenWordRecallTrialThree == 10) {
                              activeContinueButton = true;
                            }
                          });
                        },
                        child: Text(app_data.tenWordRecallList3[index]),
                      );
                    })),
              ),
            ),
            SizedBox(
                width: width * 0.9,
                child: Card(
                  elevation: 10.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10.0,
                        ),
                        onPressed: activeContinueButton
                            ? () {
                                // Update provider with trial three score
                                _updateProvider();

                                var router = MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const VisuospatialPraxis());
                                Navigator.of(context).pushAndRemoveUntil(
                                    router, (Route<dynamic> route) => true);
                              }
                            : null,
                        child: Text(
                          "Continue",
                          style: TextStyle(color: Colors.black),
                          overflow: TextOverflow.clip,
                        )),
                  ),
                )),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }

  void initFromProvider() {
    if (!mounted) return;

    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    int score = scoreModel.trialThreeScore;

    // The Provider doesn't store word colors, so we're initializing with default values
    // If needed, the colors for words could be added to the MicaScoreModel in the future

    if (score > 0) {
      setState(() {
        scoreTenWordRecallTrialThree = score;
      });
    }
  }
}
