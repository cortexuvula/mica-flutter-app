import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mica/src/domain_results/attention_concentration.dart';
import 'package:mica/src/domain_results/executive_functions.dart';
import 'package:mica/src/domain_results/gnosis.dart';
import 'package:mica/src/domain_results/language.dart';
import 'package:mica/src/domain_results/praxis.dart';
import 'package:mica/src/domain_results/verbal_shortterm_memory.dart';
import 'package:mica/src/domain_results/verbal_working_memory.dart';
import 'package:mica/src/domain_results/visual_short_term_memory.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/welcome.dart';
import 'package:share_plus/share_plus.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:file_saver/file_saver.dart';
import 'package:mica/src/models/mica_score_model.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/utils/navigation_helper.dart';

@immutable
class TestSummaryWithProvider extends StatefulWidget {
  // No parameters needed as we'll get everything from the provider
  const TestSummaryWithProvider({super.key});

  @override
  TestSummaryWithProviderState createState() => TestSummaryWithProviderState();
}

class TestSummaryWithProviderState extends State<TestSummaryWithProvider> {
  var format = DateFormat('d MMM y');

  Color attentionColor = Colors.green;
  Color languageColor = Colors.green;
  Color verbalWMColor = Colors.green;
  Color verbalSTMColor = Colors.green;
  Color visualSTMColor = Colors.green;
  Color praxisColor = Colors.green;
  Color gnosisColor = Colors.green;
  Color executiveColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    // Get the score model from the provider
    final scoreModel = MicaProviders.getScoreModel(context);

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              app_data.summary,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.share),
                tooltip: "Share Summary",
                onPressed: () async {
                  try {
                    final String shareContent = shareDoc(scoreModel);

                    if (shareContent.isNotEmpty) {
                      if (kIsWeb) {
                        // Web platform: Copy to clipboard as fallback
                        await Clipboard.setData(
                            ClipboardData(text: shareContent));
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Report copied to clipboard!'),
                              duration: Duration(seconds: 3),
                              action: SnackBarAction(
                                label: 'OK',
                                onPressed: () {},
                              ),
                            ),
                          );
                        }
                      } else {
                        // Mobile platforms: Use native share
                        await Share.share(
                          shareContent,
                          subject:
                              'MICA Assessment Report - ${scoreModel.patientName}',
                        );

                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Share dialog opened'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      }
                    } else {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'No content to share - please complete assessment first'),
                            backgroundColor: Colors.orange,
                          ),
                        );
                      }
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error sharing: ${e.toString()}'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                }),
            IconButton(
                icon: Icon(Icons.download),
                tooltip: "Download PDF",
                onPressed: () {
                  generateAndDownloadPdf(scoreModel);
                }),
            IconButton(
              icon: Icon(Icons.home),
              tooltip: "Go Home",
              onPressed: () {
                // Reset scores when going back to start
                scoreModel.resetScores();
                NavigationHelper.navigateAndRemoveUntil(
                    context, Welcome(), (Route<dynamic> route) => false);
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
        body: TabBarView(children: <Widget>[
          domainReport(scoreModel),
          fullReport(scoreModel)
        ]),
      ),
    );
  }

  Widget fullReport(MicaScoreModel scoreModel) {
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
                            "Name: ${scoreModel.patientName.isNotEmpty ? scoreModel.patientName[0].toUpperCase() + scoreModel.patientName.substring(1) : ''}"),
                        Text("Handedness: ${scoreModel.handedness}"),
                        Text(
                            "Date of Assessment: ${format.format(scoreModel.assessmentDate)}"),
                        Text(
                            "Assessor: ${scoreModel.assessorName.isNotEmpty ? scoreModel.assessorName[0].toUpperCase() + scoreModel.assessorName.substring(1) : ''}"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
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
                      // Language Comprehension row
                      // TableRow(children: [
                      //   Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child:
                      //         Text("Language Comprehension: 3 Stage Command"),
                      //   ),
                      //   Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Text(
                      //         "E (Equivocal) = some difficulty, I (Impaired) = 1 or more clear errors"),
                      //   ),
                      //   Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Text(
                      //       "${3 - scoreModel.languageComprehensionRadioValue}",
                      //       textAlign: TextAlign.center,
                      //     ),
                      //   ),
                      //   Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Text(
                      //       radioValueResultToString(
                      //           scoreModel.languageComprehensionRadioValue),
                      //       textAlign: TextAlign.center,
                      //     ),
                      //   ),
                      // ]),
                      // Working Memory Verbal Trial 1
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Working Memory VerbalTrial 1: 10 Word Recall"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("N > 6, E = 5-6, I < 5"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${scoreModel.trialOneScore}",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            valueTrial12ResultToString(
                                scoreModel.trialOneScore),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                      // Short-term Memory Verbal Trial 2
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Short-term Memory Verbal Trial 2: 10 Word Recall"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("N > 6, E = 5-6, I < 5"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${scoreModel.trialTwoScore}",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            valueTrial12ResultToString(
                                scoreModel.trialTwoScore),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                      // Short-term Memory Verbal Trial 3
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Short-term Memory Verbal Trial 3: 10 Word Recall"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("N > 7, E = 5-7, I < 5"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${scoreModel.trialThreeScore}",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            valueTrial3ResultToString(
                                scoreModel.trialThreeScore),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                      // Visuospatial & Praxis: Line Drawing Copy
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Text("Visuospatial & Praxis: Line Drawing Copy"),
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
                      // Attention: Vigilance Test
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
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            radioValueResultToString(scoreModel.attention),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                      // Executive: Animal Naming Task
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
                          child: Text(
                            "${scoreModel.executiveAnimalNamingCount}",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            radioValueResultToString(
                                scoreModel.executiveAnimalNaming),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                      // Executive: Luria Alternating Hand Movements
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
                          child: Text(
                            "${scoreModel.executiveLuriaScore}",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            radioValueResultToString(scoreModel.executiveLuria),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                      // Executive: Serial Order Reversal Task
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Executive: Serial Order Reversal Task"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("N = no errors; E = 1 error; I >1 error"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${scoreModel.executiveSerialScore}",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            radioValueResultToString(
                                scoreModel.executiveSerial),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                      // Short-Term Memory Verbal Recall: Orientation
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
                          child: Text(
                            "${scoreModel.shorttermMemoryVerbalScore}",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            radioValueResultToString(
                                scoreModel.shorttermMemoryVerbal),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                      // Praxis: Finger-hand Dexterity: Right
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
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            radioValueResultToString(scoreModel.praxisRight),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                      // Praxis: Finger-hand Dexterity: Left
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
                          child: Text(
                            "",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            radioValueResultToString(scoreModel.praxisLeft),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                      // Short-Term Memory Verbal: Delayed Recall Of 10 Words
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Short-Term Memory Verbal: Delayed Recall Of 10 Words"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("N > 5, E = 5, I < 5"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${scoreModel.tenWordDelay}",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            valueDelayResultToString(scoreModel.tenWordDelay),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                      // Short-Term Memory Verbal: Recognition: Total Score
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Short-Term Memory Verbal Recognition: Total Score"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("N > 5, E = 5, I < 5"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${scoreModel.scoreVerbalRecognitionMemoryTenWords}",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            valueDelayResultToString(scoreModel
                                .scoreVerbalRecognitionMemoryTenWords),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                      // Short-Term Memory Visual: Line Drawing Recall
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Short-Term Memory Visual: Line Drawing Recall"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("N > 5, E = 5, I < 5"),
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
                      // Anomia: Naming Line Drawings
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Anomia: Naming Line Drawings"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Text("N = all correct, E = 1 error, I >1 error"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "3",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            radioValueResultToString(scoreModel.anomiaAgnosia),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                      // Agnosia: Recognition of Line Drawings
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Agnosia: Recognition of Line Drawings"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Text("N = all correct, E = 1 error, I >1 error"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "3",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            radioValueResultToString(scoreModel.agnosia),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                      // Executive: Design Fluency
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Executive: Design Fluency"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "N > 7 drawings, E = 5-7 drawings, I< 5 drawings"),
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
                            radioValueResultToString(scoreModel.executive),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                      // Spoken Language
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Spoken Language"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "N = normal speech, E = equivocal, I = definite impairment"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "3",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            radioValueResultToString(scoreModel.spokenLanguage),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Domain report method using provider
  Widget domainReport(MicaScoreModel scoreModel) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Name: ${scoreModel.patientName}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              'Handedness: ${scoreModel.handedness}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Test Date: ${format.format(scoreModel.assessmentDate)}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              'Assessor: ${scoreModel.assessorName}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Domain cards
          attentionConcentrationCard(scoreModel),
          languageCard(scoreModel),
          verbalWorkingMemoryCard(scoreModel),
          Card(
            elevation: 10.0,
            color: verbalShortTermMemory(
              scoreModel.trialTwoScore,
              scoreModel.trialThreeScore,
              scoreModel.shorttermMemoryVerbal,
              scoreModel.tenWordDelay,
              scoreModel.scoreVerbalRecognitionMemoryTenWords,
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
                          color: valueTrial12ResultToColor(
                              scoreModel.trialTwoScore),
                        ),
                        Icon(
                          Icons.brightness_1,
                          color: valueTrial3ResultToColor(
                              scoreModel.trialThreeScore),
                        ),
                        Icon(
                          Icons.brightness_1,
                          color: radioValueResultToColor(
                              scoreModel.shorttermMemoryVerbal),
                        ),
                        Icon(
                          Icons.brightness_1,
                          color:
                              valueDelayResultToColor(scoreModel.tenWordDelay),
                        ),
                        Icon(
                          Icons.brightness_1,
                          color: valueDelayResultToColor(
                              scoreModel.scoreVerbalRecognitionMemoryTenWords),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  NavigationHelper.navigateAndRemoveUntil(
                      context,
                      VerbalShortTermMemory(
                        trialTwoScore: scoreModel.trialTwoScore,
                        trialThreeScore: scoreModel.trialThreeScore,
                        orientation: scoreModel.shorttermMemoryVerbal,
                        tenWordDelay: scoreModel.tenWordDelay,
                        scoreVerbalRecognitionMemoryTenWords:
                            scoreModel.scoreVerbalRecognitionMemoryTenWords,
                      ),
                      (Route<dynamic> route) => true);
                },
              ),
            ),
          ),
          visualShortTermMemoryCard(scoreModel),
          praxisCard(scoreModel),
          gnosisCard(scoreModel),
          executiveFunctionCard(scoreModel),
        ],
      ),
    );
  }

  // Example of domain cards using the provider model
  Widget attentionConcentrationCard(MicaScoreModel scoreModel) {
    return Card(
      elevation: 10.0,
      color: attentionCardColor(scoreModel.attention),
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
          trailing: Container(
            width: 130.0,
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.brightness_1,
                    color: radioValueResultToColor(scoreModel.attention),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            var router = MaterialPageRoute(
                builder: (BuildContext context) => AttentionConcentration());
            Navigator.of(context)
                .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
          },
        ),
      ),
    );
  }

  Widget languageCard(MicaScoreModel scoreModel) {
    return Card(
      elevation: 10.0,
      color: languageCardColor(
        scoreModel.spokenLanguage,
        scoreModel.languageComprehensionRadioValue,
        scoreModel.executiveAnimalNaming,
      ),
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
          trailing: Container(
            width: 130.0,
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.brightness_1,
                    color: radioValueResultToColor(scoreModel.spokenLanguage),
                  ),
                  // Icon(
                  //   Icons.brightness_1,
                  //   color: radioValueResultToColor(
                  //       scoreModel.languageComprehensionRadioValue),
                  // ),
                  Icon(
                    Icons.brightness_1,
                    color: radioValueResultToColor(scoreModel.executive),
                  )
                ],
              ),
            ),
          ),
          onTap: () {
            var router = MaterialPageRoute(
                builder: (BuildContext context) => Language(
                      spokenLanguage: scoreModel.spokenLanguage,
                      comprehension: scoreModel.languageComprehensionRadioValue,
                      drawLine: scoreModel.executive,
                    ));
            Navigator.of(context)
                .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
          },
        ),
      ),
    );
  }

  Widget verbalWorkingMemoryCard(MicaScoreModel scoreModel) {
    return Card(
      elevation: 10.0,
      color: verbalWorkingMemoryCardColor(scoreModel.trialOneScore),
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
          trailing: Container(
            width: 130.0,
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.brightness_1,
                    color: valueTrial12ResultToColor(scoreModel.trialOneScore),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            var router = MaterialPageRoute(
                builder: (BuildContext context) => VerbalWorkingMemory(
                      trialOneScore: scoreModel.trialOneScore,
                    ));
            Navigator.of(context)
                .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
          },
        ),
      ),
    );
  }

  Widget verbalShortTermMemoryCard(MicaScoreModel scoreModel) {
    // Calculate color and print it
    Color cardColor = verbalShortTermMemory(
      scoreModel.trialTwoScore,
      scoreModel.trialThreeScore,
      scoreModel.shorttermMemoryVerbal,
      scoreModel.tenWordDelay,
      scoreModel.scoreVerbalRecognitionMemoryTenWords,
    );
    return Card(
      elevation: 10.0,
      color: cardColor,
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
          trailing: Container(
            width: 130.0,
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.brightness_1,
                    color: valueTrial12ResultToColor(scoreModel.trialTwoScore),
                  ),
                  Icon(
                    Icons.brightness_1,
                    color: valueTrial3ResultToColor(scoreModel.trialThreeScore),
                  ),
                  Icon(
                    Icons.brightness_1,
                    color: radioValueResultToColor(
                        scoreModel.shorttermMemoryVerbal),
                  ),
                  Icon(
                    Icons.brightness_1,
                    color: valueDelayResultToColor(scoreModel.tenWordDelay),
                  ),
                  Icon(
                    Icons.brightness_1,
                    color: valueDelayResultToColor(
                        scoreModel.scoreVerbalRecognitionMemoryTenWords),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            var router = MaterialPageRoute(
                builder: (BuildContext context) => VerbalShortTermMemory(
                      trialTwoScore: scoreModel.trialTwoScore,
                      trialThreeScore: scoreModel.trialThreeScore,
                      orientation: scoreModel.shorttermMemoryVerbal,
                      tenWordDelay: scoreModel.tenWordDelay,
                      scoreVerbalRecognitionMemoryTenWords:
                          scoreModel.scoreVerbalRecognitionMemoryTenWords,
                    ));
            Navigator.of(context)
                .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
          },
        ),
      ),
    );
  }

  Widget visualShortTermMemoryCard(MicaScoreModel scoreModel) {
    return Card(
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
          trailing: Container(
            width: 130.0,
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.brightness_1,
                    color: valueVisualResultToColor(scoreModel),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            var router = MaterialPageRoute(
                builder: (BuildContext context) => VisualShortTermMemory(
                      shorttermMemoryVisualImage1:
                          scoreModel.shorttermMemoryVisualImage1,
                      shorttermMemoryVisualImage2:
                          scoreModel.shorttermMemoryVisualImage2,
                      shorttermMemoryVisualImage3:
                          scoreModel.shorttermMemoryVisualImage3,
                    ));
            Navigator.of(context)
                .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
          },
        ),
      ),
    );
  }

  Widget praxisCard(MicaScoreModel scoreModel) {
    return Card(
      elevation: 10.0,
      color: praxisCardColor(scoreModel),
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
          trailing: Container(
            width: 130.0,
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.brightness_1,
                    color: radioValueResultToColor(scoreModel.praxisRight),
                  ),
                  Icon(
                    Icons.brightness_1,
                    color: radioValueResultToColor(scoreModel.praxisLeft),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            var router = MaterialPageRoute(
                builder: (BuildContext context) => Praxis(
                      praxisRight: scoreModel.praxisRight,
                      praxisLeft: scoreModel.praxisLeft,
                      visuospatialPraxisImage1:
                          scoreModel.visuospatialPraxisImage1,
                      visuospatialPraxisImage2:
                          scoreModel.visuospatialPraxisImage2,
                      visuospatialPraxisImage3:
                          scoreModel.visuospatialPraxisImage3,
                    ));
            Navigator.of(context)
                .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
          },
        ),
      ),
    );
  }

  Widget gnosisCard(MicaScoreModel scoreModel) {
    return Card(
      elevation: 10.0,
      color: gnosisCardColor(scoreModel),
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
          trailing: Container(
            width: 130.0,
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.brightness_1,
                    color: radioValueResultToColor(scoreModel.anomiaAgnosia),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            var router = MaterialPageRoute(
                builder: (BuildContext context) => Gnosis(
                      visuospatialPraxisImage1:
                          scoreModel.visuospatialPraxisImage1,
                      visuospatialPraxisImage2:
                          scoreModel.visuospatialPraxisImage2,
                      visuospatialPraxisImage3:
                          scoreModel.visuospatialPraxisImage3,
                      anomiaAgnosia: scoreModel.anomiaAgnosia,
                    ));
            Navigator.of(context)
                .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
          },
        ),
      ),
    );
  }

  Widget executiveFunctionCard(MicaScoreModel scoreModel) {
    return Card(
      elevation: 10.0,
      color: executiveFunctionCarcColor(scoreModel.executive),
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
          trailing: Container(
            width: 130.0,
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.brightness_1,
                    color: radioValueResultToColor(
                        scoreModel.executiveAnimalNaming),
                  ),
                  Icon(
                    Icons.brightness_1,
                    color: radioValueResultToColor(scoreModel.executiveLuria),
                  ),
                  Icon(
                    Icons.brightness_1,
                    color: radioValueResultToColor(scoreModel.executiveSerial),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            var router = MaterialPageRoute(
                builder: (BuildContext context) => ExecutiveFunctions(
                      executiveAnimalNaming: scoreModel.executiveAnimalNaming,
                    ));
            Navigator.of(context)
                .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
          },
        ),
      ),
    );
  }

  // Helper methods for color and string representation
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
    } else if (value >= 5 && value <= 6) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  Color valueTrial12ResultToColor(int valueTotal) {
    if (valueTotal < 5) {
      return Colors.red;
    } else if (valueTotal >= 5 && valueTotal <= 6) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  Color valueTrial3ResultToColor(int valueTotal) {
    if (valueTotal < 5) {
      return Colors.red;
    } else if (valueTotal >= 5 && valueTotal <= 7) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  Color valueDelayResultToColor(int valueTotal) {
    if (valueTotal < 5) {
      return Colors.red;
    } else if (valueTotal == 5) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  Color verbalShortTermMemory(
    int valuetrialTwoScore,
    int valuetrialThreeScore,
    int valueshorttermMemoryVerbal,
    int valuetenWordDelay,
    int valuescoreVerbalRecognitionMemoryTenWords,
  ) {
    // Check if all values have excellent scores, assuming 0 means default/not set
    if (valuetrialTwoScore >= 7 &&
        valuetrialThreeScore >= 8 &&
        (valueshorttermMemoryVerbal == 0 || valueshorttermMemoryVerbal >= 5) &&
        valuetenWordDelay >= 6 &&
        valuescoreVerbalRecognitionMemoryTenWords >= 6) {
      return Colors.green;
    }

    // Check if any value indicates impaired (red)
    // For shorttermMemoryVerbal, only consider it impaired if it's not 0 and less than 4
    bool stmVerbalImpaired =
        valueshorttermMemoryVerbal != 0 && valueshorttermMemoryVerbal < 4;

    bool isImpaired = valuetrialTwoScore < 5 ||
        valuetrialThreeScore < 5 ||
        stmVerbalImpaired ||
        valuetenWordDelay < 5 ||
        valuescoreVerbalRecognitionMemoryTenWords < 5;

    if (isImpaired) {
      return Colors.red;
    }

    // Check if any value indicates equivocal (yellow)
    // For trial two score
    bool trial2Equivocal = valuetrialTwoScore == 5 || valuetrialTwoScore == 6;
    // For trial three score
    bool trial3Equivocal =
        valuetrialThreeScore >= 5 && valuetrialThreeScore <= 7;
    // For short-term memory verbal
    bool stmVerbalEquivocal = valueshorttermMemoryVerbal == 4;
    // For ten word delay
    bool tenWordDelayEquivocal = valuetenWordDelay == 5;
    // For recognition memory
    bool recognitionEquivocal = valuescoreVerbalRecognitionMemoryTenWords == 5;

    bool isEquivocal = trial2Equivocal ||
        trial3Equivocal ||
        stmVerbalEquivocal ||
        tenWordDelayEquivocal ||
        recognitionEquivocal;

    if (isEquivocal) {
      return Colors.yellow;
    }
    return Colors.green;
  }

  Color visualShortTermMemoryCardColor() {
    return Colors.green; // Default color
  }

  Color valueVisualResultToColor(MicaScoreModel scoreModel) {
    int score1 = 3 - scoreModel.shorttermMemoryVisualImage1;
    int score2 = 3 - scoreModel.shorttermMemoryVisualImage2;
    int score3 = 3 - scoreModel.shorttermMemoryVisualImage3;

    int combineScore = score1 + score2 + score3;

    if (combineScore < 6) {
      return Colors.red;
    } else if (combineScore == 6) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  String valueVisualResultToString() {
    // This is a placeholder - in the real implementation, it would use the combined scores
    return "N";
  }

  Color praxisCardColor(MicaScoreModel scoreModel) {
    int score1 = 3 - scoreModel.visuospatialPraxisImage1;
    int score2 = 3 - scoreModel.visuospatialPraxisImage2;
    int score3 = 3 - scoreModel.visuospatialPraxisImage3;

    int combineScore = score1 + score2 + score3;

    if (combineScore < 5 ||
        scoreModel.praxisLeft == 2 ||
        scoreModel.praxisRight == 2) {
      return Colors.red;
    } else if (combineScore == 5 ||
        scoreModel.praxisLeft == 1 ||
        scoreModel.praxisRight == 1) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  Color gnosisCardColor(MicaScoreModel scoreModel) {
    int score1 = 3 - scoreModel.visuospatialPraxisImage1;
    int score2 = 3 - scoreModel.visuospatialPraxisImage2;
    int score3 = 3 - scoreModel.visuospatialPraxisImage3;

    int combineScore = score1 + score2 + score3;

    if (combineScore < 5 || scoreModel.anomiaAgnosia == 2) {
      return Colors.red;
    } else if (combineScore == 5 || scoreModel.anomiaAgnosia == 1) {
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

  String valueTrial12ResultToString(int valueTotal) {
    if (valueTotal < 5) {
      return "I";
    } else if (valueTotal >= 5 && valueTotal <= 6) {
      return "E";
    } else {
      return "N";
    }
  }

  String valueTrial3ResultToString(int valueTotal) {
    if (valueTotal < 5) {
      return "I";
    } else if (valueTotal >= 5 && valueTotal <= 7) {
      return "E";
    } else {
      return "N";
    }
  }

  String valueDelayResultToString(int valueTotal) {
    if (valueTotal < 5) {
      return "I";
    } else if (valueTotal == 5) {
      return "E";
    } else {
      return "N";
    }
  }

  String shareDoc(MicaScoreModel scoreModel) {
    String shareDoc = "MICA Assessment Report\n";
    shareDoc += "_________________________________________________________\n\n";

    shareDoc += "Disclaimer: ${app_data.disclaimer2} \n\n";

    shareDoc +=
        "Name: ${scoreModel.patientName.isNotEmpty ? scoreModel.patientName[0].toUpperCase() + scoreModel.patientName.substring(1) : ''}\n\n";
    shareDoc += "Handedness: ${scoreModel.handedness}\n\n";
    shareDoc += "Test Date: ${format.format(scoreModel.assessmentDate)}\n\n";
    shareDoc +=
        "Assessor: ${scoreModel.assessorName.isNotEmpty ? scoreModel.assessorName[0].toUpperCase() + scoreModel.assessorName.substring(1) : ''}\n\n";

    shareDoc += "Results:\n\n";

    shareDoc += "The following abbreviations are used:\n\n";
    shareDoc += "  N = Normal, E = Equivocal, I = Impaired\n\n";
    shareDoc += "Cut scores are estimates only.\n\n";

    // Working Memory Verbal Trial 1
    shareDoc += "Working Memory VerbalTrial 1: Ten Word Recall\n\n";
    shareDoc += "N > 6, E = 5 - 6, I < 5\n\n";
    shareDoc += "  Raw score: ${scoreModel.trialOneScore}/10\n";
    shareDoc +=
        "  ${convertResponseToString(valueTrial12ResultToString(scoreModel.trialOneScore))}\n\n";

    // Short-term Memory Verbal Trial 2
    shareDoc += "Short-term Memory Verbal Trial 2: Ten Word Recall\n\n";
    shareDoc += "N > 6, E = 5 - 6, I < 5\n\n";
    shareDoc += "  Raw score: ${scoreModel.trialTwoScore}/10\n";
    shareDoc +=
        "  ${convertResponseToString(valueTrial12ResultToString(scoreModel.trialTwoScore))}\n\n";

    // Short-term Memory Verbal Trial 3
    shareDoc += "Short-term Memory Verbal Trial 3: Ten Word Recall\n\n";
    shareDoc += "N > 7, E = 5 - 7, I < 5\n\n";
    shareDoc += "  Raw score: ${scoreModel.trialThreeScore}/10\n";
    shareDoc +=
        "  ${convertResponseToString(valueTrial3ResultToString(scoreModel.trialThreeScore))}\n\n";

    // Visuospatial & Praxis: Line Drawing Copy
    shareDoc += "Visuospatial & Praxis: Line Drawing Copy\n\n";
    shareDoc += "N > 6, E = 6, I < 6\n\n";
    shareDoc += "  Raw score: 9/9\n";
    shareDoc += "  ${convertResponseToString(valueVisualResultToString())}\n\n";

    // Attention: Vigilance Test
    shareDoc += "Attention: Vigilance Test\n\n";
    shareDoc += "N = no mistakes, E = one mistake and I = > 1 mistake\n\n";
    shareDoc += "  Raw score: ${scoreModel.attentionCorrect} Correct Taps\n";
    shareDoc += "  Raw score: ${scoreModel.attentionMistakes} Incorrect Taps\n";
    shareDoc +=
        "  ${convertResponseToString(radioValueResultToString(scoreModel.attention))}\n\n";

    // Executive: Animal Naming Task
    shareDoc += "Executive: Animal Naming Task\n\n";
    shareDoc += ">14 = N, 12 - 14 = E, < 12 = I\n\n";
    shareDoc +=
        "  Raw score: ${scoreModel.executiveAnimalNamingCount} Animals Named\n";
    shareDoc +=
        "  ${convertResponseToString(radioValueResultToString(scoreModel.executiveAnimalNaming))}\n\n";

    // Executive: Luria Alternating Hand Movements
    shareDoc += "Executive: Luria Alternating Hand Movements\n\n";
    shareDoc +=
        "N = 3 cycles without mistakes; E = able to do 1 - 2 cycles; I = unable to complete task\n\n";
    shareDoc +=
        "  Raw score: ${scoreModel.executiveLuriaScore} Hand Movements\n";
    shareDoc +=
        "  ${convertResponseToString(radioValueResultToString(scoreModel.executiveLuria))}\n\n";

    // Executive: Serial Order Reversal Task
    shareDoc += "Executive: Serial Order Reversal Task\n\n";
    shareDoc += "N = no errors; E = 1 error; I >1 error\n\n";
    shareDoc += "  Raw score: ${scoreModel.executiveSerialScore}/6\n";
    shareDoc +=
        "  ${convertResponseToString(radioValueResultToString(scoreModel.executiveSerial))}\n\n";

    // Short-Term Memory Verbal Recall: Orientation
    shareDoc += "Short-Term Memory Verbal Recall: Orientation\n\n";
    shareDoc += "N = 5, E = 4, I < 4\n\n";
    shareDoc += "  Raw score: ${scoreModel.shorttermMemoryVerbalScore}/6\n";
    shareDoc +=
        "  ${convertResponseToString(radioValueResultToString(scoreModel.shorttermMemoryVerbal))}\n\n";

    // Praxis: Finger-hand Dexterity: Right
    shareDoc += "Praxis: Finger-hand Dexterity: Right\n\n";
    shareDoc += "N = no errors, E = some difficulty, I = clear difficulty\n\n";
    shareDoc += "  Raw score: 3/3\n";
    shareDoc +=
        "  ${convertResponseToString(radioValueResultToString(scoreModel.praxisRight))}\n\n";

    // Praxis: Finger-hand Dexterity: Left
    shareDoc += "Praxis: Finger-hand Dexterity: Left\n\n";
    shareDoc += "N = no errors, E = some difficulty, I = clear difficulty\n\n";
    shareDoc += "  Raw score: 3/3\n";
    shareDoc +=
        "  ${convertResponseToString(radioValueResultToString(scoreModel.praxisLeft))}\n\n";

    // Short-Term Memory Verbal: Delayed Recall Of 10 Words
    shareDoc += "Short-Term Memory Verbal: Delayed Recall Of 10 Words\n\n";
    shareDoc += "N > 5, E = 5, I < 5\n\n";
    shareDoc += "  Raw score: ${scoreModel.tenWordDelay}/10\n";
    shareDoc +=
        "  ${convertResponseToString(valueDelayResultToString(scoreModel.tenWordDelay))}\n\n";

    // Short-Term Memory Verbal Recognition: Total Score
    shareDoc += "Short-Term Memory Verbal Recognition: Total Score\n\n";
    shareDoc += "N > 5, E = 5, I < 5\n\n";
    shareDoc +=
        "  Raw score: Words correctly identified in original word list: ${scoreModel.scoreVerbalRecognitionMemoryTenWordsInList}/10\n";
    shareDoc +=
        "  Raw score: Words correctly identified NOT in original word list: ${scoreModel.scoreVerbalRecognitionMemoryTenWordsNotInList}/10\n";
    shareDoc +=
        "  Raw score: Words identified: ${scoreModel.scoreVerbalRecognitionMemoryTenWords}/20\n";
    shareDoc +=
        "  ${convertResponseToString(valueDelayResultToString(scoreModel.scoreVerbalRecognitionMemoryTenWords))}\n\n";

    // Short-Term Memory Visual: Line Drawing Recall
    shareDoc += "Short-Term Memory Visual: Line Drawing Recall\n\n";
    shareDoc += "N > 5, E = 5, I < 5\n\n";
    shareDoc += "  Raw score: 9/9\n";
    shareDoc += "  ${convertResponseToString(valueVisualResultToString())}\n\n";

    // Anomia: Naming Line Drawings
    shareDoc += "Anomia: Naming Line Drawings\n\n";
    shareDoc += "N = all correct, E = 1 error, I > 1 error\n\n";
    shareDoc += "  Raw Score: 3/3\n";
    shareDoc +=
        "  ${convertResponseToString(radioValueResultToString(scoreModel.anomiaAgnosia))}\n\n";

    // Agnosia: Recognition of Line Drawings
    shareDoc += "Agnosia: Recognition of Line Drawings\n\n";
    shareDoc += "N = all correct, E = 1 error, I > 1 error\n\n";
    shareDoc += "  Raw Score: 3/3\n";
    shareDoc +=
        "  ${convertResponseToString(radioValueResultToString(scoreModel.agnosia))}\n\n";

    // Executive: Design Fluency
    shareDoc += "Executive: Design Fluency\n\n";
    shareDoc += "N > 7 drawings, E = 5 - 7 drawings, I < 5 drawings\n\n";
    shareDoc += "  Raw Score: 3/3\n";
    shareDoc +=
        "  ${convertResponseToString(radioValueResultToString(scoreModel.executive))}\n\n";

    // Spoken Language
    shareDoc += "Spoken Language\n\n";
    shareDoc += "N = normal speech, E = equivocal, I definite impairment\n\n";
    shareDoc += "  Raw Score: 3/3\n";
    shareDoc +=
        "  ${convertResponseToString(radioValueResultToString(scoreModel.spokenLanguage))}\n\n";

    return shareDoc;
  }

  String convertResponseToString(String response) {
    if (response == "N") {
      return "Normal";
    } else if (response == "I") {
      return "Impaired";
    } else {
      return "Equivocal";
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

  // PDF generation method for assessment report
  // Helper function to create assessment sections in PDF
  pw.Widget addAssessmentSection(
      {required String title,
      required String guide,
      required String rawScore,
      required String result}) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(title, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 2),
          if (guide.isNotEmpty) pw.Text(guide),
          if (guide.isNotEmpty) pw.SizedBox(height: 2),
          for (var scoreLine in rawScore.split('\n'))
            pw.Padding(
              padding: const pw.EdgeInsets.only(left: 10),
              child: pw.Text(scoreLine, style: pw.TextStyle(fontSize: 10)),
            ),
          pw.Padding(
            padding: const pw.EdgeInsets.only(left: 10),
            child: pw.Text(result,
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          ),
          pw.SizedBox(height: 8),
        ]);
  }

  Future<void> generateAndDownloadPdf(MicaScoreModel scoreModel) async {
    // Create a PDF document
    final pdf = pw.Document();

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
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold)),
            ),
          );

          widgets.add(pw.Divider(thickness: 1));

          // Add disclaimer
          widgets.add(pw.Paragraph(
              text: "Disclaimer: ${app_data.disclaimer2}",
              style: pw.TextStyle(fontSize: 10)));

          widgets.add(pw.SizedBox(height: 10));

          // Add patient information
          widgets.add(pw.Paragraph(
            text:
                "Name: ${scoreModel.patientName.isNotEmpty ? scoreModel.patientName[0].toUpperCase() + scoreModel.patientName.substring(1) : ''}",
          ));

          widgets.add(pw.Paragraph(
            text: "Handedness: ${scoreModel.handedness}",
          ));

          widgets.add(pw.Paragraph(
            text: "Test Date: ${format.format(scoreModel.assessmentDate)}",
          ));

          widgets.add(pw.Paragraph(
            text:
                "Assessor: ${scoreModel.assessorName.isNotEmpty ? scoreModel.assessorName[0].toUpperCase() + scoreModel.assessorName.substring(1) : ''}",
          ));

          widgets.add(pw.SizedBox(height: 10));

          // Add Results header
          widgets.add(
            pw.Header(
              level: 1,
              child: pw.Text('Results:',
                  style: pw.TextStyle(
                      fontSize: 16, fontWeight: pw.FontWeight.bold)),
            ),
          );

          widgets.add(pw.SizedBox(height: 5));

          // Add abbreviations
          widgets.add(
            pw.Header(
              level: 2,
              child: pw.Text('The following abbreviations are used:',
                  style: pw.TextStyle(
                      fontSize: 12, fontWeight: pw.FontWeight.bold)),
            ),
          );

          widgets.add(pw.Padding(
            padding: const pw.EdgeInsets.only(left: 20),
            child: pw.Text('N = Normal, E = Equivocal, I = Impaired',
                style: pw.TextStyle(fontSize: 11)),
          ));

          widgets.add(pw.Paragraph(
              text: "Cut scores are estimates only.",
              style:
                  pw.TextStyle(fontSize: 11, fontStyle: pw.FontStyle.italic)));

          widgets.add(pw.SizedBox(height: 10));

          // Working Memory VerbalTrial 1
          widgets.add(addAssessmentSection(
              title: "Working Memory VerbalTrial 1: Ten Word Recall",
              guide: "N > 6, E = 5 - 6, I < 5",
              rawScore: "Raw score: ${scoreModel.trialOneScore}/10",
              result: convertResponseToString(
                  valueTrial12ResultToString(scoreModel.trialOneScore))));

          // Short-term Memory Verbal Trial 2
          widgets.add(addAssessmentSection(
              title: "Short-term Memory Verbal Trial 2: Ten Word Recall",
              guide: "N > 6, E = 5 - 6, I < 5",
              rawScore: "Raw score: ${scoreModel.trialTwoScore}/10",
              result: convertResponseToString(
                  valueTrial12ResultToString(scoreModel.trialTwoScore))));

          // Short-term Memory Verbal Trial 3
          widgets.add(addAssessmentSection(
              title: "Short-term Memory Verbal Trial 3: Ten Word Recall",
              guide: "N > 7, E = 5 - 7, I < 5",
              rawScore: "Raw score: ${scoreModel.trialThreeScore}/10",
              result: convertResponseToString(
                  valueTrial3ResultToString(scoreModel.trialThreeScore))));

          // Visuospatial & Praxis
          widgets.add(addAssessmentSection(
              title: "Visuospatial & Praxis: Line Drawing Copy",
              guide: "N > 6, E = 6, I < 6",
              rawScore: "Raw score: 9/9",
              result: convertResponseToString(valueVisualResultToString())));

          // Attention
          widgets.add(addAssessmentSection(
              title: "Attention: Vigilance Test",
              guide: "N = no mistakes, E = one mistake and I = > 1 mistake",
              rawScore:
                  "Raw score: ${scoreModel.attentionCorrect} Correct Taps\nRaw score: ${scoreModel.attentionMistakes} Incorrect Taps",
              result: convertResponseToString(
                  radioValueResultToString(scoreModel.attention))));

          // Executive functions sections
          widgets.add(addAssessmentSection(
              title: "Executive: Animal Naming Task",
              guide: ">14 = N, 12 - 14 = E, < 12 = I",
              rawScore:
                  "Raw score: ${scoreModel.executiveAnimalNamingCount} Animals Named",
              result: convertResponseToString(
                  radioValueResultToString(scoreModel.executiveAnimalNaming))));

          widgets.add(addAssessmentSection(
              title: "Executive: Luria Alternating Hand Movements",
              guide:
                  "N = 3 cycles without mistakes; E = able to do 1 - 2 cycles; I = unable to complete task",
              rawScore:
                  "Raw score: ${scoreModel.executiveLuriaScore} Hand Movements",
              result: convertResponseToString(
                  radioValueResultToString(scoreModel.executiveLuria))));

          widgets.add(addAssessmentSection(
              title: "Executive: Serial Order Reversal Task",
              guide: "N = no errors; E = 1 error; I >1 error",
              rawScore: "Raw score: ${scoreModel.executiveSerialScore}/6",
              result: convertResponseToString(
                  radioValueResultToString(scoreModel.executiveSerial))));

          // Short-Term Memory
          widgets.add(addAssessmentSection(
              title: "Short-Term Memory Verbal Recall: Orientation",
              guide: "N = 5, E = 4, I < 4",
              rawScore: "Raw score: ${scoreModel.shorttermMemoryVerbalScore}/6",
              result: convertResponseToString(
                  radioValueResultToString(scoreModel.shorttermMemoryVerbal))));

          // Praxis sections
          widgets.add(addAssessmentSection(
              title: "Praxis: Finger-hand Dexterity: Right",
              guide: "N = no errors, E = some difficulty, I = clear difficulty",
              rawScore: "Raw score: 3/3",
              result: convertResponseToString(
                  radioValueResultToString(scoreModel.praxisRight))));

          widgets.add(addAssessmentSection(
              title: "Praxis: Finger-hand Dexterity: Left",
              guide: "N = no errors, E = some difficulty, I = clear difficulty",
              rawScore: "Raw score: 3/3",
              result: convertResponseToString(
                  radioValueResultToString(scoreModel.praxisLeft))));

          // More memory sections
          widgets.add(addAssessmentSection(
              title: "Short-Term Memory Verbal: Delayed Recall Of 10 Words",
              guide: "N > 5, E = 5, I < 5",
              rawScore: "Raw score: ${scoreModel.tenWordDelay}/10",
              result: convertResponseToString(
                  valueDelayResultToString(scoreModel.tenWordDelay))));

          widgets.add(addAssessmentSection(
              title: "Short-Term Memory Verbal Recognition: Total Score",
              guide: "N > 5, E = 5, I < 5",
              rawScore:
                  "Raw score: Words correctly identified in original word list: ${scoreModel.scoreVerbalRecognitionMemoryTenWordsInList}/10\nRaw score: Words correctly identified NOT in original word list: ${scoreModel.scoreVerbalRecognitionMemoryTenWordsNotInList}/10\nRaw score: Words identified: ${scoreModel.scoreVerbalRecognitionMemoryTenWords}/20",
              result: convertResponseToString(valueDelayResultToString(
                  scoreModel.scoreVerbalRecognitionMemoryTenWords))));

          widgets.add(addAssessmentSection(
              title: "Short-Term Memory Visual: Line Drawing Recall",
              guide: "N > 5, E = 5, I < 5",
              rawScore: "Raw score: 9/9",
              result: convertResponseToString(valueVisualResultToString())));

          // Final sections
          widgets.add(addAssessmentSection(
              title: "Anomia: Naming Line Drawings",
              guide: "N = all correct, E = 1 error, I > 1 error",
              rawScore: "Raw Score: 3/3",
              result: convertResponseToString(
                  radioValueResultToString(scoreModel.anomiaAgnosia))));

          widgets.add(addAssessmentSection(
              title: "Agnosia: Recognition of Line Drawings",
              guide: "N = all correct, E = 1 error, I > 1 error",
              rawScore: "Raw Score: 3/3",
              result: convertResponseToString(
                  radioValueResultToString(scoreModel.agnosia))));

          widgets.add(addAssessmentSection(
              title: "Executive: Design Fluency",
              guide: "N > 7 drawings, E = 5 - 7 drawings, I < 5 drawings",
              rawScore: "Raw Score: 3/3",
              result: convertResponseToString(
                  radioValueResultToString(scoreModel.executive))));

          widgets.add(addAssessmentSection(
              title: "Spoken Language",
              guide: "N = normal speech, E = equivocal, I definite impairment",
              rawScore: "Raw Score: 3/3",
              result: convertResponseToString(
                  radioValueResultToString(scoreModel.spokenLanguage))));

          return widgets;
        },
      ),
    );

    // Save the PDF
    final bytes = await pdf.save();

    // Generate filename with patient name and date
    final String fileName =
        'MICA_${scoreModel.patientName.isNotEmpty ? scoreModel.patientName.replaceAll(" ", "_") : "Report"}_${format.format(scoreModel.assessmentDate).replaceAll(" ", "_")}.pdf';

    // Save the file
    await FileSaver.instance.saveFile(
      name: fileName,
      bytes: Uint8List.fromList(bytes),
      ext: 'pdf',
      mimeType: MimeType.pdf,
    );
  }
}
