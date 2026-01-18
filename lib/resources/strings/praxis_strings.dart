/// String constants for the Praxis domain assessment screens.
class PraxisStrings {
  PraxisStrings._(); // Prevent instantiation

  // Domain Title
  static const domainTitle = 'Praxis';

  // Menu Buttons
  static const limbKineticButton = 'Limb-kinetic Apraxia';
  static const ideomotorButton = 'Ideomotor Apraxia';
  static const ideationalButton = 'Ideational Apraxia';
  static const oralButton = 'Oral Apraxia';
  static const dressingButton = 'Dressing Apraxia';
  static const lineDrawingButton = 'Line Drawing';

  // Limb-kinetic Apraxia
  static const limbKineticTitle = 'Limb-kinetic Apraxia';
  static const limbKineticPatientInstruction =
      '"Take this pen and rotate it with your fingers as fast as you can."';
  static const limbKineticExaminerInstruction = 'Test both hands.';

  // Ideomotor Apraxia
  static const ideomotorTitle = 'Ideomotor Apraxia';
  static const ideomotorExaminerInstruction =
      'This is a failure to correctly position and move a limb in space. It can be assessed by asking the patient to mime tasks.';
  static const ideomotorPatientInstruction1 =
      '"Show with your right hand how you would pour a cup of tea, add sugar and stir it."';
  static const ideomotorPatientInstruction2 =
      '"Now do the same with your left hand."';

  // Ideational Apraxia
  static const ideationalTitle = 'Ideational Apraxia';
  static const ideationalExaminerInstruction1 =
      'This is the ability to correctly sequence a series of well-learned motor acts that lead to a goal. The patient is given an A4 sheet of paper, an envelope and a pencil.';
  static const ideationalPatientInstruction =
      '"Pretend that you have written a letter and would like to post it. Fold the sheet of paper so that it fits into the envelope, then seal the envelope and address it to yourself and then indicate where you will put a stamp."';
  static const ideationalExaminerInstruction2 =
      'The instructions can be repeated, as this is not a test of memory. Most individuals are able to do this task without any difficulty.';

  // Oral Apraxia
  static const oralTitle = 'Oral Apraxia';
  static const oralExaminerInstruction =
      'Oral apraxia is an inability to perform orobuccal movements.';
  static const oralPatientInstruction1 =
      '"Show me how you would blow out a match."';
  static const oralPatientInstruction2 = '"Lick crumbs from your lips?"';
  static const oralPatientInstruction3 = '"Blow a kiss?"';

  // Dressing Apraxia
  static const dressingTitle = 'Dressing Apraxia';
  static const dressingExaminerInstruction =
      'This task involves limb-kinetic, ideomotor, and to some extent ideational praxis. It is assessed by asking the patient to put on a hospital gown or other suitable piece of clothing such as a cardigan. Observe if the patient is able to put their hands and arms through the sleeves correctly and is able to fasten the buttons.';

  // Line Drawing
  static const lineDrawingTitle = 'Line Drawing';
  static const lineDrawingExaminerInstruction1 =
      'Line drawings are presented, and the patient is asked to copy them. The ability to successfully copy a line drawing depends on correct recognition of the drawing with visual processing. This input function is part of gnosis. Drawing with the dominant hand is an output function and part of praxis as it involves motor planning.';
  static const lineDrawingExaminerInstruction2 =
      'The patient can be asked if their drawing resembles the stimulus drawing. If the patient says the drawing differs from the stimulus, but they do not know how to draw it correctly then it may indicate visual perception is intact but not higher order motor control.';
  static const lineDrawingPatientInstruction = '"Copy these drawings."';
  static const lineDrawingScoringHeader = 'Cannot name picture';

  // Scoring Table Labels (praxis-specific)
  static const noErrors = 'No errors';
  static const someDifficulty = 'Some difficulty';
  static const clearDifficulty = 'Clear difficulty';
  static const right = 'Right';
  static const left = 'Left';

  // Line Drawing Scoring (shared with visual memory)
  static const imageHeader = 'Image';
  static const noMistakes = 'No Mistakes';
  static const fewOmissions = 'Few Omissions';
  static const poor = 'Poor';
  static const noDrawing = 'No Drawing';
  static const image1 = 'Image 1';
  static const image2 = 'Image 2';
  static const image3 = 'Image 3';
}
