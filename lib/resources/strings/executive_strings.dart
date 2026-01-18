/// String constants for the Executive Function domain assessment screens.
class ExecutiveStrings {
  ExecutiveStrings._(); // Prevent instantiation

  // Domain Title
  static const domainTitle = 'Executive Functions';

  // Menu Buttons
  static const luriaAlternatingButton = 'Luria Alternating Hand Movements';
  static const luriaFistEdgePalmButton = 'Luria Fist-Edge-Palm Movement';
  static const animalNamingButton = 'Animal Naming Task';
  static const lexicalFluencyButton = 'Lexical Fluency Test';
  static const designFluencyButton = 'Design Fluency Task';
  static const fingerNoseButton = 'Finger-Nose Task';
  static const tapTaskButton = 'Tap Task';
  static const alternatingSequencesButton = 'Alternating Sequences';
  static const monthsBackwardsButton = 'Months of the Year Backwards';

  // === Luria Alternating Hand Movements ===
  static const luriaAlternatingTitle = 'Luria Alternating Hand Movements';
  static const luriaAlternatingPatientInstruction =
      '"Place both hands on the table like I do. Watch me carefully because I want you to do the same as I am doing. Can you see that I am making a fist with one hand? Now swap the hands over. Can you do that as fast as you can?"';
  static const tapToCountCycles = 'Tap to count Cycles';
  static const fiveCyclesNoMistakes = '5 cycles without any mistakes';
  static const oneMistake = '1 mistake';
  static const twoOrMoreMistakes = '2 or more mistakes';

  // === Luria Fist-Edge-Palm Movement ===
  static const luriaFistEdgePalmTitle = 'Luria Fist-Edge-Palm Movement';
  static const luriaFistEdgePalmExaminerInstruction =
      'The examiner performs alternating movements with the right hand by making a fist, then opening the hand with the edge touching the surface, and then the palm touching the surface. The patient is first asked to imitate the series and then continue on his/her own.';
  static const luriaFistEdgePalmPatientInstruction =
      '"Can you see what I am doing? Please join me and do the same."';
  static const luriaFistEdgePalmScoringNote =
      'The patient should be able to perform 5 cycles correctly. Test both hands.';
  static const rightHand = 'Right Hand';
  static const leftHand = 'Left Hand';

  // === Animal Naming Task ===
  static const animalNamingTitle = 'Animal Naming Task';
  static const animalNamingPatientInstruction =
      '"I am going to give you one minute to name as many animals as possible."';
  static const animalNamingExaminerInstruction =
      'The patient can name mammals, birds, reptiles or fish. Repetitions are not scored.';
  static const animalNamingResponseNormal = '> 14 Names';
  static const animalNamingResponseEquivocal = '12 - 14 Names';
  static const animalNamingResponseImpaired = '< 12 Names';

  // === Lexical Fluency Test ===
  static const lexicalFluencyTitle = 'Lexical Fluency Test';
  static const lexicalFluencyPatientInstruction =
      '"Say as many words as you can beginning with the letter \'S\', any words except names of people or places. I will give you one minute to complete the task. Are you ready? Go."';
  static const lexicalFluencyExaminerInstruction =
      'Repetitions are not scored but should be noted as it may indicate perseveration. The letters \'F\' and \'A\' can also be used.';
  static const lexicalFluencyResponseNormal = '> 14 Names';
  static const lexicalFluencyResponseEquivocal = '12 - 14 Names';
  static const lexicalFluencyResponseImpaired = '< 12 Names';

  // === Design Fluency Task ===
  static const designFluencyTitle = 'Design Fluency Task';
  static const designFluencyPatientInstruction =
      '"You have one minute to draw anything using four lines. The drawings must be different and I must be able to count the lines. I will give you two examples."';
  static const designFluencyPatientInstruction2 =
      '"Do you have any questions? Your minute starts now."';
  static const designFluencyExaminerInstruction =
      'Draw the following two examples on the same paper that the patient will use. Count the lines from 1 - 4 while you are drawing.';
  static const designFluencyResponseNormal = '> 7 drawings';
  static const designFluencyResponseEquivocal = '5 - 7 drawings';
  static const designFluencyResponseImpaired = '< 5 drawings';

  // === Finger-Nose Task ===
  static const fingerNoseTitle = 'Finger-Nose Task';
  static const fingerNoseExaminerInstruction =
      'The examiner lifts their finger and in response the patient touches their nose. When the examiner touches his nose, the patient responds by lifting his finger.';
  static const fingerNosePatientInstruction =
      '"Listen carefully. When I touch my nose, you raise your finger like this."\n"When I raise my finger, you touch your nose. Let\'s try it now."';
  static const fingerNoseVariationsInstruction =
      'The examiner performs five variations such as Finger-Nose-Nose-Finger-Nose. Most individuals can complete this task without making a mistake.';
  static const fingerNoseResponse = 'Note the response of the patient and score as below.';

  // === Tap Task ===
  static const tapTaskTitle = 'Tap Task';
  static const tapTaskPatientInstruction =
      '"Tap once when I tap once. Do not tap when I tap twice."';
  static const tapTaskExaminerInstruction =
      'Perform a random series of tapping once or twice and note the patient\'s response. Most people can do this without any mistakes.';
  static const tapTaskResponse = 'Note the response of the patient and score as below.';

  // === Alternating Sequences ===
  static const alternatingSequencesTitle = 'Alternating Sequences';
  static const alternatingSequencesPatientInstruction1 =
      '"I will say a sequence of letters and numbers. Listen carefully as I would like you to complete it for me. A 1 B 2 C...?"';
  static const alternatingSequencesPatientInstruction2 =
      '"Good, now start from A and say this sequence until I ask you to stop."';
  static const alternatingSequencesExaminerInstruction =
      'Score the sequence below. Most people can complete this task without any mistakes.\n\nA 1 B 2 C 3 D 4 E 5';
  static const alternatingSequencesResponse =
      'Note the response of the patient and score as below.';

  // === Months of the Year Backwards ===
  static const monthsBackwardsTitle = 'Months of the Year Backwards';
  static const monthsBackwardsPatientInstruction1 =
      '"Say the months of the year starting with January."';
  static const monthsBackwardsPatientInstruction2 =
      '"Now start with December and go backwards."';
  static const monthsBackwardsExaminerInstruction =
      'Allow person to complete the sequence January to December.';
  static const monthsBackwardsResponse =
      'Stop the person when he reaches July or makes 2 or more mistakes.';
  static const monthsBackwardsResponseNormal = 'No errors';
  static const monthsBackwardsResponseEquivocal = '1 error';
  static const monthsBackwardsResponseImpaired = '> 1 error';
  static const tapToScore = 'Tap to score';

  // === Timer Button States ===
  static const timerStart = 'Start';
  static const timerRunning = 'Running';
  static const timerComplete = 'Complete';

  // === Counter Labels ===
  static const tapToCountWords = 'Tap to count Words';
}
