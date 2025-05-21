import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/ten_word_recall_task_trial_two.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/providers/mica_provider.dart';

class TenWordRecallTrialOne extends StatefulWidget {
  const TenWordRecallTrialOne({super.key});

  @override
  _TenWordRecallTrialOneState createState() => _TenWordRecallTrialOneState();
}

class _TenWordRecallTrialOneState extends State<TenWordRecallTrialOne>
    with SingleTickerProviderStateMixin {
  final List<Color> wordButtonColor = [];
  final List<String> wordColor = [];
  late int scoreTenWordRecallTrialOne;

  bool activeContinueButton = false;

  @override
  void initState() {
    super.initState();

    scoreTenWordRecallTrialOne = 0;

    for (var i = 0; i < 10; i++) {
      wordButtonColor.add(Colors.yellowAccent.shade100);
      wordColor.add('yellow');
    }
    initFromProvider();
  }

  // Update the provider with the trial one score
  void _updateProvider() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setTrialOneScore(scoreTenWordRecallTrialOne);
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
        if (didPop) {
          return;
        }

        // Update provider before navigation
        _updateProvider();

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const Welcome(),
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              app_data.testTenWordRecallTrialOne,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              app_data.testTenWordRecallTrialOneSubtitle,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  var router = MaterialPageRoute(
                      builder: (BuildContext context) => const Welcome());
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
                padding: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 8.0),
                children: <Widget>[
                  Card(
                    elevation: 10.0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                "Scroll down to reveal more instructions",
                                style: TextStyle(
                                    fontSize: 10.0, color: Colors.black38),
                              ),
                            ],
                          ),

                          Card(
                            elevation: 10.0,
                            color: Colors.yellowAccent.shade400,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                app_data
                                    .instructionsTenWordRecallTrialOnePaient1,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0),
                              ),
                            ),
                          ),
//                    Padding(padding: EdgeInsets.all(8.0)),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Card(
                            elevation: 10.0,
                            color: Colors.deepPurple.shade300,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                app_data
                                    .instructionsTenWordRecallTrialOneHealthworker1,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0),
                              ),
                            ),
                          ),
//                    Padding(padding: EdgeInsets.all(8.0)),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Card(
                            elevation: 10.0,
                            color: Colors.yellowAccent.shade400,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                app_data
                                    .instructionsTenWordRecallTrialOnePatient2,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),

                          Card(
                            elevation: 10.0,
                            color: Colors.deepPurple.shade300,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                app_data
                                    .instructionsTenWordRecallTrialOneHealthworker2,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0),
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
                    padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 0.0),
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    children: List.generate(10, (index) {
                      return TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: wordButtonColor[index],
                        ),
                        onPressed: () {
                          setState(() {
                            if (wordButtonColor[index] ==
                                Colors.yellowAccent.shade100) {
                              wordButtonColor[index] = Colors.green;
                              scoreTenWordRecallTrialOne += 1;
                            } else if (wordButtonColor[index] == Colors.green) {
                              wordButtonColor[index] =
                                  Colors.yellowAccent.shade100;
                              scoreTenWordRecallTrialOne -= 1;
                            }

                            if (scoreTenWordRecallTrialOne == 10) {
                              activeContinueButton = true;
                            }
                          });
                        },
                        child: Text(app_data.tenWordRecallList[index]),
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
                        child: const Text(
                          "Continue",
                          style: TextStyle(color: Colors.black),
                          overflow: TextOverflow.clip,
                        ),
                        //onPressed: () => debugPrint("hello"),
                        onPressed: () {
                          // Update provider with the trial one score
                          _updateProvider();

                          // Navigate to the next screen using Provider
                          var router = MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const TenWordRecallTrialTwo());
                          Navigator.of(context).pushAndRemoveUntil(
                              router, (Route<dynamic> route) => true);
                        }),
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
    int score = scoreModel.trialOneScore;

    // The Provider doesn't store word colors, so we're initializing with default values
    // If needed, the colors for words could be added to the MicaScoreModel in the future

    if (score > 0) {
      setState(() {
        scoreTenWordRecallTrialOne = score;
      });
    }
  }
}
