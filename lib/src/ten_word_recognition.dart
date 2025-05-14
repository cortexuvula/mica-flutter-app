import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/shortterm_memory_visual.dart';
import 'package:mica/src/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TenWordRecognition extends StatefulWidget {
  final String? patientName;
  final String? assessorName;
  final String? handedness;
  final DateTime? assessmentDate;
  final int? languageComprehensionRadioValue;
  final int? trialOneScore;
  final int? trialTwoScore;
  final int? trialThreeScore;
  final int? visuospatialPraxisImage1;
  final int? visuospatialPraxisImage2;
  final int? visuospatialPraxisImage3;
  final int? attention;
  final int? attentionCorrect;
  final int? attentionMistakes;
  final int? executiveAnimalNaming;
  final int? executiveAnimalNamingCount;
  final int? executiveLuria;
  final int? executiveLuriaScore;
  final int? executiveSerial;
  final int? executiveSerialScore;
  final int? shorttermMemoryVerbal;
  final int? shorttermMemoryVerbalScore;
  final int? praxisRight;
  final int? praxisLeft;
  final int? tenWordDelay;

  const TenWordRecognition(
      {super.key,
      this.patientName,
      this.assessorName,
      this.handedness,
      this.assessmentDate,
      this.languageComprehensionRadioValue,
      this.trialOneScore,
      this.trialTwoScore,
      this.trialThreeScore,
      this.visuospatialPraxisImage1,
      this.visuospatialPraxisImage2,
      this.visuospatialPraxisImage3,
      this.attention,
      this.attentionCorrect,
      this.attentionMistakes,
      this.executiveAnimalNaming,
      this.executiveAnimalNamingCount,
      this.executiveLuria,
      this.executiveLuriaScore,
      this.executiveSerial,
      this.executiveSerialScore,
      this.shorttermMemoryVerbal,
      this.shorttermMemoryVerbalScore,
      this.praxisRight,
      this.praxisLeft,
      this.tenWordDelay});

  @override
  _TenWordRecognitionState createState() => _TenWordRecognitionState();
}

class _TenWordRecognitionState extends State<TenWordRecognition> {
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
    for (var i = 0; i < appData.tenWordMemoryList.length; i++) {
      wordButtonColor.add({"yes": Colors.white70, "no": Colors.white70});
    }
    getPrefsData();
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
        final shouldPop = await savePrefData();
        if (shouldPop && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              appData.testTenWordRecognition,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              appData.testTenWordRecognitionSubtitle,
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
                              appData.instructionsWordRecognitionPatient1,
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
                                      text: appData
                                          .instructionsWordRecognitionHealthworker2),
                                  TextSpan(
                                      text: appData
                                          .instructionsWordRecognitionHealthworker3,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: appData
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
                    itemCount: appData.tenWordMemoryList.length,
                    padding: const EdgeInsets.all(16.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 10.0,
                        color: Theme.of(context).cardColor,
                        child: ListTile(
                          title: Text(
                            appData.tenWordMemoryList[index],
                            style: TextStyle(
                                fontWeight: appData.tenWordRecallList.contains(
                                        appData.tenWordMemoryList[index])
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: appData.tenWordRecallList.contains(
                                        appData.tenWordMemoryList[index])
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
                                            if (appData.tenWordRecallList
                                                .contains(
                                                    appData.tenWordMemoryList[
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
                                          //                                        if (appData.tenWordRecallList.contains(
                                          //                                            appData.tenWordMemoryList[index])) {
                                          //                                          ifWordInTheListMinus();
                                          //                                        }
                                          //                                      }
                                          //                                      else if (wordButtonColor[index]
                                          //                                      ["yes"] ==
                                          //                                          Colors.red) {
                                          //                                        wordButtonColor[index]["yes"] =
                                          //                                            Colors.white70;
                                          //                                        // Not sure if this is the correct logic here - check scores
                                          ////                                        if (!appData.tenWordRecallList.contains(
                                          ////                                            appData.tenWordMemoryList[index])) {
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
                                            if (appData.tenWordRecallList
                                                .contains(
                                                    appData.tenWordMemoryList[
                                                        index])) {
                                              ifWordInTheListAdd();
                                              wordButtonColor[index]["yes"] =
                                                  Colors.green;
                                            }
                                            if (!appData.tenWordRecallList
                                                .contains(
                                                    appData.tenWordMemoryList[
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
                                            if (appData.tenWordRecallList
                                                .contains(
                                                    appData.tenWordMemoryList[
                                                        index])) {
                                              ifWordInTheListAdd();
                                              wordButtonColor[index]["yes"] =
                                                  Colors.green;
                                            }
                                            if (!appData.tenWordRecallList
                                                .contains(
                                                    appData.tenWordMemoryList[
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
                                            if (!appData.tenWordRecallList
                                                .contains(
                                                    appData.tenWordMemoryList[
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
                                          //                                        if (!appData.tenWordRecallList.contains(appData.tenWordMemoryList[index])) {
                                          //                                          ifWordNotInListMinus();
                                          //
                                          //                                        }
                                          //                                      }
                                        } else if (wordButtonColor[index]
                                                ["yes"] ==
                                            Colors.green) {
                                          if (wordButtonColor[index]["no"] ==
                                              Colors.white70) {
                                            if (!appData.tenWordRecallList
                                                .contains(
                                                    appData.tenWordMemoryList[
                                                        index])) {
                                              ifWordNotInListAdd();
                                              wordButtonColor[index]["no"] =
                                                  Colors.green;
                                              wordButtonColor[index]["yes"] =
                                                  Colors.white70;
                                            } else if (appData.tenWordRecallList
                                                .contains(
                                                    appData.tenWordMemoryList[
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
                                          if (!appData.tenWordRecallList
                                              .contains(appData
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
                          overflow: TextOverflow.clip,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ShortTermMemoryVisual(
                                patientName: widget.patientName,
                                assessorName: widget.assessorName,
                                handedness: widget.handedness,
                                assessmentDate: widget.assessmentDate,
                                languageComprehensionRadioValue:
                                    widget.languageComprehensionRadioValue,
                                trialOneScore: widget.trialOneScore,
                                trialTwoScore: widget.trialTwoScore,
                                trialThreeScore: widget.trialThreeScore,
                                visuospatialPraxisImage1:
                                    widget.visuospatialPraxisImage1,
                                visuospatialPraxisImage2:
                                    widget.visuospatialPraxisImage2,
                                visuospatialPraxisImage3:
                                    widget.visuospatialPraxisImage3,
                                attention: widget.attention,
                                attentionCorrect: widget.attentionCorrect,
                                attentionMistakes: widget.attentionMistakes,
                                executiveAnimalNaming:
                                    widget.executiveAnimalNaming,
                                executiveAnimalNamingCount:
                                    widget.executiveAnimalNamingCount,
                                executiveLuria: widget.executiveLuria,
                                executiveLuriaScore: widget.executiveLuriaScore,
                                executiveSerial: widget.executiveSerial,
                                executiveSerialScore:
                                    widget.executiveSerialScore,
                                shorttermMemoryVerbal:
                                    widget.shorttermMemoryVerbal,
                                shorttermMemoryVerbalScore:
                                    widget.shorttermMemoryVerbalScore,
                                praxisRight: widget.praxisRight,
                                praxisLeft: widget.praxisLeft,
                                tenWordDelay: widget.tenWordDelay,
                                scoreVerbalRecognitionMemoryTenWords:
                                    scoreVerbalRecognitionMemoryTenWords,
                                scoreVerbalRecognitionMemoryTenWordsInList:
                                    scoreVerbalRecognitionMemoryTenWordsInList,
                                scoreVerbalRecognitionMemoryTenWordsNotInList:
                                    scoreVerbalRecognitionMemoryTenWordsNotInList,
                              ),
                            ),
                          );
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

  Future<bool> savePrefData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("tenWordRecognition", scoreVerbalRecognitionMemoryTenWords);
    prefs.setInt(
        "tenWordRecognitionInList", scoreVerbalRecognitionMemoryTenWordsInList);
    prefs.setInt("tenWordRecognitionNotInList",
        scoreVerbalRecognitionMemoryTenWordsNotInList);

    List<String> noWordColor = [];
    List<String> yesWordColor = [];

    for (var i = 0; i < 20; i++) {
      if (wordButtonColor[i]["yes"] == Colors.white70) {
        yesWordColor.add("white");
      } else if (wordButtonColor[i]["yes"] == Colors.red) {
        yesWordColor.add("red");
      } else {
        yesWordColor.add("green");
      }
      if (wordButtonColor[i]["no"] == Colors.white70) {
        noWordColor.add("white");
      } else if (wordButtonColor[i]["no"] == Colors.red) {
        noWordColor.add("red");
      } else {
        noWordColor.add("green");
      }
    }

    prefs.setStringList("noColors", noWordColor);
    prefs.setStringList("yesColors", yesWordColor);

    return true;
  }

  void getPrefsData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      scoreVerbalRecognitionMemoryTenWords =
          prefs.getInt("tenWordRecognition") ?? 0;
      scoreVerbalRecognitionMemoryTenWordsInList =
          prefs.getInt("tenWordRecognitionInList") ?? 0;
      scoreVerbalRecognitionMemoryTenWordsNotInList =
          prefs.getInt("tenWordRecognitionNotInList") ?? 0;
    });
  }
}
