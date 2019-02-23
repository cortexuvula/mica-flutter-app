const String appName = "Midland Cognitive Assessment";
const String disclaimer =
    "The Midland Cognitive Assessment App does not provide medical advice and cannot replace good clinical practice. It is intended for health professionals familiar with this type of assessment. You use this App as is and at your own risk. You are strongly encouraged to first read the Full Instructions and Teaching Booklet.";
const String disclaimer2 =
    "The Midland Cognitive Assessment app is intended for use by health professionals familiar with this type of cognitive assessment. It does not provide medical advice and cannot replace good clinical practice. It should be used at your own discretion. You are strongly encouraged to first read the full instructions and teaching booklet.";
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
    "If the patient does not repeat the word say: \“Please repeat the word.\” Read the words from left to right. Carry on with the rest of the list. Tap on each word correctly recalled.";
const String instructionsTenWordRecallTrialOnePatient2 =
    "\“What were those words?\” ";
const String instructionsTenWordRecallTrialOneHealthworker2 =
    "Tap on each word correctly recalled:";

const String testTenWordRecallTrialTwo = "Ten Word Recall Trial 2";
const String instructionsTenWordRecallTrialTwoHealthworker1 =
    "Read the words again from left to right, asking for repetition after every word.";
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
const String testAttentionToPatient =
    "\"I am going to read you a long series of letters. Whenever you hear the letter A, tap your hand like this.\” Indicate tapping movement. For all other letters, do not tap. ";
const String testAttentionResponse = "A mistake is an omission or inclusion.";
const String testAttentionResponseNormal = "Normal = no mistakes.";
const String testAttentionResponseEquivocal = "Equivocal = 1 mistake.";
const String testAttentionResponseImpaired = "Impaired = > 1 mistake.";

const String testExecutiveAnimalNaming = "Executive";
const String testExecutiveAnimalNamingSubtitle = "Animal Naming Task";
const String testExecutiveAnimalNamingDetails = "";
const String testExecutiveAnimalNamingToPatient = "\“I am going to give you one minute to name as many animals as possible.\”";
const String testExecutiveAnimalNamingResponse = "The patient can name mammals, birds, reptiles or fish. Repetitions are not scored.";
const String testExecutiveAnimalNamingResponseNormal = "> 14 Names";
const String testExecutiveAnimalNamingResponseEquivocal = "12 - 14 Names";
const String testExecutiveAnimalNamingResponseImpaired = "< 12 Names";

const String testExecutiveLuria = "Executive";
const String testExecutiveLuriaSubtitle = "Luria Alternating Hand Movements";
const String testExecutiveLuriaDetails = "";
const String testExecutiveLuriaToPatient = "\"Place both hands on the table like I do. Watch me carefully because I want you to do the same as I am doing. Can you see that I am making a fist with one hand? Now I swap it around. Can you do that as fast as you can?\”";
const String testExecutiveLuriaResponse = "";
const String testExecutiveLuriaResponseNormal = "3 cycles without any mistakes";
const String testExecutiveLuriaResponseEquivocal = "1-2 cycles";
const String testExecutiveLuriaResponseImpaired = "Not being able to complete the task.";

const String testExecutiveSerial = "Executive";
const String testExecutiveSerialSubtitle = "Serial Order Reversal Task";
const String testExecutiveSerialDetails = "";
const String testExecutiveSerialToPatient = "\”Say the months of the year starting with January. Now start with December and go backwards.\”";
const String testExecutiveSerialResponse = "Allow the person to complete the task until December. Stop the person when he reaches July or makes 2 or more mistakes: December November October September August July.";
const String testExecutiveSerialResponseNormal = "No errors";
const String testExecutiveSerialResponseEquivocal = "1 error";
const String testExecutiveSerialResponseImpaired = "> 1 error";