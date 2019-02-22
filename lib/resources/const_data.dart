const String appName = "Midland Cognitive Assessment";
const String disclaimer =
    "The Midland Cognitive Assessment App does not provide medical advice and cannot replace good clinical practice. It is intended for health professionals familiar with this type of assessment. You use this App as is and at your own risk. You are strongly encouraged to first read the Full Instructions and Teaching Booklet.";
const String disclaimer2 = "The midland cognitive assessment app is intended for use by health professionals familiar with this type of cognitive assessment. It does not provide medical advice and cannot replace good clinical practice. It should be used at your own discretion. You are strongly encouraged to first read the full instructions and teaching booklet.";
const String testDescription = "Task Description:";
const String testToPatient = "To Patient:";
const String testResponse = "Response:";

const String appDescription =
    "The Midland Cognitive Assessment (MICA) is a collection of cognitive tasks that can be done in full or in part. Emphasis is on cognitive domain assessment and not on total scores. For full instructions see the accompanying booklet - Bedside Cognitive Assessment.";
const String bookletButton = "Bedside Cognitive Assessment Booklet";
const String fullTestButton = "Start Full Test";
const String fullTestText =
    "Ensure that all testing is done in a quiet environment without any disturbance. You will need two blank sheets of A4 paper and a pen or pencil.";
const String startTesting =
    "We are now going to do some tests of your memory and thinking. Some of the tests will be easy and others difficult. Just try your best. Any questions?";

const String testLanguageComprehension = "Language Comprehension";
const String testLanguageComprehensionDetails =
    "Evaluate comprehension of spoken language by using a 3-stage command.";
const String testLanguageComprehensionToPatient =
    "\"Can you point with your finger to the ceiling, floor and the door.\"";
const String testLanguageComprehensionResponse =
    "Note the response of the patient and score as below.";
const String testLanguageComprehensionResponseNormal =
    "Normal - 3 stages complete without an error";
const String testLanguageComprehensionResponseEquivocal =
    "Equivocal - Some difficulty";
const String testLanguageComprehensionResponseImpaired =
    "Impaired - 1 or more clear errors";

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

const String testTenWordRecallTrialOne = "Ten Word Recall Trial 1";
const String instructionsTenWordRecallTrialOnePaient1 =
    "\"I am going to read you a list of 10 words. Remember these words, as I will ask you what you can remember after I have finished reading the list to you. Please repeat each word after I have said it, so that I can be sure that you heard it correctly. Do you understand? Are you ready? Let's go!\"";
const String instructionsTenWordRecallTrialOneHealthworker1 =
    "If the patient does not repeat the word say: \“Please repeat the word.\” Carry on with the rest of the list. Tap on each word correctly recalled.";
const String instructionsTenWordRecallTrialOnePatient2 =
    "\“What were those words?\” ";
const String instructionsTenWordRecallTrialOneHealthworker2 =
    "Tap on each word correctly recalled:";

const String testTenWordRecallTrialTwo = "Ten Word Recall Trial 2";
const String instructionsTenWordRecallTrialTwoHealthworker1 =
    "Read the words again, asking for repetition after every word.";
const String instructionsTenWordRecallTrialTwoPatient1 =
    "\“What were those words?\”";
const String instructionsTenWordRecallTrialTwoHealthworker2 =
    "Tap on each word correctly recalled.";
const String instructionsTenWordRecallTrialTwoPatient2 =
    "\“Now remember the words because I will ask you later for it.\"";

const String testVisuospatialPraxis = "Visuospatial & Praxis";
const String testVisuospatialPraxisDetails =
    "Assess the ability to copy line drawings. Swipe to the left to show the following 3 pictures to the patient.";
const String testVisuospatialPraxisToPatient = "\"Copy these figures.\"";
const String testVisuospatialPraxisResponse =
    " Do not warn about delayed recall. Observe how the patient performs the copy task and take this information into account when scoring.";
const String testVisuospatialPraxisScoring = "Score each drawing:";
const String testVisuospatialPraxisResponseNormal = "3 Points = No mistakes";
const String testVisuospatialPraxisResponseEquivocal =
    "2 Points = Few Omissions";
const String testVisuospatialPraxisResponseImpaired = "1 Point = Poor";
const String testVisuospatialPraxisResponseFubar = "0 Point = No drawing";

const String testAttention = "Attention";
const String testAttentionDetails = "";
const String testAttentionToPatient = "\"I am going to read you a long series of letters. Whenever you hear the letter A, tap your hand like this.\” Indicate tapping movement. For all other letters, do not tap. ";
const String testAttentionResponse = "A mistake is an omission or inclusion.";
const String testAttentionResponseNormal =
    "Normal = no mistakes.";
const String testAttentionResponseEquivocal =
    "Equivocal = 1 mistake.";
const String testAttentionResponseImpaired =
    "Impaired = > 1 mistake.";