const String appName = "Midland Cognitive Assessment";
const String disclaimer =
    "The Midland Cognitive Assessment App does not provide medical advice and cannot replace good clinical practice. It is intended for health professionals familiar with this type of assessment. You use this App as is and at your own risk. You are strongly encouraged to first read the Full Instructions and Teaching Booklet.";
const String disclaimer2 =
    "The Midland Cognitive Assessment App is intended for use by health professionals familiar with this type of cognitive assessment. It does not provide medical advice and cannot replace good clinical practice. It should be used at your own discretion. You are strongly encouraged to first read the full instructions and teaching booklet.";

const String disclaimer3 =
    "The following abbreviations are used:\nN = Normal, E = Equivocal, I = Impaired\n\nCut scores are estimates only.";
const String testDescription = "Task Description:";
const String testToPatient = "To Patient:";
const String testResponse = "Response:";

const String appDescription =
    "The Midland Cognitive Assessment (MICA) is a collection of cognitive tasks that can be done in full or in part. Emphasis is on cognitive domain assessment and not on a total score. For full instructions see the accompanying booklet - Bedside Cognitive Assessment.";
const String bookletButton = "Bedside Cognitive Assessment Booklet";
const String fullTestButton = "Start Full Test";
const String fullTestText =
    "Ensure that all testing is done in a quiet environment without any disturbance. You will need two blank sheets of A4 paper and a pen or pencil.";
const String startTesting =
    "We are now going to do some tests of your memory and thinking. Some of the tests will be easy and others difficult. Just try your best. Any questions?";

const String testLanguageComprehension = "Language";
const String testLanguageComprehensionSubtitle = "Comprehension";
const String testLanguageComprehensionDetails =
    "Evaluate comprehension by using a 3-stage command.";
const String testLanguageComprehensionToPatient =
    "\"Can you point with your finger to the ceiling, the floor and the door.\"";
const String testLanguageComprehensionResponse =
    "Note the response of the patient and score as below.";
const String testLanguageComprehensionResponseNormal =
    "3 stages complete without an error";
const String testLanguageComprehensionResponseEquivocal = "Some difficulty";
const String testLanguageComprehensionResponseImpaired =
    "1 or more clear errors";

const List<String> attentionList = [
  "A",
  "L",
  "T",
  "A",
  "A",
  "D",
  "A",
  "R",
  "S",
  "N",
  "A",
  "G",
  "A",
  "A",
  "A",
  "K",
  "P",
  "A",
  "T",
  "C",
  "A",
  "A",
  "P",
  "A",
  "L",
  "R",
];

const List<String> tenWordRecallList = [
  "CARROT",
  "BOAT",
  "LION",
  "EYE",
  "JUG",
  "CAT",
  "SOUP",
  "LEG",
  "HOUSE",
  "TICKET"
];

const List<String> tenWordRecallList2 = [
  "LION",
  "CARROT",
  "BOAT",
  "CAT",
  "EYE",
  "JUG",
  "HOUSE",
  "SOUP",
  "LEG",
  "TICKET"
];

const List<String> tenWordRecallList3 = [
  "SOUP",
  "TICKET",
  "BOAT",
  "JUG",
  "EYE",
  "CAT",
  "HOUSE",
  "LION",
  "LEG",
  "CARROT"
];

const List<String> tenWordMemoryList = [
  "CARROT",
  "ONION",
  "BUG",
  "JUG",
  "SHIP",
  "BOAT",
  "LION",
  "GOAT",
  "SPY",
  "EYE",
  "SOUP",
  "BUTTER",
  "BAT",
  "ARM",
  "CAT",
  "LEG",
  "MOUSE",
  "TICKET",
  "HOUSE",
  "BUCKET"
];

const String testTenWordRecallTrialOne = "Working Memory";
const String testTenWordRecallTrialOneSubtitle = "Verbal Trial 1";
const String instructionsTenWordRecallTrialOnePaient1 =
    "\"I am going to read you a list of 10 words. Remember these words, as I will ask you what you can remember afterwards. Please repeat each word after I have said it, so that I can be sure that you have heard it correctly. Do you understand? Are you ready? Let's go!\"";
const String instructionsTenWordRecallTrialOneHealthworker1 =
    "If the patient does not repeat the word say: \“Please repeat the word.\” Read the words from left to right. Carry on with the rest of the list.";
const String instructionsTenWordRecallTrialOnePatient2 =
    "\“What were those words?\” ";
const String instructionsTenWordRecallTrialOneHealthworker2 =
    "Tap on each word correctly recalled.";

const String testTenWordRecallTrialTwo = "Short-Term Memory";
const String testTenWordRecallTrialTwoSubtitle = "Verbal Trial 2";
const String instructionsTenWordRecallTrialTwoHealthworker1 =
    "Read the words aloud again from left to right, asking for repetition after every word.";
const String instructionsTenWordRecallTrialTwoPatient1 =
    "\“What were those words?\”";
const String instructionsTenWordRecallTrialTwoHealthworker2 =
    "Tap on each word correctly recalled.";
const String instructionsTenWordRecallTrialTwoPatient2 =
    "\“Now try to remember the words because I will ask you again later.\"";

const String testTenWordRecallTrialThree = "Short-Term Memory";
const String testTenWordRecallTrialThreeSubtitle = "Verbal Trial 3";
const String instructionsTenWordRecallTrialThreeHealthworker1 =
    "Read the words aloud again from left to right, asking for repetition after every word.";
const String instructionsTenWordRecallTrialThreePatient1 =
    "\“What were those words?\”";
const String instructionsTenWordRecallTrialThreeHealthworker2 =
    "Tap on each word correctly recalled.";
const String instructionsTenWordRecallTrialThreePatient2 =
    "\“Now try to remember the words because I will ask you again later.\"";

const String testVisuospatialPraxis = "Agnosia and Apraxia";
const String testVisuospatialPraxisSubtitle = "Line Drawing Copy";
const String testVisuospatialPraxisDetails =
    "Assess the ability to copy line drawings. Click on the images to enlarge them before displaying to patient. Do not warn about delayed recall of these drawings.";
const String testVisuospatialPraxisToPatient = "\"Copy these drawings.\"";
const String testVisuospatialPraxisResponse =
    " Do not warn about delayed recall.";
const String testVisuospatialPraxisScoring = "";
const String testVisuospatialPraxisResponseNormal = "3 Points = No mistakes";
const String testVisuospatialPraxisResponseEquivocal =
    "2 Points = Few Omissions";
const String testVisuospatialPraxisResponseImpaired = "1 Point = Poor";
const String testVisuospatialPraxisResponseFubar = "0 Point = No drawing";

const String testAttention = "Attention and Concentration";
const String testAttentionSubtitle = "Vigilance Task";
const String testAttentionDetails =
    "Tap on a letter when patient taps. Double tap on A when patient does not tap on hearing the letter A.";
const String testAttentionToPatient =
    "\"I am going to read you a long series of letters. Whenever you hear the letter A, tap your hand like this.\” Indicate tapping movement. For all other letters do not tap.";
const String testAttentionResponse = "A mistake is an omission or inclusion.";
const String testAttentionResponseNormal = "no mistakes.";
const String testAttentionResponseEquivocal = "1 mistake.";
const String testAttentionResponseImpaired = "> 1 mistake.";

const String testExecutiveAnimalNaming = "Executive";
const String testExecutiveAnimalNamingSubtitle = "Animal Naming Task";
const String testExecutiveAnimalNamingDetails =
    "The patient can name mammals, birds, reptiles or fish. Repetitions are not scored.";
const String testExecutiveAnimalNamingToPatient =
    "\“I am going to give you one minute to name as many animals as possible.\”";
const String testExecutiveAnimalNamingResponse = "";
const String testExecutiveAnimalNamingResponseNormal = "> 14 Names";
const String testExecutiveAnimalNamingResponseEquivocal = "12 - 14 Names";
const String testExecutiveAnimalNamingResponseImpaired = "< 12 Names";

const String testExecutiveLuria = "Executive";
const String testExecutiveLuriaSubtitle = "Luria Alternating Hand Movements";
const String testExecutiveLuriaDetails = "";
const String testExecutiveLuriaToPatient =
    "\"Place both hands on the table like I do. Watch me carefully because I want you to do the same as I am doing. Can you see that I am making a fist with one hand? Now swap the hands over. Can you do that as fast as you can?\”";
const String testExecutiveLuriaResponse = "";
const String testExecutiveLuriaResponseNormal = "3 cycles without any mistakes";
const String testExecutiveLuriaResponseEquivocal = "1-2 cycles";
const String testExecutiveLuriaResponseImpaired =
    "Not being able to complete the task.";

const String testExecutiveSerial = "Executive";
const String testExecutiveSerialSubtitle = "Serial Order Reversal Task";
const String testExecutiveSerialDetails =
    "Allow person to complete the sequence January to December.";
const String testExecutiveSerialToPatient1 =
    "\”Say the months of the year starting with January.\"";
const String testExecutiveSerialToPatient2 =
    "\"Now start with December and go backwards.\”";
const String testExecutiveSerialResponse =
    "Stop the person when he reaches July or makes 2 or more mistakes.";
const String testExecutiveSerialResponseNormal = "No errors";
const String testExecutiveSerialResponseEquivocal = "1 error";
const String testExecutiveSerialResponseImpaired = "> 1 error";

const String testShortTermMemory = "Short-Term Memory";
const String testShortTermMemorySubtitle = "Verbal";
const String testShortTermMemoryDetails = "Orientation.";
const String testShortTermMemoryToPatient = "Ask the patient the following:";
const String testShortTermMemoryResponse =
    "Date can be +/- one day, the rest must be exact.";
const String testShortTermMemoryResponseNormal = "5 correct";
const String testShortTermMemoryResponseEquivocal = "4 correct";
const String testShortTermMemoryResponseImpaired = "< 4 correct";

const String testPraxis = "Praxis";
const String testPraxisSubtitle = "";
const String testPraxisDetails = "Test both hands.";
const String testPraxisToPatient =
    "\“Take this pen and rotate it with your fingers as fast as you can.\”";
const String testPraxisResponse = "";
const String testPraxisResponseNormal = "no errors";
const String testPraxisResponseEquivocal = "some difficulty";
const String testPraxisResponseImpaired = "clear difficulty";

const String testTenWordDelayedRecall = "Short-Term Memory";
const String testTenWordDelayedRecallSubtitle = "Verbal Delayed Recall";
const String instructionDelayedRecallPatient1 =
    "To Patient: \“What were the words I asked you to remember earlier?\”";
const String instructionDelayedRecallHealthworker1 =
    "Healthworker: Tap on each word correctly recalled:";

const String testTenWordRecognition = "Short-Term Memory";
const String testTenWordRecognitionSubtitle = "Verbal Recognition";
const String instructionsWordRecognitionHealthworker1 =
    "Healthworker: Scroll down to see all the words.";
const String instructionsWordRecognitionPatient1 =
    "To Patient: \"I am now going to read a list of words. Some of the words are from the list that I asked you to remember and some of the words are new. Say yes if you recognise the word and no if it was not in the list I asked you to memorise. If you don’t know the answer just guess.\"";
const String instructionsWordRecognitionHealthworker2 =
    "Healthworker: The instructions may be repeated if forgotten.To select correct responses, tap on Yes or No for each word. (Words from the original memory list are in";
const String instructionsWordRecognitionHealthworker3 = " BOLD";
const String instructionsWordRecognitionHealthworker4 = ".)";

const String testShortTermMemoryVisual = "Short-Term Memory";
const String testShortTermMemoryVisualSubtitle = "Visual Recall";
const String testShortTermMemoryVisualDetails = "Visual recall.";
const String testShortTermMemoryVisualToPatient =
    "\“Earlier, you copied three pictures. Can you remember them? Can you draw them here?\”";
const String testShortTermMemoryVisualResponse =
    "Provide the patient with a blank sheet of paper.";
const String testShortTermMemoryVisualResponseNormal = "no mistakes";
const String testShortTermMemoryVisualResponseEquivocal = "few omissions";
const String testShortTermMemoryVisualResponseImpaired = "poor recall";
const String testShortTermMemoryVisualResponseFubar =
    "a failure to recall anything.";

const String testAnomiaAgnosia = "Anomia & Agnosia";
const String testAnomiaAgnosiaSubtitle = "";
const String testAnomiaAgnosiaDetails =
    "Anomia: Cannot name picture.\nAgnosia: Cannot describe object.\n Click on image to enlarge it.";
const String testAnomiaAgnosiaToPatient = "\"Name the following pictures.\”";
const String testAnomiaAgnosiaResponse = "Anomia: Cannot name picture.";
const String testAnomiaAgnosiaResponse2 = "Agnosia: Cannot describe object.";
const String testAnomiaAgnosiaResponseNormal = "All correct";
const String testAnomiaAgnosiaResponseEquivocal = "1 mistake";
const String testAnomiaAgnosiaResponseImpaired = "> 1 mistake";

const List<String> imageURL = [
  "./images/dice.png",
  "./images/glass.png",
  "./images/guitar.png",
  "./images/scale.png",
  "./images/stapler.png"
];

const String testExecutive = "Executive";
const String testExecutiveSubtitle = "Design Fluency";
const String testExecutiveDetails =
    "Draw the following two examples on the same paper that the patient will use. Count the lines from 1 - 4 while you are drawing.";
const String testExecutiveToPatient =
    "\“You have one minute to draw anything using four lines. The drawings must be different and I must be able to count the lines. I will give you two examples. Do you have any questions? Your minute starts now.\”";
const String testExecutiveResponse = "";
const String testExecutiveResponseNormal = "7 drawings";
const String testExecutiveResponseEquivocal = "5 - 7 drawings";
const String testExecutiveResponseImpaired = "> 5 drawings";

const String testSpokenLanguage = "Spoken Language";
const String testSpokenLanguageSubtitle = "";
const String testSpokenLanguageDetails = "";
const String testSpokenLanguageToPatient = "";
const String testSpokenLanguageResponse =
    "Estimate spoken language ability by evaluating speech. It should be clear, fluent and understandable.";
const String testSpokenLanguageResponseNormal = "normal speech";
const String testSpokenLanguageResponseEquivocal = "equivocal";
const String testSpokenLanguageResponseImpaired = "definite impairment";

const List<String> imageURLPraxis = [
  "./images/block_one.png",
  "./images/block_two.png",
  "./images/block_three.png"
];

const String summary = "Summary";

const List<Map<String, String>> videos = [
  {
    "title": "Alternating Numbers & Letters",
    "video": "AlternatingNumLetters.m4v"
  },
  {"title": "Animal Naming", "video": "AnimalNaming.m4v"},
  {"title": "Clock Drawing", "video": "ClockDrawing.m4v"},
  {"title": "Coin Rotation", "video": "CoinRotation.m4v"},
  {"title": "Comprehension", "video": "Comprehension3Objects.m4v"},
  {"title": "Design Fluency", "video": "DesignFluency.m4v"},
  {"title": "Digit Span", "video": "DigitSpan.m4v"},
  {"title": "Finger Perception", "video": "FingerID.m4v"},
  {"title": "Finger-Nose Task", "video": "FingerNose.m4v"},
  {"title": "Ideational Apraxia", "video": "FoldingLetter.m4v"},
  {"title": "Four Stage Command", "video": "FourStageCommand.m4v"},
  {"title": "Luria Hand Movement I", "video": "LuriaI.m4v"},
  {"title": "Luria Hand Movement II", "video": "LuriaII.m4v"},
  {"title": "Ideomotor Apraxia", "video": "MakingTea.m4v"},
  {"title": "Naming", "video": "Naming.m4v"},
  {"title": "Object Identification", "video": "ObjectIDTouch.m4v"},
  {"title": "Serial 7's", "video": "Serial7s.m4v"},
  {"title": "Tap Task", "video": "TappingTask.m4v"},
  {"title": "Delayed Recall", "video": "VerbalMemDelayedRecog.m4v"},
  {"title": "Vigilance Test", "video": "VigilanceTest.m4v"},
  {"title": "Verbal Recall", "video": "WordListImRec2.m4v"},
];

const String resourceButtonBooklet = "Bedside Cognitive Assessment Booklet";
const String resourceButtonVideo = "Educational Videos";
