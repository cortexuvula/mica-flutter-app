import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/welcome.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/utils/screen_routes.dart';
import 'package:mica/src/services/persistence_service.dart';
import 'package:mica/resources/strings/attention_strings.dart';
import 'package:mica/resources/strings/common_strings.dart';

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

  int? _radioValue;
  double sizeBoxHeight = 10.0;
  int sequenceIndex = 0;
  bool sequenceInMotion = false;

  int i = 0;
  String displayLetter = "Letters";

  List<bool> tapCorrect = [];

  // Update the provider with attention scores
  void _updateProvider() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setAttention(
      score: _radioValue ?? 0,
      correct: correctTap,
      mistakes: wrongTap,
    );
  }

  List<bool> tapWrong = [];
  List<bool> correctCheck = [];

  List<Color> letterTapButtonColor = [];
  List<Color> letterNoTapButtonColor = [];
  int correctTap = 0;
  int wrongTap = 0;
  var correctSelectedColor = Colors.green;
  var wrongSelectedColor = Colors.red;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _saveCurrentScreen();
    });
  }

  void _saveCurrentScreen() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setCurrentScreen(ScreenRoutes.attentionVigilance);
    PersistenceService.saveProgressImmediate(scoreModel);
  }

  @override
  void initState() {
    super.initState();
    // Initialize lists with correct length
    final letterCount = app_data.attentionList.length;
    tapCorrect = List.filled(letterCount, false);
    tapWrong = List.filled(letterCount, false);
    correctCheck = List.filled(letterCount, false);
    letterTapButtonColor = List.filled(letterCount, Colors.cyan.shade200);

    initFromProvider();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }

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
              AttentionStrings.vigilanceTitle,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              AttentionStrings.vigilanceSubtitle,
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
                              AttentionStrings.vigilancePatientInstruction,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
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
                              AttentionStrings.vigilanceExaminerInstruction,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
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
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 7,
                          childAspectRatio: 1.2,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                          children: List.generate(app_data.attentionList.length,
                              (index) {
                            return Material(
                              color: letterTapButtonColor[index],
                              child: InkWell(
                                onTap: () {
                                  if (!tapWrong[index] && !tapCorrect[index]) {
                                    if (app_data.attentionList[index] == "A") {
                                      setState(() {
                                        tapCorrect[index] = true;
                                        correctTap += 1;
                                        letterTapButtonColor[index] =
                                            Colors.green;
                                        correctCheck[index] = true;
                                      });
                                    }
                                    if (app_data.attentionList[index] != "A") {
                                      setState(() {
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
                                      });
                                    }
                                  } else {
                                    setState(() {
                                      if (tapCorrect[index]) {
                                        correctTap =
                                            correctTap > 0 ? correctTap - 1 : 0;
                                      }

                                      if (tapWrong[index]) {
                                        wrongTap =
                                            wrongTap > 0 ? wrongTap - 1 : 0;
                                        if (wrongTap == 1) {
                                          _radioValue = 1;
                                        } else if (wrongTap > 1) {
                                          _radioValue = 2;
                                        } else if (wrongTap < 1) {
                                          _radioValue = 0;
                                        }
                                      }

                                      tapCorrect[index] = false;
                                      tapWrong[index] = false;
                                      correctCheck[index] = false;
                                      letterTapButtonColor[index] =
                                          Colors.cyan.shade200;
                                    });
                                  }
                                },
                                child: Center(
                                  child: SizedBox.expand(
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Text(
                                          app_data.attentionList[index],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        if (tapCorrect[index])
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black38,
                                              shape: BoxShape.circle,
                                            ),
                                            padding: EdgeInsets.all(4),
                                            child: Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                          ),
                                        if (tapWrong[index])
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black38,
                                              shape: BoxShape.circle,
                                            ),
                                            padding: EdgeInsets.all(4),
                                            child: Icon(
                                              Icons.clear,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
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
                              AttentionStrings.vigilanceCorrectLabel,
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25.0),
                            ),
                            Text(
                              "$correctTap",
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25.0),
                            ),
                            Text(
                              AttentionStrings.vigilanceMistakesLabel,
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25.0),
                            ),
                            Text(
                              "$wrongTap",
                              style: const TextStyle(
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
                            Text(
                              AttentionStrings.vigilanceResponseInstruction,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                            RadioGroup<int>(
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                              child: Table(
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
                                          activeColor: Colors.white,
                                        ),
                                        Text(
                                          CommonStrings.normal,
                                          style: const TextStyle(
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
                                          activeColor: Colors.white,
                                        ),
                                        Text(
                                          CommonStrings.equivocal,
                                          style: const TextStyle(
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
                                          activeColor: Colors.white,
                                        ),
                                        Text(
                                          CommonStrings.impaired,
                                          style: const TextStyle(
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
                                      AttentionStrings.vigilanceResponseNormal,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      AttentionStrings.vigilanceResponseEquivocal,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      AttentionStrings.vigilanceResponseImpaired,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                ])
                              ],
                            ),
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
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            sequenceInMotion = false;
                            timer?.cancel();

                            // Update provider
                            _updateProvider();

                            // Just pop the screen to return to previous
                            Navigator.of(context).pop();
                          },
                          child: Text(CommonStrings.taskCompleted,
                              style: TextStyle(color: Colors.black)),
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
      _radioValue = value;
    });
  }

  // Initialize from provider
  void initFromProvider() {
    if (!mounted) return;

    final scoreModel = MicaProviders.getScoreModel(context, listen: false);

    // Load basic attention scores
    setState(() {
      _radioValue = scoreModel.attention;
      correctTap = scoreModel.attentionCorrect;
      wrongTap = scoreModel.attentionMistakes;
    });

    // Re-initialize UI state based on loaded data if needed
    // This is a simplified version - you might want to store and restore
    // the full state of each letter selection if needed
  }
}