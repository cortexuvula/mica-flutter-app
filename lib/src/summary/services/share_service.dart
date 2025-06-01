import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:mica/src/models/mica_score_model.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import '../assessment_string_utils.dart';

/// Service for sharing assessment reports
class ShareService {
  static final DateFormat _dateFormat = DateFormat('d MMM y');

  /// Share the assessment report
  static Future<ShareResult?> shareReport(MicaScoreModel scoreModel) async {
    final String shareContent = generateShareContent(scoreModel);

    if (shareContent.isEmpty) {
      throw Exception('No content to share - please complete assessment first');
    }

    if (kIsWeb) {
      // Web platform: Copy to clipboard as fallback
      await Clipboard.setData(ClipboardData(text: shareContent));
      return null; // Web doesn't return ShareResult
    } else {
      // Mobile platforms: Use native share
      return await Share.share(
        shareContent,
        subject: 'MICA Assessment Report - ${scoreModel.patientName}',
      );
    }
  }

  /// Generate the text content for sharing
  static String generateShareContent(MicaScoreModel scoreModel) {
    String shareDoc = "MICA Assessment Report\n";
    shareDoc += "_________________________________________________________\n\n";

    shareDoc += "Disclaimer: ${app_data.disclaimer2} \n\n";

    shareDoc += "Name: ${AssessmentStringUtils.formatPatientName(scoreModel.patientName)}\n\n";
    shareDoc += "Handedness: ${scoreModel.handedness}\n\n";
    shareDoc += "Test Date: ${_dateFormat.format(scoreModel.assessmentDate)}\n\n";
    shareDoc += "Assessor: ${AssessmentStringUtils.formatAssessorName(scoreModel.assessorName)}\n\n";

    shareDoc += "Results:\n\n";

    shareDoc += "The following abbreviations are used:\n\n";
    shareDoc += "  N = Normal, E = Equivocal, I = Impaired\n\n";
    shareDoc += "Cut scores are estimates only.\n\n";

    // Working Memory Verbal Trial 1
    shareDoc += "Working Memory VerbalTrial 1: Ten Word Recall\n\n";
    shareDoc += "N > 5, E = 4-5, I < 4\n\n";
    shareDoc += "  Raw score: ${scoreModel.trialOneScore}/10\n";
    shareDoc +=
        "  ${AssessmentStringUtils.resultToFullName(AssessmentStringUtils.trial1ResultToString(scoreModel.trialOneScore))}\n\n";

    // Short-term Memory Verbal Trial 2
    shareDoc += "Short-term Memory Verbal Trial 2: Ten Word Recall\n\n";
    shareDoc += "N > 6, E = 5 - 6, I < 5\n\n";
    shareDoc += "  Raw score: ${scoreModel.trialTwoScore}/10\n";
    shareDoc +=
        "  ${AssessmentStringUtils.resultToFullName(AssessmentStringUtils.trial2ResultToString(scoreModel.trialTwoScore))}\n\n";

    // Short-term Memory Verbal Trial 3
    shareDoc += "Short-term Memory Verbal Trial 3: Ten Word Recall\n\n";
    shareDoc += "N > 7, E = 6-7, I < 6\n\n";
    shareDoc += "  Raw score: ${scoreModel.trialThreeScore}/10\n";
    shareDoc +=
        "  ${AssessmentStringUtils.resultToFullName(AssessmentStringUtils.trial3ResultToString(scoreModel.trialThreeScore))}\n\n";

    // Visuospatial & Praxis: Line Drawing Copy
    shareDoc += "Visuospatial & Praxis: Line Drawing Copy\n\n";
    shareDoc += "N > 7, E = 7, I < 7\n\n";
    shareDoc +=
        "  Raw score: ${(scoreModel.visuospatialPraxisImage1 + scoreModel.visuospatialPraxisImage2 + scoreModel.visuospatialPraxisImage3)}/9\n";
    shareDoc +=
        "  ${AssessmentStringUtils.resultToFullName(AssessmentStringUtils.visualMemoryResultToString(scoreModel))}\n\n";

    // Attention: Vigilance Test
    shareDoc += "Attention: Vigilance Test\n\n";
    shareDoc += "N = no mistakes, E = one mistake and I = > 1 mistake\n\n";
    shareDoc += "  Raw score: ${scoreModel.attentionCorrect} Correct Taps\n";
    shareDoc += "  Raw score: ${scoreModel.attentionMistakes} Incorrect Taps\n";
    shareDoc +=
        "  ${AssessmentStringUtils.resultToFullName(AssessmentStringUtils.radioValueToString(scoreModel.attention))}\n\n";

    // Executive: Animal Naming Task
    shareDoc += "Executive: Animal Naming Task\n\n";
    shareDoc += ">14 = N, 12 - 14 = E, < 12 = I\n\n";
    shareDoc += "  Raw score: ${scoreModel.executiveAnimalNamingCount} Animals Named\n";
    shareDoc +=
        "  ${AssessmentStringUtils.resultToFullName(AssessmentStringUtils.radioValueToString(scoreModel.executiveAnimalNaming))}\n\n";

    // Executive: Luria Alternating Hand Movements
    shareDoc += "Executive: Luria Alternating Hand Movements\n\n";
    shareDoc += "N = 3 cycles without mistakes; E = able to do 1 - 2 cycles; I = unable to complete task\n\n";
    shareDoc += "  Raw score: ${scoreModel.executiveLuriaScore} Hand Movements\n";
    shareDoc +=
        "  ${AssessmentStringUtils.resultToFullName(AssessmentStringUtils.radioValueToString(scoreModel.executiveLuria))}\n\n";

    // Executive: Serial Order Reversal Task
    shareDoc += "Executive: Serial Order Reversal Task\n\n";
    shareDoc += "N = no errors; E = 1 error; I >1 error\n\n";
    shareDoc += "  Raw score: ${scoreModel.executiveSerialScore}/6\n";
    shareDoc +=
        "  ${AssessmentStringUtils.resultToFullName(AssessmentStringUtils.radioValueToString(scoreModel.executiveSerial))}\n\n";

    // Short-Term Memory Verbal Recall: Orientation
    shareDoc += "Short-Term Memory Verbal Recall: Orientation\n\n";
    shareDoc += "N = 5, E = 4, I < 4\n\n";
    shareDoc += "  Raw score: ${scoreModel.shorttermMemoryVerbalScore}/6\n";
    shareDoc +=
        "  ${AssessmentStringUtils.resultToFullName(AssessmentStringUtils.radioValueToString(scoreModel.shorttermMemoryVerbal))}\n\n";

    // Praxis: Finger-hand Dexterity: Right
    shareDoc += "Praxis: Finger-hand Dexterity: Right\n\n";
    shareDoc += "N = no errors, E = some difficulty, I = clear difficulty\n\n";
    shareDoc += "  Raw score: ${scoreModel.praxisRight}/3\n";
    shareDoc +=
        "  ${AssessmentStringUtils.resultToFullName(AssessmentStringUtils.radioValueToString(scoreModel.praxisRight))}\n\n";

    // Praxis: Finger-hand Dexterity: Left
    shareDoc += "Praxis: Finger-hand Dexterity: Left\n\n";
    shareDoc += "N = no errors, E = some difficulty, I = clear difficulty\n\n";
    shareDoc += "  Raw score: ${scoreModel.praxisLeft}/3\n";
    shareDoc +=
        "  ${AssessmentStringUtils.resultToFullName(AssessmentStringUtils.radioValueToString(scoreModel.praxisLeft))}\n\n";

    // Short-Term Memory Verbal: Delayed Recall Of 10 Words
    shareDoc += "Short-Term Memory Verbal: Delayed Recall Of 10 Words\n\n";
    shareDoc += "N > 5, E = 5, I < 5\n\n";
    shareDoc += "  Raw score: ${scoreModel.tenWordDelay}/10\n";
    shareDoc +=
        "  ${AssessmentStringUtils.resultToFullName(AssessmentStringUtils.delayRecallResultToString(scoreModel.tenWordDelay))}\n\n";

    // Short-Term Memory Verbal Recognition: Total Score
    shareDoc += "Short-Term Memory Verbal Recognition: Total Score\n\n";
    shareDoc += "N > 16, E = 14-16, I < 14\n\n";
    shareDoc += "  Raw score: Words correctly identified in original word list: ${scoreModel.scoreVerbalRecognitionMemoryTenWordsInList}/10\n";
    shareDoc += "  Raw score: Words correctly identified NOT in original word list: ${scoreModel.scoreVerbalRecognitionMemoryTenWordsNotInList}/10\n";
    shareDoc += "  Raw score: Words identified: ${scoreModel.scoreVerbalRecognitionMemoryTenWords}/20\n";
    shareDoc +=
        "  ${AssessmentStringUtils.resultToFullName(AssessmentStringUtils.recognitionResultToString(scoreModel.scoreVerbalRecognitionMemoryTenWords))}\n\n";

    // Short-Term Memory Visual: Line Drawing Recall
    shareDoc += "Short-Term Memory Visual: Line Drawing Recall\n\n";
    shareDoc += "N > 5, E = 5, I < 5\n\n";
    shareDoc += "  Raw score: ${(scoreModel.shorttermMemoryVisualImage1 + scoreModel.shorttermMemoryVisualImage2 + scoreModel.shorttermMemoryVisualImage3)}/9\n";
    shareDoc +=
        "  ${AssessmentStringUtils.resultToFullName(AssessmentStringUtils.visualMemoryResultToString(scoreModel))}\n\n";

    // Anomia: Naming Line Drawings
    shareDoc += "Anomia: Naming Line Drawings\n\n";
    shareDoc += "N = all correct, E = 1 error, I > 1 error\n\n";
    shareDoc += "  Raw Score: ${scoreModel.anomiaAgnosia}/3\n";
    shareDoc +=
        "  ${AssessmentStringUtils.resultToFullName(AssessmentStringUtils.radioValueToString(scoreModel.anomiaAgnosia))}\n\n";

    // Agnosia: Recognition of Line Drawings
    shareDoc += "Agnosia: Recognition of Line Drawings\n\n";
    shareDoc += "N = all correct, E = 1 error, I > 1 error\n\n";
    shareDoc += "  Raw Score: ${scoreModel.agnosia}/3\n";
    shareDoc +=
        "  ${AssessmentStringUtils.resultToFullName(AssessmentStringUtils.radioValueToString(scoreModel.agnosia))}\n\n";

    // Executive: Design Fluency
    shareDoc += "Executive: Design Fluency\n\n";
    shareDoc += "N > 7 drawings, E = 5 - 7 drawings, I < 5 drawings\n\n";
    shareDoc += "  Raw Score: ${scoreModel.executive}/3\n";
    shareDoc +=
        "  ${AssessmentStringUtils.resultToFullName(AssessmentStringUtils.radioValueToString(scoreModel.executive))}\n\n";

    // Spoken Language
    shareDoc += "Spoken Language\n\n";
    shareDoc += "N = normal speech, E = equivocal, I definite impairment\n\n";
    shareDoc += "  Raw Score: ${scoreModel.spokenLanguage}/3\n";
    shareDoc +=
        "  ${AssessmentStringUtils.resultToFullName(AssessmentStringUtils.radioValueToString(scoreModel.spokenLanguage))}\n\n";

    return shareDoc;
  }
}