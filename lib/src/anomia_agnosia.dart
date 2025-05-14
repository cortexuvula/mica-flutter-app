import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/executive.dart';
import 'package:mica/src/show_image_anomia.dart';
import 'package:mica/src/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnomiaAgnosia extends StatefulWidget {
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

  const AnomiaAgnosia({
    super.key,
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
  });

  @override
  _AnomiaAgnosiaState createState() => _AnomiaAgnosiaState();
}

class _AnomiaAgnosiaState extends State<AnomiaAgnosia> {
  double sizeBoxHeight = 10.0;

  int? _radioValue;
  int? _radioValue2;
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
    // Remove unused variable
    //var sizeBoxWidth = _width * 0.1;
    var sizeBoxHeight = width * 0.05;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final shouldPop = await savePrefData();
          if (shouldPop && context.mounted) {
            Navigator.of(context).pop();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              appData.testAnomiaAgnosia,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              appData.testAnomiaAgnosiaSubtitle,
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
                              appData.testAnomiaAgnosiaToPatient,
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
                              appData.testAnomiaAgnosiaDetails,
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
                    width: width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                            icon: const Icon(Icons.arrow_back_ios),
                            iconSize: 40.0,
                            onPressed: backButtonActive
                                ? () {
                                    print("tapped");
                                    if (imageNumber > 0) {
                                      setState(() {
                                        imageNumber -= 1;
                                        displayImage =
                                            appData.imageURL[imageNumber];
                                      });
                                    }
                                    if (imageNumber == 0) {
                                      setState(() {
                                        backButtonActive = false;
                                      });
                                    }
                                    if (imageNumber < 4) {
                                      setState(() {
                                        forwardButtonActive = true;
                                      });
                                    }
                                  }
                                : null),
                        SizedBox(
                          width: 20.0,
                        ),
                        Card(
                          elevation: 10.0,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                debugPrint("tapped picture");
                                var router = MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ShowImageAnomia(
                                          imageURL: displayImage,
                                          imageNumber: imageNumber,
                                        ));
                                Navigator.of(context).pushAndRemoveUntil(
                                    router, (Route<dynamic> route) => true);
                              },
                              child: SizedBox(
                                width: 150.0,
                                height: 150.0,
                                child: Image.asset(
                                  displayImage,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        IconButton(
                            icon: const Icon(Icons.arrow_forward_ios),
                            iconSize: 40.0,
                            onPressed: forwardButtonActive
                                ? () {
                                    print("tapped");
                                    if (imageNumber < 4) {
                                      setState(() {
                                        imageNumber += 1;
                                        displayImage =
                                            appData.imageURL[imageNumber];
                                      });
                                    }
                                    if (imageNumber == 4) {
                                      setState(() {
                                        forwardButtonActive = false;
                                      });
                                    }
                                    if (imageNumber > 0) {
                                      setState(() {
                                        backButtonActive = true;
                                      });
                                    }
                                  }
                                : null),
                      ],
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
                              appData.testAnomiaAgnosiaResponse,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                            SizedBox(
                              height: 5.0,
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
                                        onChanged: _handleRadioValueChange,
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
                                        onChanged: _handleRadioValueChange,
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
                                        onChanged: _handleRadioValueChange,
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
                                      appData.testAnomiaAgnosiaResponseNormal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData
                                          .testAnomiaAgnosiaResponseEquivocal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData.testAnomiaAgnosiaResponseImpaired,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                ])
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              appData.testAnomiaAgnosiaResponse2,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                            SizedBox(
                              height: 5.0,
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
                                        groupValue: _radioValue2,
                                        onChanged: _handleRadioValueChange2,
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
                                        groupValue: _radioValue2,
                                        onChanged: _handleRadioValueChange2,
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
                                        groupValue: _radioValue2,
                                        onChanged: _handleRadioValueChange2,
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
                                      appData.testAnomiaAgnosiaResponseNormal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData
                                          .testAnomiaAgnosiaResponseEquivocal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData.testAnomiaAgnosiaResponseImpaired,
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
                                builder: (BuildContext context) => Executive(
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
                                      anomiaAgnosia: _radioValue ?? 0,
                                      agnosia: _radioValue2 ?? 0,
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

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value;
    });
  }

  void _handleRadioValueChange2(int? value) {
    setState(() {
      _radioValue2 = value;
    });
  }

  void getPrefsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? anomia = prefs.getInt("anomiaAgnosia");
    int? agnosia = prefs.getInt("agnosia");

    setState(() {
      _radioValue = anomia;
      _radioValue2 = agnosia;
    });
  }

  Future<bool> savePrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_radioValue != null) {
      prefs.setInt("anomiaAgnosia", _radioValue!);
    }

    if (_radioValue2 != null) {
      prefs.setInt("agnosia", _radioValue2!);
    }

    return true;
  }
}
