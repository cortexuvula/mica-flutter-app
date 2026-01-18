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
import 'package:mica/resources/strings/summary_strings.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/models/mica_score_model.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/services/persistence_service.dart';

// Import refactored components
import 'assessment_color_utils.dart';
import 'assessment_string_utils.dart';
import 'widgets/domain_card_widget.dart';
import 'widgets/domain_report_card.dart';
import 'services/pdf_generation_service.dart';
import 'services/share_service.dart';
import 'widgets/keep_alive_tab_content.dart';

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
              SummaryStrings.title,
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
              tooltip: SummaryStrings.shareSummaryTooltip,
              onPressed: () => _shareReport(scoreModel),
            ),
            IconButton(
              icon: const Icon(Icons.download),
              tooltip: SummaryStrings.downloadPdfTooltip,
              onPressed: () => _downloadPdf(scoreModel),
            ),
            IconButton(
              icon: const Icon(Icons.home),
              tooltip: SummaryStrings.goHomeTooltip,
              onPressed: () => _goHome(scoreModel),
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              const Tab(
                icon: Icon(Icons.score),
                text: SummaryStrings.domainResultsTab,
              ),
              const Tab(
                icon: Icon(Icons.all_inclusive),
                text: SummaryStrings.fullReportTab,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            KeepAliveTabContent(child: _buildDomainReport(scoreModel)),
            KeepAliveTabContent(child: _buildFullReport(scoreModel)),
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
                    '${SummaryStrings.nameLabel}${scoreModel.patientName}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    '${SummaryStrings.handednessLabel}${scoreModel.handedness}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${SummaryStrings.testDateLabel}${_dateFormat.format(scoreModel.assessmentDate)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    '${SummaryStrings.assessorLabel}${scoreModel.assessorName}',
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
                    "${SummaryStrings.nameLabel}${AssessmentStringUtils.formatPatientName(scoreModel.patientName)}"),
                Text("${SummaryStrings.handednessLabel}${scoreModel.handedness}"),
                Text(
                    "${SummaryStrings.dateOfAssessmentLabel}${_dateFormat.format(scoreModel.assessmentDate)}"),
                Text(
                    "${SummaryStrings.assessorLabel}${AssessmentStringUtils.formatAssessorName(scoreModel.assessorName)}"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10.0,
        color: const Color(0xFFF5F5DC),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            SummaryStrings.infoCardText,
            style: const TextStyle(fontSize: 14),
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
          title: SummaryStrings.attentionDomain,
          tasks: [
            TaskRowData(
              taskName: SummaryStrings.taskAttentionVigilance,
              scoringGuide: SummaryStrings.scoreGuideAttention,
              result: scoreModel.attentionMistakes.toString(),
              nei: AssessmentStringUtils.radioValueToString(scoreModel.attention),
            ),
          ],
        ),
        // Language Domain
        DomainReportCard(
          title: SummaryStrings.languageDomain,
          tasks: [
            TaskRowData(
              taskName: SummaryStrings.taskAnomiaNaming,
              scoringGuide: SummaryStrings.scoreGuideAnomia,
              result: SummaryStrings.clinicalResult,
              nei: AssessmentStringUtils.radioValueToString(scoreModel.anomiaAgnosia),
            ),
            TaskRowData(
              taskName: SummaryStrings.taskSpokenLanguage,
              scoringGuide: SummaryStrings.scoreGuideSpokenLanguage,
              result: SummaryStrings.clinicalResult,
              nei: AssessmentStringUtils.radioValueToString(scoreModel.spokenLanguage),
            ),
          ],
        ),
        // Verbal Working Memory Domain
        DomainReportCard(
          title: SummaryStrings.verbalWorkingMemoryDomain,
          tasks: [
            TaskRowData(
              taskName: SummaryStrings.taskWorkingMemoryTrial1,
              scoringGuide: SummaryStrings.scoreGuideTrial1,
              result: scoreModel.trialOneScore.toString(),
              nei: AssessmentStringUtils.trial1ResultToString(scoreModel.trialOneScore),
            ),
          ],
        ),
        // Verbal Short-Term Memory Domain
        DomainReportCard(
          title: SummaryStrings.verbalShortTermMemoryDomain,
          useResultColumn: true,
          tasks: [
            TaskRowData(
              taskName: SummaryStrings.taskShortTermTrial2,
              scoringGuide: SummaryStrings.scoreGuideTrial2,
              result: scoreModel.trialTwoScore.toString(),
              nei: AssessmentStringUtils.trial2ResultToString(scoreModel.trialTwoScore),
            ),
            TaskRowData(
              taskName: SummaryStrings.taskShortTermTrial3,
              scoringGuide: SummaryStrings.scoreGuideTrial3,
              result: scoreModel.trialThreeScore.toString(),
              nei: AssessmentStringUtils.trial3ResultToString(scoreModel.trialThreeScore),
            ),
            TaskRowData(
              taskName: SummaryStrings.taskDelayedRecall,
              scoringGuide: SummaryStrings.scoreGuideDelayedRecall,
              result: scoreModel.tenWordDelay.toString(),
              nei: AssessmentStringUtils.delayRecallResultToString(scoreModel.tenWordDelay),
            ),
            TaskRowData(
              taskName: SummaryStrings.taskRecognitionTotal,
              scoringGuide: SummaryStrings.scoreGuideRecognition,
              result: scoreModel.scoreVerbalRecognitionMemoryTenWords.toString(),
              nei: AssessmentStringUtils.recognitionResultToString(
                  scoreModel.scoreVerbalRecognitionMemoryTenWords),
            ),
            TaskRowData(
              taskName: SummaryStrings.taskOrientation,
              scoringGuide: SummaryStrings.scoreGuideOrientation,
              result: scoreModel.shorttermMemoryVerbalScore.toString(),
              nei: AssessmentStringUtils.orientationResultToString(
                  scoreModel.shorttermMemoryVerbalScore),
            ),
          ],
        ),
        // Visual Short-Term Memory Domain
        DomainReportCard(
          title: SummaryStrings.visualShortTermMemoryDomain,
          useResultColumn: true,
          tasks: [
            TaskRowData(
              taskName: SummaryStrings.taskVisualLineDrawing,
              scoringGuide: SummaryStrings.scoreGuideVisualMemory,
              result: AssessmentStringUtils.calculateVisualMemoryScore(scoreModel, true).toString(),
              nei: AssessmentStringUtils.visualMemoryResultToString(scoreModel),
            ),
          ],
        ),
        // Praxis Domain
        DomainReportCard(
          title: SummaryStrings.praxisDomain,
          tasks: [
            TaskRowData(
              taskName: SummaryStrings.taskPraxisRight,
              scoringGuide: SummaryStrings.scoreGuidePraxis,
              result: SummaryStrings.clinicalResult,
              nei: AssessmentStringUtils.radioValueToString(scoreModel.praxisRight),
            ),
            TaskRowData(
              taskName: SummaryStrings.taskPraxisLeft,
              scoringGuide: SummaryStrings.scoreGuidePraxisAlt,
              result: SummaryStrings.clinicalResult,
              nei: AssessmentStringUtils.radioValueToString(scoreModel.praxisLeft),
            ),
            TaskRowData(
              taskName: SummaryStrings.taskVisuospatialPraxis,
              scoringGuide: SummaryStrings.scoreGuideVisuospatial,
              result: AssessmentStringUtils.calculateVisualMemoryScore(scoreModel, true).toString(),
              nei: AssessmentStringUtils.visualMemoryResultToString(scoreModel),
            ),
          ],
        ),
        // Gnosis Domain
        DomainReportCard(
          title: SummaryStrings.gnosisDomain,
          tasks: [
            TaskRowData(
              taskName: SummaryStrings.taskAgnosiaRecognition,
              scoringGuide: SummaryStrings.scoreGuideAgnosia,
              result: SummaryStrings.clinicalResult,
              nei: AssessmentStringUtils.radioValueToString(scoreModel.agnosia),
            ),
            TaskRowData(
              taskName: SummaryStrings.taskVisuospatialPraxis,
              scoringGuide: SummaryStrings.scoreGuideVisuospatial,
              result: AssessmentStringUtils.calculateVisualMemoryScore(scoreModel, false).toString(),
              nei: AssessmentStringUtils.visualMemoryResultToString(scoreModel),
            ),
          ],
        ),
        // Executive Function Domain
        DomainReportCard(
          title: SummaryStrings.executiveFunctionDomain,
          tasks: [
            TaskRowData(
              taskName: SummaryStrings.taskAnimalNaming,
              scoringGuide: SummaryStrings.scoreGuideAnimalNaming,
              result: scoreModel.executiveAnimalNamingCount.toString(),
              nei: AssessmentStringUtils.radioValueToString(scoreModel.executiveAnimalNaming),
            ),
            TaskRowData(
              taskName: SummaryStrings.taskDesignFluency,
              scoringGuide: SummaryStrings.scoreGuideDesignFluency,
              result: scoreModel.executive.toString(),
              nei: AssessmentStringUtils.radioValueToString(scoreModel.executive),
            ),
            TaskRowData(
              taskName: SummaryStrings.taskLuriaAlternating,
              scoringGuide: SummaryStrings.scoreGuideLuria,
              result: scoreModel.executiveLuriaScore.toString(),
              nei: AssessmentStringUtils.radioValueToString(scoreModel.executiveLuria),
            ),
            TaskRowData(
              taskName: SummaryStrings.taskSerialOrderReversal,
              scoringGuide: SummaryStrings.scoreGuideSerialOrder,
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
      title: SummaryStrings.attentionDomain,
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
      title: SummaryStrings.languageDomain,
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
      title: SummaryStrings.verbalWorkingMemoryDomain,
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
      title: SummaryStrings.verbalShortTermMemoryDomain,
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
      title: SummaryStrings.visualShortTermMemoryDomain,
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
      title: SummaryStrings.praxisDomain,
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
      title: SummaryStrings.gnosisDomain,
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
      title: SummaryStrings.executiveFunctionDomain,
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
                ? SummaryStrings.reportCopiedToClipboard
                : SummaryStrings.shareDialogOpened),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${SummaryStrings.errorSharing}${e.toString()}'),
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
          SnackBar(
            content: Text(SummaryStrings.pdfDownloadedSuccessfully),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${SummaryStrings.errorGeneratingPdf}${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _goHome(MicaScoreModel scoreModel) async {
    // Clear saved progress since assessment is complete
    await PersistenceService.clearProgress();
    scoreModel.resetScores();
    if (mounted) {
      NavigationHelper.navigateAndRemoveUntil(
        context,
        const Welcome(),
        (Route<dynamic> route) => false,
      );
    }
  }
}