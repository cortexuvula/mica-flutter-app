import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
//import 'package:mica/src/home.dart';
import 'package:mica/src/ten_word_delay_recall.dart';
import 'package:mica/src/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Praxis extends StatefulWidget {
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

  const Praxis({
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
      required this.shorttermMemoryVerbalScore});

  @override
  _PraxisState createState() => _PraxisState();
}

class _PraxisState extends State<Praxis> {
  double sizeBoxHeight = 10.0;
  int? _radioValueRight;
  int? _radioValueLeft;

  final double _fontsize = 8.0;

  @override
  void initState() {
    super.initState();
    getPrefsData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var sizeBoxWidth = (_width * 0.8) / 3;
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
          title: ListTile(
            title: Text(
              appData.testPraxis,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              appData.testPraxisSubtitle,
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
                              appData.testPraxisToPatient,
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
                              appData.testPraxisDetails,
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
                        child: SizedBox(
                            width: width * 0.8,
                            child: Image.asset(
                              "./images/pen.png",
                              fit: BoxFit.contain,
                            )),
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
                              appData.testPraxisResponse,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                            Table(
                              border: TableBorder.all(),
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              columnWidths: {
                                0: FlexColumnWidth(0.15),
                                1: FlexColumnWidth(0.27),
                                2: FlexColumnWidth(0.27),
                                3: FlexColumnWidth(0.27)
                              },
                              children: [
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Right",
                                      style: TextStyle(fontSize: _fontsize),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 0,
                                        groupValue: _radioValueRight,
                                        onChanged: (int? value) {
                                          _handleRadioValueChange(value);
                                        },
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Normal",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: _fontsize,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 1,
                                        groupValue: _radioValueRight,
                                        onChanged: (int? value) {
                                          _handleRadioValueChange(value);
                                        },
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Equivocal",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: _fontsize,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 2,
                                        groupValue: _radioValueRight,
                                        onChanged: (int? value) {
                                          _handleRadioValueChange(value);
                                        },
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Impaired",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: _fontsize,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Left",
                                      style: TextStyle(fontSize: _fontsize),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 0,
                                        groupValue: _radioValueLeft,
                                        onChanged: (int? value) {
                                          _handleRadioValueChangeLeft(value);
                                        },
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Normal",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: _fontsize,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 1,
                                        groupValue: _radioValueLeft,
                                        onChanged: (int? value) {
                                          _handleRadioValueChangeLeft(value);
                                        },
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Equivocal",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: _fontsize,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        value: 2,
                                        groupValue: _radioValueLeft,
                                        onChanged: (int? value) {
                                          _handleRadioValueChangeLeft(value);
                                        },
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Impaired",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: _fontsize,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                                TableRow(children: [
                                  Container(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData.testPraxisResponseNormal,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData.testPraxisResponseEquivocal,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      appData.testPraxisResponseImpaired,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 10.0),
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
                                    TenWordDelayedRecall(
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
                                      shorttermMemoryVerbal:
                                          widget.shorttermMemoryVerbal,
                                      shorttermMemoryVerbalScore:
                                          widget.shorttermMemoryVerbalScore,
                                      praxisRight: _radioValueRight ?? 0,
                                      praxisLeft: _radioValueLeft ?? 0,
                                    ));
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
                          },
                          child: Text("Continue with Testing"),
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
      _radioValueRight = value;
    });
  }

  void _handleRadioValueChangeLeft(int? value) {
    setState(() {
      _radioValueLeft = value;
    });
  }

  void getPrefsData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? right = prefs.getInt("praxisRight");
    int? left = prefs.getInt("praxisLeft");

    setState(() {
      _radioValueLeft = left;
      _radioValueRight = right;
    });
  }

  Future<bool> savePrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("praxisRight", _radioValueRight ?? 0);
    prefs.setInt("praxisLeft", _radioValueLeft ?? 0);

    return true;
  }
}
