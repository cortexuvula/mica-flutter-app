
import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/home.dart';
import 'package:mica/src/shortterm_memory_visual.dart';

class TenWordRecognition extends StatefulWidget {
  String patientName;
  String assessorName;
  String handedness;
  DateTime assessmentDate;
  int languageComprehensionRadioValue;
  int trialOneScore;
  int trialTwoScore;
  int trialThreeScore;
  int visuospatialPraxisImage1;
  int visuospatialPraxisImage2;
  int visuospatialPraxisImage3;
  int attention;
  int executiveAnimalNaming;
  int executiveLuria;
  int executiveSerial;
  int shorttermMemoryVerbal;
  int praxis;
  int tenWordDelay;


  TenWordRecognition(
      {Key key,
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
        this.executiveAnimalNaming,
        this.executiveLuria,
        this.executiveSerial,
        this.shorttermMemoryVerbal,
        this.praxis,
        this.tenWordDelay
        })
      : super(key: key);

  @override
  _TenWordRecognitionState createState() =>
      _TenWordRecognitionState();
}

class _TenWordRecognitionState
    extends State<TenWordRecognition> {
  List<Map<String, Color>> wordButtonColor = [];

  int scoreVerbalRecognitionMemoryTenWords = 0;
  int scoreVerbalRecognitionMemoryTenWordsInList = 0;
  int scoreVerbalRecognitionMemoryTenWordsNotInList = 0;

  bool yesNoSelected = false;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < appData.tenWordMemoryList.length; i++) {
      wordButtonColor.add({"yes": Colors.white70, "no": Colors.white70});
    }
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var screenHeightInfo =
    (MediaQuery.of(context).size.height * 0.3).floorToDouble();
    var screenHeightWords =
    (MediaQuery.of(context).size.height * 0.4).floorToDouble();
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            appData.testTenWordRecognition,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                var router = new MaterialPageRoute(
                    builder: (BuildContext context) => new Home(
                      viewedDisclaimer: true,
                    ));
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Scroll down to reveal more instructions",
                            style:
                            TextStyle(fontSize: 10.0, color: Colors.black38),
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
                        color: Colors.deepPurple.shade300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
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
                                        style: TextStyle(
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
              width: MediaQuery.of(context).size.width,
              height: screenHeightWords,
              child: ListView.builder(
                  itemCount: appData.tenWordMemoryList.length,
                  padding: EdgeInsets.all(16.0),
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
                        trailing: Container(
                          width: 200.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              // yes button setup
                              FlatButton(
                                onPressed: () {
                                  setState(() {
                                    if (wordButtonColor[index]["no"] ==
                                        Colors.white70) {
                                      if (wordButtonColor[index]["yes"] ==
                                          Colors.white70) {
//                                        wordButtonColor[index]["yes"] =
//                                            Colors.green;
                                        if (appData.tenWordRecallList.contains(
                                            appData.tenWordMemoryList[index])) {
                                          ifWordInTheListAdd();
                                          wordButtonColor[index]["yes"] =
                                              Colors.green;
                                        } else {
                                          wordButtonColor[index]["yes"] =
                                              Colors.red;
                                          // Do nothing as word is not in list and not correctly rejected
                                        }
                                      }
                                      //TODO: Sort out the scorring as it will not be correct as code is now
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
                                    } else if (wordButtonColor[index]["no"] ==
                                        Colors.green) {
                                      if (wordButtonColor[index]["yes"] ==
                                          Colors.white70) {
//                                        wordButtonColor[index]["yes"] =
//                                            Colors.green;
                                        wordButtonColor[index]["no"] =
                                            Colors.white70;
                                        if (appData.tenWordRecallList.contains(
                                            appData.tenWordMemoryList[index])) {
                                          ifWordInTheListAdd();
                                          wordButtonColor[index]["yes"] =
                                              Colors.green;
                                        }
                                        if (!appData.tenWordRecallList
                                            .contains(appData
                                            .tenWordMemoryList[index])) {
                                          wordButtonColor[index]["yes"] =
                                              Colors.red;
                                          // Do nothing as word is not in list and not correctly rejected
                                          ifWordNotInListMinus();
                                        }
                                      }
                                    } else if (wordButtonColor[index]["no"] ==
                                        Colors.red) {
                                      if (wordButtonColor[index]["yes"] ==
                                          Colors.white70) {
//                                        wordButtonColor[index]["yes"] =
//                                            Colors.green;
                                        wordButtonColor[index]["no"] =
                                            Colors.white70;
                                        if (appData.tenWordRecallList.contains(
                                            appData.tenWordMemoryList[index])) {
                                          ifWordInTheListAdd();
                                          wordButtonColor[index]["yes"] =
                                              Colors.green;
                                        }
                                        if (!appData.tenWordRecallList
                                            .contains(appData
                                            .tenWordMemoryList[index])) {
                                          wordButtonColor[index]["yes"] =
                                              Colors.red;
                                          // Do nothing as word is not in list and not correctly rejected
                                          ifWordNotInListMinus();
                                        }
                                      }
                                    }
                                  });

                                },
                                child: Text("Yes"),
                                color: wordButtonColor[index]["yes"],
                              ),
                              // No Button Setup
                              FlatButton(
                                onPressed: () {
                                  setState(() {
                                    if (wordButtonColor[index]["yes"] == Colors.white70) {
                                      if (wordButtonColor[index]["no"] == Colors.white70) {
                                        if (!appData.tenWordRecallList.contains(appData.tenWordMemoryList[index])) {
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

                                    } else if (wordButtonColor[index]["yes"] == Colors.green) {
                                      if (wordButtonColor[index]["no"] == Colors.white70) {
                                        if (!appData.tenWordRecallList.contains(appData.tenWordMemoryList[index])) {
                                          ifWordNotInListAdd();
                                          wordButtonColor[index]["no"] =
                                              Colors.green;
                                          wordButtonColor[index]["yes"] =
                                              Colors.white70;
                                        } else if (appData.tenWordRecallList.contains(appData.tenWordMemoryList[index])) {
                                          // Do nothing as word is not in list and not correctly rejected
                                          ifWordInTheListMinus();
                                          wordButtonColor[index]["no"] =
                                              Colors.red;
                                          wordButtonColor[index]["yes"] =
                                              Colors.white70;
                                        }
                                      }
                                    } else if (wordButtonColor[index]["yes"] == Colors.red) {
                                      wordButtonColor[index]["yes"] = Colors.white70;
                                      if (!appData.tenWordRecallList.contains(appData.tenWordMemoryList[index])) {
                                        wordButtonColor[index]["no"] =
                                            Colors.green;
                                      }
                                    }
                                  });

                                },
                                child: Text("No"),
                                color: wordButtonColor[index]["no"],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
          SizedBox(
            height: 10.0,
          ),
          Container(
              width: _width * 0.9,
              child: Card(
                elevation: 10.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      elevation: 10.0,
                      child: Text(
                        "Continue",
                        overflow: TextOverflow.clip,
                      ),
                      //onPressed: () => debugPrint("hello"),
                      onPressed: () {
                        var router = new MaterialPageRoute(
                            builder: (BuildContext context) =>
                            new ShortTermMemoryVisual(
                              patientName: widget.patientName,
                              assessorName: widget.assessorName,
                              handedness: widget.handedness,
                              assessmentDate: widget.assessmentDate,
                              languageComprehensionRadioValue: widget
                                  .languageComprehensionRadioValue,
                              trialOneScore: widget.trialOneScore,
                              trialTwoScore: widget.trialTwoScore,
                              trialThreeScore: widget.trialThreeScore,
                              visuospatialPraxisImage1: widget.visuospatialPraxisImage1,
                              visuospatialPraxisImage2: widget.visuospatialPraxisImage2,
                              visuospatialPraxisImage3: widget.visuospatialPraxisImage3,
                              attention: widget.attention,
                              executiveAnimalNaming: widget.executiveAnimalNaming,
                              executiveLuria: widget.executiveLuria,
                              executiveSerial: widget.executiveSerial,
                              praxis: widget.praxis,
                              shorttermMemoryVerbal: widget.shorttermMemoryVerbal,
                              tenWordDelay: widget.tenWordDelay,
                              scoreVerbalRecognitionMemoryTenWords: scoreVerbalRecognitionMemoryTenWords,
                              scoreVerbalRecognitionMemoryTenWordsInList: scoreVerbalRecognitionMemoryTenWordsInList,
                              scoreVerbalRecognitionMemoryTenWordsNotInList: scoreVerbalRecognitionMemoryTenWordsNotInList,
                            ));
                        Navigator.of(context).pushAndRemoveUntil(
                            router, (Route<dynamic> route) => false);
                      }),
                ),
              )),

        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
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
}
