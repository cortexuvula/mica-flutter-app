import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/ten_word_recognition.dart';
import 'package:mica/src/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mica/src/models/mica_score_model.dart';
import 'package:provider/provider.dart';

class TenWordDelayedRecall extends StatefulWidget {
  // Using Provider pattern, no need for parameters
  const TenWordDelayedRecall({super.key});

  @override
  _TenWordDelayedRecallState createState() => _TenWordDelayedRecallState();
}

class _TenWordDelayedRecallState extends State<TenWordDelayedRecall> {
  final List<Color> wordButtonColor = [];
  final List<String> wordColor = [];
  late int scoreTenWordDelayRecall;

  @override
  void initState() {
    super.initState();
    scoreTenWordDelayRecall = 0;

    for (var i = 0; i < 10; i++) {
      wordButtonColor.add(Colors.yellowAccent.shade100);
      wordColor.add('yellow');
    }
    getPrefsData();
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

        final bool shouldPop = await savePrefData();
        if (shouldPop && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              app_data.testTenWordDelayedRecall,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              app_data.testTenWordDelayedRecallSubtitle,
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
                              app_data.instructionDelayedRecallPatient1,
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
                        SizedBox(
                          width: width * 0.9,
                          child: Card(
                            elevation: 10.0,
                            color: Colors.deepPurple.shade300,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                app_data.instructionDelayedRecallHealthworker1,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
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
                              scoreTenWordDelayRecall += 1;
                            } else if (wordButtonColor[index] == Colors.green) {
                              wordButtonColor[index] =
                                  Colors.yellowAccent.shade100;
                              scoreTenWordDelayRecall -= 1;
                            }
                          });
                        },
                        child: Text(app_data.tenWordRecallList[index]),
                      );
                    })),
              ),
            ),
//          Padding(padding: EdgeInsets.all(8.0)),
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
                          // Update the model with the current ten word delay recall score
                          final micaScoreModel = Provider.of<MicaScoreModel>(context, listen: false);
                          micaScoreModel.setTenWordDelay(scoreTenWordDelayRecall);
                          
                          // Navigate to next screen using Provider
                          var router = MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const TenWordRecognition());
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

  void getPrefsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final micaScoreModel = Provider.of<MicaScoreModel>(context, listen: false);
    
    // Check if we have a saved score, otherwise use the model's score
    int? score = prefs.getInt("tenWordDelay") ?? micaScoreModel.tenWordDelay;
    List<String>? tempWordColor = prefs.getStringList("recallwordButtonColor");

    if (tempWordColor != null) {
      for (var i = 0; i < 10; i++) {
        if (i < tempWordColor.length && tempWordColor[i] == "green") {
          setState(() {
            wordButtonColor[i] = Colors.green;
            wordColor[i] = "green";
          });
        }
      }
    }

    setState(() {
      scoreTenWordDelayRecall = score;
    });
    
    // Update the model with the loaded score
    micaScoreModel.setTenWordDelay(scoreTenWordDelayRecall);
  }

  Future<bool> savePrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final micaScoreModel = Provider.of<MicaScoreModel>(context, listen: false);
    
    // Save to shared preferences
    await prefs.setInt("tenWordDelay", scoreTenWordDelayRecall);

    for (var i = 0; i < 10; i++) {
      if (wordButtonColor[i] == Colors.green) {
        wordColor[i] = "green";
      } else {
        wordColor[i] = 'yellow';
      }
    }
    await prefs.setStringList("recallwordButtonColor", wordColor);
    
    // Update the model
    micaScoreModel.setTenWordDelay(scoreTenWordDelayRecall);

    return true;
  }
}
