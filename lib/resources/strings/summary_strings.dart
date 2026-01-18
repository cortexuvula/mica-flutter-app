/// String constants for the Summary/Results screens.
class SummaryStrings {
  SummaryStrings._(); // Prevent instantiation

  // Page Title
  static const title = 'Summary';

  // Tooltips
  static const shareSummaryTooltip = 'Share Summary';
  static const downloadPdfTooltip = 'Download PDF';
  static const goHomeTooltip = 'Go Home';

  // Tab Labels
  static const domainResultsTab = 'Domain Results';
  static const fullReportTab = 'Full Report';

  // Patient Info Labels
  static const nameLabel = 'Name: ';
  static const handednessLabel = 'Handedness: ';
  static const testDateLabel = 'Test Date: ';
  static const assessorLabel = 'Assessor: ';
  static const dateOfAssessmentLabel = 'Date of Assessment: ';

  // Info Card
  static const infoCardText =
      'Some tasks have a numerical raw score. Other tasks provide an estimate based on clinical judgement which is indicated by the word "Clinical" in the table below.';

  // Domain Titles (used in both cards and reports)
  static const attentionDomain = 'Attention & Concentration';
  static const languageDomain = 'Language';
  static const verbalWorkingMemoryDomain = 'Verbal Working Memory';
  static const verbalShortTermMemoryDomain = 'Verbal Short-Term Memory';
  static const visualShortTermMemoryDomain = 'Visual Short-Term Memory';
  static const praxisDomain = 'Praxis';
  static const gnosisDomain = 'Gnosis';
  static const executiveFunctionDomain = 'Executive Function';

  // Table Headers
  static const taskHeader = 'Task';
  static const scoringGuideHeader = 'Scoring Guide';
  static const resultHeader = 'Result';
  static const estimateHeader = 'Estimate';
  static const neiHeader = 'N / E / I';

  // Result Values
  static const clinicalResult = 'Clinical';

  // Task Names
  static const taskAttentionVigilance = 'Attention: Vigilance Test';
  static const taskAnomiaNaming = 'Anomia: Naming Pictures';
  static const taskSpokenLanguage = 'Spoken Language';
  static const taskWorkingMemoryTrial1 = 'Working Memory Verbal Trial 1: 10 Word Recall';
  static const taskShortTermTrial2 = 'Short-term Memory Verbal Trial 2: 10 Word Recall';
  static const taskShortTermTrial3 = 'Short-term Memory Verbal Trial 3: 10 Word Recall';
  static const taskDelayedRecall = 'Short-Term Memory Verbal: Delayed Recall Of 10 Words';
  static const taskRecognitionTotal = 'Short-Term Memory Verbal Recognition: Total Score';
  static const taskOrientation = 'Short-Term Memory Verbal Recall: Orientation';
  static const taskVisualLineDrawing = 'Short-term Memory Visual: Line Drawing Recall';
  static const taskPraxisRight = 'Praxis: Finger-hand Dexterity: Right';
  static const taskPraxisLeft = 'Praxis: Finger-hand Dexterity: Left';
  static const taskVisuospatialPraxis = 'Visuospatial & Praxis: Line Drawing Copy';
  static const taskAgnosiaRecognition = 'Agnosia: Recognition of Pictures';
  static const taskAnimalNaming = 'Executive: Animal Naming Task';
  static const taskDesignFluency = 'Executive: Design Fluency';
  static const taskLuriaAlternating = 'Executive: Luria Alternating Hand Movements';
  static const taskSerialOrderReversal = 'Executive: Serial Order Reversal Task';

  // Scoring Guides
  static const scoreGuideAttention = 'N = no mistakes, E = one mistake and I = > 1 mistake';
  static const scoreGuideAnomia = 'N = all correct, E = 1 error, I >1 error';
  static const scoreGuideSpokenLanguage = 'N = Normal speech, E = Equivocal, I = definite impairment';
  static const scoreGuideTrial1 = 'N > 6, E = 5-6, I < 5';
  static const scoreGuideTrial2 = 'N > 6, E = 5-6, I < 5';
  static const scoreGuideTrial3 = 'N > 7, E = 5-7, I < 5';
  static const scoreGuideDelayedRecall = 'N >5, E = 5, I < 5';
  static const scoreGuideRecognition = 'N > 16, E = 14 - 16, I < 14';
  static const scoreGuideOrientation = 'N = 5, E = 4, I < 4';
  static const scoreGuideVisualMemory = 'N >5, E = 5, I < 5';
  static const scoreGuidePraxis = 'N = No errors, E = Some difficulty, I = Clear difficulty';
  static const scoreGuidePraxisAlt = 'N = no errors, E = some difficulty, I = Clear difficulty';
  static const scoreGuideVisuospatial = 'N > 6, E = 6, I < 6';
  static const scoreGuideAgnosia = 'N = all correct, E = 1 error, I >1 error';
  static const scoreGuideAnimalNaming = '>14 = N, 12-14 = E, <12 =I';
  static const scoreGuideDesignFluency = 'N > 7 drawings, E = 5-7 drawings, I< 5 drawings';
  static const scoreGuideLuria = 'N = 3 cycles without mistakes, E = able to do 1-2 cycles, I = unable to complete task';
  static const scoreGuideSerialOrder = 'N = no errors, E = 1 error, I > 1 error';

  // Snackbar Messages
  static const reportCopiedToClipboard = 'Report copied to clipboard!';
  static const shareDialogOpened = 'Share dialog opened';
  static const errorSharing = 'Error sharing: ';
  static const pdfDownloadedSuccessfully = 'PDF downloaded successfully';
  static const errorGeneratingPdf = 'Error generating PDF: ';
}
