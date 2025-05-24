import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/welcome.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/utils/navigation_helper.dart';

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
  DomainVigilanceState createState() => DomainVigilanceState();
}

class DomainVigilanceState extends State<DomainVigilance> {
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
              app_data.testAttention,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              app_data.testAttentionSubtitle,
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
                  NavigationHelper.navigateAndRemoveUntil(
                    context,
                    Welcome(),
                    (Route<dynamic> route) => false,
                  );
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
                              app_data.testAttentionToPatient,
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
                              app_data.testAttentionDetails,
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
                        child: GridView.count(
                          crossAxisCount: 7,
                          childAspectRatio: 1.2,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                          children: List.generate(app_data.attentionList.length,
                              (index) {
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
                                        if (app_data.attentionList[index] ==
                                            "A") {
                                          tapCorrect[index] = true;
                                          correctTap += 1;
                                          letterTapButtonColor[index] =
                                              Colors.green;
                                          correctCheck[index] = true;
                                        }
                                        if (app_data.attentionList[index] !=
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
                                  child: Text(app_data.attentionList[index]),
                                ),
                                Center(
                                  child: SizedBox(
                                    width: 30.0,
                                    height: 30.0,
                                    child: tapCorrect[index]
                                        ? Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          )
                                        : tapWrong[index]
                                            ? Icon(
                                                Icons.close,
                                                color: Colors.red,
                                              )
                                            : null,
                                  ),
                                ),
                                GestureDetector(
                                  child: tapWrong[index]
                                      ? Icon(
                                          Icons.clear,
                                          color: Colors.white,
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
                              ],
                            );
                          }),
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
//                            app_data.testResponse,
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
                              app_data.testAttentionResponse,
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
                                      app_data.testAttentionResponseNormal,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data.testAttentionResponseEquivocal,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data.testAttentionResponseImpaired,
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
                            NavigationHelper.navigateAndRemoveUntil(
                              context,
                              AttentionConcentration(),
                              (Route<dynamic> route) => true,
                            );
                          },
                          child: Text(app_data.domainTestCompleteButton),
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
        score: _radioValue, correct: correctTap, mistakes: wrongTap);

    // We don't need to save the UI states (button colors, etc.) to the Provider
    // as these are only relevant during the current session
  }
}
