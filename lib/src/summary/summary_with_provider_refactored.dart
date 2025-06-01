import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
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
import 'package:mica/src/models/mica_score_model.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/utils/navigation_helper.dart';

// Import refactored components
import 'assessment_color_utils.dart';
import 'assessment_string_utils.dart';
import 'widgets/domain_card_widget.dart';
import 'widgets/domain_report_card.dart';
import 'services/pdf_generation_service.dart';
import 'services/share_service.dart';

/// Refactored Summary page using extracted components
@immutable
class TestSummaryWithProviderRefactored extends StatefulWidget {
  const TestSummaryWithProviderRefactored({super.key});

  @override
  TestSummaryWithProviderRefactoredState createState() =>
      TestSummaryWithProviderRefactoredState();
}

class TestSummaryWithProviderRefactoredState
    extends State<TestSummaryWithProviderRefactored> {
  final DateFormat _dateFormat = DateFormat('d MMM y');

  @override
  Widget build(BuildContext context) {
    final scoreModel = MicaProviders.getScoreModel(context);

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              app_data.summary,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.share),
              tooltip: "Share Summary",
              onPressed: () => _shareReport(scoreModel),
            ),
            IconButton(
              icon: const Icon(Icons.download),
              tooltip: "Download PDF",
              onPressed: () => _downloadPdf(scoreModel),
            ),
            IconButton(
              icon: const Icon(Icons.home),
              tooltip: "Go Home",
              onPressed: () => _goHome(scoreModel),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.score),
                text: "Domain Results",
              ),
              Tab(
                icon: Icon(Icons.all_inclusive),
                text: "Full Report",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _buildDomainReport(scoreModel),
            _buildFullReport(scoreModel),
          ],
        ),
      ),
    );
  }

  Widget _buildDomainReport(MicaScoreModel scoreModel) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildPatientInfoCard(scoreModel),
          _buildAttentionCard(scoreModel),
          _buildLanguageCard(scoreModel),
          _buildVerbalWorkingMemoryCard(scoreModel),
          _buildVerbalShortTermMemoryCard(scoreModel),
          _buildVisualShortTermMemoryCard(scoreModel),
          _buildPraxisCard(scoreModel),
          _buildGnosisCard(scoreModel),
          _buildExecutiveFunctionCard(scoreModel),
        ],
      ),
    );
  }

  Widget _buildFullReport(MicaScoreModel scoreModel) {
    final width = MediaQuery.of(context).size.width;
    return ListView(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10.0),
            _buildPatientInfoSection(scoreModel, width),
            _buildInfoCard(),
            _buildDomainSections(scoreModel),
          ],
        ),
      ],
    );
  }

  Widget _buildPatientInfoCard(MicaScoreModel scoreModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
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
                    'Test Date: ${_dateFormat.format(scoreModel.assessmentDate)}',
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
      ),
    );
  }

  Widget _buildPatientInfoSection(MicaScoreModel scoreModel, double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width,
        child: Card(
          elevation: 10.0,
          color: const Color(0xFFF5F5DC),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    "Name: ${AssessmentStringUtils.formatPatientName(scoreModel.patientName)}"),
                Text("Handedness: ${scoreModel.handedness}"),
                Text(
                    "Date of Assessment: ${_dateFormat.format(scoreModel.assessmentDate)}"),
                Text(
                    "Assessor: ${AssessmentStringUtils.formatAssessorName(scoreModel.assessorName)}"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        elevation: 10.0,
        color: Color(0xFFF5F5DC),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Some tasks have a numerical raw score. Other tasks provide an estimate based on clinical judgement which is indicated by the word "Clinical" in the table below.',
            style: TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }

  Widget _buildDomainSections(MicaScoreModel scoreModel) {
    return Column(
      children: [
        // Attention & Concentration Domain
        DomainReportCard(
          title: 'Attention & Concentration',
          tasks: [
            TaskRowData(
              taskName: 'Attention: Vigilance Test',
              scoringGuide: 'N = no mistakes, E = one mistake and I = > 1 mistake',
              result: scoreModel.attentionMistakes.toString(),
              nei: AssessmentStringUtils.radioValueToString(scoreModel.attention),
            ),
          ],
        ),
        // Language Domain
        DomainReportCard(
          title: 'Language',
          tasks: [
            TaskRowData(
              taskName: 'Anomia: Naming Pictures',
              scoringGuide: 'N = all correct, E = 1 error, I >1 error',
              result: 'Clinical',
              nei: AssessmentStringUtils.radioValueToString(scoreModel.anomiaAgnosia),
            ),
            TaskRowData(
              taskName: 'Spoken Language',
              scoringGuide: 'N = Normal speech, E = Equivocal, I = definite impairment',
              result: 'Clinical',
              nei: AssessmentStringUtils.radioValueToString(scoreModel.spokenLanguage),
            ),
          ],
        ),
        // Verbal Working Memory Domain
        DomainReportCard(
          title: 'Verbal Working Memory',
          tasks: [
            TaskRowData(
              taskName: 'Working Memory Verbal Trial 1: 10 Word Recall',
              scoringGuide: 'N > 6, E = 5-6, I < 5',
              result: scoreModel.trialOneScore.toString(),
              nei: AssessmentStringUtils.trial1ResultToString(scoreModel.trialOneScore),
            ),
          ],
        ),
        // Verbal Short-Term Memory Domain
        DomainReportCard(
          title: 'Verbal Short-Term Memory',
          useResultColumn: true,
          tasks: [
            TaskRowData(
              taskName: 'Short-term Memory Verbal Trial 2: 10 Word Recall',
              scoringGuide: 'N > 6, E = 5-6, I < 5',
              result: scoreModel.trialTwoScore.toString(),
              nei: AssessmentStringUtils.trial2ResultToString(scoreModel.trialTwoScore),
            ),
            TaskRowData(
              taskName: 'Short-term Memory Verbal Trial 3: 10 Word Recall',
              scoringGuide: 'N > 7, E = 5-7, I < 5',
              result: scoreModel.trialThreeScore.toString(),
              nei: AssessmentStringUtils.trial3ResultToString(scoreModel.trialThreeScore),
            ),
            TaskRowData(
              taskName: 'Short-Term Memory Verbal: Delayed Recall Of 10 Words',
              scoringGuide: 'N >5, E = 5, I < 5',
              result: scoreModel.tenWordDelay.toString(),
              nei: AssessmentStringUtils.delayRecallResultToString(scoreModel.tenWordDelay),
            ),
            TaskRowData(
              taskName: 'Short-Term Memory Verbal Recognition: Total Score',
              scoringGuide: 'N > 16, E = 14 - 16, I < 14',
              result: scoreModel.scoreVerbalRecognitionMemoryTenWords.toString(),
              nei: AssessmentStringUtils.recognitionResultToString(
                  scoreModel.scoreVerbalRecognitionMemoryTenWords),
            ),
            TaskRowData(
              taskName: 'Short-Term Memory Verbal Recall: Orientation',
              scoringGuide: 'N = 5, E = 4, I < 4',
              result: scoreModel.shorttermMemoryVerbalScore.toString(),
              nei: AssessmentStringUtils.orientationResultToString(
                  scoreModel.shorttermMemoryVerbalScore),
            ),
          ],
        ),
        // Visual Short-Term Memory Domain
        DomainReportCard(
          title: 'Visual Short-Term Memory',
          useResultColumn: true,
          tasks: [
            TaskRowData(
              taskName: 'Short-term Memory Visual: Line Drawing Recall',
              scoringGuide: 'N >5, E = 5, I < 5',
              result: AssessmentStringUtils.calculateVisualMemoryScore(scoreModel, true).toString(),
              nei: AssessmentStringUtils.visualMemoryResultToString(scoreModel),
            ),
          ],
        ),
        // Praxis Domain
        DomainReportCard(
          title: 'Praxis',
          tasks: [
            TaskRowData(
              taskName: 'Praxis: Finger-hand Dexterity: Right',
              scoringGuide: 'N = No errors, E = Some difficulty, I = Clear difficulty',
              result: 'Clinical',
              nei: AssessmentStringUtils.radioValueToString(scoreModel.praxisRight),
            ),
            TaskRowData(
              taskName: 'Praxis: Finger-hand Dexterity: Left',
              scoringGuide: 'N = no errors, E = some difficulty, I = Clear difficulty',
              result: 'Clinical',
              nei: AssessmentStringUtils.radioValueToString(scoreModel.praxisLeft),
            ),
            TaskRowData(
              taskName: 'Visuospatial & Praxis: Line Drawing Copy',
              scoringGuide: 'N > 6, E = 6, I < 6',
              result: AssessmentStringUtils.calculateVisualMemoryScore(scoreModel, true).toString(),
              nei: AssessmentStringUtils.visualMemoryResultToString(scoreModel),
            ),
          ],
        ),
        // Gnosis Domain
        DomainReportCard(
          title: 'Gnosis',
          tasks: [
            TaskRowData(
              taskName: 'Agnosia: Recognition of Pictures',
              scoringGuide: 'N = all correct, E = 1 error, I >1 error',
              result: 'Clinical',
              nei: AssessmentStringUtils.radioValueToString(scoreModel.agnosia),
            ),
            TaskRowData(
              taskName: 'Visuospatial & Praxis: Line Drawing Copy',
              scoringGuide: 'N > 6, E = 6, I < 6',
              result: AssessmentStringUtils.calculateVisualMemoryScore(scoreModel, false).toString(),
              nei: AssessmentStringUtils.visualMemoryResultToString(scoreModel),
            ),
          ],
        ),
        // Executive Function Domain
        DomainReportCard(
          title: 'Executive Function',
          tasks: [
            TaskRowData(
              taskName: 'Executive: Animal Naming Task',
              scoringGuide: '>14 = N, 12-14 = E, <12 =I',
              result: scoreModel.executiveAnimalNamingCount.toString(),
              nei: AssessmentStringUtils.radioValueToString(scoreModel.executiveAnimalNaming),
            ),
            TaskRowData(
              taskName: 'Executive: Design Fluency',
              scoringGuide: 'N > 7 drawings, E = 5-7 drawings, I< 5 drawings',
              result: scoreModel.executive.toString(),
              nei: AssessmentStringUtils.radioValueToString(scoreModel.executive),
            ),
            TaskRowData(
              taskName: 'Executive: Luria Alternating Hand Movements',
              scoringGuide: 'N = 3 cycles without mistakes, E = able to do 1-2 cycles, I = unable to complete task',
              result: scoreModel.executiveLuriaScore.toString(),
              nei: AssessmentStringUtils.radioValueToString(scoreModel.executiveLuria),
            ),
            TaskRowData(
              taskName: 'Executive: Serial Order Reversal Task',
              scoringGuide: 'N = no errors, E = 1 error, I > 1 error',
              result: scoreModel.executiveSerialScore.toString(),
              nei: AssessmentStringUtils.radioValueToString(scoreModel.executiveSerial),
            ),
          ],
        ),
      ],
    );
  }

  // Domain card builders using the new widgets
  Widget _buildAttentionCard(MicaScoreModel scoreModel) {
    return DomainCardWidget(
      title: "Attention & Concentration",
      cardColor: AssessmentColorUtils.attentionColor(scoreModel.attention),
      statusIndicators: [
        StatusIndicator(
          color: AssessmentColorUtils.radioValueToColor(scoreModel.attention),
        ),
      ],
      onTap: () {
        NavigationHelper.navigateAndRemoveUntil(
          context,
          const AttentionConcentration(),
          (Route<dynamic> route) => true,
        );
      },
    );
  }

  Widget _buildLanguageCard(MicaScoreModel scoreModel) {
    return DomainCardWidget(
      title: "Language",
      cardColor: AssessmentColorUtils.languageDomainColor(
        scoreModel.spokenLanguage,
        scoreModel.executiveAnimalNaming,
      ),
      statusIndicators: [
        StatusIndicator(
          color: AssessmentColorUtils.radioValueToColor(scoreModel.spokenLanguage),
        ),
        StatusIndicator(
          color: AssessmentColorUtils.radioValueToColor(scoreModel.executive),
        ),
      ],
      onTap: () {
        NavigationHelper.navigateAndRemoveUntil(
          context,
          Language(
            spokenLanguage: scoreModel.spokenLanguage,
            comprehension: scoreModel.languageComprehensionRadioValue,
            drawLine: scoreModel.executive,
          ),
          (Route<dynamic> route) => true,
        );
      },
    );
  }

  Widget _buildVerbalWorkingMemoryCard(MicaScoreModel scoreModel) {
    return DomainCardWidget(
      title: "Verbal Working Memory",
      cardColor: AssessmentColorUtils.trial1Color(scoreModel.trialOneScore),
      statusIndicators: [
        StatusIndicator(
          color: AssessmentColorUtils.trial1Color(scoreModel.trialOneScore),
        ),
      ],
      onTap: () {
        NavigationHelper.navigateAndRemoveUntil(
          context,
          VerbalWorkingMemory(trialOneScore: scoreModel.trialOneScore),
          (Route<dynamic> route) => true,
        );
      },
    );
  }

  Widget _buildVerbalShortTermMemoryCard(MicaScoreModel scoreModel) {
    return DomainCardWidget(
      title: "Verbal Short-Term Memory",
      cardColor: AssessmentColorUtils.verbalShortTermMemoryColor(
        scoreModel.trialTwoScore,
        scoreModel.trialThreeScore,
        scoreModel.shorttermMemoryVerbal,
        scoreModel.tenWordDelay,
        scoreModel.scoreVerbalRecognitionMemoryTenWords,
      ),
      statusIndicators: [
        StatusIndicator(
          color: AssessmentColorUtils.trial2Color(scoreModel.trialTwoScore),
        ),
        StatusIndicator(
          color: AssessmentColorUtils.trial3Color(scoreModel.trialThreeScore),
        ),
        StatusIndicator(
          color: AssessmentColorUtils.radioValueToColor(
              scoreModel.shorttermMemoryVerbal),
        ),
        StatusIndicator(
          color: AssessmentColorUtils.delayRecallColor(scoreModel.tenWordDelay),
        ),
        StatusIndicator(
          color: AssessmentColorUtils.delayRecallColor(
              scoreModel.scoreVerbalRecognitionMemoryTenWords),
        ),
      ],
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
          (Route<dynamic> route) => true,
        );
      },
    );
  }

  Widget _buildVisualShortTermMemoryCard(MicaScoreModel scoreModel) {
    return DomainCardWidget(
      title: "Visual Short-Term Memory",
      cardColor: AssessmentColorUtils.visualMemoryColor(scoreModel),
      statusIndicators: [
        StatusIndicator(
          color: AssessmentColorUtils.visualMemoryColor(scoreModel),
        ),
      ],
      onTap: () {
        NavigationHelper.navigateAndRemoveUntil(
          context,
          VisualShortTermMemory(
            shorttermMemoryVisualImage1: scoreModel.shorttermMemoryVisualImage1,
            shorttermMemoryVisualImage2: scoreModel.shorttermMemoryVisualImage2,
            shorttermMemoryVisualImage3: scoreModel.shorttermMemoryVisualImage3,
          ),
          (Route<dynamic> route) => true,
        );
      },
    );
  }

  Widget _buildPraxisCard(MicaScoreModel scoreModel) {
    return DomainCardWidget(
      title: "Praxis",
      cardColor: AssessmentColorUtils.praxisDomainColor(scoreModel),
      statusIndicators: [
        StatusIndicator(
          color: AssessmentColorUtils.radioValueToColor(scoreModel.praxisRight),
        ),
        StatusIndicator(
          color: AssessmentColorUtils.radioValueToColor(scoreModel.praxisLeft),
        ),
      ],
      onTap: () {
        NavigationHelper.navigateAndRemoveUntil(
          context,
          Praxis(
            praxisRight: scoreModel.praxisRight,
            praxisLeft: scoreModel.praxisLeft,
            visuospatialPraxisImage1: scoreModel.visuospatialPraxisImage1,
            visuospatialPraxisImage2: scoreModel.visuospatialPraxisImage2,
            visuospatialPraxisImage3: scoreModel.visuospatialPraxisImage3,
          ),
          (Route<dynamic> route) => true,
        );
      },
    );
  }

  Widget _buildGnosisCard(MicaScoreModel scoreModel) {
    return DomainCardWidget(
      title: "Gnosis",
      cardColor: AssessmentColorUtils.gnosisDomainColor(scoreModel),
      statusIndicators: [
        StatusIndicator(
          color: AssessmentColorUtils.radioValueToColor(scoreModel.anomiaAgnosia),
        ),
      ],
      onTap: () {
        NavigationHelper.navigateAndRemoveUntil(
          context,
          Gnosis(
            visuospatialPraxisImage1: scoreModel.visuospatialPraxisImage1,
            visuospatialPraxisImage2: scoreModel.visuospatialPraxisImage2,
            visuospatialPraxisImage3: scoreModel.visuospatialPraxisImage3,
            anomiaAgnosia: scoreModel.anomiaAgnosia,
          ),
          (Route<dynamic> route) => true,
        );
      },
    );
  }

  Widget _buildExecutiveFunctionCard(MicaScoreModel scoreModel) {
    return DomainCardWidget(
      title: "Executive Function",
      cardColor: AssessmentColorUtils.executiveFunctionColor(scoreModel.executive),
      statusIndicators: [
        StatusIndicator(
          color: AssessmentColorUtils.radioValueToColor(
              scoreModel.executiveAnimalNaming),
        ),
        StatusIndicator(
          color: AssessmentColorUtils.radioValueToColor(scoreModel.executiveLuria),
        ),
        StatusIndicator(
          color: AssessmentColorUtils.radioValueToColor(scoreModel.executiveSerial),
        ),
      ],
      onTap: () {
        NavigationHelper.navigateAndRemoveUntil(
          context,
          ExecutiveFunctions(
            executiveAnimalNaming: scoreModel.executiveAnimalNaming,
          ),
          (Route<dynamic> route) => true,
        );
      },
    );
  }

  // Action handlers
  Future<void> _shareReport(MicaScoreModel scoreModel) async {
    try {
      await ShareService.shareReport(scoreModel);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(kIsWeb 
                ? 'Report copied to clipboard!' 
                : 'Share dialog opened'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error sharing: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _downloadPdf(MicaScoreModel scoreModel) async {
    try {
      await PdfGenerationService.generateAndDownloadPdf(scoreModel);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('PDF downloaded successfully'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error generating PDF: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _goHome(MicaScoreModel scoreModel) {
    scoreModel.resetScores();
    NavigationHelper.navigateAndRemoveUntil(
      context,
      const Welcome(),
      (Route<dynamic> route) => false,
    );
  }
}