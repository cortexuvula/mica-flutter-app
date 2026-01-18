/// Language domain strings for the MICA app.
///
/// Contains all string constants used in language assessment screens.
class LanguageStrings {
  LanguageStrings._(); // Prevent instantiation

  // Domain Title and Menu
  static const domainTitle = 'Language';
  static const selectAssessmentInstruction = 'SELECT A LANGUAGE ASSESSMENT BELOW';

  // Menu Buttons
  static const spontaneousSpeechButton = 'Spontaneous Speech';
  static const comprehensionThreeStageButton = 'Comprehension: 3 Stage Command Task';
  static const comprehensionMovingObjectsButton = 'Comprehension: Moving 3 Objects Task';
  static const repetitionButton = 'Repetition';
  static const namingButton = 'Naming';
  static const readingButton = 'Reading';
  static const writingButton = 'Writing';
  static const pictureNamingButton = 'Picture Naming';
  static const objectNamingButton = 'Object Naming';

  // Spontaneous Speech
  static const spontaneousSpeechTitle = 'Spontaneous Speech';
  static const spontaneousSpeechExaminerInstruction =
      'Evaluate free speech by listening for impairments of fluency, articulation and the presence of paraphasias. Paraphasias are word substitutions and can be phonemic i.e. "sitter" for "sister" or semantic i.e. "jug" for "glass."';

  // Comprehension - Three Stage Command
  static const comprehensionThreeStageTitle = 'Comprehension';
  static const comprehensionThreeStageExaminerInstruction =
      'Evaluate comprehension by using a 3-stage command. Intact basic comprehension ensures good compliance with any test procedures that follow.';
  static const comprehensionThreeStagePatientInstruction =
      '"Can you point with your finger to the ceiling, the floor and the door."';
  static const comprehensionThreeStageResponseNormal = '3 stages complete without an error';
  static const comprehensionThreeStageResponseEquivocal = 'Some difficulty';
  static const comprehensionThreeStageResponseImpaired = '1 or more clear errors';

  // Comprehension - Moving Objects
  static const comprehensionMovingObjectsTitle = 'Comprehension: Moving 3 Objects Task';
  static const comprehensionMovingObjectsExaminerInstruction =
      'Place 3 objects in front of the patient and name them while they are being placed to exclude naming ability and object agnosia as confounding factors. Common objects such as a coin, keys and a piece of paper can be used. Begin with simple commands and then move to more complex instructions.';
  static const comprehensionMovingObjectsPatientInstruction1 = '"Turn the coin over"';
  static const comprehensionMovingObjectsPatientInstruction2 =
      '"Place the keys on the other side of the paper"';
  static const comprehensionMovingObjectsPatientInstruction3 =
      '"Place the coin between the keys and the paper, and then turn over the paper."';

  // Repetition
  static const repetitionTitle = 'Repetition';
  static const repetitionExaminerInstruction = 'Ask the patient to repeat the following.';
  static const repetitionPatientInstruction1 = '"No ifs ands or buts."';
  static const repetitionPatientInstruction2 =
      '"The little boy went to the shopping mall to spend his money."';

  // Naming
  static const namingTitle = 'Naming';

  // Object Naming
  static const objectNamingTitle = 'Naming';
  static const objectNamingExaminerInstruction =
      'Point towards the following objects and ask the patient to name it. Inability to name objects (nominal dysphasia) must be distinguished from visual object agnosia.';
  static const objectNamingPatientInstruction = '"Can you tell me what this is?"';
  static const objectNamingCommonObjects =
      'Point to a watch, pen, tissue, button, shoe, and shirt.';
  static const objectNamingUncommonObjects =
      'Less common objects are: knuckles, ring finger, eyebrow, winder of a watch, and collar.';
  static const objectNamingDistinguishInstruction =
      'To distinguish between nominal aphasia and visual object agnosia, ask the patient to describe the object or its use. If this can be done adequately then visual perception might be normal and the deficit is more likely language based. Language deficits can be further examined by providing the patient with language cues by saying either a part of the word or giving a phonetic clue. For example, say "col..." for collar or say it sounds like "dollar" Some patients may then be able to progress and say the word, the deficit is then more likely to be nominal aphasia.';

  // Picture Naming
  static const pictureNamingTitle = 'Picture Naming';
  static const pictureNamingPatientInstruction = '"Name the following pictures."';
  static const pictureNamingExaminerInstruction =
      'Compare the ability to name pictures with naming of real objects.';
  static const pictureNamingAnomiaResponse = 'Anomia: Cannot name picture.';
  static const pictureNamingAgnosiaResponse = 'Agnosia: Cannot describe object.';
  static const pictureNamingResponseNormal = 'All correct';
  static const pictureNamingResponseEquivocal = '1 mistake';
  static const pictureNamingResponseImpaired = '> 1 mistake';

  // Reading
  static const readingTitle = 'Reading';
  static const readingExaminerInstruction =
      'Can you read this sentence and do what it says so that I can be sure you understood it?';
  static const readingPatientInstruction = 'CLOSE YOUR EYES';

  // Writing
  static const writingTitle = 'Writing';
  static const writingExaminerInstruction = '"Can you write a sentence for me here?"';
  static const writingPatientInstruction = 'Provide the patient with a piece of paper and a pen.';
}
