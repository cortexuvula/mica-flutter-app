import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/welcome.dart';
import 'package:mica/src/providers/mica_provider.dart';

import 'domain_attention_concentration.dart';

class DomainVigilance extends StatefulWidget {
  final String? patientName;
  final String? assessorName;
  final String? handedness;
  final DateTime? assessmentDate;

  const DomainVigilance({
    super.key,
    this.patientName,
    this.assessorName,
    this.handedness,
    this.assessmentDate,
  });

  @override
  _DomainVigilanceState createState() => _DomainVigilanceState();
}

class _DomainVigilanceState extends State<DomainVigilance> {
  Timer? timer;

  int _radioValue = 0;
  double sizeBoxHeight = 10.0;
  int sequenceIndex = 0;
  bool sequenceInMotion = false;

  int i = 0;
  String displayLetter = "Letters";

  List<bool> tapCorrect = [];
  List<bool> tapWrong = [];
  List<bool> correctCheck = [];

  List<Color> letterTapButtonColor = [];
  List<Color> letterNoTapButtonColor = [];
  int correctTap = 0;
  int wrongTap = 0;
  var correctSelectedColor = Colors.green;
  var wrongSelectedColor = Colors.red;

  // Removed unused letters list

  @override
  void initState() {
    super.initState();
    // No need to populate letters list since it's not used
    initFromProvider();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        // Save to provider instead of SharedPreferences
        saveToProvider();
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              appData.testAttention,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              appData.testAttentionSubtitle,
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
        body: ListView(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: sizeBoxHeight,
                  ),
                  SizedBox(
                    width: width * 0.9,
                    child: Card(
                      elevation: 10.0,
                      color: Colors.yellowAccent.shade400,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              appData.testAttentionToPatient,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizeBoxHeight,
                  ),
                  SizedBox(
                    width: width * 0.9,
                    child: Card(
                      elevation: 10.0,
                      color: Colors.deepPurple.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              appData.testAttentionDetails,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizeBoxHeight,
                  ),
                  SizedBox(
                    width: width * 0.9,
                    height: 200.0,
                    child: Card(
                      elevation: 10.0,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: GridView.count(
                            crossAxisCount: 7,
                            childAspectRatio: 1.2,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                            children: List.generate(
                                appData.attentionList.length, (index) {
                              tapCorrect.add(false);
                              tapWrong.add(false);
                              correctCheck.add(false);
                              letterTapButtonColor.add(Colors.cyan.shade200);

                              return Stack(
                                children: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        if (!tapWrong[index] &&
                                            !tapCorrect[index]) {
                                          if (appData.attentionList[index] ==
                                              "A") {
                                            tapCorrect[index] = true;
                                            correctTap += 1;
                                            letterTapButtonColor[index] =
                                                Colors.green;
                                            correctCheck[index] = true;
                                          }
                                          if (appData.attentionList[index] !=
                                              "A") {
                                            tapWrong[index] = true;
                                            wrongTap += 1;
                                            letterTapButtonColor[index] =
                                                Colors.red;
                                            if (wrongTap == 1) {
                                              _radioValue = 1;
                                            } else if (wrongTap > 1) {
                                              _radioValue = 2;
                                            } else if (wrongTap < 1) {
                                              _radioValue = 0;
                                            }
                                          }
                                        }
                                      });
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStateProperty.all(
                                          letterTapButtonColor[index]),
                                    ),
                                    child:
                                        Text(appData.attentionList[index]),
                                  ),
                                  Center(
                                    child: Container(
                                      child: GestureDetector(
                                        child: tapCorrect[index]
                                            ? Container(
                                                child: Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                ),
                                              )
                                            : Container(),
                                        onTap: () {
                                          print("hello tap");
                                          if (correctCheck[index]) {
                                            setState(() {
                                              correctCheck[index] = true;
                                              tapCorrect[index] = false;
                                              tapWrong[index] = true;
                                              correctTap -= 1;
                                              wrongTap += 1;
                                              letterTapButtonColor[index] =
                                                  Colors.red;
                                              if (wrongTap == 1) {
                                                _radioValue = 1;
                                              } else if (wrongTap > 1) {
                                                _radioValue = 2;
                                              } else if (wrongTap < 1) {
                                                _radioValue = 0;
                                              }
                                            });
                                          }
//                                        setState(() {
//                                          tapCorrect[index] = false;
//                                          correctTap -= 1;
//                                          letterTapButtonColor[index] =
//                                              Colors.cyan.shade200;
//                                        });
                                        },
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      child: GestureDetector(
                                        child: tapWrong[index]
                                            ? Container(
                                                child: Icon(
                                                  Icons.clear,
                                                  color: Colors.white,
                                                ),
                                              )
                                            : Container(),
                                        onTap: () {
                                          setState(() {
                                            tapWrong[index] = false;
                                            wrongTap -= 1;
                                            letterTapButtonColor[index] =
                                                Colors.cyan.shade200;
                                            if (wrongTap == 1) {
                                              _radioValue = 1;
                                            } else if (wrongTap > 1) {
                                              _radioValue = 2;
                                            } else if (wrongTap < 1) {
                                              _radioValue = 0;
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizeBoxHeight,
                  ),
                  SizedBox(
                    width: width * 0.9,
                    child: Card(
                      elevation: 10.0,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Correct: ",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25.0),
                            ),
                            Text(
                              "$correctTap",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25.0),
                            ),
                            Text(
                              "Mistakes: ",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25.0),
                            ),
                            Text(
                              "$wrongTap",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizeBoxHeight,
                  ),
                  SizedBox(
                    width: width * 0.9,
                    child: Card(
                      elevation: 10.0,
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
//                          Text(
//                            appData.testResponse,
//                            textAlign: TextAlign.left,
//                            style: TextStyle(
//                              color: Colors.black,
//                              fontWeight: FontWeight.w500,
//                              fontSize: 20.0,
//                              decoration: TextDecoration.underline,
//                            ),
//                          ),
//                          SizedBox(
//                            height: 5.0,
//                          ),
                            Text(
                              appData.testAttentionResponse,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                            Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              border: TableBorder.all(),
                              columnWidths: {
                                0: FlexColumnWidth(0.3),
                                1: FlexColumnWidth(0.3),
                                2: FlexColumnWidth(0.34)
                              },
                              children: [
                                TableRow(children: [
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 0,
                                        groupValue: _radioValue,
                                        onChanged: _handleRadioValueChange,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Normal",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 1,
                                        groupValue: _radioValue,
                                        onChanged: _handleRadioValueChange,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Equivocal",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 2,
                                        groupValue: _radioValue,
                                        onChanged: _handleRadioValueChange,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Impaired",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData.testAttentionResponseNormal,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData.testAttentionResponseEquivocal,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData.testAttentionResponseImpaired,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                ])
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizeBoxHeight,
                  ),
                  SizedBox(
                    width: width * 0.9,
                    child: Card(
                      elevation: 10.0,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            var router = MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AttentionConcentration());
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
                          },
                          child: Text(appData.domain_test_complete_button),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value ?? 0;
    });
  }

  void initFromProvider() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    
    // Initialize default values
    List<Color> initialButtonColors = List.filled(26, Colors.cyan.shade200);
    List<bool> initialTapCorrect = List.filled(26, false);
    List<bool> initialTapWrong = List.filled(26, false);
    List<bool> initialCorrectCheck = List.filled(26, false);
    
    setState(() {
      // Get attention scores from the provider
      _radioValue = scoreModel.attention;
      correctTap = scoreModel.attentionCorrect;
      wrongTap = scoreModel.attentionMistakes;
      
      // Initialize button colors and states
      // Since these are UI states, we use default values rather than loading from Provider
      letterTapButtonColor = initialButtonColors;
      tapCorrect = initialTapCorrect;
      tapWrong = initialTapWrong;
      correctCheck = initialCorrectCheck;
    });
  }

  void saveToProvider() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    
    // Save attention scores to the provider
    scoreModel.setAttention(
      score: _radioValue,
      correct: correctTap,
      mistakes: wrongTap
    );
    
    // We don't need to save the UI states (button colors, etc.) to the Provider
    // as these are only relevant during the current session
  }
}
