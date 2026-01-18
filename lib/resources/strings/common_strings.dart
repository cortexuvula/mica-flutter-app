/// Common strings shared across the application.
///
/// This class contains UI labels, button text, and common phrases
/// that are used in multiple places throughout the app.
class CommonStrings {
  CommonStrings._(); // Prevent instantiation

  // Button Labels
  static const taskCompleted = 'Task Completed';
  static const continueButton = 'Continue';
  static const start = 'Start';
  static const clear = 'Clear';
  static const yes = 'Yes';
  static const no = 'No';
  static const done = 'Done';
  static const cancel = 'Cancel';
  static const ok = 'OK';

  // Result Status Labels
  static const normal = 'Normal';
  static const equivocal = 'Equivocal';
  static const impaired = 'Impaired';

  // Score Display Labels
  static const scoreSummary = 'Score Summary';
  static const results = 'Results';

  // Common Instruction Phrases
  static const scrollDownToReveal = 'Scroll down to reveal more instructions';
  static const noteResponseAndScore =
      'Note the response of the patient and score as below.';
  static const toPatient = 'To Patient:';
  static const examinerInstructions = 'Examiner Instructions:';
  static const scoring = 'Scoring:';

  // Form Labels
  static const nameLabel = 'Name:';
  static const testDateLabel = 'Test Date:';
  static const assessorLabel = 'Assessor:';
  static const handednessLabel = 'Handedness:';
  static const rightHanded = 'Right';
  static const leftHanded = 'Left';
  static const ambidextrous = 'Ambidextrous';

  // Domain Names
  static const attention = 'Attention';
  static const language = 'Language';
  static const memory = 'Memory';
  static const praxis = 'Praxis';
  static const gnosis = 'Gnosis';
  static const executive = 'Executive';

  // Common Test Phrases
  static const trial1 = 'Trial 1';
  static const trial2 = 'Trial 2';
  static const trial3 = 'Trial 3';
  static const verbal = 'Verbal';
  static const visual = 'Visual';

  // App Info
  static const appName = 'Midland Cognitive Assessment';
  static const disclaimer =
      'The Midland Cognitive Assessment App does not provide medical advice and cannot replace good clinical practice. It is intended for health professionals familiar with this type of assessment. You use this App as is and at your own risk. You are strongly encouraged to first read the Full Instructions and Teaching Booklet.';
  static const disclaimer2 =
      'The Midland Cognitive Assessment App is intended for use by health professionals familiar with this type of cognitive assessment. It does not provide medical advice and cannot replace good clinical practice. It should be used at your own discretion. You are strongly encouraged to first read the full instructions and teaching booklet.';
  static const disclaimer3 =
      'The following abbreviations are used:\nN = Normal, E = Equivocal, I = Impaired\n\nCut scores are estimates only.';
  static const appDescription =
      'The Midland Cognitive Assessment (MICA) is a collection of cognitive tasks that can be done in full or in part. Emphasis is on cognitive domain assessment and not on a total score. For full instructions see the accompanying booklet - Bedside Cognitive Assessment.';

  // Welcome Screen
  static const welcomeTitle = 'Welcome, what would you like to do today?';
  static const welcomeOption1 =
      'Administer the Midland Cognitive Assessment (MICA). A 15 minute cognitive assessment tool that covers most of the important cognitive domains.';
  static const welcomeOption2 = 'Assess specific cognitive domain(s)';
  static const welcomeOption3 =
      'Learn more about the assessment of patients with specific clinical presentations.';
  static const welcomeButtonMica = 'MICA';
  static const welcomeButtonDomains = 'Domains';
  static const welcomeButtonClinicalCases = 'Clinical Cases';
  static const welcomeButtonBooklet = 'Bedside Cognitive Assessment Booklet';
  static const welcomeButtonVideos = 'Educational Videos';

  // Domain Select
  static const domainSelect = 'Domain Select';
  static const domainSelectInfo =
      'Select a cognitive domain below to see how to assess for it.';
  static const domainSelectAttention = 'Attention and Concentration';
  static const domainSelectLanguage = 'Language';
  static const domainSelectMemory = 'Memory';
  static const domainSelectPraxis = 'Praxis';
  static const domainSelectGnosis = 'Gnosis';
  static const domainSelectExecutive = 'Executive functions';

  // Clinical Cases
  static const clinicalSelectTitle = 'Clinical Cases';
  static const clinicalAlzheimersEarly = "Early or Mild Alzheimer's disease";
  static const clinicalAlzheimersModerate = "Moderate Alzheimer's disease";
  static const clinicalVascularDementia = 'Vascular dementia';
  static const clinicalSchizophrenia = 'Schizophrenia';
  static const clinicalDepression = 'Depression';

  // Resources
  static const resourceButtonBooklet = 'Bedside Cognitive Assessment Booklet';
  static const resourceButtonVideo = 'Educational Videos';
  static const bookletButton = 'Bedside Cognitive Assessment Booklet';
  static const fullTestButton = 'Start Full Test';
  static const fullTestText =
      'Ensure that all testing is done in a quiet environment without any disturbance. You will need two blank sheets of A4 paper and a pen or pencil.';
  static const startTesting =
      'We are now going to do some tests of your memory and thinking. Some of the tests will be easy and others difficult. Just try your best. Any questions?';

  // Generic Test Strings
  static const testDescription = 'Task Description:';
  static const testToPatient = 'To Patient:';
  static const testResponse = 'Response:';
}
