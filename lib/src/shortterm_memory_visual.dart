import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/anomia_agnosia.dart';
import 'package:mica/src/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShortTermMemoryVisual extends StatefulWidget {
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

  const ShortTermMemoryVisual(
      {super.key,
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
      this.scoreVerbalRecognitionMemoryTenWordsNotInList});

  @override
  _ShortTermMemoryVisualState createState() => _ShortTermMemoryVisualState();
}

class _ShortTermMemoryVisualState extends State<ShortTermMemoryVisual> {
  double sizeBoxHeight = 10.0;

  int? _radioValueImageOne;
  int? _radioValueImageTwo;
  int? _radioValueImageThree;

  final double _fontSize = 8.0;

  @override
  void initState() {
    super.initState();
    getPrefsData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var _sizeboxWidth = _width * 0.8 / 5;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }

        await savePrefData();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Welcome(),
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: ListTile(
            title: Text(
              appData.testShortTermMemoryVisual,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              appData.testShortTermMemoryVisualSubtitle,
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
                              appData.testShortTermMemoryVisualToPatient,
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
                              appData.testShortTermMemoryVisualDetails,
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
                        child: SizedBox(
                          width: width * 0.9,
                          height: 200.0,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: width * 0.8 / 3,
                                height: 180.0,
                                child: Image.asset("./images/block_one.png",
                                    fit: BoxFit.scaleDown),
                              ),
                              SizedBox(
                                width: width * 0.8 / 3,
                                height: 180.0,
                                child: Image.asset(
                                  "./images/block_two.png",
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.8 / 3,
                                height: 180.0,
                                child: Image.asset(
                                  "./images/block_three.png",
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ],
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
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Table(
                              border: TableBorder.all(),
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              columnWidths: {
                                0: FlexColumnWidth(0.2),
                                1: FlexColumnWidth(0.2),
                                2: FlexColumnWidth(0.2),
                                3: FlexColumnWidth(0.2),
                                4: FlexColumnWidth(0.2),
                              },
                              children: [
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Image",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: _fontSize,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "No Mistakes",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: _fontSize,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Few Omissions",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: _fontSize,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Poor",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: _fontSize,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "No Drawing",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: _fontSize,
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Image 1",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 0,
                                        groupValue: _radioValueImageOne,
                                        onChanged: _handleRadioValueChange1,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "3",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 1,
                                        groupValue: _radioValueImageOne,
                                        onChanged: _handleRadioValueChange1,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "2",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 2,
                                        groupValue: _radioValueImageOne,
                                        onChanged: _handleRadioValueChange1,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 3,
                                        groupValue: _radioValueImageOne,
                                        onChanged: _handleRadioValueChange1,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Image 2",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 0,
                                        groupValue: _radioValueImageTwo,
                                        onChanged: _handleRadioValueChange2,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "3",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 1,
                                        groupValue: _radioValueImageTwo,
                                        onChanged: _handleRadioValueChange2,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "2",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 2,
                                        groupValue: _radioValueImageTwo,
                                        onChanged: _handleRadioValueChange2,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 3,
                                        groupValue: _radioValueImageTwo,
                                        onChanged: _handleRadioValueChange2,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Image 3",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 0,
                                        groupValue: _radioValueImageThree,
                                        onChanged: _handleRadioValueChange3,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "3",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 1,
                                        groupValue: _radioValueImageThree,
                                        onChanged: _handleRadioValueChange3,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "2",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 2,
                                        groupValue: _radioValueImageThree,
                                        onChanged: _handleRadioValueChange3,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 3,
                                        groupValue: _radioValueImageThree,
                                        onChanged: _handleRadioValueChange3,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
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
                                    AnomiaAgnosia(
                                      patientName: widget.patientName ?? "",
                                      assessorName: widget.assessorName ?? "",
                                      handedness: widget.handedness ?? "",
                                      assessmentDate: widget.assessmentDate ??
                                          DateTime.now(),
                                      languageComprehensionRadioValue: widget
                                              .languageComprehensionRadioValue ??
                                          0,
                                      trialOneScore: widget.trialOneScore ?? 0,
                                      trialTwoScore: widget.trialTwoScore ?? 0,
                                      trialThreeScore:
                                          widget.trialThreeScore ?? 0,
                                      visuospatialPraxisImage1:
                                          widget.visuospatialPraxisImage1 ?? 0,
                                      visuospatialPraxisImage2:
                                          widget.visuospatialPraxisImage2 ?? 0,
                                      visuospatialPraxisImage3:
                                          widget.visuospatialPraxisImage3 ?? 0,
                                      attention: widget.attention ?? 0,
                                      attentionCorrect:
                                          widget.attentionCorrect ?? 0,
                                      attentionMistakes:
                                          widget.attentionMistakes ?? 0,
                                      executiveAnimalNaming:
                                          widget.executiveAnimalNaming ?? 0,
                                      executiveAnimalNamingCount:
                                          widget.executiveAnimalNamingCount ??
                                              0,
                                      executiveLuria:
                                          widget.executiveLuria ?? 0,
                                      executiveLuriaScore:
                                          widget.executiveLuriaScore ?? 0,
                                      executiveSerial:
                                          widget.executiveSerial ?? 0,
                                      executiveSerialScore:
                                          widget.executiveSerialScore ?? 0,
                                      praxisRight: widget.praxisRight ?? 0,
                                      praxisLeft: widget.praxisLeft ?? 0,
                                      shorttermMemoryVerbal:
                                          widget.shorttermMemoryVerbal ?? 0,
                                      shorttermMemoryVerbalScore:
                                          widget.shorttermMemoryVerbalScore ??
                                              0,
                                      tenWordDelay: widget.tenWordDelay ?? 0,
                                      scoreVerbalRecognitionMemoryTenWords:
                                          widget.scoreVerbalRecognitionMemoryTenWords ??
                                              0,
                                      scoreVerbalRecognitionMemoryTenWordsInList:
                                          widget.scoreVerbalRecognitionMemoryTenWordsInList ??
                                              0,
                                      scoreVerbalRecognitionMemoryTenWordsNotInList:
                                          widget.scoreVerbalRecognitionMemoryTenWordsNotInList ??
                                              0,
                                      shorttermMemoryVisualImage1:
                                          _radioValueImageOne ?? 0,
                                      shorttermMemoryVisualImage2:
                                          _radioValueImageTwo ?? 0,
                                      shorttermMemoryVisualImage3:
                                          _radioValueImageThree ?? 0,
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

  void _handleRadioValueChange1(int? value) {
    setState(() {
      _radioValueImageOne = value;
    });
  }

  void _handleRadioValueChange2(int? value) {
    setState(() {
      _radioValueImageTwo = value;
    });
  }

  void _handleRadioValueChange3(int? value) {
    setState(() {
      _radioValueImageThree = value;
    });
  }

  void getPrefsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? score1 = prefs.getInt("shorttermMemoryVisualImage1");
    int? score2 = prefs.getInt("shorttermMemoryVisualImage2");
    int? score3 = prefs.getInt("shorttermMemoryVisualImage3");

    setState(() {
      _radioValueImageOne = score1;
      _radioValueImageTwo = score2;
      _radioValueImageThree = score3;
    });
  }

  Future<bool> savePrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("shorttermMemoryVisualImage1", _radioValueImageOne ?? 0);
    prefs.setInt("shorttermMemoryVisualImage2", _radioValueImageTwo ?? 0);
    prefs.setInt("shorttermMemoryVisualImage3", _radioValueImageThree ?? 0);

    return true;
  }
}
