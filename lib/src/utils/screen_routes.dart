import 'package:flutter/material.dart';
import 'package:mica/src/domain_testing/domain_select.dart';
// Domain main screens
import 'package:mica/src/domain_testing/attention_concentration/domain_attention_concentration.dart';
import 'package:mica/src/domain_testing/language/language_assessment.dart';
import 'package:mica/src/domain_testing/memory/memory_assessment.dart';
import 'package:mica/src/domain_testing/praxis/praxis_assessment.dart';
import 'package:mica/src/domain_testing/gnosis/gnosis_assessment.dart';
import 'package:mica/src/domain_testing/executive_function/executive_function_assessment.dart';

// Initial linear flow screens
import 'package:mica/src/patient_information.dart';
import 'package:mica/src/ten_word_recall_task_trial_one.dart';
import 'package:mica/src/ten_word_recall_task_trial_two.dart';
import 'package:mica/src/ten_word_recall_task_trial_three.dart';
import 'package:mica/src/visuospatial_praxis.dart';
import 'package:mica/src/attention.dart';
import 'package:mica/src/ten_word_recognition.dart';
import 'package:mica/src/executive_animal_naming.dart';
import 'package:mica/src/executive_luria.dart';
import 'package:mica/src/shortterm_memory_visual.dart';
import 'package:mica/src/anomia_agnosia.dart';
import 'package:mica/src/summary/summary_with_provider_refactored.dart';

// Attention sub-tests
import 'package:mica/src/domain_testing/attention_concentration/domain_vigilance.dart';
import 'package:mica/src/domain_testing/attention_concentration/domain_language.dart';
import 'package:mica/src/domain_testing/attention_concentration/domain_digit.dart' show Digit;
import 'package:mica/src/domain_testing/attention_concentration/domain_serial_seven.dart' show SerialSeven;
import 'package:mica/src/domain_testing/attention_concentration/domain_spell_word.dart' show SpellWordBarkwards;

// Language sub-tests
import 'package:mica/src/domain_testing/language/spontaneous_speech.dart';
import 'package:mica/src/domain_testing/language/comprehension_three_stage.dart';
import 'package:mica/src/domain_testing/language/comprehension_moving_objects.dart';
import 'package:mica/src/domain_testing/language/repetition.dart';
import 'package:mica/src/domain_testing/language/naming.dart';
import 'package:mica/src/domain_testing/language/reading.dart';
import 'package:mica/src/domain_testing/language/writing.dart';
import 'package:mica/src/domain_testing/language/object_naming.dart';
import 'package:mica/src/domain_testing/language/picture_naming.dart';

// Memory sub-tests
import 'package:mica/src/domain_testing/memory/semantic_memory.dart';
import 'package:mica/src/domain_testing/memory/short_verbal_memory_test.dart';
import 'package:mica/src/domain_testing/memory/ten_word_verbal_recall.dart';
import 'package:mica/src/domain_testing/memory/visual_short_term_memory.dart';
import 'package:mica/src/domain_testing/memory/visual_working_memory.dart';

// Praxis sub-tests
import 'package:mica/src/domain_testing/praxis/limb_kinetic_apraxia.dart';
import 'package:mica/src/domain_testing/praxis/ideomotor_apraxia.dart';
import 'package:mica/src/domain_testing/praxis/ideational_apraxia.dart';
import 'package:mica/src/domain_testing/praxis/oral_apraxia.dart';
import 'package:mica/src/domain_testing/praxis/dressing_apraxia.dart';
import 'package:mica/src/domain_testing/praxis/line_drawing.dart';

// Gnosis sub-tests
import 'package:mica/src/domain_testing/gnosis/clock_drawing_test.dart';
import 'package:mica/src/domain_testing/gnosis/identify_objects_visually.dart';
import 'package:mica/src/domain_testing/gnosis/identify_objects_by_touch.dart';
import 'package:mica/src/domain_testing/gnosis/finger_perception_test.dart';

// Executive Function sub-tests
import 'package:mica/src/domain_testing/executive_function/luria_alternating_hand_movements.dart';
import 'package:mica/src/domain_testing/executive_function/luria_fist_edge_palm_movement.dart';
import 'package:mica/src/domain_testing/executive_function/animal_naming_task.dart';
import 'package:mica/src/domain_testing/executive_function/lexical_fluency_test.dart';
import 'package:mica/src/domain_testing/executive_function/design_fluency_task.dart';
import 'package:mica/src/domain_testing/executive_function/finger_nose_task.dart';
import 'package:mica/src/domain_testing/executive_function/tap_task.dart';
import 'package:mica/src/domain_testing/executive_function/alternating_sequences.dart';
import 'package:mica/src/domain_testing/executive_function/months_of_year_backwards.dart';

/// Route identifiers for screen persistence and navigation.
///
/// These constants are used to track which screen the user was on
/// when they exit the app, allowing the Resume feature to navigate
/// back to the correct screen.
class ScreenRoutes {
  // Prevent instantiation
  ScreenRoutes._();

  // ===== Initial Linear Flow =====
  static const String patientInformation = 'patient_information';
  static const String tenWordRecallTrialOne = 'ten_word_recall_trial_one';
  static const String tenWordRecallTrialTwo = 'ten_word_recall_trial_two';
  static const String tenWordRecallTrialThree = 'ten_word_recall_trial_three';
  static const String visuospatialPraxis = 'visuospatial_praxis';
  static const String attentionOld = 'attention_old';  // The old linear flow attention screen
  static const String executiveAnimalNamingOld = 'executive_animal_naming_old';  // Old linear flow
  static const String executiveLuria = 'executive_luria';  // Old linear flow
  static const String tenWordRecognition = 'ten_word_recognition';
  static const String shorttermMemoryVisual = 'shortterm_memory_visual';
  static const String anomiaAgnosia = 'anomia_agnosia';
  static const String summary = 'summary';

  // ===== Domain Selection =====
  static const String domainSelect = 'domain_select';

  // ===== Attention & Concentration =====
  static const String attention = 'attention';
  static const String attentionVigilance = 'attention_vigilance';
  static const String attentionLanguage = 'attention_language';
  static const String attentionDigit = 'attention_digit';
  static const String attentionSerialSeven = 'attention_serial_seven';
  static const String attentionSpellWord = 'attention_spell_word';

  // ===== Language =====
  static const String language = 'language';
  static const String languageSpontaneousSpeech = 'language_spontaneous_speech';
  static const String languageComprehensionThreeStage = 'language_comprehension_three_stage';
  static const String languageComprehensionMoving = 'language_comprehension_moving';
  static const String languageRepetition = 'language_repetition';
  static const String languageNaming = 'language_naming';
  static const String languageReading = 'language_reading';
  static const String languageWriting = 'language_writing';
  static const String languageObjectNaming = 'language_object_naming';
  static const String languagePictureNaming = 'language_picture_naming';

  // ===== Memory =====
  static const String memory = 'memory';
  static const String memorySemanticMemory = 'memory_semantic';
  static const String memoryShortVerbal = 'memory_short_verbal';
  static const String memoryTenWordRecall = 'memory_ten_word_recall';
  static const String memoryVisualShortTerm = 'memory_visual_short_term';
  static const String memoryVisualWorking = 'memory_visual_working';

  // ===== Praxis =====
  static const String praxis = 'praxis';
  static const String praxisLimbKinetic = 'praxis_limb_kinetic';
  static const String praxisIdeomotor = 'praxis_ideomotor';
  static const String praxisIdeational = 'praxis_ideational';
  static const String praxisOral = 'praxis_oral';
  static const String praxisDressing = 'praxis_dressing';
  static const String praxisLineDrawing = 'praxis_line_drawing';

  // ===== Gnosis =====
  static const String gnosis = 'gnosis';
  static const String gnosisClockDrawing = 'gnosis_clock_drawing';
  static const String gnosisIdentifyVisually = 'gnosis_identify_visually';
  static const String gnosisIdentifyByTouch = 'gnosis_identify_by_touch';
  static const String gnosisFingerPerception = 'gnosis_finger_perception';

  // ===== Executive Function =====
  static const String executive = 'executive';
  static const String executiveLuriaAlternating = 'executive_luria_alternating';
  static const String executiveLuriaFistEdgePalm = 'executive_luria_fist_edge_palm';
  static const String executiveAnimalNaming = 'executive_animal_naming';
  static const String executiveLexicalFluency = 'executive_lexical_fluency';
  static const String executiveDesignFluency = 'executive_design_fluency';
  static const String executiveFingerNose = 'executive_finger_nose';
  static const String executiveTap = 'executive_tap';
  static const String executiveAlternatingSequences = 'executive_alternating_sequences';
  static const String executiveMonthsBackwards = 'executive_months_backwards';

  /// Check if a route identifier is valid
  static bool isValidRoute(String? route) {
    if (route == null) return false;
    return _routeBuilders.containsKey(route);
  }

  /// Get a human-readable name for a route
  static String getDisplayName(String? route) {
    switch (route) {
      // Initial linear flow
      case patientInformation:
        return 'Patient Information';
      case tenWordRecallTrialOne:
        return '10-Word Recall Trial 1';
      case tenWordRecallTrialTwo:
        return '10-Word Recall Trial 2';
      case tenWordRecallTrialThree:
        return '10-Word Recall Trial 3';
      case visuospatialPraxis:
        return 'Visuospatial Praxis';
      case attentionOld:
        return 'Attention Assessment';
      case executiveAnimalNamingOld:
        return 'Executive Animal Naming';
      case executiveLuria:
        return 'Executive Luria Test';
      case tenWordRecognition:
        return '10-Word Recognition';
      case shorttermMemoryVisual:
        return 'Visual Short-Term Memory';
      case anomiaAgnosia:
        return 'Anomia and Agnosia';
      case summary:
        return 'Summary';
      case domainSelect:
        return 'Domain Selection';
      // Attention
      case attention:
        return 'Attention & Concentration';
      case attentionVigilance:
        return 'Vigilance Test';
      case attentionLanguage:
        return 'Language Test';
      case attentionDigit:
        return 'Digit Span';
      case attentionSerialSeven:
        return 'Serial Sevens';
      case attentionSpellWord:
        return 'Spell Word';
      // Language
      case language:
        return 'Language';
      case languageSpontaneousSpeech:
        return 'Spontaneous Speech';
      case languageComprehensionThreeStage:
        return 'Three-Stage Comprehension';
      case languageComprehensionMoving:
        return 'Moving Objects Comprehension';
      case languageRepetition:
        return 'Repetition';
      case languageNaming:
        return 'Naming';
      case languageReading:
        return 'Reading';
      case languageWriting:
        return 'Writing';
      case languageObjectNaming:
        return 'Object Naming';
      case languagePictureNaming:
        return 'Picture Naming';
      // Memory
      case memory:
        return 'Memory';
      case memorySemanticMemory:
        return 'Semantic Memory';
      case memoryShortVerbal:
        return 'Short Verbal Memory';
      case memoryTenWordRecall:
        return 'Ten Word Recall';
      case memoryVisualShortTerm:
        return 'Visual Short-Term Memory';
      case memoryVisualWorking:
        return 'Visual Working Memory';
      // Praxis
      case praxis:
        return 'Praxis';
      case praxisLimbKinetic:
        return 'Limb-Kinetic Apraxia';
      case praxisIdeomotor:
        return 'Ideomotor Apraxia';
      case praxisIdeational:
        return 'Ideational Apraxia';
      case praxisOral:
        return 'Oral Apraxia';
      case praxisDressing:
        return 'Dressing Apraxia';
      case praxisLineDrawing:
        return 'Line Drawing';
      // Gnosis
      case gnosis:
        return 'Gnosis';
      case gnosisClockDrawing:
        return 'Clock Drawing';
      case gnosisIdentifyVisually:
        return 'Identify Objects Visually';
      case gnosisIdentifyByTouch:
        return 'Identify Objects by Touch';
      case gnosisFingerPerception:
        return 'Finger Perception';
      // Executive
      case executive:
        return 'Executive Function';
      case executiveLuriaAlternating:
        return 'Luria Alternating Movements';
      case executiveLuriaFistEdgePalm:
        return 'Fist-Edge-Palm';
      case executiveAnimalNaming:
        return 'Animal Naming';
      case executiveLexicalFluency:
        return 'Lexical Fluency';
      case executiveDesignFluency:
        return 'Design Fluency';
      case executiveFingerNose:
        return 'Finger-Nose';
      case executiveTap:
        return 'Tap Task';
      case executiveAlternatingSequences:
        return 'Alternating Sequences';
      case executiveMonthsBackwards:
        return 'Months Backwards';
      default:
        return 'Assessment';
    }
  }

  /// Map of route identifiers to widget builders.
  /// Using builder functions allows for lazy instantiation.
  static final Map<String, Widget Function()> _routeBuilders = {
    // Initial Linear Flow
    patientInformation: () => const PatientInformation(),
    tenWordRecallTrialOne: () => const TenWordRecallTrialOne(),
    tenWordRecallTrialTwo: () => const TenWordRecallTrialTwo(),
    tenWordRecallTrialThree: () => const TenWordRecallTrialThree(),
    visuospatialPraxis: () => const VisuospatialPraxis(),
    attentionOld: () => const Attention(),
    executiveAnimalNamingOld: () => const ExecutiveAnimalNaming(),
    executiveLuria: () => const ExecutiveLuria(),
    tenWordRecognition: () => const TenWordRecognition(),
    shorttermMemoryVisual: () => const ShortTermMemoryVisual(),
    anomiaAgnosia: () => const AnomiaAgnosia(),
    summary: () => const TestSummaryWithProviderRefactored(),

    // Domain Selection
    domainSelect: () => const DomainSelect(),

    // Attention & Concentration
    attention: () => AttentionConcentration(),
    attentionVigilance: () => const DomainVigilance(),
    attentionLanguage: () => const DomainLanguage(),
    attentionDigit: () => const Digit(),
    attentionSerialSeven: () => const SerialSeven(),
    attentionSpellWord: () => const SpellWordBarkwards(),

    // Language
    language: () => const LanguageAssessment(),
    languageSpontaneousSpeech: () => const SpontaneousSpeech(),
    languageComprehensionThreeStage: () => const ComprehensionThreeStage(),
    languageComprehensionMoving: () => const ComprehensionMovingObjects(),
    languageRepetition: () => const Repetition(),
    languageNaming: () => const Naming(),
    languageReading: () => const Reading(),
    languageWriting: () => const Writing(),
    languageObjectNaming: () => const ObjectNaming(),
    languagePictureNaming: () => const PictureNaming(),

    // Memory
    memory: () => const MemoryAssessment(),
    memorySemanticMemory: () => const SemanticMemory(),
    memoryShortVerbal: () => const ShortVerbalMemoryTest(),
    memoryTenWordRecall: () => const TenWordVerbalRecall(),
    memoryVisualShortTerm: () => const VisualShortTermMemory(),
    memoryVisualWorking: () => const VisualWorkingMemory(),

    // Praxis
    praxis: () => const PraxisAssessment(),
    praxisLimbKinetic: () => const LimbKineticApraxia(),
    praxisIdeomotor: () => const IdeomotorApraxia(),
    praxisIdeational: () => const IdeationalApraxia(),
    praxisOral: () => const OralApraxia(),
    praxisDressing: () => const DressingApraxia(),
    praxisLineDrawing: () => const LineDrawing(),

    // Gnosis
    gnosis: () => const GnosisAssessment(),
    gnosisClockDrawing: () => const ClockDrawingTest(),
    gnosisIdentifyVisually: () => const IdentifyObjectsVisually(),
    gnosisIdentifyByTouch: () => const IdentifyObjectsByTouch(),
    gnosisFingerPerception: () => const FingerPerceptionTest(),

    // Executive Function
    executive: () => const ExecutiveFunctionAssessment(),
    executiveLuriaAlternating: () => const LuriaAlternatingHandMovements(),
    executiveLuriaFistEdgePalm: () => const LuriaFistEdgePalmMovement(),
    executiveAnimalNaming: () => const AnimalNamingTask(),
    executiveLexicalFluency: () => const LexicalFluencyTest(),
    executiveDesignFluency: () => const DesignFluencyTask(),
    executiveFingerNose: () => const FingerNoseTask(),
    executiveTap: () => const TapTask(),
    executiveAlternatingSequences: () => const AlternatingSequences(),
    executiveMonthsBackwards: () => const MonthsOfYearBackwards(),
  };

  /// Build a widget for a given route identifier.
  /// Returns DomainSelect as fallback if route is invalid.
  static Widget buildScreen(String? route) {
    final builder = _routeBuilders[route];
    if (builder != null) {
      return builder();
    }
    // Default to DomainSelect if route is invalid
    return const DomainSelect();
  }

  /// Navigate to a screen by route identifier.
  /// Uses pushAndRemoveUntil to maintain consistent navigation behavior.
  static void navigateTo(BuildContext context, String route) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => buildScreen(route)),
      (Route<dynamic> route) => true,
    );
  }
}
