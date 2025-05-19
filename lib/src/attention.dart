import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/executive_animal_naming.dart';
import 'package:mica/src/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mica/src/providers/mica_provider.dart';

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
    getPrefsData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          await savePrefData();
        }
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
                  var router = MaterialPageRoute(
                      builder: (BuildContext context) => const Welcome());
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
                            // Update provider with attention scores
                            _updateProvider();
                            
                            var router = MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ExecutiveAnimalNaming());
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
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

  void getPrefsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? score1 = prefs.getInt("attention");
    int? score2 = prefs.getInt("correctTap");
    int? score3 = prefs.getInt("wrongTap");

    List<String> tapCorrectList = [];
    List<String> letterTapButtonColorList = [];
    List<String> tapWrongList = [];
    List<String> correctCheckList = [];

    List<bool> tapCorrect = [];
    List<Color> letterTapButtonColor = [];
    List<bool> tapWrong = [];
    List<bool> correctCheck = [];

    letterTapButtonColorList =
        prefs.getStringList("letterTapButtonColor") ?? [];
    tapCorrectList = prefs.getStringList("tapCorrect") ?? [];
    tapWrongList = prefs.getStringList("tapWrong") ?? [];
    correctCheckList = prefs.getStringList("correctCheck") ?? [];

    // Ensure lists have expected length
    if (letterTapButtonColorList.isEmpty ||
        tapCorrectList.isEmpty ||
        tapWrongList.isEmpty ||
        correctCheckList.isEmpty) {
      // Initialize with default values if lists are empty
      for (var i = 0; i < 26; i++) {
        letterTapButtonColor.add(Colors.cyan.shade200);
        tapCorrect.add(false);
        tapWrong.add(false);
        correctCheck.add(false);
      }
    } else {
      for (var i = 0; i < 26; i++) {
        if (i < letterTapButtonColorList.length) {
          if (letterTapButtonColorList[i] == "cyan") {
            letterTapButtonColor.add(Colors.cyan.shade200);
          } else if (letterTapButtonColorList[i] == "green") {
            letterTapButtonColor.add(Colors.green);
          } else {
            letterTapButtonColor.add(Colors.red);
          }
        } else {
          letterTapButtonColor.add(Colors.cyan.shade200);
        }

        if (i < tapCorrectList.length) {
          if (tapCorrectList[i] == "false") {
            tapCorrect.add(false);
          } else {
            tapCorrect.add(true);
          }
        } else {
          tapCorrect.add(false);
        }

        if (i < tapWrongList.length) {
          if (tapWrongList[i] == "false") {
            tapWrong.add(false);
          } else {
            tapWrong.add(true);
          }
        } else {
          tapWrong.add(false);
        }

        if (i < correctCheckList.length) {
          if (correctCheckList[i] == "false") {
            correctCheck.add(false);
          } else {
            correctCheck.add(true);
          }
        } else {
          correctCheck.add(false);
        }
      }
    }

    setState(() {
      _radioValue = score1;
      correctTap = score2 ?? 0;
      wrongTap = score3 ?? 0;
      letterTapButtonColor = letterTapButtonColor;
      tapCorrect = tapCorrect;
      tapWrong = tapWrong;
      correctCheck = correctCheck;
    });
  }

  Future<bool> savePrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("attention", _radioValue ?? 0);
    prefs.setInt("correctTap", correctTap);
    prefs.setInt("wrongTap", wrongTap);

    List<String> tapCorrectList = [];
    List<String> letterTapButtonColorList = [];
    List<String> tapWrongList = [];
    List<String> correctCheckList = [];

    for (var i = 0; i < 26; i++) {
      if (letterTapButtonColor[i] == Colors.cyan.shade200) {
        letterTapButtonColorList.add("cyan");
      } else if (letterTapButtonColor[i] == Colors.red) {
        letterTapButtonColorList.add("red");
      } else {
        letterTapButtonColorList.add("green");
      }

      if (tapCorrect[i] == false) {
        tapCorrectList.add("false");
      } else {
        tapCorrectList.add("true");
      }

      if (tapWrong[i] == false) {
        tapWrongList.add("false");
      } else {
        tapWrongList.add("true");
      }

      if (correctCheck[i] == false) {
        correctCheckList.add("false");
      } else {
        correctCheckList.add("true");
      }
    }

    prefs.setStringList("letterTapButtonColor", letterTapButtonColorList);
    prefs.setStringList("tapCorrect", tapCorrectList);
    prefs.setStringList("tapWrong", tapWrongList);
    prefs.setStringList("correctCheck", correctCheckList);

    return true;
  }
}
