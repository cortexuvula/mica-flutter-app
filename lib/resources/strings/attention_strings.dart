/// Strings for the Attention and Concentration domain assessment screens.
///
/// This class contains all text content used in the attention assessment
/// screens including vigilance, digit span, serial 7s/3s, spell word backwards,
/// and observation tests.
class AttentionStrings {
  AttentionStrings._(); // Prevent instantiation

  // Domain Title
  static const domainTitle = 'Assessment of Attention';
  static const domainSubtitle = 'and Concentration';

  // Menu Options
  static const vigilanceButton = '1. Vigilance test';
  static const spellWordButton = '2. Spell a 5 letter word backwards';
  static const serialButton = '3. Serial 7s or 3s';
  static const digitSpanButton = '4. Digit span';
  static const observationButton = '5. Observation';

  // Vigilance Test
  static const vigilanceTitle = 'Attention';
  static const vigilanceSubtitle = 'Vigilance Task';
  static const vigilancePatientInstruction =
      '"I am going to read some letters to you. Tap the table as soon as you hear the letter A."';
  static const vigilanceExaminerInstruction =
      'Read the following letter sequence slowly and clearly: (at one per second)';
  static const vigilanceResponseInstruction = 'A mistake is an omission or inclusion.';
  static const vigilanceResponseNormal = 'No mistakes.';
  static const vigilanceResponseEquivocal = '1 mistake.';
  static const vigilanceResponseImpaired = '> 1 mistake.';
  static const vigilanceLettersLabel = 'Letters';
  static const vigilanceCorrectLabel = 'Correct:';
  static const vigilanceMistakesLabel = 'Mistakes:';

  // Spell Word Backwards Test
  static const spellWordTitle = 'Spelling Words Backwards';
  static const spellWordPatientInstruction =
      '"I want you to spell the word "WORLD" forwards."  "Good. Now spell it backwards."';
  static const spellWordAlternativeInstruction = 'Alternative words: April or March';

  // Serial 7s and 3s Test
  static const serialTitle = "Serial 7's And 3's";
  static const serialSevenHeader = "Serial 7's";
  static const serialThreeHeader = "Serial 3's";
  static const serialSevenPatientInstruction = '"Subtract seven from one hundred."';
  static const serialSevenExaminerInstruction = 'Wait for the response.';
  static const serialSevenPatientInstruction2 =
      '"Continue to take 7 away from that number." (say this only if they stop)';
  static const serialThreePatientInstruction = '"Subtract three from twenty."';
  static const serialThreeExaminerInstruction = 'Wait for the response.';
  static const serialThreePatientInstruction2 =
      '"Continue to take 3 away from that number." (say this only if they stop)';

  // Digit Span Test
  static const digitSpanTitle = 'Digit Span';
  static const digitSpanPatientInstruction =
      '"I am going to say some numbers, and when I stop, you repeat them."';
  static const digitSpanExaminerInstruction =
      'Say one digit per second. Tap the check box for each correct response.';
  static const digitSpanNumbers1 = '"5 4 8 1"';
  static const digitSpanNumbers1Sub = 'if required: "6 4 1 7"';
  static const digitSpanNumbers2 = '"5 3 9 5 3"';
  static const digitSpanNumbers2Sub = 'if required: "9 6 3 8 4"';
  static const digitSpanNumbers3 = '"8 6 3 2 8 5"';
  static const digitSpanNumbers3Sub = 'if required: "5 2 9 7 4 3"';
  static const digitSpanNumbers4 = '"2 8 5 4 8 4 2"';
  static const digitSpanNumbers4Sub = 'if required: "3 7 4 2 8 4 1"';

  // Observation Test
  static const observationTitle = 'Attention';
  static const observationSubtitle = 'Observation';
  static const observationExaminerInstruction =
      'Note the language and behaviour of the patient and score as below.';
  static const observationResponseInstruction =
      'Rate the patient\'s spontaneous speech';
}
