/// Validation constants for MICA test scores.
/// Used for debug assertions to catch invalid values during development.
class ScoreValidation {
  ScoreValidation._();

  // Radio values (Normal=0, Equivocal=1, Impaired=2)
  static const int radioMin = 0;
  static const int radioMax = 2;

  // Ten Word Recall trial scores (0-10 words)
  static const int tenWordTrialMin = 0;
  static const int tenWordTrialMax = 10;

  // Ten Word Delay recall (0-10 words)
  static const int tenWordDelayMin = 0;
  static const int tenWordDelayMax = 10;

  // Image scores (visuospatial praxis, visual memory) - 0=perfect, 3=worst
  static const int imageScoreMin = 0;
  static const int imageScoreMax = 3;

  // Attention counters (30 letters in the vigilance test)
  static const int attentionCounterMin = 0;
  static const int attentionCounterMax = 30;

  // Clock Drawing Test (5-point criteria)
  static const int clockDrawingMin = 0;
  static const int clockDrawingMax = 5;

  // Short Verbal Memory Test (name/address - 7 items)
  static const int shortVerbalMemoryMin = 0;
  static const int shortVerbalMemoryMax = 7;

  // Picture Naming Test (10 pictures)
  static const int pictureNamingMin = 0;
  static const int pictureNamingMax = 10;

  // Ten Word Recognition Test (10 words in list + 10 not in list = 20 total)
  static const int recognitionInListMin = 0;
  static const int recognitionInListMax = 10;
  static const int recognitionNotInListMin = 0;
  static const int recognitionNotInListMax = 10;
  static const int recognitionTotalMin = 0;
  static const int recognitionTotalMax = 20;

  // Finger Perception Test patterns (each pattern scored 0-2)
  static const int fingerPerceptionPatternMin = 0;
  static const int fingerPerceptionPatternMax = 2;
  static const int fingerPerceptionTotalMin = 0;
  static const int fingerPerceptionTotalMax = 14; // 7 patterns * 2

  // Astereognosis scoring (binary for each hand)
  static const int astereognosisMin = 0;
  static const int astereognosisMax = 2;

  // Visual identification scoring
  static const int visualIdentificationMin = 0;
  static const int visualIdentificationMax = 2;

  // Semantic memory score
  static const int semanticMemoryMin = 0;
  static const int semanticMemoryMax = 2;

  // Animal naming and lexical fluency counts (practical limits)
  static const int fluencyCountMin = 0;
  static const int fluencyCountMax = 100; // Generous upper limit

  // Design fluency, finger nose, tap, alternating sequences, luria, serial
  static const int executiveRadioMin = 0;
  static const int executiveRadioMax = 2;

  // Helper methods for validation

  /// Validates a radio value (N=0, E=1, I=2)
  static bool isValidRadioValue(int value) {
    return value >= radioMin && value <= radioMax;
  }

  /// Validates a ten word trial score (0-10)
  static bool isValidTenWordTrialScore(int value) {
    return value >= tenWordTrialMin && value <= tenWordTrialMax;
  }

  /// Validates an image score (0-3)
  static bool isValidImageScore(int value) {
    return value >= imageScoreMin && value <= imageScoreMax;
  }

  /// Validates attention counter (0-30)
  static bool isValidAttentionCounter(int value) {
    return value >= attentionCounterMin && value <= attentionCounterMax;
  }

  /// Validates clock drawing score (0-5)
  static bool isValidClockDrawingScore(int value) {
    return value >= clockDrawingMin && value <= clockDrawingMax;
  }

  /// Validates short verbal memory scores (0-7)
  static bool isValidShortVerbalMemoryScore(int value) {
    return value >= shortVerbalMemoryMin && value <= shortVerbalMemoryMax;
  }

  /// Validates picture naming scores (0-10)
  static bool isValidPictureNamingScore(int value) {
    return value >= pictureNamingMin && value <= pictureNamingMax;
  }

  /// Validates finger perception pattern score (0-2)
  static bool isValidFingerPerceptionPattern(int value) {
    return value >= fingerPerceptionPatternMin &&
        value <= fingerPerceptionPatternMax;
  }

  /// Validates finger perception total (0-14)
  static bool isValidFingerPerceptionTotal(int value) {
    return value >= fingerPerceptionTotalMin &&
        value <= fingerPerceptionTotalMax;
  }

  /// Validates fluency count (0-100)
  static bool isValidFluencyCount(int value) {
    return value >= fluencyCountMin && value <= fluencyCountMax;
  }

  /// Validates that correct <= total for relationship validation
  static bool isValidCorrectTotal(int correct, int total) {
    return correct >= 0 && total >= 0 && correct <= total;
  }

  /// Validates attention correct + mistakes <= 30
  static bool isValidAttentionSum(int correct, int mistakes) {
    return correct >= 0 &&
        mistakes >= 0 &&
        (correct + mistakes) <= attentionCounterMax;
  }
}
