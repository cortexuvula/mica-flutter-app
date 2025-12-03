# MICA Model Expansion - TODO Implementation Plan

**Date:** 2025-12-02
**Status:** Planning Phase
**Impact:** 26 TODO items across 4 modules
**Estimated Effort:** 3-5 hours

---

## Executive Summary

This plan addresses 26 TODO comments across the codebase by expanding `MicaScoreModel` to support granular scoring for:
- **Gnosis Module** (8 TODOs) - NEW module support needed
- **Language Module** (11 TODOs) - Individual test scoring needed
- **Memory Module** (5 TODOs) - Additional test support needed
- **Executive Function Module** (2 TODOs) - Integration with existing setters needed

**Current Model State:**
- 44 fields across 6 domains
- Supports: Executive Function, Attention, Basic Language/Memory/Praxis
- Missing: Granular Gnosis, Language, and Memory test scoring

---

## Phase 1: Model Field Additions

### 1.1 Gnosis Module Fields (NEW)

Add to `MicaScoreModel` after line 61 (after `_agnosia`):

```dart
// Gnosis domain scores
// Finger Perception Test (7 patterns scored)
int _gnosisFingerPerceptionPattern1 = 0;
int _gnosisFingerPerceptionPattern2 = 0;
int _gnosisFingerPerceptionPattern3 = 0;
int _gnosisFingerPerceptionPattern4 = 0;
int _gnosisFingerPerceptionPattern5 = 0;
int _gnosisFingerPerceptionPattern6 = 0;
int _gnosisFingerPerceptionPattern7 = 0;
int _gnosisFingerPerceptionTotal = 0;

// Visual Object Identification (nominal dysphasia vs visual agnosia)
int _gnosisVisualNominalDysphasia = 0;  // Score for naming difficulty
int _gnosisVisualAgnosia = 0;           // Score for recognition difficulty

// Tactile Object Identification (astereognosis)
int _gnosisAstereognosisRight = 0;  // Right hand tactile recognition
int _gnosisAstereognosisLeft = 0;   // Left hand tactile recognition

// Clock Drawing Test (5-point criteria)
int _gnosisClockDrawing = 0;  // Total score 0-5
```

**Rationale:** Gnosis module has 4 distinct tests measuring different aspects of sensory recognition and integration. Each test needs independent scoring to track specific deficits.

### 1.2 Language Module Fields (EXPANSION)

Add to `MicaScoreModel` after line 14 (expand language section):

```dart
// Language domain scores (expanded)
int _languageComprehensionRadioValue = 0;  // EXISTING - keep
int _spokenLanguage = 0;                    // EXISTING - keep

// New granular language test scores
int _languageReading = 0;                   // Reading comprehension score
int _languageRepetition = 0;                // Sentence repetition score
int _languageComprehensionMoving = 0;       // Moving objects comprehension
int _languageWriting = 0;                   // Writing ability score
int _languageObjectNaming = 0;              // Object naming score
int _languageSpontaneousSpeech = 0;         // Spontaneous speech fluency
int _languageComprehensionThreeStage = 0;   // 3-stage command score

// Picture Naming Test (detailed scoring)
int _languagePictureNamingCorrect = 0;      // Number correct
int _languagePictureNamingTotal = 0;        // Total attempted
int _languagePictureAgnosia = 0;            // Picture agnosia score (0-2)
```

**Rationale:** Current model only has 2 generic language fields. Language domain has 7+ distinct tests that measure different aspects (comprehension, production, naming, etc.). Granular scoring enables identification of specific language deficits.

### 1.3 Memory Module Fields (EXPANSION)

Add to `MicaScoreModel` after line 30 (expand visual memory section):

```dart
// Visual memory scores - EXISTING
int _shorttermMemoryVisualImage1 = 0;  // EXISTING - keep
int _shorttermMemoryVisualImage2 = 0;  // EXISTING - keep
int _shorttermMemoryVisualImage3 = 0;  // EXISTING - keep

// New memory test scores
int _memorySemanticScore = 0;           // Semantic memory test score

// Visual Working Memory (immediate recall - same images as STM)
int _memoryVisualWorkingImage1 = 0;
int _memoryVisualWorkingImage2 = 0;
int _memoryVisualWorkingImage3 = 0;

// Short Verbal Memory Test (name/address recall)
int _memoryShortVerbalCorrect = 0;      // Number of correct items
int _memoryShortVerbalTotal = 0;        // Total items tested

// Ten Word Recall (detailed breakdown - expand existing)
// EXISTING: _trialOneScore, _trialTwoScore, _trialThreeScore, _tenWordDelay
// Add recognition test breakdown
int _memoryTenWordRecognitionCorrect = 0;    // Correct identifications
int _memoryTenWordRecognitionFalsePositive = 0;  // Incorrectly identified
```

**Rationale:** Memory module has multiple distinct tests (immediate vs delayed, visual vs verbal, working vs short-term). Current model conflates some of these. Granular fields enable precise tracking of memory type deficits.

---

## Phase 2: Getter Methods

### 2.1 Gnosis Getters

Add after line 122 (after agnosia getters):

```dart
// Getters for gnosis domain scores
int get gnosisFingerPerceptionPattern1 => _gnosisFingerPerceptionPattern1;
int get gnosisFingerPerceptionPattern2 => _gnosisFingerPerceptionPattern2;
int get gnosisFingerPerceptionPattern3 => _gnosisFingerPerceptionPattern3;
int get gnosisFingerPerceptionPattern4 => _gnosisFingerPerceptionPattern4;
int get gnosisFingerPerceptionPattern5 => _gnosisFingerPerceptionPattern5;
int get gnosisFingerPerceptionPattern6 => _gnosisFingerPerceptionPattern6;
int get gnosisFingerPerceptionPattern7 => _gnosisFingerPerceptionPattern7;
int get gnosisFingerPerceptionTotal => _gnosisFingerPerceptionTotal;

int get gnosisVisualNominalDysphasia => _gnosisVisualNominalDysphasia;
int get gnosisVisualAgnosia => _gnosisVisualAgnosia;

int get gnosisAstereognosisRight => _gnosisAstereognosisRight;
int get gnosisAstereognosisLeft => _gnosisAstereognosisLeft;

int get gnosisClockDrawing => _gnosisClockDrawing;
```

### 2.2 Language Getters

Add after line 71 (expand language getters):

```dart
// Getters for language domain scores (expanded)
int get languageReading => _languageReading;
int get languageRepetition => _languageRepetition;
int get languageComprehensionMoving => _languageComprehensionMoving;
int get languageWriting => _languageWriting;
int get languageObjectNaming => _languageObjectNaming;
int get languageSpontaneousSpeech => _languageSpontaneousSpeech;
int get languageComprehensionThreeStage => _languageComprehensionThreeStage;

int get languagePictureNamingCorrect => _languagePictureNamingCorrect;
int get languagePictureNamingTotal => _languagePictureNamingTotal;
int get languagePictureAgnosia => _languagePictureAgnosia;
```

### 2.3 Memory Getters

Add after line 90 (expand memory getters):

```dart
// Getters for memory domain scores (expanded)
int get memorySemanticScore => _memorySemanticScore;

int get memoryVisualWorkingImage1 => _memoryVisualWorkingImage1;
int get memoryVisualWorkingImage2 => _memoryVisualWorkingImage2;
int get memoryVisualWorkingImage3 => _memoryVisualWorkingImage3;

int get memoryShortVerbalCorrect => _memoryShortVerbalCorrect;
int get memoryShortVerbalTotal => _memoryShortVerbalTotal;

int get memoryTenWordRecognitionCorrect => _memoryTenWordRecognitionCorrect;
int get memoryTenWordRecognitionFalsePositive => _memoryTenWordRecognitionFalsePositive;
```

---

## Phase 3: Setter Methods

### 3.1 Gnosis Setters

Add after line 299 (after `setAgnosia`):

```dart
// Gnosis domain setters

/// Set finger perception test scores for all 7 patterns
void setGnosisFingerPerception({
  required int pattern1,
  required int pattern2,
  required int pattern3,
  required int pattern4,
  required int pattern5,
  required int pattern6,
  required int pattern7,
}) {
  _gnosisFingerPerceptionPattern1 = pattern1;
  _gnosisFingerPerceptionPattern2 = pattern2;
  _gnosisFingerPerceptionPattern3 = pattern3;
  _gnosisFingerPerceptionPattern4 = pattern4;
  _gnosisFingerPerceptionPattern5 = pattern5;
  _gnosisFingerPerceptionPattern6 = pattern6;
  _gnosisFingerPerceptionPattern7 = pattern7;

  // Calculate total (sum of all patterns)
  _gnosisFingerPerceptionTotal = pattern1 + pattern2 + pattern3 +
                                  pattern4 + pattern5 + pattern6 + pattern7;

  notifyListeners();
}

/// Set visual object identification scores (nominal dysphasia vs agnosia)
void setGnosisVisualIdentification({
  required int nominalDysphasia,
  required int visualAgnosia,
}) {
  _gnosisVisualNominalDysphasia = nominalDysphasia;
  _gnosisVisualAgnosia = visualAgnosia;
  notifyListeners();
}

/// Set tactile object identification scores (astereognosis)
void setGnosisAstereognosis({
  required int rightHand,
  required int leftHand,
}) {
  _gnosisAstereognosisRight = rightHand;
  _gnosisAstereognosisLeft = leftHand;
  notifyListeners();
}

/// Set clock drawing test score (0-5 scale)
void setGnosisClockDrawing(int score) {
  _gnosisClockDrawing = score;
  notifyListeners();
}
```

### 3.2 Language Setters

Add after line 142 (expand language setters):

```dart
// Language domain setters (expanded)

void setLanguageReading(int score) {
  _languageReading = score;
  notifyListeners();
}

void setLanguageRepetition(int score) {
  _languageRepetition = score;
  notifyListeners();
}

void setLanguageComprehensionMoving(int score) {
  _languageComprehensionMoving = score;
  notifyListeners();
}

void setLanguageWriting(int score) {
  _languageWriting = score;
  notifyListeners();
}

void setLanguageObjectNaming(int score) {
  _languageObjectNaming = score;
  notifyListeners();
}

void setLanguageSpontaneousSpeech(int score) {
  _languageSpontaneousSpeech = score;
  notifyListeners();
}

void setLanguageComprehensionThreeStage(int score) {
  _languageComprehensionThreeStage = score;
  notifyListeners();
}

/// Set picture naming test scores with detailed breakdown
void setLanguagePictureNaming({
  required int correct,
  required int total,
  required int agnosia,
}) {
  _languagePictureNamingCorrect = correct;
  _languagePictureNamingTotal = total;
  _languagePictureAgnosia = agnosia;
  notifyListeners();
}
```

### 3.3 Memory Setters

Add after line 197 (expand memory setters):

```dart
// Memory domain setters (expanded)

void setMemorySemanticScore(int score) {
  _memorySemanticScore = score;
  notifyListeners();
}

/// Set visual working memory scores (immediate recall)
void setMemoryVisualWorking({
  required int image1,
  required int image2,
  required int image3,
}) {
  _memoryVisualWorkingImage1 = image1;
  _memoryVisualWorkingImage2 = image2;
  _memoryVisualWorkingImage3 = image3;
  notifyListeners();
}

/// Set short verbal memory test scores (name/address recall)
void setMemoryShortVerbal({
  required int correct,
  required int total,
}) {
  _memoryShortVerbalCorrect = correct;
  _memoryShortVerbalTotal = total;
  notifyListeners();
}

/// Set ten word recognition test breakdown
void setMemoryTenWordRecognition({
  required int correct,
  required int falsePositive,
}) {
  _memoryTenWordRecognitionCorrect = correct;
  _memoryTenWordRecognitionFalsePositive = falsePositive;
  notifyListeners();
}
```

---

## Phase 4: Update Initialization Methods

### 4.1 Update `initFromTestSummary` Method

**Location:** `lib/src/models/mica_score_model.dart` line 302

**Action:** Add new parameters to the method signature and assignments

```dart
void initFromTestSummary({
  // ... existing parameters ...
  required int spokenLanguage,

  // ADD NEW PARAMETERS:
  // Gnosis parameters
  required int gnosisFingerPerceptionPattern1,
  required int gnosisFingerPerceptionPattern2,
  required int gnosisFingerPerceptionPattern3,
  required int gnosisFingerPerceptionPattern4,
  required int gnosisFingerPerceptionPattern5,
  required int gnosisFingerPerceptionPattern6,
  required int gnosisFingerPerceptionPattern7,
  required int gnosisFingerPerceptionTotal,
  required int gnosisVisualNominalDysphasia,
  required int gnosisVisualAgnosia,
  required int gnosisAstereognosisRight,
  required int gnosisAstereognosisLeft,
  required int gnosisClockDrawing,

  // Language parameters
  required int languageReading,
  required int languageRepetition,
  required int languageComprehensionMoving,
  required int languageWriting,
  required int languageObjectNaming,
  required int languageSpontaneousSpeech,
  required int languageComprehensionThreeStage,
  required int languagePictureNamingCorrect,
  required int languagePictureNamingTotal,
  required int languagePictureAgnosia,

  // Memory parameters
  required int memorySemanticScore,
  required int memoryVisualWorkingImage1,
  required int memoryVisualWorkingImage2,
  required int memoryVisualWorkingImage3,
  required int memoryShortVerbalCorrect,
  required int memoryShortVerbalTotal,
  required int memoryTenWordRecognitionCorrect,
  required int memoryTenWordRecognitionFalsePositive,
}) {
  // ... existing assignments ...
  _spokenLanguage = spokenLanguage;

  // ADD NEW ASSIGNMENTS:
  // Gnosis assignments
  _gnosisFingerPerceptionPattern1 = gnosisFingerPerceptionPattern1;
  _gnosisFingerPerceptionPattern2 = gnosisFingerPerceptionPattern2;
  _gnosisFingerPerceptionPattern3 = gnosisFingerPerceptionPattern3;
  _gnosisFingerPerceptionPattern4 = gnosisFingerPerceptionPattern4;
  _gnosisFingerPerceptionPattern5 = gnosisFingerPerceptionPattern5;
  _gnosisFingerPerceptionPattern6 = gnosisFingerPerceptionPattern6;
  _gnosisFingerPerceptionPattern7 = gnosisFingerPerceptionPattern7;
  _gnosisFingerPerceptionTotal = gnosisFingerPerceptionTotal;
  _gnosisVisualNominalDysphasia = gnosisVisualNominalDysphasia;
  _gnosisVisualAgnosia = gnosisVisualAgnosia;
  _gnosisAstereognosisRight = gnosisAstereognosisRight;
  _gnosisAstereognosisLeft = gnosisAstereognosisLeft;
  _gnosisClockDrawing = gnosisClockDrawing;

  // Language assignments
  _languageReading = languageReading;
  _languageRepetition = languageRepetition;
  _languageComprehensionMoving = languageComprehensionMoving;
  _languageWriting = languageWriting;
  _languageObjectNaming = languageObjectNaming;
  _languageSpontaneousSpeech = languageSpontaneousSpeech;
  _languageComprehensionThreeStage = languageComprehensionThreeStage;
  _languagePictureNamingCorrect = languagePictureNamingCorrect;
  _languagePictureNamingTotal = languagePictureNamingTotal;
  _languagePictureAgnosia = languagePictureAgnosia;

  // Memory assignments
  _memorySemanticScore = memorySemanticScore;
  _memoryVisualWorkingImage1 = memoryVisualWorkingImage1;
  _memoryVisualWorkingImage2 = memoryVisualWorkingImage2;
  _memoryVisualWorkingImage3 = memoryVisualWorkingImage3;
  _memoryShortVerbalCorrect = memoryShortVerbalCorrect;
  _memoryShortVerbalTotal = memoryShortVerbalTotal;
  _memoryTenWordRecognitionCorrect = memoryTenWordRecognitionCorrect;
  _memoryTenWordRecognitionFalsePositive = memoryTenWordRecognitionFalsePositive;

  notifyListeners();
}
```

### 4.2 Update `resetScores` Method

**Location:** `lib/src/models/mica_score_model.dart` line 394

**Action:** Add reset assignments for new fields

```dart
void resetScores() {
  // ... existing resets ...
  _spokenLanguage = 0;

  // ADD NEW RESETS:
  // Reset gnosis scores
  _gnosisFingerPerceptionPattern1 = 0;
  _gnosisFingerPerceptionPattern2 = 0;
  _gnosisFingerPerceptionPattern3 = 0;
  _gnosisFingerPerceptionPattern4 = 0;
  _gnosisFingerPerceptionPattern5 = 0;
  _gnosisFingerPerceptionPattern6 = 0;
  _gnosisFingerPerceptionPattern7 = 0;
  _gnosisFingerPerceptionTotal = 0;
  _gnosisVisualNominalDysphasia = 0;
  _gnosisVisualAgnosia = 0;
  _gnosisAstereognosisRight = 0;
  _gnosisAstereognosisLeft = 0;
  _gnosisClockDrawing = 0;

  // Reset language scores
  _languageReading = 0;
  _languageRepetition = 0;
  _languageComprehensionMoving = 0;
  _languageWriting = 0;
  _languageObjectNaming = 0;
  _languageSpontaneousSpeech = 0;
  _languageComprehensionThreeStage = 0;
  _languagePictureNamingCorrect = 0;
  _languagePictureNamingTotal = 0;
  _languagePictureAgnosia = 0;

  // Reset memory scores
  _memorySemanticScore = 0;
  _memoryVisualWorkingImage1 = 0;
  _memoryVisualWorkingImage2 = 0;
  _memoryVisualWorkingImage3 = 0;
  _memoryShortVerbalCorrect = 0;
  _memoryShortVerbalTotal = 0;
  _memoryTenWordRecognitionCorrect = 0;
  _memoryTenWordRecognitionFalsePositive = 0;

  notifyListeners();
}
```

### 4.3 Update `MicaStateInitializer`

**Location:** `lib/src/utils/mica_state_initializer.dart`

**Action:** Add new parameters matching the model updates (same signature as `initFromTestSummary`)

---

## Phase 5: Implement TODOs in Test Files

### 5.1 Executive Function TODOs (QUICK WINS)

#### File: `luria_alternating_hand_movements.dart:298`

**Current Code:**
```dart
void _saveScore() {
  if (selectedScore != null) {
    // TODO: Save the score to the model
    // You may need to add a specific method for executive function scores
    // For now, we'll just store the cycle count and score
  }
}
```

**Replace With:**
```dart
void _saveScore() {
  if (selectedScore != null) {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setExecutiveLuria(
      score: selectedScore!,
      count: cycleCount,
    );
  }
}
```

**Remove:** TODO comment

---

#### File: `luria_fist_edge_palm_movement.dart:398`

**Current Code:**
```dart
void _saveScore() {
  // TODO: Save the scores to the model
  // You may need to add specific methods for executive function scores
  // For now, we'll just store the cycle counts and scores
}
```

**Replace With:**
```dart
void _saveScore() {
  final scoreModel = MicaProviders.getScoreModel(context, listen: false);

  // Calculate average score from both hands
  // If one hand has no cycles, it defaults to 0 (Normal)
  int averageScore = ((rightHandScore ?? 0) + (leftHandScore ?? 0)) ~/ 2;
  int totalCycles = rightHandCycleCount + leftHandCycleCount;

  scoreModel.setExecutiveLuria(
    score: averageScore,
    count: totalCycles,
  );
}
```

**Remove:** TODO comment

---

### 5.2 Gnosis TODOs (8 items)

#### File: `finger_perception_test.dart:523` and `:530`

**Current Code:**
```dart
void _saveScores() {
  // TODO: Add finger perception scores to the model when model is updated
}

void _loadScoresFromModel() {
  // TODO: Load finger perception scores from the model when model is updated
}
```

**Replace With:**
```dart
void _saveScores() {
  if (!mounted) return;

  final scoreModel = MicaProviders.getScoreModel(context, listen: false);
  scoreModel.setGnosisFingerPerception(
    pattern1: _patternScores[0] ?? 0,
    pattern2: _patternScores[1] ?? 0,
    pattern3: _patternScores[2] ?? 0,
    pattern4: _patternScores[3] ?? 0,
    pattern5: _patternScores[4] ?? 0,
    pattern6: _patternScores[5] ?? 0,
    pattern7: _patternScores[6] ?? 0,
  );
}

void _loadScoresFromModel() {
  if (!mounted) return;

  final scoreModel = MicaProviders.getScoreModel(context, listen: false);
  setState(() {
    _patternScores[0] = scoreModel.gnosisFingerPerceptionPattern1;
    _patternScores[1] = scoreModel.gnosisFingerPerceptionPattern2;
    _patternScores[2] = scoreModel.gnosisFingerPerceptionPattern3;
    _patternScores[3] = scoreModel.gnosisFingerPerceptionPattern4;
    _patternScores[4] = scoreModel.gnosisFingerPerceptionPattern5;
    _patternScores[5] = scoreModel.gnosisFingerPerceptionPattern6;
    _patternScores[6] = scoreModel.gnosisFingerPerceptionPattern7;
  });
}
```

**Remove:** TODO comments

---

#### File: `identify_objects_visually.dart:315` and `:322`

**Current Code:**
```dart
void _updateProvider() {
  // TODO: Add gnosis scores to the model when model is updated
}

void _initFromProvider() {
  // TODO: Load gnosis scores from the model when model is updated
}
```

**Replace With:**
```dart
void _updateProvider() {
  if (!mounted) return;

  final scoreModel = MicaProviders.getScoreModel(context, listen: false);
  scoreModel.setGnosisVisualIdentification(
    nominalDysphasia: _nominalDysphasiaRadioValue ?? 0,
    visualAgnosia: _visualAgnosiaRadioValue ?? 0,
  );
}

void _initFromProvider() {
  if (!mounted) return;

  final scoreModel = MicaProviders.getScoreModel(context, listen: false);
  setState(() {
    _nominalDysphasiaRadioValue = scoreModel.gnosisVisualNominalDysphasia;
    _visualAgnosiaRadioValue = scoreModel.gnosisVisualAgnosia;
  });
}
```

**Remove:** TODO comments

---

#### File: `identify_objects_by_touch.dart:452` and `:459`

**Current Code:**
```dart
void _updateProvider() {
  // TODO: Add astereognosis scores to the model when model is updated
}

void _initFromProvider() {
  // TODO: Load astereognosis scores from the model when model is updated
}
```

**Replace With:**
```dart
void _updateProvider() {
  if (!mounted) return;

  final scoreModel = MicaProviders.getScoreModel(context, listen: false);
  scoreModel.setGnosisAstereognosis(
    rightHand: _rightHandRadioValue ?? 0,
    leftHand: _leftHandRadioValue ?? 0,
  );
}

void _initFromProvider() {
  if (!mounted) return;

  final scoreModel = MicaProviders.getScoreModel(context, listen: false);
  setState(() {
    _rightHandRadioValue = scoreModel.gnosisAstereognosisRight;
    _leftHandRadioValue = scoreModel.gnosisAstereognosisLeft;
  });
}
```

**Remove:** TODO comments

---

#### File: `clock_drawing_test.dart:345` and `:352`

**Current Code:**
```dart
void _updateProvider() {
  // TODO: Add clock drawing scores to the model when model is updated
}

void _initFromProvider() {
  // TODO: Load clock drawing scores from the model when model is updated
}
```

**Replace With:**
```dart
void _updateProvider() {
  if (!mounted) return;

  final scoreModel = MicaProviders.getScoreModel(context, listen: false);
  scoreModel.setGnosisClockDrawing(_selectedScore ?? 0);
}

void _initFromProvider() {
  if (!mounted) return;

  final scoreModel = MicaProviders.getScoreModel(context, listen: false);
  setState(() {
    _selectedScore = scoreModel.gnosisClockDrawing;
  });
}
```

**Remove:** TODO comments

---

### 5.3 Language TODOs (11 items)

#### Files: Individual language test files

**Pattern for all language files:**

1. **`reading.dart:236`**
2. **`repetition.dart:247`**
3. **`comprehension_moving_objects.dart:262`**
4. **`writing.dart:231`**
5. **`object_naming.dart:279`**
6. **`spontaneous_speech.dart:212`**
7. **`comprehension_three_stage.dart:291`**

**Current Pattern:**
```dart
onPressed: () {
  // TODO: Add [test name] score to model when available
  Navigator.pop(context);
},
```

**Replace Pattern:**
```dart
onPressed: () {
  final scoreModel = MicaProviders.getScoreModel(context, listen: false);
  scoreModel.setLanguage[TestName](_selectedScore ?? 0);
  Navigator.pop(context);
},
```

**Specific Replacements:**

| File | Line | Setter Method |
|------|------|--------------|
| `reading.dart` | 236 | `setLanguageReading` |
| `repetition.dart` | 247 | `setLanguageRepetition` |
| `comprehension_moving_objects.dart` | 262 | `setLanguageComprehensionMoving` |
| `writing.dart` | 231 | `setLanguageWriting` |
| `object_naming.dart` | 279 | `setLanguageObjectNaming` |
| `spontaneous_speech.dart` | 212 | `setLanguageSpontaneousSpeech` |
| `comprehension_three_stage.dart` | 291 | `setLanguageComprehensionThreeStage` |

**Remove:** All TODO comments in these files

---

#### File: `picture_naming.dart` (4 TODOs: lines 475, 504, 516, 529)

**Current Code (multiple TODOs):**
```dart
// Line 475
onPressed: () {
  // TODO: Add picture naming scores to model when available
  Navigator.pop(context);
}

// Line 504
void _savePictureNamingScore() {
  // TODO: Add picture naming score to model when available
}

// Line 516
void _savePictureAgnosiaScore() {
  // TODO: Add picture agnosia score to model when available
}

// Line 529
void _loadScoresFromModel() {
  // TODO: Get picture naming scores from model when available
}
```

**Replace With:**
```dart
// Line 475
onPressed: () {
  final scoreModel = MicaProviders.getScoreModel(context, listen: false);
  scoreModel.setLanguagePictureNaming(
    correct: _correctCount,
    total: _totalAttempted,
    agnosia: _agnosiaScore ?? 0,
  );
  Navigator.pop(context);
}

// Line 504
void _savePictureNamingScore() {
  if (!mounted) return;

  final scoreModel = MicaProviders.getScoreModel(context, listen: false);
  scoreModel.setLanguagePictureNaming(
    correct: _correctCount,
    total: _totalAttempted,
    agnosia: _agnosiaScore ?? 0,
  );
}

// Line 516
void _savePictureAgnosiaScore() {
  if (!mounted) return;

  final scoreModel = MicaProviders.getScoreModel(context, listen: false);
  scoreModel.setLanguagePictureNaming(
    correct: scoreModel.languagePictureNamingCorrect, // Keep existing
    total: scoreModel.languagePictureNamingTotal,     // Keep existing
    agnosia: _agnosiaScore ?? 0,                      // Update only agnosia
  );
}

// Line 529
void _loadScoresFromModel() {
  if (!mounted) return;

  final scoreModel = MicaProviders.getScoreModel(context, listen: false);
  setState(() {
    _correctCount = scoreModel.languagePictureNamingCorrect;
    _totalAttempted = scoreModel.languagePictureNamingTotal;
    _agnosiaScore = scoreModel.languagePictureAgnosia;
  });
}
```

**Remove:** All 4 TODO comments

---

### 5.4 Memory TODOs (5 items)

#### File: `ten_word_verbal_recall.dart:1248`

**Current Code:**
```dart
onPressed: () {
  // TODO: Save scores to model
  // final scoreModel = MicaProviders.getScoreModel(context, listen: false);
  // scoreModel.setTenWordVerbalRecallScores(...);

  Navigator.pop(context);
}
```

**Analysis:** Existing model already has trial scores. Need to add recognition breakdown.

**Replace With:**
```dart
onPressed: () {
  final scoreModel = MicaProviders.getScoreModel(context, listen: false);

  // Save recognition test breakdown
  scoreModel.setMemoryTenWordRecognition(
    correct: _recognitionCorrectCount,
    falsePositive: _recognitionFalsePositiveCount,
  );

  // Trial scores are already saved via setTrialScores() during the test

  Navigator.pop(context);
}
```

**Note:** This assumes `_recognitionCorrectCount` and `_recognitionFalsePositiveCount` variables exist. If not, these need to be calculated from the test state.

**Remove:** TODO comment and commented code

---

#### File: `semantic_memory.dart:138`

**Current Code:**
```dart
onPressed: () {
  // TODO: Add semantic memory score setter to model
  Navigator.pop(context);
}
```

**Replace With:**
```dart
onPressed: () {
  final scoreModel = MicaProviders.getScoreModel(context, listen: false);
  scoreModel.setMemorySemanticScore(_selectedScore ?? 0);
  Navigator.pop(context);
}
```

**Remove:** TODO comment

---

#### File: `visual_working_memory.dart:403`

**Current Code:**
```dart
onPressed: () {
  // TODO: Save score to model
  // final scoreModel = MicaProviders.getScoreModel(context, listen: false);
  // int totalScore = selectedScores['image1']! + selectedScores['image2']! + selectedScores['image3']!;
  // scoreModel.setVisualWorkingMemoryScore(totalScore);

  Navigator.of(context).pop();
}
```

**Replace With:**
```dart
onPressed: () {
  final scoreModel = MicaProviders.getScoreModel(context, listen: false);
  scoreModel.setMemoryVisualWorking(
    image1: selectedScores['image1'] ?? 0,
    image2: selectedScores['image2'] ?? 0,
    image3: selectedScores['image3'] ?? 0,
  );

  Navigator.of(context).pop();
}
```

**Remove:** TODO comment and commented code

---

#### File: `visual_short_term_memory.dart:354`

**Current Code:**
```dart
onPressed: () {
  // TODO: Save score to model
  // final scoreModel = MicaProviders.getScoreModel(context, listen: false);
  // int totalScore = selectedScores['image1']! + selectedScores['image2']! + selectedScores['image3']!;
  // scoreModel.setVisualShortTermMemoryScore(totalScore);

  Navigator.of(context).pop();
}
```

**Replace With:**
```dart
onPressed: () {
  final scoreModel = MicaProviders.getScoreModel(context, listen: false);

  // Visual short-term memory uses the existing setter
  scoreModel.setShorttermMemoryVisualImages(
    image1: selectedScores['image1'] ?? 0,
    image2: selectedScores['image2'] ?? 0,
    image3: selectedScores['image3'] ?? 0,
  );

  Navigator.of(context).pop();
}
```

**Note:** This uses the EXISTING `setShorttermMemoryVisualImages` setter, not a new one.

**Remove:** TODO comment and commented code

---

#### File: `short_verbal_memory_test.dart:588`

**Current Code:**
```dart
onPressed: () {
  // TODO: Save scores to model
  Navigator.of(context).pop();
}
```

**Replace With:**
```dart
onPressed: () {
  final scoreModel = MicaProviders.getScoreModel(context, listen: false);

  // Calculate correct items from selectedScores map
  int correctCount = selectedScores.values.where((score) => score == 0).length; // 0 = correct
  int totalCount = selectedScores.length;

  scoreModel.setMemoryShortVerbal(
    correct: correctCount,
    total: totalCount,
  );

  Navigator.of(context).pop();
}
```

**Note:** Adjust scoring logic based on actual test implementation (may need to review what score values mean).

**Remove:** TODO comment

---

## Phase 6: Testing Strategy

### 6.1 Unit Tests (Recommended)

Create `test/models/mica_score_model_test.dart`:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mica/src/models/mica_score_model.dart';

void main() {
  group('MicaScoreModel - Gnosis Tests', () {
    test('setGnosisFingerPerception calculates total correctly', () {
      final model = MicaScoreModel();

      model.setGnosisFingerPerception(
        pattern1: 1, pattern2: 2, pattern3: 0,
        pattern4: 1, pattern5: 2, pattern6: 1,
        pattern7: 0,
      );

      expect(model.gnosisFingerPerceptionTotal, equals(7));
      expect(model.gnosisFingerPerceptionPattern1, equals(1));
    });

    // Add tests for other gnosis setters...
  });

  group('MicaScoreModel - Language Tests', () {
    test('setLanguagePictureNaming stores all values', () {
      final model = MicaScoreModel();

      model.setLanguagePictureNaming(
        correct: 8,
        total: 10,
        agnosia: 1,
      );

      expect(model.languagePictureNamingCorrect, equals(8));
      expect(model.languagePictureNamingTotal, equals(10));
      expect(model.languagePictureAgnosia, equals(1));
    });

    // Add tests for other language setters...
  });

  group('MicaScoreModel - Memory Tests', () {
    test('setMemoryVisualWorking stores all image scores', () {
      final model = MicaScoreModel();

      model.setMemoryVisualWorking(
        image1: 3, image2: 2, image3: 3,
      );

      expect(model.memoryVisualWorkingImage1, equals(3));
      expect(model.memoryVisualWorkingImage2, equals(2));
      expect(model.memoryVisualWorkingImage3, equals(3));
    });

    // Add tests for other memory setters...
  });

  group('MicaScoreModel - resetScores', () {
    test('resetScores clears all new fields to 0', () {
      final model = MicaScoreModel();

      // Set some values
      model.setGnosisClockDrawing(5);
      model.setLanguageReading(2);
      model.setMemorySemanticScore(1);

      // Reset
      model.resetScores();

      // Verify all reset to 0
      expect(model.gnosisClockDrawing, equals(0));
      expect(model.languageReading, equals(0));
      expect(model.memorySemanticScore, equals(0));
    });
  });
}
```

**Run Tests:**
```bash
flutter test test/models/mica_score_model_test.dart
```

### 6.2 Integration Tests

**Manual Test Checklist:**

- [ ] Executive Function: Complete Luria tests, verify scores save
- [ ] Gnosis: Complete all 4 tests, verify scores save and load
- [ ] Language: Complete all 7+ language tests, verify scores save
- [ ] Memory: Complete all memory tests, verify scores save
- [ ] Summary: Verify all new scores appear in test summary/report
- [ ] Reset: Verify resetScores() clears all new fields
- [ ] Navigation: Verify all tests still navigate correctly

### 6.3 Smoke Test Script

```bash
# Run analyzer to check for errors
flutter analyze

# Run all tests
flutter test

# Run app in debug mode and test one screen from each module
flutter run -d chrome

# Verify compilation
flutter build apk --debug  # For Android
flutter build web          # For Web
```

---

## Phase 7: Implementation Rollout

### Recommended Sequence

**Day 1: Model Foundation (2-3 hours)**
1. Add all new fields to `MicaScoreModel` (Phase 1)
2. Add all getters (Phase 2)
3. Add all setters (Phase 3)
4. Update `initFromTestSummary` and `resetScores` (Phase 4)
5. Update `MicaStateInitializer` (Phase 4.3)
6. Run `flutter analyze` to check for compilation errors
7. Create unit tests (Phase 6.1)

**Day 2: Quick Wins + Gnosis (1-2 hours)**
1. Implement 2 Executive Function TODOs (Phase 5.1)
2. Implement 8 Gnosis TODOs (Phase 5.2)
3. Test gnosis module end-to-end
4. Commit changes

**Day 3: Language Module (1-2 hours)**
1. Implement 11 Language TODOs (Phase 5.3)
2. Test language module end-to-end
3. Commit changes

**Day 4: Memory Module + Final Testing (1 hour)**
1. Implement 5 Memory TODOs (Phase 5.4)
2. Run full integration test checklist (Phase 6.2)
3. Run smoke test script (Phase 6.3)
4. Commit final changes

---

## Phase 8: Breaking Changes & Migration Notes

### Breaking Changes

⚠️ **`initFromTestSummary` signature changed**
- **Impact:** Any code calling this method must add new required parameters
- **Affected Files:** `lib/src/utils/mica_state_initializer.dart`
- **Migration:** Add all new parameters with default value `0`

⚠️ **`MicaStateInitializer.initializeFromTestParameters` signature changed**
- **Impact:** Any code calling this method must add new required parameters
- **Affected Files:** Code using `MicaStateInitializer` for initialization
- **Migration:** Add all new parameters with default value `0`

### Non-Breaking Changes

✅ All new getters/setters are additions (no breaking changes)
✅ Existing fields remain unchanged (backward compatible)
✅ TODO removals do not affect API

---

## Phase 9: Post-Implementation

### Documentation Updates

1. **Update CLAUDE.md:**
   - Document new model fields by domain
   - Update state management patterns section
   - Add examples of using new setters

2. **Create Migration Guide:**
   - Document for future developers
   - Explain model field organization
   - Provide examples of adding new test scores

3. **Update Summary/Report Generation:**
   - Verify summary screens display all new scores
   - Update result calculation logic if needed
   - Test PDF/export functionality if applicable

### Code Quality

1. **Remove All TODO Comments:**
   - 26 TODOs removed total
   - Codebase 100% TODO-free for these items

2. **Run Final Analysis:**
```bash
flutter analyze
grep -r "TODO" lib/src/domain_testing --include="*.dart"
# Should return 0 results for our 26 TODOs
```

3. **Performance Check:**
   - Verify `notifyListeners()` not called excessively
   - Check for memory leaks in tests
   - Profile app if needed

---

## Summary

**Total Changes:**
- **31 new private fields** added to model
- **31 new getter methods** added
- **15 new setter methods** added (some set multiple fields)
- **2 existing methods updated** (`initFromTestSummary`, `resetScores`)
- **1 utility class updated** (`MicaStateInitializer`)
- **26 TODO items implemented** across 17 files
- **26 TODO comments removed**

**Estimated Lines of Code:**
- Model additions: ~200 lines
- TODO implementations: ~150 lines
- Tests: ~100 lines
- **Total: ~450 lines added**

**Risk Level:** Low-Medium
- All changes are additive (backward compatible)
- Existing functionality not modified
- Breaking changes limited to initialization signatures

**Validation:**
- Unit tests cover all new setters
- Integration tests verify end-to-end flows
- Smoke tests ensure no regressions

---

## Quick Start Commands

```bash
# 1. Create feature branch
git checkout -b feature/model-expansion-todo-implementation

# 2. Start with model changes (Day 1)
# Edit: lib/src/models/mica_score_model.dart
# Edit: lib/src/utils/mica_state_initializer.dart

# 3. Run analyzer after model changes
flutter analyze

# 4. Implement TODOs in test files (Days 2-3)
# Edit files from Phase 5 sections

# 5. Run tests
flutter test

# 6. Commit changes
git add .
git commit -m "feat: expand MicaScoreModel and implement 26 TODOs

- Add gnosis domain fields (4 tests)
- Add language domain fields (7+ tests)
- Add memory domain fields (4 tests)
- Implement all 26 TODO items
- Add unit tests for new setters
- Remove all TODO comments

Closes #[issue-number]"

# 7. Push and create PR
git push origin feature/model-expansion-todo-implementation
```

---

**Document Version:** 1.0
**Last Updated:** 2025-12-02
**Status:** Ready for Implementation
