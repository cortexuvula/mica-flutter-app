/// Strings for the Gnosis domain assessment screens.
///
/// This class contains all text content used in the gnosis assessment
/// screens including clock drawing, visual identification, touch identification,
/// and finger perception tests.
class GnosisStrings {
  GnosisStrings._(); // Prevent instantiation

  // Domain Title
  static const domainTitle = 'Gnosis';

  // Menu Options
  static const identifyObjectsVisually = 'Identify Objects Visually';
  static const identifyObjectsByTouch = 'Identify Objects by Touch';
  static const fingerPerceptionTest = 'Finger Perception Test';
  static const clockDrawingTest = 'Clock Drawing Test';

  // Clock Drawing Test
  static const clockDrawingExplanation =
      'Drawing a clock requires a number of cognitive domains to work together. '
      'Guiding the hand involves praxis. Planning the task is executive functioning. '
      'Monitoring the result visually is gnosis.';
  static const clockDrawingPatientInstruction =
      '"Draw a clock face with the time set to 10 past five. '
      'It must have all the numbers and hands so that a child can read the time"';
  static const clockDrawingScoringIntro =
      'The instructions may be repeated once if required. A total of five points are awarded.\n'
      'Most people would be able to score full marks.';
  static const clockDrawingScoreCriteria1 =
      '- Score one point if the outer circle is present.';
  static const clockDrawingScoreCriteria2 =
      '- Score one point if all the numbers are present, in the correct order and in the appropriate quadrant. '
      'No other numbers or letters are allowed.';
  static const clockDrawingScoreCriteria3 =
      '- Score one point if all the hands are present. The minute hand must be longer than the hour hand.';
  static const clockDrawingScoreCriteria4 =
      '- Score one point if the time is correctly indicated.';
  static const clockDrawingScoreCriteria5 =
      '- Score one point for good overall planning (starts with a circle and plans the writing of the numbers in appropriate quadrants).';

  // Identify Objects Visually
  static const visualIdentificationExaminerInstruction =
      'Point towards the following objects and ask the patient to name it. '
      'Inability to name objects (nominal dysphasia) must be distinguished from visual object agnosia.';
  static const visualIdentificationPatientInstruction =
      '"Can you tell me what this is?"';
  static const visualIdentificationCommonObjects =
      'Point to a watch, pen, tissue, button, shoe, and shirt.';
  static const visualIdentificationUncommonObjects =
      'Less common objects are: knuckles, ring finger, eyebrow, winder of a watch, and collar.';
  static const visualIdentificationDistinguishing =
      'To distinguish between nominal aphasia and visual object agnosia, ask the patient to describe the object or its use. '
      'If this can be done adequately then visual perception might be normal and the deficit is more likely language based. '
      'Language deficits can be further examined by providing the patient with language cues by saying either a part of the word or giving a phonetic clue. '
      'For example, say "col..." for collar or say it sounds like "dollar" '
      'Some patients may then be able to progress and say the word, the deficit is then more likely to be nominal aphasia.';

  // Identify Objects by Touch
  static const touchIdentificationPatientInstruction =
      '"Please hold out your right hand. I am going to ask you to close your eyes and then I will place an object in your hand. '
      'Identify this by touch only."';
  static const touchIdentificationExaminerInstruction =
      "Place common objects such as keys, coin or pen in the patient's right hand. "
      'Repeat the same with the left hand. An inability to identify objects by touch is known as astereognosis.';
  static const touchIdentificationRightHand = 'Right';
  static const touchIdentificationLeftHand = 'Left';
  static const touchIdentificationNoErrors = 'No errors';
  static const touchIdentificationSomeDifficulty = 'Some difficulty';
  static const touchIdentificationClearDifficulty = 'Clear difficulty';

  // Finger Perception Test
  static const fingerPerceptionPatientInstruction1 =
      '"Place your hands on the table in front of you. I am now going to touch two of your fingers and you must say how many of your other fingers are in between my fingers."';
  static const fingerPerceptionExaminerInstruction1 =
      'Touch the fingers indicated in the picture below, on the black markings. The patient should answer "one."';
  static const fingerPerceptionPatientInstruction2 =
      '"Now close your eyes while I continue this test. How many of your fingers are in between the fingers that I touch?"';
  static const fingerPerceptionExaminerInstruction2 =
      "Continue to touch the patient's fingers as indicated below and rate the response.";
  static const fingerPerceptionSummaryNote =
      'Most people should be able to complete this test without any mistakes.';
  static const fingerPerceptionSummaryScore = 'Summary Score:';
  static const fingerPerceptionHandDiagram = 'Hand Diagram';
}
