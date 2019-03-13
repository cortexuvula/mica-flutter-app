import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/home.dart';
import 'package:mica/src/visuospatial_praxis.dart';

class TenWordRecallTrialThree extends StatefulWidget {
  String patientName;
  String assessorName;
  String handedness;
  DateTime assessmentDate;
  int languageComprehensionRadioValue;
  int trialOneScore;
  int trialTwoScore;

  TenWordRecallTrialThree(
      {Key key,
        this.patientName,
        this.assessorName,
        this.handedness,
        this.assessmentDate,
        this.languageComprehensionRadioValue,
        this.trialOneScore,
        this.trialTwoScore})
      : super(key: key);

  @override
  _TenWordRecallTrialThreeState createState() => _TenWordRecallTrialThreeState();
}

class _TenWordRecallTrialThreeState extends State<TenWordRecallTrialThree> {
  List<Color> wordButtonColor = [];
  int scoreTenWordRecallTrialThree = 0;
  bool activeContinueButton = false;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 10; i++) {
      wordButtonColor.add(Colors.yellowAccent.shade100);
    }
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var screenHeightInfo =
    (MediaQuery.of(context).size.height * 0.3).floorToDouble();
    var screenHeightWords =
    (MediaQuery.of(context).size.height * 0.45).floorToDouble();
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            appData.testTenWordRecallTrialThree,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.start,
          ),
          subtitle: Text(
            appData.testTenWordRecallTrialThreeSubtitle,
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
                          color: Colors.deepPurple.shade300,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              appData
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
                              appData.instructionsTenWordRecallTrialThreePatient1,
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
                              appData
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
                              appData.instructionsTenWordRecallTrialThreePatient2,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                              textAlign: TextAlign.left,
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
                      child: Text("${appData.tenWordRecallList3[index]}"),
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
                            new VisuospatialPraxis(
                              patientName: widget.patientName,
                              assessorName: widget.assessorName,
                              handedness: widget.handedness,
                              assessmentDate: widget.assessmentDate,
                              languageComprehensionRadioValue:
                              widget.languageComprehensionRadioValue,
                              trialOneScore: widget.trialOneScore,
                              trialTwoScore: widget.trialTwoScore,
                              trialThreeScore: scoreTenWordRecallTrialThree,
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
}
