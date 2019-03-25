import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/home.dart';
import 'package:mica/src/ten_word_recall_task_trial_two.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TenWordRecallTrialOne extends StatefulWidget {
  String patientName;
  String assessorName;
  String handedness;
  DateTime assessmentDate;
  int languageComprehensionRadioValue;

  TenWordRecallTrialOne(
      {Key key,
      this.patientName,
      this.assessorName,
      this.handedness,
      this.assessmentDate,
      this.languageComprehensionRadioValue})
      : super(key: key);

  @override
  _TenWordRecallTrialOneState createState() => _TenWordRecallTrialOneState();
}

class _TenWordRecallTrialOneState extends State<TenWordRecallTrialOne>
    with SingleTickerProviderStateMixin {
  List<Color> wordButtonColor = [];
  List<String> wordColor = [];
  int scoreTenWordRecallTrialOne;

  bool activeContinueButton = false;

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 10; i++) {
      wordButtonColor.add(Colors.yellowAccent.shade100);
    }
    getPrefsData();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var screenHeightInfo =
        (MediaQuery.of(context).size.height * 0.3).floorToDouble();
    var screenHeightWords =
        (MediaQuery.of(context).size.height * 0.45).floorToDouble();
    return WillPopScope(
      onWillPop: savePrefData,
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              appData.testTenWordRecallTrialOne,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              appData.testTenWordRecallTrialOneSubtitle,
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
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
                            color: Colors.yellowAccent.shade400,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                appData
                                    .instructionsTenWordRecallTrialOnePaient1,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0),
                              ),
                            ),
                          ),
//                    Padding(padding: EdgeInsets.all(8.0)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Card(
                            elevation: 10.0,
                            color: Colors.deepPurple.shade300,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                appData
                                    .instructionsTenWordRecallTrialOneHealthworker1,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0),
                              ),
                            ),
                          ),
//                    Padding(padding: EdgeInsets.all(8.0)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Card(
                            elevation: 10.0,
                            color: Colors.yellowAccent.shade400,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                appData
                                    .instructionsTenWordRecallTrialOnePatient2,
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
                              child: Text(
                                appData
                                    .instructionsTenWordRecallTrialOneHealthworker2,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0),
                              ),
                            ),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                      return FlatButton(
                        color: wordButtonColor[index],
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
                        child: Text("${appData.tenWordRecallList[index]}"),
                      );
                    })),
              ),
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
                                  new TenWordRecallTrialTwo(
                                    patientName: widget.patientName,
                                    assessorName: widget.assessorName,
                                    handedness: widget.handedness,
                                    assessmentDate: widget.assessmentDate,
                                    languageComprehensionRadioValue:
                                        widget.languageComprehensionRadioValue,
                                    trialOneScore: scoreTenWordRecallTrialOne,
                                  ));
                          Navigator.of(context).pushAndRemoveUntil(
                              router, (Route<dynamic> route) => true);
                        }),
                  ),
                )),
          ],
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
  }

  void getPrefsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int _score = prefs.getInt("trialOneScore");
    wordColor = prefs.getStringList("trial1wordButtonColor");

    for (var i = 0; i < 10; i++) {
      if (wordColor[i] == "green") {
        setState(() {
          wordButtonColor[i] = Colors.green;
        });
      }
    }
    setState(() {
      scoreTenWordRecallTrialOne = _score;
    });
  }

  Future<bool> savePrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("trialOneScore", scoreTenWordRecallTrialOne);

    for (var i = 0; i < 10; i++) {
      if (wordButtonColor[i] == Colors.green) {
        wordColor[i] = "green";
      } else {
        wordColor[i] = 'yellow';
      }
    }

    prefs.setStringList("trial1wordButtonColor", wordColor);

    return true;
  }
}
