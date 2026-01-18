/// String constants for the Memory domain assessment screens.
class MemoryStrings {
  MemoryStrings._(); // Prevent instantiation

  // Domain Title and Menu
  static const domainTitle = 'Memory';

  // Menu Buttons
  static const shortVerbalMemoryButton = 'Short Verbal Memory Test';
  static const tenWordVerbalRecallButton = '10-Word Verbal Recall';
  static const visualWorkingMemoryButton = 'Visual Working Memory';
  static const visualShortTermMemoryButton = 'Visual Short-Term Memory';
  static const semanticMemoryButton = 'Semantic memory';

  // Short Verbal Memory Test
  static const shortVerbalTitle = 'Short Verbal Memory Test';
  static const shortVerbalPatientInstruction1 =
      '"I would like you to remember a name and address. Listen carefully as I will say it only once. Are you ready?"';
  static const shortVerbalPatientInstruction2 =
      '"Peter Black, 25 Market Close, Northam, Wheatbelt. Can you repeat that?"';
  static const shortVerbalPatientReminder =
      '"Remember the name and address as I will ask for it later."';
  static const shortVerbalDelayedInstruction =
      '"Tell me the name and address that you learned earlier."';
  static const shortVerbalCuedInstruction = '"Did I ask you to remember...?"';
  static const shortVerbalTapWordsInstruction = 'Tap on words correctly recalled.';
  static const shortVerbalRepeatInstruction =
      'If the patient is able to recall without error then continue. If unable, then the name and address can be repeated up to 3 times asking for recall each time. This is not scored.';
  static const shortVerbalDistractionInstruction =
      'Allow about 5 minutes to pass by using distraction';
  static const shortVerbalCuedExaminerInstruction =
      'Test for cued recall by giving alternatives as indicated below.';
  static const shortVerbalCuedTapInstruction =
      'Read 2 alternatives and target word.\nTap on words correctly recalled.';
  static const shortVerbalRecognitionMemoryTitle = 'Name and Address: Recognition Memory';
  static const shortVerbalContinueDelayed = 'Continue to Delayed Recall';
  static const shortVerbalContinueCued = 'Continue to Cued Recall';
  static const shortVerbalNoErrors = 'No errors';
  static const shortVerbalOneError = '1 error';
  static const shortVerbalMoreThanOneError = '> 1 error';

  // 10-Word Verbal Recall
  static const tenWordWorkingMemoryTitle = 'Working Memory';
  static const tenWordIntermissionTitle = 'Word Intermission';
  static const tenWordShortTermTitle = 'Short-Term Memory';
  static const tenWordMemoryTestTitle = 'Memory Test';
  static const tenWordResultsTitle = 'Results';
  static const tenWordVerbalTrial1 = 'Verbal Trial 1';
  static const tenWordVerbalTrial2 = 'Verbal Trial 2';
  static const tenWordVerbalTrial3 = 'Verbal Trial 3';
  static const tenWordDelayedRecall = 'Verbal Delayed Recall';
  static const tenWordRecognition = 'Verbal Recognition';
  static const tenWordScrollInstruction = 'Scroll down to reveal more instructions';
  static const tenWordTrial1PatientInstruction =
      '"I am going to read you a list of 10 words. Remember these words, as I will ask you what you can remember afterwards. Please repeat each word after I have said it, so that I can be sure that you have heard it correctly. Do you understand? Are you ready? Let\'s go!"';
  static const tenWordRepeatWordInstruction =
      'If the patient does not repeat the word say: "Please repeat the word." Read the words from left to right. Carry on with the rest of the list.';
  static const tenWordWhatWereThoseWords = '"What were those words?"';
  static const tenWordReadWordsInstruction =
      'Read the words aloud again from left to right, asking for repetition after every word.';
  static const tenWordTapRecalledInstruction = 'Tap on each word correctly recalled.';
  static const tenWordRememberLaterInstruction =
      '"Now try to remember the words because I will ask you again later."';
  static const tenWordIntermissionInstruction =
      'Allow about 5 minutes to pass by using distraction tasks such as Months Backwards, Design Fluency and/or Luria Alternating Hand Movements.';
  static const tenWordDelayedRecallInstruction =
      '"Tell me the words you learned during this memory test."';
  static const tenWordRecognitionPatientInstruction =
      '"I am now going to read a list of words. Some of the words are from the list that I asked you to remember and some of the words are new. Say yes if you recognise the word and no if it was not in the list I asked you to memorise. If you don\'t know the answer just guess."';
  static const tenWordRecognitionExaminerInstruction =
      'The instructions may be repeated if forgotten. To select correct responses, tap on Yes or No for each word. (Words from the original memory list are in BOLD.)';
  static const tenWordScoreSummary = 'Score Summary';
  static const tenWordWorkingMemoryLabel = 'Working Memory:';
  static const tenWordShortTermMemoryLabel = 'Short-Term Memory:';

  // Visual Working Memory
  static const visualWorkingTitle = 'Visual Working Memory';
  static const visualWorkingSubtitle = 'Visual - Copy';
  static const visualWorkingPrepareInstruction =
      'Prepare by having available 3 sheets of blank paper. The patient draws each figure on a separate sheet. Tap on the picture below to enlarge.';
  static const visualWorkingPatientInstruction =
      '"I will show you a sketch for 10 seconds. Try to memorise it during this time. I will then remove it and we will wait 10 seconds. Then draw what you can remember. Ready?"';
  static const visualWorkingVisuospatialTitle = 'Visuospatial Working Memory';
  static const visualWorkingTapToEnlarge = 'Tap image to enlarge';
  static const visualWorkingCloseHint = 'Tap anywhere or press X to close';

  // Visual Short-Term Memory
  static const visualShortTermTitle = 'Visual Short-Term Memory';
  static const visualShortTermSubtitle = 'Visual - 3 Shapes';
  static const visualShortTermDelayInstruction =
      'Allow 5 minutes or more to pass before testing recall of the line drawings shown in Visual Working Memory.';
  static const visualShortTermPatientInstruction =
      '"Earlier I showed you some drawings to test your memory. Can you still remember them? Please draw what you can remember here."';
  static const visualShortTermProvideBlankPaper =
      'Provide the patient with a blank sheet of paper.';

  // Visual Memory Scoring Table Headers
  static const visualMemoryImageHeader = 'Image';
  static const visualMemoryNoMistakes = 'No Mistakes';
  static const visualMemoryFewOmissions = 'Few Omissions';
  static const visualMemoryPoor = 'Poor';
  static const visualMemoryNoDrawing = 'No Drawing';
  static const visualMemoryImage1 = 'Image 1';
  static const visualMemoryImage2 = 'Image 2';
  static const visualMemoryImage3 = 'Image 3';

  // Semantic Memory
  static const semanticTitle = 'Semantic memory';
  static const semanticTapInstruction = 'Tap on the button to log answer';
  static const semanticScoringNote =
      'Most people will be able to give a correct answer for 3 or more of the questions.';
}
