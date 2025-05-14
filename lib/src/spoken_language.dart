import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/summary.dart';
import 'package:mica/src/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpokenLanguage extends StatefulWidget {
  final String patientName;
  final String assessorName;
  final String handedness;
  final DateTime assessmentDate;
  final int languageComprehensionRadioValue;
  final int trialOneScore;
  final int trialTwoScore;
  final int trialThreeScore;
  final int visuospatialPraxisImage1;
  final int visuospatialPraxisImage2;
  final int visuospatialPraxisImage3;
  final int attention;
  final int attentionCorrect;
  final int attentionMistakes;
  final int executiveAnimalNaming;
  final int executiveAnimalNamingCount;
  final int executiveLuria;
  final int executiveLuriaScore;
  final int executiveSerial;
  final int executiveSerialScore;
  final int shorttermMemoryVerbal;
  final int shorttermMemoryVerbalScore;
  final int praxisRight;
  final int praxisLeft;
  final int tenWordDelay;
  final int scoreVerbalRecognitionMemoryTenWords;
  final int scoreVerbalRecognitionMemoryTenWordsInList;
  final int scoreVerbalRecognitionMemoryTenWordsNotInList;
  final int shorttermMemoryVisualImage1;
  final int shorttermMemoryVisualImage2;
  final int shorttermMemoryVisualImage3;
  final int anomiaAgnosia;
  final int agnosia;
  final int executive;

  const SpokenLanguage(
      {super.key,
      required this.patientName,
      required this.assessorName,
      required this.handedness,
      required this.assessmentDate,
      required this.languageComprehensionRadioValue,
      required this.trialOneScore,
      required this.trialTwoScore,
      required this.trialThreeScore,
      required this.visuospatialPraxisImage1,
      required this.visuospatialPraxisImage2,
      required this.visuospatialPraxisImage3,
      required this.attention,
      required this.attentionCorrect,
      required this.attentionMistakes,
      required this.executiveAnimalNaming,
      required this.executiveAnimalNamingCount,
      required this.executiveLuria,
      required this.executiveLuriaScore,
      required this.executiveSerial,
      required this.executiveSerialScore,
      required this.shorttermMemoryVerbal,
      required this.shorttermMemoryVerbalScore,
      required this.praxisRight,
      required this.praxisLeft,
      required this.tenWordDelay,
      required this.scoreVerbalRecognitionMemoryTenWords,
      required this.scoreVerbalRecognitionMemoryTenWordsInList,
      required this.scoreVerbalRecognitionMemoryTenWordsNotInList,
      required this.shorttermMemoryVisualImage1,
      required this.shorttermMemoryVisualImage2,
      required this.shorttermMemoryVisualImage3,
      required this.anomiaAgnosia,
      required this.agnosia,
      required this.executive});

  @override
  _SpokenLanguageState createState() => _SpokenLanguageState();
}

class _SpokenLanguageState extends State<SpokenLanguage> {
  final double sizeBoxHeight = 10.0;

  late int _radioValue;
  int imageNumber = 0;

  String displayImage = appData.imageURL[0];

  bool backButtonActive = false;
  bool forwardButtonActive = true;

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
        if (didPop) return;

        final shouldPop = await savePrefData();
        if (shouldPop) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              appData.testSpokenLanguage,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              appData.testSpokenLanguageSubtitle,
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
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              appData.testSpokenLanguageResponse,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                            Table(
                              border: TableBorder.all(),
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              columnWidths: const {
                                0: FlexColumnWidth(0.3),
                                1: FlexColumnWidth(0.3),
                                2: FlexColumnWidth(0.34)
                              },
                              children: [
                                TableRow(children: [
                                  Row(
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 0,
                                        groupValue: _radioValue,
                                        onChanged: (int? value) {
                                          if (value != null) {
                                            _handleRadioValueChange(value);
                                          }
                                        },
                                        activeColor: Colors.white,
                                      ),
                                      const Text(
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
                                      Radio<int>(
                                        value: 1,
                                        groupValue: _radioValue,
                                        onChanged: (int? value) {
                                          if (value != null) {
                                            _handleRadioValueChange(value);
                                          }
                                        },
                                        activeColor: Colors.white,
                                      ),
                                      const Text(
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
                                      Radio<int>(
                                        value: 2,
                                        groupValue: _radioValue,
                                        onChanged: (int? value) {
                                          if (value != null) {
                                            _handleRadioValueChange(value);
                                          }
                                        },
                                        activeColor: Colors.white,
                                      ),
                                      const Text(
                                        "Impaired",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData.testSpokenLanguageResponseNormal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData
                                          .testSpokenLanguageResponseEquivocal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData
                                          .testSpokenLanguageResponseImpaired,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
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
                          style: ElevatedButton.styleFrom(
                            elevation: 10.0,
                          ),
                          onPressed: () {
                            var router = MaterialPageRoute(
                                builder: (BuildContext context) => TestSummary(
                                      patientName: widget.patientName,
                                      assessorName: widget.assessorName,
                                      handedness: widget.handedness,
                                      assessmentDate: widget.assessmentDate,
                                      languageComprehensionRadioValue: widget
                                          .languageComprehensionRadioValue,
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
                                      attentionMistakes:
                                          widget.attentionMistakes,
                                      executiveAnimalNaming:
                                          widget.executiveAnimalNaming,
                                      executiveAnimalNamingCount:
                                          widget.executiveAnimalNamingCount,
                                      executiveLuria: widget.executiveLuria,
                                      executiveLuriaScore:
                                          widget.executiveLuriaScore,
                                      executiveSerial: widget.executiveSerial,
                                      executiveSerialScore:
                                          widget.executiveSerialScore,
                                      praxisRight: widget.praxisRight,
                                      praxisLeft: widget.praxisLeft,
                                      shorttermMemoryVerbal:
                                          widget.shorttermMemoryVerbal,
                                      shorttermMemoryVerbalScore:
                                          widget.shorttermMemoryVerbalScore,
                                      tenWordDelay: widget.tenWordDelay,
                                      scoreVerbalRecognitionMemoryTenWords: widget
                                          .scoreVerbalRecognitionMemoryTenWords,
                                      scoreVerbalRecognitionMemoryTenWordsInList:
                                          widget
                                              .scoreVerbalRecognitionMemoryTenWordsInList,
                                      scoreVerbalRecognitionMemoryTenWordsNotInList:
                                          widget
                                              .scoreVerbalRecognitionMemoryTenWordsNotInList,
                                      shorttermMemoryVisualImage1:
                                          widget.shorttermMemoryVisualImage1,
                                      shorttermMemoryVisualImage2:
                                          widget.shorttermMemoryVisualImage2,
                                      shorttermMemoryVisualImage3:
                                          widget.shorttermMemoryVisualImage3,
                                      anomiaAgnosia: widget.anomiaAgnosia,
                                      agnosia: widget.agnosia,
                                      executive: widget.executive,
                                      spokenLanguage: _radioValue,
                                    ));
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

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  void getPrefsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? setRadioPref = prefs.getInt("spokenLanguage");
    setState(() {
      _radioValue = setRadioPref ?? 0;
    });
  }

  Future<bool> savePrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("spokenLanguage", _radioValue);

    return true;
  }
}
