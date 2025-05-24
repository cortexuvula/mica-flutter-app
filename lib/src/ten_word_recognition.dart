import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/shortterm_memory_visual.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/models/mica_score_model.dart';
import 'package:provider/provider.dart';
import 'package:mica/src/utils/navigation_helper.dart';

class TenWordRecognition extends StatefulWidget {
  // Using Provider pattern, no need for parameters
  const TenWordRecognition({super.key});

  @override
  TenWordRecognitionState createState() => TenWordRecognitionState();
}

class TenWordRecognitionState extends State<TenWordRecognition> {
  List<Map<String, Color>> wordButtonColor = [];

  int scoreVerbalRecognitionMemoryTenWords = 0;
  int scoreVerbalRecognitionMemoryTenWordsInList = 0;
  int scoreVerbalRecognitionMemoryTenWordsNotInList = 0;

  bool yesNoSelected = false;

  List<String>? noColors;
  List<String>? yesColors;

  @override
  void initState() {
    super.initState();
    // Load data from the model instead of preferences
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadFromModel();
    });
    for (var i = 0; i < app_data.tenWordMemoryList.length; i++) {
      wordButtonColor.add({"yes": Colors.white70, "no": Colors.white70});
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var screenHeightInfo =
        (MediaQuery.of(context).size.height * 0.3).floorToDouble();
    var screenHeightWords =
        (MediaQuery.of(context).size.height * 0.4).floorToDouble();
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        // Save to the model
        saveToModel();
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              app_data.testTenWordRecognition,
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
                  NavigationHelper.navigateAndRemoveUntil(context,
                      const Welcome(), (Route<dynamic> route) => false);
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
                              app_data.instructionDelayedRecallHealthworker1,
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
                            child: RichText(
                                text: TextSpan(
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: app_data
                                          .instructionsWordRecognitionHealthworker2),
                                  TextSpan(
                                      text: app_data
                                          .instructionDelayedRecallHealthworker1,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: app_data
                                          .instructionsWordRecognitionHealthworker4)
                                ])),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
                width: width,
                height: screenHeightWords,
                child: ListView.builder(
                    itemCount: app_data.tenWordMemoryList.length,
                    padding: const EdgeInsets.all(16.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 10.0,
                        color: Theme.of(context).cardColor,
                        child: ListTile(
                          title: Text(
                            app_data.tenWordMemoryList[index],
                            style: TextStyle(
                                fontWeight: app_data.tenWordRecallList.contains(
                                        app_data.tenWordMemoryList[index])
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: app_data.tenWordRecallList.contains(
                                        app_data.tenWordMemoryList[index])
                                    ? Colors.black
                                    : Colors.black38),
                          ),
                          trailing: SizedBox(
                            width: 200.0,
                            child: Container(
                              color: Colors.black87,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  // yes button setup
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        if (wordButtonColor[index]["no"] ==
                                            Colors.white70) {
                                          if (wordButtonColor[index]["yes"] ==
                                              Colors.white70) {
                                            if (app_data.tenWordRecallList
                                                .contains(
                                                    app_data.tenWordMemoryList[
                                                        index])) {
                                              ifWordInTheListAdd();
                                              wordButtonColor[index]["yes"] =
                                                  Colors.green;
                                            } else {
                                              wordButtonColor[index]["yes"] =
                                                  Colors.red;
                                              // Do nothing as word is not in list and not correctly rejected
                                            }
                                          }
                                          // Sort out the scorring as it will not be correct as code is now
                                          //                                      else if (wordButtonColor[index]
                                          //                                      ["yes"] ==
                                          //                                          Colors.green) {
                                          //                                        wordButtonColor[index]["yes"] =
                                          //                                            Colors.white70;
                                          //                                        if (app_data.tenWordRecallList.contains(
                                          //                                            app_data.tenWordMemoryList[index])) {
                                          //                                          ifWordInTheListMinus();
                                          //                                        }
                                          //                                      }
                                          //                                      else if (wordButtonColor[index]
                                          //                                      ["yes"] ==
                                          //                                          Colors.red) {
                                          //                                        wordButtonColor[index]["yes"] =
                                          //                                            Colors.white70;
                                          //                                        // Not sure if this is the correct logic here - check scores
                                          ////                                        if (!app_data.tenWordRecallList.contains(
                                          ////                                            app_data.tenWordMemoryList[index])) {
                                          ////                                          ifWordInTheListMinus();
                                          ////                                        }
                                          //                                      }
                                        } else if (wordButtonColor[index]
                                                ["no"] ==
                                            Colors.green) {
                                          if (wordButtonColor[index]["yes"] ==
                                              Colors.white70) {
                                            wordButtonColor[index]["no"] =
                                                Colors.white70;
                                            if (app_data.tenWordRecallList
                                                .contains(
                                                    app_data.tenWordMemoryList[
                                                        index])) {
                                              ifWordInTheListAdd();
                                              wordButtonColor[index]["yes"] =
                                                  Colors.green;
                                            }
                                            if (!app_data.tenWordRecallList
                                                .contains(
                                                    app_data.tenWordMemoryList[
                                                        index])) {
                                              wordButtonColor[index]["yes"] =
                                                  Colors.red;
                                              // Do nothing as word is not in list and not correctly rejected
                                              ifWordNotInListMinus();
                                            }
                                          }
                                        } else if (wordButtonColor[index]
                                                ["no"] ==
                                            Colors.red) {
                                          if (wordButtonColor[index]["yes"] ==
                                              Colors.white70) {
                                            wordButtonColor[index]["no"] =
                                                Colors.white70;
                                            if (app_data.tenWordRecallList
                                                .contains(
                                                    app_data.tenWordMemoryList[
                                                        index])) {
                                              ifWordInTheListAdd();
                                              wordButtonColor[index]["yes"] =
                                                  Colors.green;
                                            }
                                            if (!app_data.tenWordRecallList
                                                .contains(
                                                    app_data.tenWordMemoryList[
                                                        index])) {
                                              wordButtonColor[index]["yes"] =
                                                  Colors.red;
                                              // Do nothing as word is not in list and not correctly rejected
                                              ifWordNotInListMinus();
                                            }
                                          }
                                        }
                                      });
                                    },
                                    style: TextButton.styleFrom(
                                      foregroundColor: wordButtonColor[index]
                                          ["yes"],
                                    ),
                                    child: const Text("Yes"),
                                  ),
                                  // No Button Setup
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        if (wordButtonColor[index]["yes"] ==
                                            Colors.white70) {
                                          if (wordButtonColor[index]["no"] ==
                                              Colors.white70) {
                                            if (!app_data.tenWordRecallList
                                                .contains(
                                                    app_data.tenWordMemoryList[
                                                        index])) {
                                              ifWordNotInListAdd();
                                              wordButtonColor[index]["no"] =
                                                  Colors.green;
                                            } else {
                                              wordButtonColor[index]["no"] =
                                                  Colors.red;
                                              // not sure if logic is needed for scoring
                                            }
                                          }
                                          //                                      if (wordButtonColor[index]["no"] == Colors.green) {
                                          //                                        wordButtonColor[index]["no"] =
                                          //                                            Colors.white70;
                                          //                                        if (!app_data.tenWordRecallList.contains(app_data.tenWordMemoryList[index])) {
                                          //                                          ifWordNotInListMinus();
                                          //
                                          //                                        }
                                          //                                      }
                                        } else if (wordButtonColor[index]
                                                ["yes"] ==
                                            Colors.green) {
                                          if (wordButtonColor[index]["no"] ==
                                              Colors.white70) {
                                            if (!app_data.tenWordRecallList
                                                .contains(
                                                    app_data.tenWordMemoryList[
                                                        index])) {
                                              ifWordNotInListAdd();
                                              wordButtonColor[index]["no"] =
                                                  Colors.green;
                                              wordButtonColor[index]["yes"] =
                                                  Colors.white70;
                                            } else if (app_data
                                                .tenWordRecallList
                                                .contains(
                                                    app_data.tenWordMemoryList[
                                                        index])) {
                                              // Do nothing as word is not in list and not correctly rejected
                                              ifWordInTheListMinus();
                                              wordButtonColor[index]["no"] =
                                                  Colors.red;
                                              wordButtonColor[index]["yes"] =
                                                  Colors.white70;
                                            }
                                          }
                                        } else if (wordButtonColor[index]
                                                ["yes"] ==
                                            Colors.red) {
                                          wordButtonColor[index]["yes"] =
                                              Colors.white70;
                                          if (!app_data.tenWordRecallList
                                              .contains(app_data
                                                  .tenWordMemoryList[index])) {
                                            wordButtonColor[index]["no"] =
                                                Colors.green;
                                          }
                                        }
                                      });
                                    },
                                    style: TextButton.styleFrom(
                                      foregroundColor: wordButtonColor[index]
                                          ["no"],
                                    ),
                                    child: const Text("No"),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
            SizedBox(
              height: 10.0,
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
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(color: Colors.black),
                          overflow: TextOverflow.clip,
                        ),
                        onPressed: () {
                          // Update the model first before navigating
                          final micaScoreModel = Provider.of<MicaScoreModel>(
                              context,
                              listen: false);
                          micaScoreModel.setVerbalRecognitionMemory(
                            score: scoreVerbalRecognitionMemoryTenWords,
                            inList: scoreVerbalRecognitionMemoryTenWordsInList,
                            notInList:
                                scoreVerbalRecognitionMemoryTenWordsNotInList,
                          );

                          // Then navigate to the next screen
                          NavigationHelper.navigateTo(
                              context, const ShortTermMemoryVisual());
                        }),
                  ),
                )),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }

  void ifWordInTheListAdd() {
    scoreVerbalRecognitionMemoryTenWords += 1;
    scoreVerbalRecognitionMemoryTenWordsInList += 1;
  }

  void ifWordInTheListMinus() {
    scoreVerbalRecognitionMemoryTenWords -= 1;
    scoreVerbalRecognitionMemoryTenWordsInList -= 1;
  }

  void ifWordNotInListAdd() {
    scoreVerbalRecognitionMemoryTenWords += 1;
    scoreVerbalRecognitionMemoryTenWordsNotInList += 1;
  }

  void ifWordNotInListMinus() {
    scoreVerbalRecognitionMemoryTenWords -= 1;
    scoreVerbalRecognitionMemoryTenWordsNotInList -= 1;
  }

  void saveToModel() {
    final micaScoreModel = Provider.of<MicaScoreModel>(context, listen: false);

    // Update the model with current values
    micaScoreModel.setVerbalRecognitionMemory(
        score: scoreVerbalRecognitionMemoryTenWords,
        inList: scoreVerbalRecognitionMemoryTenWordsInList,
        notInList: scoreVerbalRecognitionMemoryTenWordsNotInList);

    // If we want to save button states in the future,
    // we would need to extend the model to store this information
  }

  void loadFromModel() {
    final micaScoreModel = Provider.of<MicaScoreModel>(context, listen: false);

    setState(() {
      scoreVerbalRecognitionMemoryTenWords =
          micaScoreModel.scoreVerbalRecognitionMemoryTenWords;
      scoreVerbalRecognitionMemoryTenWordsInList =
          micaScoreModel.scoreVerbalRecognitionMemoryTenWordsInList;
      scoreVerbalRecognitionMemoryTenWordsNotInList =
          micaScoreModel.scoreVerbalRecognitionMemoryTenWordsNotInList;
    });
  }
}
