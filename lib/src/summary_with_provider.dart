import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mica/src/domain_results/attention_concentration.dart';
import 'package:mica/src/domain_results/executive_functions.dart';
import 'package:mica/src/domain_results/language.dart';
import 'package:mica/src/domain_results/gnosis.dart';
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
import 'dart:typed_data';
import 'package:mica/src/models/mica_score_model.dart';
import 'package:mica/src/providers/mica_provider.dart';

@immutable
class TestSummaryWithProvider extends StatefulWidget {
  // No parameters needed as we'll get everything from the provider
  const TestSummaryWithProvider({super.key});

  @override
  _TestSummaryWithProviderState createState() => _TestSummaryWithProviderState();
}

class _TestSummaryWithProviderState extends State<TestSummaryWithProvider> {
  var format = DateFormat('d MMM y');

  @override
  Widget build(BuildContext context) {
    // Get the score model from the provider
    final scoreModel = MicaProviders.getScoreModel(context);
    
    // Now we can access all the properties directly from the score model
    // instead of accessing widget.property
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Summary'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String result) {
              switch (result) {
                case 'Share':
                  Share.share(shareDoc(scoreModel));
                  break;
                case 'Download PDF':
                  generateAndDownloadPdf(scoreModel);
                  break;
                case 'Back to Start':
                  // Reset scores when going back to start
                  scoreModel.resetScores();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Welcome()),
                    (Route<dynamic> route) => false,
                  );
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Share',
                child: Text('Share'),
              ),
              const PopupMenuItem<String>(
                value: 'Download PDF',
                child: Text('Download PDF'),
              ),
              const PopupMenuItem<String>(
                value: 'Back to Start',
                child: Text('Back to Start'),
              ),
            ],
          )
        ],
      ),
      body: domainReport(scoreModel),
    );
  }

  // Example method using provider
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
          verbalShortTermMemoryCard(scoreModel),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: attentionCardColor(scoreModel.attention),
        child: ListTile(
          title: const Text('Attention & Concentration'),
          subtitle: Text(
            'Score: ${radioValueResultToString(scoreModel.attention)}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AttentionConcentration(),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget languageCard(MicaScoreModel scoreModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: languageCardColor(
          scoreModel.spokenLanguage,
          scoreModel.languageComprehensionRadioValue,
          scoreModel.executiveAnimalNaming,
        ),
        child: ListTile(
          title: const Text('Language'),
          subtitle: const Text(
            'Impaired/Equivocal/Normal',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Language(
                  spokenLanguage: scoreModel.spokenLanguage,
                  comprehension: scoreModel.languageComprehensionRadioValue,
                  drawLine: scoreModel.executiveAnimalNaming,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget verbalWorkingMemoryCard(MicaScoreModel scoreModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: verbalWorkingMemoryCardColor(scoreModel.trialOneScore),
        child: ListTile(
          title: const Text('Working Memory Verbal'),
          subtitle: Text(
            'Score: ${valueTrial12ResultToString(scoreModel.trialOneScore)}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VerbalWorkingMemory(
                  trialOneScore: scoreModel.trialOneScore,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget verbalShortTermMemoryCard(MicaScoreModel scoreModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: verbalShortTermMemory(
          scoreModel.trialTwoScore,
          scoreModel.trialThreeScore,
          scoreModel.shorttermMemoryVerbal,
          scoreModel.tenWordDelay,
          scoreModel.scoreVerbalRecognitionMemoryTenWordsInList,
        ),
        child: ListTile(
          title: const Text('Short-Term Memory Verbal'),
          subtitle: const Text(
            'Impaired/Equivocal/Normal',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VerbalShortTermMemory(
                  trialTwoScore: scoreModel.trialTwoScore,
                  trialThreeScore: scoreModel.trialThreeScore,
                  orientation: scoreModel.shorttermMemoryVerbal,
                  tenWordDelay: scoreModel.tenWordDelay,
                  scoreVerbalRecognitionMemoryTenWords: scoreModel.scoreVerbalRecognitionMemoryTenWords,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget visualShortTermMemoryCard(MicaScoreModel scoreModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: visualShortTermMemoryCardColor(),
        child: ListTile(
          title: const Text('Short-Term Memory Visual'),
          subtitle: const Text(
            'Impaired/Equivocal/Normal',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VisualShortTermMemory(
                  shorttermMemoryVisualImage1: scoreModel.shorttermMemoryVisualImage1,
                  shorttermMemoryVisualImage2: scoreModel.shorttermMemoryVisualImage2,
                  shorttermMemoryVisualImage3: scoreModel.shorttermMemoryVisualImage3,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget praxisCard(MicaScoreModel scoreModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: praxisCardColor(scoreModel),
        child: ListTile(
          title: const Text('Praxis'),
          subtitle: const Text(
            'Impaired/Equivocal/Normal',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Praxis(
                  praxisRight: scoreModel.praxisRight,
                  praxisLeft: scoreModel.praxisLeft,
                  visuospatialPraxisImage1: scoreModel.visuospatialPraxisImage1,
                  visuospatialPraxisImage2: scoreModel.visuospatialPraxisImage2,
                  visuospatialPraxisImage3: scoreModel.visuospatialPraxisImage3,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget gnosisCard(MicaScoreModel scoreModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: gnosisCardColor(scoreModel),
        child: ListTile(
          title: const Text('Gnosis'),
          subtitle: const Text(
            'Impaired/Equivocal/Normal',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Gnosis(
                  visuospatialPraxisImage1: scoreModel.visuospatialPraxisImage1,
                  visuospatialPraxisImage2: scoreModel.visuospatialPraxisImage2,
                  visuospatialPraxisImage3: scoreModel.visuospatialPraxisImage3,
                  anomiaAgnosia: scoreModel.anomiaAgnosia,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget executiveFunctionCard(MicaScoreModel scoreModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: executiveFunctionCarcColor(scoreModel.executive),
        child: ListTile(
          title: const Text('Executive Function'),
          subtitle: Text(
            'Score: ${radioValueResultToString(scoreModel.executive)}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExecutiveFunctions(
                  executiveAnimalNaming: scoreModel.executiveAnimalNaming,
                ),
              ),
            );
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

  Color verbalShortTermMemory(
    int valuetrialTwoScore,
    int valuetrialThreeScore,
    int valueshorttermMemoryVerbal,
    int valuetenWordDelay,
    int valuescoreVerbalRecognitionMemoryTenWords,
  ) {
    if (valuetrialTwoScore < 5 ||
        valuetrialThreeScore < 5 ||
        valueshorttermMemoryVerbal < 4 ||
        valuetenWordDelay < 5 ||
        valuescoreVerbalRecognitionMemoryTenWords < 5) {
      return Colors.red;
    } else if (valuetrialTwoScore == 5 ||
        valuetrialTwoScore == 6 ||
        valuetrialThreeScore == 5 ||
        valuetrialThreeScore == 6 ||
        valuetrialThreeScore == 7 ||
        valueshorttermMemoryVerbal == 4 ||
        valuetenWordDelay == 5 ||
        valuescoreVerbalRecognitionMemoryTenWords == 5) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  Color visualShortTermMemoryCardColor() {
    // In a real implementation, this would use scoreModel data
    return Colors.green; // Placeholder
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

  // Example of the share document method using provider
  String shareDoc(MicaScoreModel scoreModel) {
    String shareDoc = "Disclaimer: ${app_data.disclaimer2} \n\n";

    shareDoc += "Name: ${scoreModel.patientName.isNotEmpty ? scoreModel.patientName[0].toUpperCase() + scoreModel.patientName.substring(1) : ''}\n\n";

    shareDoc += "Handedness: ${scoreModel.handedness}\n";
    shareDoc += "Test Date: ${format.format(scoreModel.assessmentDate)}\n";
    shareDoc += "Assessor: ${scoreModel.assessorName.isNotEmpty ? scoreModel.assessorName[0].toUpperCase() + scoreModel.assessorName.substring(1) : ''}\n\n";

    shareDoc += "Results: \n\n";

    shareDoc += "${app_data.disclaimer3}\n\n";

    shareDoc += "Language Comprehension: 3 Stage Command\nRaw score: ${3 - scoreModel.languageComprehensionRadioValue}/3\n${convertResponseToString(radioValueResultToString(scoreModel.languageComprehensionRadioValue))}\n\n";

    shareDoc += "Working Memory VerbalTrial 1: Ten Word Recall\nN > 6, E = 5 - 6, I < 5\nRaw score: ${scoreModel.trialOneScore}/10\n${convertResponseToString(valueTrial12ResultToString(scoreModel.trialOneScore))}\n\n";

    shareDoc += "Short-term Memory Verbal Trial 2: Ten Word Recall\nN > 6, E = 5 - 6, I < 5\nRaw score: ${scoreModel.trialTwoScore}/10\n${convertResponseToString(valueTrial12ResultToString(scoreModel.trialTwoScore))}\n\n";

    // Add more report content here as needed

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

  // Example of the PDF generation method using provider
  Future<void> generateAndDownloadPdf(MicaScoreModel scoreModel) async {
    // Create a PDF document
    final pdf = pw.Document();
    
    // Add content to the PDF
    final docContent = shareDoc(scoreModel);
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
              child: pw.Text('${app_data.appName} Assessment Report', 
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
            }
          }
          
          return widgets;
        },
      ),
    );
    
    // Save the PDF
    final bytes = await pdf.save();
    
    // Generate filename with patient name and date
    final String fileName = 'MICA_${scoreModel.patientName.isNotEmpty ? scoreModel.patientName.replaceAll(" ", "_") : "Report"}_${format.format(scoreModel.assessmentDate).replaceAll(" ", "_")}.pdf';
    
    // Save the file
    await FileSaver.instance.saveFile(
      name: fileName,
      bytes: Uint8List.fromList(bytes),
      ext: 'pdf',
      mimeType: MimeType.pdf,
    );
  }
}
