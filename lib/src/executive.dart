import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/spoken_language.dart';
import 'package:mica/src/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Executive extends StatefulWidget {
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
  final int? scoreVerbalRecognitionMemoryTenWords;
  final int? scoreVerbalRecognitionMemoryTenWordsInList;
  final int? scoreVerbalRecognitionMemoryTenWordsNotInList;
  final int? shorttermMemoryVisualImage1;
  final int? shorttermMemoryVisualImage2;
  final int? shorttermMemoryVisualImage3;
  final int? anomiaAgnosia;
  final int? agnosia;

  const Executive({
    super.key,
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
    this.tenWordDelay,
    this.scoreVerbalRecognitionMemoryTenWords,
    this.scoreVerbalRecognitionMemoryTenWordsInList,
    this.scoreVerbalRecognitionMemoryTenWordsNotInList,
    this.shorttermMemoryVisualImage1,
    this.shorttermMemoryVisualImage2,
    this.shorttermMemoryVisualImage3,
    this.anomiaAgnosia,
    this.agnosia});

  @override
  _ExecutiveState createState() => _ExecutiveState();
}

class _ExecutiveState extends State<Executive> with TickerProviderStateMixin {
  double sizeBoxHeight = 10.0;

  int _radioValue = 0;
  int imageNumber = 0;

  String displayImage = appData.imageURL[0];

  bool backButtonActive = false;
  bool forwardButtonActive = true;

  late AnimationController clockController;

  String buttonText = "Start";

  String get timerString {
    Duration duration = clockController.duration! * clockController.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    clockController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    );
    getPrefsData();
  }

  @override
  void dispose() {
    clockController.dispose();
    super.dispose();
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
              appData.testExecutive,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              appData.testExecutiveSubtitle,
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
                              appData.testExecutiveToPatient,
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
                              appData.testExecutiveDetails,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: width * 0.8,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SizedBox(
                                      width: width * 0.35,
                                      height: 100.0,
                                      child: Image.asset(
                                        "./images/hash.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.35,
                                      height: 100.0,
                                      child: Image.asset(
                                        "./images/steps.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ],
                                ),
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
                      color: Colors.yellowAccent.shade400,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              appData.testExecutiveToPatient2,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: AnimatedBuilder(
                                  animation: clockController,
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return Text(
                                      timerString,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500),
                                    );
                                  }),
                            ),
                            SizedBox(
                              width: 150.0,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.cyan.shade200,
                                  ),
                                  onPressed: () {
                                    if (clockController.isAnimating) {
                                      clockController.stop();
                                      setState(() {
                                        buttonText = "Resume";
                                      });
                                    } else {
                                      clockController.reverse(
                                          from: clockController.value == 0.0
                                              ? 1.0
                                              : clockController.value);
                                      setState(() {
                                        buttonText = "Pause";
                                      });
                                    }
                                  },
                                  child: Text(
                                    buttonText,
                                    style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500),
                                  )),
                            )
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
                              appData.testExecutiveResponse,
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
                              columnWidths: {
                                0: const FlexColumnWidth(0.3),
                                1: const FlexColumnWidth(0.3),
                                2: const FlexColumnWidth(0.34)
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
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData.testExecutiveResponseNormal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData.testExecutiveResponseEquivocal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData.testExecutiveResponseImpaired,
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
                          onPressed: () {
                            var router = MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SpokenLanguage(
                                      patientName: widget.patientName ?? "",
                                      assessorName: widget.assessorName ?? "",
                                      handedness: widget.handedness ?? "",
                                      assessmentDate: widget.assessmentDate ?? DateTime.now(),
                                      languageComprehensionRadioValue:
                                          widget.languageComprehensionRadioValue ?? 0,
                                      trialOneScore: widget.trialOneScore ?? 0,
                                      trialTwoScore: widget.trialTwoScore ?? 0,
                                      trialThreeScore: widget.trialThreeScore ?? 0,
                                      visuospatialPraxisImage1:
                                          widget.visuospatialPraxisImage1 ?? 0,
                                      visuospatialPraxisImage2:
                                          widget.visuospatialPraxisImage2 ?? 0,
                                      visuospatialPraxisImage3:
                                          widget.visuospatialPraxisImage3 ?? 0,
                                      attention: widget.attention ?? 0,
                                      attentionCorrect: widget.attentionCorrect ?? 0,
                                      attentionMistakes:
                                          widget.attentionMistakes ?? 0,
                                      executiveAnimalNaming:
                                          widget.executiveAnimalNaming ?? 0,
                                      executiveAnimalNamingCount:
                                          widget.executiveAnimalNamingCount ?? 0,
                                      executiveLuria: widget.executiveLuria ?? 0,
                                      executiveLuriaScore:
                                          widget.executiveLuriaScore ?? 0,
                                      executiveSerial: widget.executiveSerial ?? 0,
                                      executiveSerialScore:
                                          widget.executiveSerialScore ?? 0,
                                      praxisRight: widget.praxisRight ?? 0,
                                      praxisLeft: widget.praxisLeft ?? 0,
                                      shorttermMemoryVerbal:
                                          widget.shorttermMemoryVerbal ?? 0,
                                      shorttermMemoryVerbalScore:
                                          widget.shorttermMemoryVerbalScore ?? 0,
                                      tenWordDelay: widget.tenWordDelay ?? 0,
                                      scoreVerbalRecognitionMemoryTenWords:
                                          widget.scoreVerbalRecognitionMemoryTenWords ?? 0,
                                      scoreVerbalRecognitionMemoryTenWordsInList:
                                          widget
                                              .scoreVerbalRecognitionMemoryTenWordsInList ?? 0,
                                      scoreVerbalRecognitionMemoryTenWordsNotInList:
                                          widget
                                              .scoreVerbalRecognitionMemoryTenWordsNotInList ?? 0,
                                      shorttermMemoryVisualImage1:
                                          widget.shorttermMemoryVisualImage1 ?? 0,
                                      shorttermMemoryVisualImage2:
                                          widget.shorttermMemoryVisualImage2 ?? 0,
                                      shorttermMemoryVisualImage3:
                                          widget.shorttermMemoryVisualImage3 ?? 0,
                                      anomiaAgnosia: widget.anomiaAgnosia ?? 0,
                                      agnosia: widget.agnosia ?? 0,
                                      executive: _radioValue,
                                    ));
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
                          },
                          child: const Text("Continue with Testing"),
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

  void getPrefsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? setRadioPref = prefs.getInt("executive");
    setState(() {
      _radioValue = setRadioPref ?? 0;
    });
  }

  Future<bool> savePrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("executive", _radioValue);

    return true;
  }
}
