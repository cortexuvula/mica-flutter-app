import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mica/src/utils/mica_state_initializer.dart';
import 'package:mica/src/domain_results/attention_concentration.dart';
import 'package:mica/src/domain_results/executive_functions.dart';
import 'package:mica/src/domain_results/gnosis.dart';
import 'package:mica/src/domain_results/language.dart';
import 'package:mica/src/domain_results/praxis.dart';
import 'package:mica/src/domain_results/verbal_shortterm_memory.dart';
import 'package:mica/src/domain_results/verbal_working_memory.dart';
import 'package:mica/src/domain_results/visual_short_term_memory.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/welcome.dart';
import 'package:share_plus/share_plus.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:file_saver/file_saver.dart';
import 'dart:typed_data';

@immutable
class TestSummary extends StatefulWidget {
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
  final int spokenLanguage;

  const TestSummary({
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
    required this.anomiaAgnosia,
    required this.agnosia,
    required this.executive,
    required this.spokenLanguage});

  @override
  _TestSummaryState createState() => _TestSummaryState();
}

class _TestSummaryState extends State<TestSummary> {
  var format = DateFormat('d MMM y');
  Color attentionColor = Colors.green;

  @override
  void initState() {
    super.initState();
    // Initialize the provider model with the current test data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeProviderModel();
    });
  }

  /// Initialize the provider model with the current test data
  void _initializeProviderModel() {
    MicaStateInitializer.initializeFromTestParameters(
      context: context,
      patientName: widget.patientName,
      assessorName: widget.assessorName,
      handedness: widget.handedness,
      assessmentDate: widget.assessmentDate,
      languageComprehensionRadioValue: widget.languageComprehensionRadioValue,
      trialOneScore: widget.trialOneScore,
      trialTwoScore: widget.trialTwoScore,
      trialThreeScore: widget.trialThreeScore,
      visuospatialPraxisImage1: widget.visuospatialPraxisImage1,
      visuospatialPraxisImage2: widget.visuospatialPraxisImage2,
      visuospatialPraxisImage3: widget.visuospatialPraxisImage3,
      attention: widget.attention,
      attentionCorrect: widget.attentionCorrect,
      attentionMistakes: widget.attentionMistakes,
      executiveAnimalNaming: widget.executiveAnimalNaming,
      executiveAnimalNamingCount: widget.executiveAnimalNamingCount,
      executiveLuria: widget.executiveLuria,
      executiveLuriaScore: widget.executiveLuriaScore,
      executiveSerial: widget.executiveSerial,
      executiveSerialScore: widget.executiveSerialScore,
      shorttermMemoryVerbal: widget.shorttermMemoryVerbal,
      shorttermMemoryVerbalScore: widget.shorttermMemoryVerbalScore,
      praxisRight: widget.praxisRight,
      praxisLeft: widget.praxisLeft,
      tenWordDelay: widget.tenWordDelay,
      scoreVerbalRecognitionMemoryTenWords: widget.scoreVerbalRecognitionMemoryTenWords,
      scoreVerbalRecognitionMemoryTenWordsInList: widget.scoreVerbalRecognitionMemoryTenWordsInList,
      scoreVerbalRecognitionMemoryTenWordsNotInList: widget.scoreVerbalRecognitionMemoryTenWordsNotInList,
      shorttermMemoryVisualImage1: widget.shorttermMemoryVisualImage1,
      shorttermMemoryVisualImage2: widget.shorttermMemoryVisualImage2,
      shorttermMemoryVisualImage3: widget.shorttermMemoryVisualImage3,
      anomiaAgnosia: widget.anomiaAgnosia,
      agnosia: widget.agnosia,
      executive: widget.executive,
      spokenLanguage: widget.spokenLanguage,
    );
  }
  Color languageColor = Colors.green;
  Color verbalWMColor = Colors.green;
  Color verbalSTMColor = Colors.green;
  Color visualSTMColor = Colors.green;
  Color praxisColor = Colors.green;
  Color gnosisColor = Colors.green;
  Color executiveColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            title: ListTile(
              title: Text(
                appData.summary,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.start,
              ),
              subtitle: Text(
                appData.testSpokenLanguageSubtitle,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.share),
                  tooltip: "Share Summary",
                  onPressed: () {
                    print("summary");
                    Share.share(shareDoc());
                  }),
              IconButton(
                  icon: Icon(Icons.download),
                  tooltip: "Download PDF",
                  onPressed: () {
                    generateAndDownloadPdf();
                  }),
              IconButton(
                icon: Icon(Icons.home),
                tooltip: "Go Home",
                onPressed: () {
                  var router = MaterialPageRoute(
                      builder: (BuildContext context) => Welcome());
                  Navigator.of(context).pushAndRemoveUntil(
                      router, (Route<dynamic> route) => false);
                },
              )
            ],
            bottom: TabBar(indicatorColor: Colors.white, tabs: [
              Tab(
                icon: Icon(Icons.score),
                text: "Domain Results",
              ),
              Tab(
                icon: Icon(Icons.all_inclusive),
                text: "Full Report",
              ),
            ]),
          ),
          body: TabBarView(children: <Widget>[domainReport(), fullReport()])),
    );
  }

  Widget fullReport() {
    var width = MediaQuery.of(context).size.width;
    return ListView(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: width,
                child: Card(
                  elevation: 10.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            "Name: ${widget.patientName[0].toUpperCase()}${widget.patientName.substring(1)}"),
                        Text("Handedness: ${widget.handedness}"),
                        Text(
                            "Date of Assessment: ${format.format(widget.assessmentDate)}"),
                        Text(
                            "Assessor: ${widget.assessorName[0].toUpperCase()}${widget.assessorName.substring(1)}"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Card(
                  elevation: 10.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      border: TableBorder.all(),
                      columnWidths: {
                        0: FlexColumnWidth(0.4),
                        1: FlexColumnWidth(0.3),
                        2: FlexColumnWidth(0.15),
                        3: FlexColumnWidth(0.15)
                      },
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Task"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Scoring Guide"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Result"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("N / E / I"),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Language Comprehension: 3 Stage Command"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "E (Equivocal) = some difficulty, I (Impaired) = 1 or more clear errors"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${3 - widget.languageComprehensionRadioValue}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              radioValueResultToString(
                                  widget.languageComprehensionRadioValue),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Working Memory VerbalTrial 1: 10 Word Recall"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("N > 6, E = 5-6,I < 5 "),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${widget.trialOneScore}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              valueTrial12ResultToString(widget.trialOneScore),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Short-term Memory Verbal Trial 2: 10 Word Recall"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("N > 6, E = 5-6,I < 5 "),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${widget.trialTwoScore}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              valueTrial12ResultToString(widget.trialTwoScore),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Short-term Memory Verbal Trial 3: 10 Word Recall"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("N > 7, E = 5-7,I < 5"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${widget.trialThreeScore}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              valueTrial3ResultToString(widget.trialThreeScore),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Visuospatial & Praxis: Line Drawing Copy"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("N > 6, E = 6, I < 6"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              valueVisualResultToString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Attention: Vigilance Test"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "N = no mistakes, E = one mistake and I = > 1 mistake"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
//                                child: Text("${widget.attention}",
//                                  textAlign: TextAlign.center,
//                                ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              radioValueResultToString(widget.attention),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Executive: Animal Naming Task"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(">14 = N; 12-14 = E;  <12 =I"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
//                                child: Text("${widget.executiveAnimalNaming}",
//                                  textAlign: TextAlign.center,
//                                ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              radioValueResultToString(
                                  widget.executiveAnimalNaming),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Executive: Luria Alternating Hand Movements"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "N =  3 cycles without mistakes; E = able to do 1-2 cycles; I = unable to complete task"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
//                                child: Text("${widget.executiveLuria}",
//                                  textAlign: TextAlign.center,
//                                ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              radioValueResultToString(widget.executiveLuria),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                Text("Executive: Serial Order Reversal Task"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                Text("N = no errors; E = 1 error; I >1 error"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
//                                child: Text("${widget.executiveSerial}",
//                                  textAlign: TextAlign.center,
//                                ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              radioValueResultToString(widget.executiveSerial),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Short-Term Memory Verbal Recall: Orientation"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("N = 5, E = 4, I < 4"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
//                                child: Text("${widget.shorttermMemoryVerbal}",
//                                  textAlign: TextAlign.center,
//                                ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              radioValueResultToString(
                                  widget.shorttermMemoryVerbal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Praxis: Finger-hand Dexterity: Right"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "N = no errors; E = some difficulty; I = clear difficulty"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
//                                child: Text("${widget.praxisRight}",
//                                  textAlign: TextAlign.center,
//                                ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              radioValueResultToString(widget.praxisRight),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Praxis: Finger-hand Dexterity: Left"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "N = no errors; E = some difficulty; I = clear difficulty"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
//                                child: Text("${widget.praxisLeft}",
//                                  textAlign: TextAlign.center,
//                                ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              radioValueResultToString(widget.praxisLeft),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Short-Term Memory Verbal: Delayed Recall Of 10 Words"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("N >5, E = 5, I < 5"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${widget.tenWordDelay}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              valueDelayResultToString(widget.tenWordDelay),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Short-Term Memory Verbal  Recognition: Total Score"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("N >5, E = 5, I < 5"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${widget.scoreVerbalRecognitionMemoryTenWordsInList}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              valueDelayResultToString(widget
                                  .scoreVerbalRecognitionMemoryTenWordsInList),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Short-Term Memory Visual: Line Drawing Recall"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("N >5, E = 5, I < 5"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
//                                child: Text("${widget.shorttermMemoryVisualImage1 + widget.shorttermMemoryVisualImage2 + widget.shorttermMemoryVisualImage3}",
//                                  textAlign: TextAlign.center,
//                                ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              valueDelayResultToString(9 -
                                  (widget.shorttermMemoryVisualImage1 +
                                      widget.shorttermMemoryVisualImage2 +
                                      widget.shorttermMemoryVisualImage3)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Anomia: Naming Line Drawings"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "N = all correct;E = 1 error, I >1 errorN = all correct;E = 1 error, I >1 error"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${3 - widget.anomiaAgnosia}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              radioValueResultToString(widget.anomiaAgnosia),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                Text("Agnosia: Recognition of Line Drawings"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                Text("N = all correct;E = 1 error, I >1 error"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${3 - widget.agnosia}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              radioValueResultToString(widget.anomiaAgnosia),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Executive: Design Fluency"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "N > 7 drawings; E = 5-7 drawings; I< 5 drawings"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
//                                child: Text("${widget.executive}",
//                                  textAlign: TextAlign.center,
//                                ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              radioValueResultToString(widget.executive),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Spoken Language"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "N = normal speech, E = equivocal, I definite impairment"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${3 - widget.spokenLanguage}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              radioValueResultToString(widget.spokenLanguage),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String radioValueResultToString(int radioValue) {
    switch (radioValue) {
      case 0:
        return "N";
      case 1:
        return "E";
      case 2:
        return "I";
      default:
        return "N";
    }
  }

  Color radioValueResultToColor(int radioValue) {
    switch (radioValue) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.yellow;
      case 2:
        return Colors.red;
      default:
        return Colors.green;
    }
  }

  String valueTrial12ResultToString(int valueTotal) {
    if (valueTotal > 6) {
      return "N";
    } else if (valueTotal < 5) {
      return "I";
    } else {
      return "E";
    }
  }

  Color valueTrial12ResultToColor(int valueTotal) {
    if (valueTotal > 6) {
      return Colors.green;
    } else if (valueTotal < 5) {
      return Colors.red;
    } else {
      return Colors.yellow;
    }
  }

  String valueTrial3ResultToString(int valueTotal) {
    if (valueTotal > 7) {
      return "N";
    } else if (valueTotal < 5) {
      return "I";
    } else {
      return "E";
    }
  }

  Color valueTrial3ResultToColor(int valueTotal) {
    if (valueTotal > 7) {
      return Colors.green;
    } else if (valueTotal < 5) {
      return Colors.red;
    } else {
      return Colors.yellow;
    }
  }

  String valueVisualResultToString() {
    int score1 = 3 - widget.visuospatialPraxisImage1;
    int score2 = 3 - widget.visuospatialPraxisImage2;
    int score3 = 3 - widget.visuospatialPraxisImage3;

    int combineScore = score1 + score2 + score3;
    
    if (combineScore > 6) {
      return "N";
    } else if (combineScore < 6) {
      return "I";
    } else {
      return "E";
    }
  }

  Color valueVisualResultToColor(int valueTotal) {
    if (valueTotal > 6) {
      return Colors.green;
    } else if (valueTotal < 6) {
      return Colors.red;
    } else {
      return Colors.yellow;
    }
  }

  String valueDelayResultToString(int valueTotal) {
    if (valueTotal > 5) {
      return "N";
    } else if (valueTotal < 5) {
      return "I";
    } else {
      return "E";
    }
  }

  Color valueDelayResultToColor(int valueTotal) {
    if (valueTotal > 5) {
      return Colors.green;
    } else if (valueTotal < 5) {
      return Colors.red;
    } else {
      return Colors.yellow;
    }
  }

  Color combineScoresVisualShortTermMemoryColor() {
    int score1 = 3 - widget.shorttermMemoryVisualImage1;
    int score2 = 3 - widget.shorttermMemoryVisualImage2;
    int score3 = 3 - widget.shorttermMemoryVisualImage3;

    int combineScore = score1 + score2 + score3;

    if (combineScore > 5) {
      return Colors.green;
    } else if (combineScore < 5) {
      return Colors.red;
    } else {
      return Colors.yellow;
    }
  }

  Color combineScoresPraxisMemoryColor() {
    int score1 = 3 - widget.visuospatialPraxisImage1;
    int score2 = 3 - widget.visuospatialPraxisImage2;
    int score3 = 3 - widget.visuospatialPraxisImage3;

    int combineScore = score1 + score2 + score3;

    if (combineScore > 5) {
      return Colors.green;
    } else if (combineScore < 5) {
      return Colors.red;
    } else {
      return Colors.yellow;
    }
  }

  Widget domainReport() {
    return ListView(
      children: <Widget>[
        Card(
          elevation: 10.0,
          child: Container(
            color: Colors.yellow,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Tap on the card to display more details".toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Card(
          elevation: 10.0,
          color: attentionCardColor(widget.attention),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "Attention & Concentration",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
//              subtitle: Text(
//                "Domain Result:",
//                style: TextStyle(
//                  color: Colors.black,
//                  fontWeight: FontWeight.w500,
//                ),
//              ),
              trailing: Container(
                width: 130.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.brightness_1,
                          color: radioValueResultToColor(widget.attention)),
                    ],
                  ),
                ),
              ),
              onTap: () {
                var router = MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const AttentionConcentration());
                Navigator.of(context)
                    .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
              },
            ),
          ),
        ),
        Card(
          elevation: 10.0,
          color: languageCardColor(
              widget.spokenLanguage, widget.languageComprehensionRadioValue, widget.executive),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "Language",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
//              subtitle: Text(
//                "Domain Result:",
//                style: TextStyle(
//                  color: Colors.black,
//                  fontWeight: FontWeight.w500,
//                ),
//              ),
              trailing: Container(
                width: 130.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.brightness_1,
                        color: radioValueResultToColor(widget.spokenLanguage),
                      ),
                      Icon(
                        Icons.brightness_1,
                        color: radioValueResultToColor(
                            widget.languageComprehensionRadioValue),
                      ),
                      Icon(
                        Icons.brightness_1,
                        color: radioValueResultToColor(widget.executive),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                var router = MaterialPageRoute(
                    builder: (BuildContext context) => Language(
                          spokenLanguage: widget.spokenLanguage,
                          comprehension: widget.languageComprehensionRadioValue,
                          drawLine: widget.executive,
                        ));
                Navigator.of(context)
                    .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
              },
            ),
          ),
        ),
        Card(
          elevation: 10.0,
          color: verbalWorkingMemoryCardColor(widget.trialOneScore),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "Verbal Working Memory",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
//              subtitle: Text(
//                "Domain Result:",
//                style: TextStyle(
//                  color: Colors.black,
//                  fontWeight: FontWeight.w500,
//                ),
//              ),
              trailing: Container(
                width: 130.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.brightness_1,
                        color: valueTrial12ResultToColor(widget.trialOneScore),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                var router = MaterialPageRoute(
                    builder: (BuildContext context) => VerbalWorkingMemory(
                          trialOneScore: widget.trialOneScore,
                        ));
                Navigator.of(context)
                    .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
              },
            ),
          ),
        ),
        Card(
          elevation: 10.0,
          color: verbalShortTermMemory(
            widget.trialTwoScore,
            widget.trialThreeScore,
            widget.shorttermMemoryVerbal,
            widget.tenWordDelay,
            widget.scoreVerbalRecognitionMemoryTenWords,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "Verbal Short-Term Memory",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
//              subtitle: Text(
//                "Domain Result:",
//                style: TextStyle(
//                  color: Colors.black,
//                  fontWeight: FontWeight.w500,
//                ),
//              ),
              trailing: Container(
                width: 130.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.brightness_1,
                        color: valueTrial12ResultToColor(widget.trialTwoScore),
                      ),
                      Icon(
                        Icons.brightness_1,
                        color: valueTrial3ResultToColor(widget.trialThreeScore),
                      ),
                      Icon(
                        Icons.brightness_1,
                        color: radioValueResultToColor(
                            widget.shorttermMemoryVerbal),
                      ),
                      Icon(
                        Icons.brightness_1,
                        color: valueDelayResultToColor(widget.tenWordDelay),
                      ),
                      Icon(
                        Icons.brightness_1,
                        color: valueDelayResultToColor(
                            widget.scoreVerbalRecognitionMemoryTenWords),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                var router = MaterialPageRoute(
                    builder: (BuildContext context) =>
                        VerbalShortTermMemory(
                          trialTwoScore: widget.trialTwoScore,
                          trialThreeScore: widget.trialThreeScore,
                          orientation: widget.shorttermMemoryVerbal,
                          tenWordDelay: widget.tenWordDelay,
                          scoreVerbalRecognitionMemoryTenWords:
                              widget.scoreVerbalRecognitionMemoryTenWords,
                        ));
                Navigator.of(context)
                    .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
              },
            ),
          ),
        ),
        Card(
          elevation: 10.0,
          color: visualShortTermMemoryCardColor(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "Visual Short-Term Memory",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
//              subtitle: Text(
//                "Domain Result:",
//                style: TextStyle(
//                  color: Colors.black,
//                  fontWeight: FontWeight.w500,
//                ),
//              ),
              trailing: Container(
                width: 130.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.brightness_1,
                        color: combineScoresVisualShortTermMemoryColor(),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                var router = MaterialPageRoute(
                    builder: (BuildContext context) =>
                        VisualShortTermMemory(
                          shorttermMemoryVisualImage1:
                              widget.shorttermMemoryVisualImage1,
                          shorttermMemoryVisualImage2:
                              widget.shorttermMemoryVisualImage2,
                          shorttermMemoryVisualImage3:
                              widget.shorttermMemoryVisualImage3,
                        ));
                Navigator.of(context)
                    .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
              },
            ),
          ),
        ),
        Card(
          elevation: 10.0,
          color: praxisCardColor(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "Praxis",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
//              subtitle: Text(
//                "Domain Result:",
//                style: TextStyle(
//                  color: Colors.black,
//                  fontWeight: FontWeight.w500,
//                ),
//              ),
              trailing: Container(
                width: 130.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.brightness_1,
                        color: radioValueResultToColor(widget.praxisRight),
                      ),
                      Icon(
                        Icons.brightness_1,
                        color: radioValueResultToColor(widget.praxisLeft),
                      ),
                      Icon(
                        Icons.brightness_1,
                        color: combineScoresPraxisMemoryColor(),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                var router = MaterialPageRoute(
                    builder: (BuildContext context) => Praxis(
                          praxisRight: widget.praxisRight,
                          praxisLeft: widget.praxisLeft,
                          visuospatialPraxisImage1:
                              widget.visuospatialPraxisImage1,
                          visuospatialPraxisImage2:
                              widget.visuospatialPraxisImage2,
                          visuospatialPraxisImage3:
                              widget.visuospatialPraxisImage3,
                        ));
                Navigator.of(context)
                    .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
              },
            ),
          ),
        ),
        Card(
          elevation: 10.0,
          color: gnosisCardColor(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "Gnosis",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
//              subtitle: Text(
//                "Domain Result:",
//                style: TextStyle(
//                  color: Colors.black,
//                  fontWeight: FontWeight.w500,
//                ),
//              ),
              trailing: Container(
                width: 130.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.brightness_1,
                        color: combineScoresPraxisMemoryColor(),
                      ),
                      Icon(
                        Icons.brightness_1,
                        color: radioValueResultToColor(widget.anomiaAgnosia),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                var router = MaterialPageRoute(
                    builder: (BuildContext context) => Gnosis(
                          visuospatialPraxisImage1:
                              widget.visuospatialPraxisImage1,
                          visuospatialPraxisImage2:
                              widget.visuospatialPraxisImage2,
                          visuospatialPraxisImage3:
                              widget.visuospatialPraxisImage3,
                          anomiaAgnosia: widget.anomiaAgnosia,
                        ));
                Navigator.of(context)
                    .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
              },
            ),
          ),
        ),
        Card(
          elevation: 10.0,
          color: executiveFunctionCarcColor(widget.executiveAnimalNaming),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "Executive Function",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
//              subtitle: Text(
//                "Domain Result:",
//                style: TextStyle(
//                  color: Colors.black,
//                  fontWeight: FontWeight.w500,
//                ),
//              ),
              trailing: Container(
                width: 130.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.brightness_1,
                        color: radioValueResultToColor(
                            widget.executiveAnimalNaming),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                var router = MaterialPageRoute(
                    builder: (BuildContext context) => ExecutiveFunctions(
                          executiveAnimalNaming: widget.executiveAnimalNaming,
                        ));
                Navigator.of(context)
                    .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
              },
            ),
          ),
        ),
      ],
    );
  }

  // Card Colors

  Color attentionCardColor(int radioValue) {
    switch (radioValue) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.yellow;
      case 2:
        return Colors.red;
      default:
        return Colors.green;
    }
  }

  Color languageCardColor(
      int valueSpokenLanguage, int valueComprehension, int valueExecutive) {
    if (valueSpokenLanguage == 2 ||
        valueComprehension == 2 ||
        valueExecutive == 2) {
      return Colors.red;
    } else if (valueSpokenLanguage == 1 ||
        valueComprehension == 1 ||
        valueExecutive == 1) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  Color verbalWorkingMemoryCardColor(int value) {
    if (value < 5) {
      return Colors.red;
    } else if (value > 6) {
      return Colors.green;
    } else {
      return Colors.yellow;
    }
  }

  Color verbalShortTermMemory(
    int valuetrialTwoScore,
    int valuetrialThreeScore,
    int valueshorttermMemoryVerbal,
    int valuetenWordDelay,
    int valuescoreVerbalRecognitionMemoryTenWords,
  ) {
    if (valuetrialTwoScore < 5 ||
        valuetrialThreeScore < 5 ||
        valueshorttermMemoryVerbal == 2 ||
        valuetenWordDelay < 5 ||
        valuescoreVerbalRecognitionMemoryTenWords < 5) {
      return Colors.red;
    } else if (valuetrialTwoScore == 5 ||
        valuetrialThreeScore == 5 ||
        valueshorttermMemoryVerbal == 1 ||
        valuetenWordDelay == 5 ||
        valuescoreVerbalRecognitionMemoryTenWords == 5) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  Color visualShortTermMemoryCardColor() {
    int score1 = 3 - widget.shorttermMemoryVisualImage1;
    int score2 = 3 - widget.shorttermMemoryVisualImage2;
    int score3 = 3 - widget.shorttermMemoryVisualImage3;

    int combineScore = score1 + score2 + score3;

    if (combineScore > 5) {
      return Colors.green;
    } else if (combineScore < 5) {
      return Colors.red;
    } else {
      return Colors.yellow;
    }
  }

  Color praxisCardColor() {
    int score1 = 3 - widget.visuospatialPraxisImage1;
    int score2 = 3 - widget.visuospatialPraxisImage2;
    int score3 = 3 - widget.visuospatialPraxisImage3;

    int combineScore = score1 + score2 + score3;

    if (combineScore < 5 ||
        widget.praxisLeft == 2 ||
        widget.praxisRight == 2) {
      return Colors.red;
    } else if (combineScore == 5 ||
        widget.praxisLeft == 1 ||
        widget.praxisRight == 1) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  Color gnosisCardColor() {
    int score1 = 3 - widget.visuospatialPraxisImage1;
    int score2 = 3 - widget.visuospatialPraxisImage2;
    int score3 = 3 - widget.visuospatialPraxisImage3;

    int combineScore = score1 + score2 + score3;

    if (combineScore < 5 || widget.anomiaAgnosia == 2) {
      return Colors.red;
    } else if (combineScore == 5 || widget.anomiaAgnosia == 1) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  Color executiveFunctionCarcColor(int radioValue) {
    switch (radioValue) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.yellow;
      case 2:
        return Colors.red;
      default:
        return Colors.green;
    }
  }

  int visualShortTermMemoryCardCToResult() {
    int score1 = 3 - widget.shorttermMemoryVisualImage1;
    int score2 = 3 - widget.shorttermMemoryVisualImage2;
    int score3 = 3 - widget.shorttermMemoryVisualImage3;

    int combineScore = score1 + score2 + score3;

    return combineScore;
  }

  String shareDoc() {
    String shareDoc = "Disclaimer: ${appData.disclaimer2} \n\n";

    shareDoc +=
        "Name: ${widget.patientName[0].toUpperCase()}${widget.patientName.substring(1)}\n\n";

    shareDoc += "Handedness: ${widget.handedness}\n";
    shareDoc += "Test Date: ${format.format(widget.assessmentDate)}\n";
    shareDoc +=
        "Assessor: ${widget.assessorName[0].toUpperCase()}${widget.assessorName.substring(1)}\n\n";

    shareDoc += "Results: \n\n";

    shareDoc += "${appData.disclaimer3}\n\n";

    shareDoc +=
        "Language Comprehension: 3 Stage Command\nRaw score: ${3 - widget.languageComprehensionRadioValue}/3\n${ConvertResponseToString(radioValueResultToString(widget.languageComprehensionRadioValue))}\n\n";

    shareDoc +=
        "Working Memory VerbalTrial 1: Ten Word Recall\nN > 6, E = 5 - 6, I < 5\nRaw score: ${widget.trialOneScore}/10\n${ConvertResponseToString(valueTrial12ResultToString(widget.trialOneScore))}\n\n";

    shareDoc +=
        "Short-term Memory Verbal Trial 2: Ten Word Recall\nN > 6, E = 5 - 6, I < 5\nRaw score: ${widget.trialTwoScore}/10\n${ConvertResponseToString(valueTrial12ResultToString(widget.trialTwoScore))}\n\n";

    shareDoc +=
        "Short-term Memory Verbal Trial 3: Ten Word Recall\nN > 7, E = 5 - 7, I < 5\nRaw score: ${widget.trialThreeScore}/10\n${ConvertResponseToString(valueTrial3ResultToString(widget.trialThreeScore))}\n\n";

    shareDoc +=
        "Visuospatial & Praxis: Line Drawing Copy\nN > 6, E = 6, I < 6\nRaw score: ${visualShortTermMemoryCardCToResult()}/9\n${ConvertResponseToString(valueVisualResultToString())}\n\n";

    shareDoc +=
        "Attention: Vigilance Test\nN = no mistakes, E = one mistake and I = > 1 mistake\nRaw score: ${widget.attentionCorrect} Correct Taps\nRaw score: ${widget.attentionMistakes} Incorrect Taps\n${ConvertResponseToString(radioValueResultToString(widget.attention))}\n\n";

    shareDoc +=
        "Executive: Animal Naming Task\n>14 = N, 12 - 14 = E,  < 12 = I\nRaw score: ${widget.executiveAnimalNamingCount} Animals Named\n${ConvertResponseToString(radioValueResultToString(widget.executiveAnimalNaming))}\n\n";

    shareDoc +=
        "Executive: Luria Alternating Hand Movements\nN =  3 cycles without mistakes; E = able to do 1 - 2 cycles; I = unable to complete task\nRaw score: ${widget.executiveLuriaScore} Hand Movements\n${ConvertResponseToString(radioValueResultToString(widget.executiveLuria))}\n\n";

    shareDoc +=
        "Executive: Serial Order Reversal Task\nN = no errors; E = 1 error; I >1 error\nRaw score: ${widget.executiveSerialScore}/6\n${ConvertResponseToString(radioValueResultToString(widget.executiveSerial))}\n\n";

    shareDoc +=
        "Short-Term Memory Verbal Recall: Orientation\nN = 5, E = 4, I < 4\nRaw score: ${widget.shorttermMemoryVerbalScore}/5\n${ConvertResponseToString(radioValueResultToString(widget.shorttermMemoryVerbal))}\n\n";

    shareDoc +=
        "Praxis: Finger-hand Dexterity: Right\nN = no errors, E = some difficulty, I = clear difficulty\nRaw score: ${3 - widget.praxisRight}/3\n${ConvertResponseToString(radioValueResultToString(widget.praxisRight))}\n\n";

    shareDoc +=
        "Praxis: Finger-hand Dexterity: Left\nN = no errors, E = some difficulty, I = clear difficulty\nRaw score: ${3 - widget.praxisLeft}/3\n${ConvertResponseToString(radioValueResultToString(widget.praxisLeft))}\n\n";

    shareDoc +=
        "Short-Term Memory Verbal: Delayed Recall Of 10 Words\nN > 5, E = 5, I < 5\nRaw score: ${widget.tenWordDelay}/10\n${ConvertResponseToString(valueDelayResultToString(widget.tenWordDelay))}\n\n";

    shareDoc +=
        "Short-Term Memory Verbal  Recognition: Total Score\nN > 5, E = 5, I < 5\nRaw score: Words correctly identified in original word list: ${widget.scoreVerbalRecognitionMemoryTenWordsInList}/10\nRaw score: Words correctly identified NOT in original word list: ${widget.scoreVerbalRecognitionMemoryTenWordsNotInList}/10\nRaw score: Words identified: ${widget.scoreVerbalRecognitionMemoryTenWordsInList + widget.scoreVerbalRecognitionMemoryTenWordsNotInList}/20\n${ConvertResponseToString(valueDelayResultToString(widget.scoreVerbalRecognitionMemoryTenWordsInList))}\n\n";

    shareDoc +=
        "Short-Term Memory Visual: Line Drawing Recall\nN > 5, E = 5, I < 5\nRaw score: ${9 - (widget.shorttermMemoryVisualImage1 + widget.shorttermMemoryVisualImage2 + widget.shorttermMemoryVisualImage3)}/9\n${ConvertResponseToString(valueDelayResultToString(9 - (widget.shorttermMemoryVisualImage1 + widget.shorttermMemoryVisualImage2 + widget.shorttermMemoryVisualImage3)))}\n\n";

    shareDoc +=
        "Anomia: Naming Line Drawings\nN = all correct, E = 1 error, I > 1 error\nRaw Score: ${3 - widget.anomiaAgnosia}/3\n${ConvertResponseToString(radioValueResultToString(widget.anomiaAgnosia))}\n\n";

    shareDoc +=
        "Agnosia: Recognition of Line Drawings\nN = all correct, E = 1 error, I >1 error\nRaw Score: ${3 - widget.agnosia}/3\n${ConvertResponseToString(radioValueResultToString(widget.agnosia))}\n\n";

    shareDoc +=
        "Executive: Design Fluency\nN > 7 drawings, E = 5 - 7 drawings, I < 5 drawings\nRaw Score: ${3 - widget.executive}/3\n${ConvertResponseToString(radioValueResultToString(widget.executive))}\n\n";

    shareDoc +=
        "Spoken Language\nN = normal speech, E = equivocal, I definite impairment\nRaw Score: ${3 - widget.spokenLanguage}/3\n${ConvertResponseToString(radioValueResultToString(widget.spokenLanguage))}\n\n";

    return shareDoc;
  }

  String ConvertResponseToString(String response) {
    if (response == "N") {
      return "Normal";
    } else if (response == "I") {
      return "Impaired";
    } else {
      return "Equivocal";
    }
  }

  Future<void> generateAndDownloadPdf() async {
    // Create a PDF document
    final pdf = pw.Document();
    
    // Add content to the PDF
    final docContent = shareDoc();
    final paragraphs = docContent.split('\n');
    
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          List<pw.Widget> widgets = [];
          
          // Add title
          widgets.add(
            pw.Header(
              level: 0,
              child: pw.Text('MICA Assessment Report', 
                style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)
              ),
            ),
          );
          
          widgets.add(pw.SizedBox(height: 20));
          
          // Add content paragraphs
          for (var para in paragraphs) {
            if (para.trim().isNotEmpty) {
              // Check if this line is a section header (ends with a colon)
              if (para.endsWith(':')) {
                widgets.add(
                  pw.Header(
                    level: 1,
                    child: pw.Text(para, style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
                  ),
                );
              } else if (para.startsWith('Raw score:')) {
                widgets.add(
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 12.0),
                    child: pw.Text(para, style: pw.TextStyle(fontStyle: pw.FontStyle.italic)),
                  ),
                );
              } else if (para.contains('Normal') || para.contains('Impaired') || para.contains('Equivocal')) {
                // Assessment results in bold
                widgets.add(
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 12.0, bottom: 10.0),
                    child: pw.Text(para, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ),
                );
              } else {
                widgets.add(
                  pw.Paragraph(text: para),
                );
              }
            } else {
              // Add space between sections
              widgets.add(pw.SizedBox(height: 10));
            }
          }
          
          return widgets;
        },
      ),
    );
    
    // Generate PDF bytes
    final Uint8List pdfBytes = await pdf.save();
    
    // Generate a filename based on patient name and date
    final patientName = widget.patientName.replaceAll(' ', '_');
    final dateStr = format.format(widget.assessmentDate).replaceAll(' ', '_');
    final filename = 'MICA_${patientName}_${dateStr}.pdf';
    
    try {
      // Save PDF to downloads folder
      await FileSaver.instance.saveFile(
        name: filename,
        bytes: pdfBytes,
        ext: 'pdf',
        mimeType: MimeType.pdf,
      );
      
      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('PDF saved to downloads folder as $filename')),
        );
      }
    } catch (e) {
      // Show error message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving PDF: $e')),
        );
      }
    }
  }
}
