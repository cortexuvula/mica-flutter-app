import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/executive_animal_naming.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/utils/navigation_helper.dart';

class Attention extends StatefulWidget {
  const Attention({super.key});

  @override
  State<Attention> createState() => _AttentionState();
}

class _AttentionState extends State<Attention> {
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
        NavigationHelper.navigateAndRemoveUntil(
            context, const Welcome(), (Route<dynamic> route) => false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              app_data.testAttention,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              app_data.testAttentionSubtitle,
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
                              app_data.testAttentionToPatient,
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
                              app_data.testAttentionDetails,
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
                                    // First tap
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
                                    // Second tap (double tap)
                                    setState(() {
                                      // If this is an "A" that was previously marked correct,
                                      // convert it to a mistake on double tap
                                      if (app_data.attentionList[index] == "A" && tapCorrect[index]) {
                                        // Remove from correct count
                                        correctTap = correctTap > 0 ? correctTap - 1 : 0;
                                        tapCorrect[index] = false;
                                        correctCheck[index] = false;
                                        
                                        // Add to wrong count
                                        tapWrong[index] = true;
                                        wrongTap += 1;
                                        letterTapButtonColor[index] = Colors.red;
                                        
                                        // Update radio value based on mistakes
                                        if (wrongTap == 1) {
                                          _radioValue = 1;
                                        } else if (wrongTap > 1) {
                                          _radioValue = 2;
                                        }
                                      } else {
                                        // For other cases, reset the selection
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
                                      }
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
                              "Correct: ",
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
                              "Mistakes: ",
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
                              app_data.testAttentionResponse,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
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
                                        groupValue: _radioValue,
                                        onChanged: _handleRadioValueChange,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Equivocal",
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
                                        groupValue: _radioValue,
                                        onChanged: _handleRadioValueChange,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Impaired",
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
                                      app_data.testAttentionResponseNormal,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data.testAttentionResponseEquivocal,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data.testAttentionResponseImpaired,
                                      style: const TextStyle(
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
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            sequenceInMotion = false;
                            timer?.cancel();

                            // Update provider
                            _updateProvider();

                            NavigationHelper.navigateTo(
                                context, const ExecutiveAnimalNaming());
                          },
                          child: const Text("Continue",
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

    // Initialize lists with default values
    // Note: The provider currently doesn't store the detailed lists,
    // so we initialize them with default values
    letterTapButtonColor = [];
    tapCorrect = [];
    tapWrong = [];
    correctCheck = [];

    for (var i = 0; i < 26; i++) {
      letterTapButtonColor.add(Colors.cyan.shade200);
      tapCorrect.add(false);
      tapWrong.add(false);
      correctCheck.add(false);
    }
  }
}
