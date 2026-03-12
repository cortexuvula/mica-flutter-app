import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:file_saver/file_saver.dart';
import 'package:mica/src/models/mica_score_model.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import '../assessment_string_utils.dart';

/// Exception thrown when PDF generation fails
class PdfGenerationException implements Exception {
  final String message;
  final Object? originalError;

  PdfGenerationException(this.message, [this.originalError]);

  @override
  String toString() => 'PdfGenerationException: $message';
}

/// Service for generating PDF reports from assessment data
class PdfGenerationService {
  static final DateFormat _dateFormat = DateFormat('d MMM y');

  /// Generate and download a PDF report for the assessment
  ///
  /// Throws [PdfGenerationException] if generation or saving fails.
  static Future<void> generateAndDownloadPdf(MicaScoreModel scoreModel) async {
    List<int> bytes;

    // Generate PDF content
    try {
      final pdf = pw.Document();

      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(32),
          build: (pw.Context context) {
            return _buildPdfContent(scoreModel);
          },
        ),
      );

      bytes = await pdf.save();
    } catch (e) {
      throw PdfGenerationException(
        'Failed to generate PDF content. Please try again.',
        e,
      );
    }

    // Generate filename with patient name and date
    final String fileName = _generateFileName(scoreModel);

    // Save the file
    try {
      await FileSaver.instance.saveFile(
        name: fileName,
        bytes: Uint8List.fromList(bytes),
        ext: 'pdf',
        mimeType: MimeType.pdf,
      );
    } catch (e) {
      throw PdfGenerationException(
        'Failed to save PDF file. Please check storage permissions and available space.',
        e,
      );
    }
  }

  /// Generates a safe filename for the PDF
  static String _generateFileName(MicaScoreModel scoreModel) {
    final safeName = scoreModel.patientName.isNotEmpty
        ? scoreModel.patientName
            .replaceAll(RegExp(r'[<>:"/\\|?*]'), '_') // Remove invalid chars
            .replaceAll(' ', '_')
        : 'Report';

    final dateStr = _dateFormat.format(scoreModel.assessmentDate).replaceAll(' ', '_');

    return 'MICA_${safeName}_$dateStr';
  }

  static List<pw.Widget> _buildPdfContent(MicaScoreModel scoreModel) {
    List<pw.Widget> widgets = [];

    // Add title
    widgets.add(
      pw.Header(
        level: 0,
        child: pw.Text('MICA Assessment Report',
            style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
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
          "Name: ${AssessmentStringUtils.formatPatientName(scoreModel.patientName)}",
    ));

    widgets.add(pw.Paragraph(
      text: "Handedness: ${scoreModel.handedness}",
    ));

    widgets.add(pw.Paragraph(
      text: "Test Date: ${_dateFormat.format(scoreModel.assessmentDate)}",
    ));

    widgets.add(pw.Paragraph(
      text:
          "Assessor: ${AssessmentStringUtils.formatAssessorName(scoreModel.assessorName)}",
    ));

    widgets.add(pw.SizedBox(height: 10));

    // Add Results header
    widgets.add(
      pw.Header(
        level: 1,
        child: pw.Text('Results:',
            style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
      ),
    );

    widgets.add(pw.SizedBox(height: 5));

    // Add abbreviations
    widgets.add(
      pw.Header(
        level: 2,
        child: pw.Text('The following abbreviations are used:',
            style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
      ),
    );

    widgets.add(pw.Padding(
      padding: const pw.EdgeInsets.only(left: 20),
      child: pw.Text('N = Normal, E = Equivocal, I = Impaired',
          style: pw.TextStyle(fontSize: 11)),
    ));

    widgets.add(pw.Paragraph(
        text: "Cut scores are estimates only.",
        style: pw.TextStyle(fontSize: 11, fontStyle: pw.FontStyle.italic)));

    widgets.add(pw.SizedBox(height: 10));

    // Add all assessment sections
    widgets.addAll(_buildAssessmentSections(scoreModel));

    return widgets;
  }

  static List<pw.Widget> _buildAssessmentSections(MicaScoreModel scoreModel) {
    List<pw.Widget> sections = [];

    // Working Memory Verbal Trial 1
    sections.add(_addAssessmentSection(
      title: "Working Memory VerbalTrial 1: Ten Word Recall",
      guide: "N > 5, E = 4 - 5, I < 4",
      rawScore: "Raw score: ${scoreModel.trialOneScore}/10",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.trial1ResultToString(scoreModel.trialOneScore)),
    ));

    // Short-term Memory Verbal Trial 2
    sections.add(_addAssessmentSection(
      title: "Short-term Memory Verbal Trial 2: Ten Word Recall",
      guide: "N > 6, E = 5 - 6, I < 5",
      rawScore: "Raw score: ${scoreModel.trialTwoScore}/10",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.trial2ResultToString(scoreModel.trialTwoScore)),
    ));

    // Short-term Memory Verbal Trial 3
    sections.add(_addAssessmentSection(
      title: "Short-term Memory Verbal Trial 3: Ten Word Recall",
      guide: "N > 7, E = 6 - 7, I < 6",
      rawScore: "Raw score: ${scoreModel.trialThreeScore}/10",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.trial3ResultToString(
              scoreModel.trialThreeScore)),
    ));

    // Visuospatial & Praxis
    sections.add(_addAssessmentSection(
      title: "Visuospatial & Praxis: Line Drawing Copy",
      guide: "N > 5, E = 5, I < 5",
      rawScore:
          "Raw score: ${scoreModel.visuospatialPraxisTotalScore}/9",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.visuospatialPraxisResultToString(scoreModel)),
    ));

    // Attention
    sections.add(_addAssessmentSection(
      title: "Attention: Vigilance Test",
      guide: "N = no mistakes, E = one mistake and I = > 1 mistake",
      rawScore:
          "Raw score: ${scoreModel.attentionCorrect} Correct Taps\nRaw score: ${scoreModel.attentionMistakes} Incorrect Taps",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.radioValueToString(scoreModel.attention)),
    ));

    // Executive: Animal Naming Task
    sections.add(_addAssessmentSection(
      title: "Executive: Animal Naming Task",
      guide: ">14 = N, 12 - 14 = E, < 12 = I",
      rawScore:
          "Raw score: ${scoreModel.executiveAnimalNamingCount} Animals Named",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.radioValueToString(
              scoreModel.executiveAnimalNaming)),
    ));

    // Executive: Luria Alternating Hand Movements
    sections.add(_addAssessmentSection(
      title: "Executive: Luria Alternating Hand Movements",
      guide:
          "N = 3 cycles without mistakes; E = able to do 1 - 2 cycles; I = unable to complete task",
      rawScore: "Raw score: ${scoreModel.executiveLuriaScore} Hand Movements",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.radioValueToString(scoreModel.executiveLuria)),
    ));

    // Executive: Serial Order Reversal Task
    sections.add(_addAssessmentSection(
      title: "Executive: Serial Order Reversal Task",
      guide: "N = no errors; E = 1 error; I >1 error",
      rawScore: "Raw score: ${scoreModel.executiveSerialScore}/6",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.radioValueToString(scoreModel.executiveSerial)),
    ));

    // Short-Term Memory Verbal Recall: Orientation
    sections.add(_addAssessmentSection(
      title: "Short-Term Memory Verbal Recall: Orientation",
      guide: "N > 5, E = 5, I < 5",
      rawScore: "Raw score: ${scoreModel.shorttermMemoryVerbalScore}/6",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.radioValueToString(
              scoreModel.shorttermMemoryVerbal)),
    ));

    // Praxis: Finger-hand Dexterity: Right
    sections.add(_addAssessmentSection(
      title: "Praxis: Finger-hand Dexterity: Right",
      guide: "N = no errors, E = some difficulty, I = clear difficulty",
      rawScore: "Raw score: ${scoreModel.praxisRight}/3",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.radioValueToString(scoreModel.praxisRight)),
    ));

    // Praxis: Finger-hand Dexterity: Left
    sections.add(_addAssessmentSection(
      title: "Praxis: Finger-hand Dexterity: Left",
      guide: "N = no errors, E = some difficulty, I = clear difficulty",
      rawScore: "Raw score: ${scoreModel.praxisLeft}/3",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.radioValueToString(scoreModel.praxisLeft)),
    ));

    // Praxis sub-test scores
    sections.add(_addAssessmentSection(
      title: "Limb-Kinetic Apraxia: Right",
      guide: "N = no errors, E = some difficulty, I = clear difficulty",
      rawScore: "",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.radioValueToString(scoreModel.praxisLimbKineticRight)),
    ));
    sections.add(_addAssessmentSection(
      title: "Limb-Kinetic Apraxia: Left",
      guide: "N = no errors, E = some difficulty, I = clear difficulty",
      rawScore: "",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.radioValueToString(scoreModel.praxisLimbKineticLeft)),
    ));
    sections.add(_addAssessmentSection(
      title: "Ideomotor Apraxia: Right",
      guide: "N = no errors, E = some difficulty, I = clear difficulty",
      rawScore: "",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.radioValueToString(scoreModel.praxisIdeomotorRight)),
    ));
    sections.add(_addAssessmentSection(
      title: "Ideomotor Apraxia: Left",
      guide: "N = no errors, E = some difficulty, I = clear difficulty",
      rawScore: "",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.radioValueToString(scoreModel.praxisIdeomotorLeft)),
    ));
    sections.add(_addAssessmentSection(
      title: "Ideational Apraxia",
      guide: "N = no errors, E = some difficulty, I = clear difficulty",
      rawScore: "",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.radioValueToString(scoreModel.praxisIdeational)),
    ));
    sections.add(_addAssessmentSection(
      title: "Oral Apraxia",
      guide: "N = no errors, E = some difficulty, I = clear difficulty",
      rawScore: "",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.radioValueToString(scoreModel.praxisOral)),
    ));
    sections.add(_addAssessmentSection(
      title: "Dressing Apraxia",
      guide: "N = no errors, E = some difficulty, I = clear difficulty",
      rawScore: "",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.radioValueToString(scoreModel.praxisDressing)),
    ));

    // Short-Term Memory Verbal: Delayed Recall Of 10 Words
    sections.add(_addAssessmentSection(
      title: "Short-Term Memory Verbal: Delayed Recall Of 10 Words",
      guide: "N > 5, E = 5, I < 5",
      rawScore: "Raw score: ${scoreModel.tenWordDelay}/10",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.delayRecallResultToString(
              scoreModel.tenWordDelay)),
    ));

    // Short-Term Memory Verbal Recognition: Total Score
    sections.add(_addAssessmentSection(
      title: "Short-Term Memory Verbal Recognition: Total Score",
      guide: "N > 16, E = 14-16, I < 14",
      rawScore:
          "Raw score: Words correctly identified in original word list: ${scoreModel.scoreVerbalRecognitionMemoryTenWordsInList}/10\nRaw score: Words correctly identified NOT in original word list: ${scoreModel.scoreVerbalRecognitionMemoryTenWordsNotInList}/10\nRaw score: Words identified: ${scoreModel.scoreVerbalRecognitionMemoryTenWords}/20",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.recognitionResultToString(
              scoreModel.scoreVerbalRecognitionMemoryTenWords)),
    ));

    // Short-Term Memory Visual: Line Drawing Recall
    sections.add(_addAssessmentSection(
      title: "Short-Term Memory Visual: Line Drawing Recall",
      guide: "N > 5, E = 5, I < 5",
      rawScore:
          "Raw score: ${scoreModel.visualMemoryTotalScore}/9",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.visualMemoryResultToString(scoreModel)),
    ));

    // Anomia: Naming Line Drawings
    sections.add(_addAssessmentSection(
      title: "Anomia: Naming Line Drawings",
      guide: "N = all correct, E = 1 error, I > 1 error",
      rawScore: "Raw Score: ${3 - (scoreModel.anomiaAgnosia)}/3",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.radioValueToString(scoreModel.anomiaAgnosia)),
    ));

    // Agnosia: Recognition of Line Drawings
    sections.add(_addAssessmentSection(
      title: "Agnosia: Recognition of Line Drawings",
      guide: "N = all correct, E = 1 error, I > 1 error",
      rawScore: "Raw Score: ${3 - (scoreModel.agnosia)}/3",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.radioValueToString(scoreModel.agnosia)),
    ));

    // Executive: Design Fluency
    sections.add(_addAssessmentSection(
      title: "Executive: Design Fluency",
      guide: "N > 7 drawings, E = 5 - 7 drawings, I < 5 drawings",
      rawScore: "Raw Score: ${3 - (scoreModel.executive)}/3",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.radioValueToString(scoreModel.executive)),
    ));

    // Spoken Language
    sections.add(_addAssessmentSection(
      title: "Spoken Language",
      guide: "N = normal speech, E = equivocal, I definite impairment",
      rawScore: "Raw Score: ${3 - (scoreModel.spokenLanguage)}/3",
      result: AssessmentStringUtils.resultToFullName(
          AssessmentStringUtils.radioValueToString(scoreModel.spokenLanguage)),
    ));

    return sections;
  }

  static pw.Widget _addAssessmentSection({
    required String title,
    required String guide,
    required String rawScore,
    required String result,
  }) {
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
      ],
    );
  }
}
