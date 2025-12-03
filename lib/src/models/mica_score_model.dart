import 'package:flutter/foundation.dart';

/// Model class for MICA test scores to be used with Provider state management
class MicaScoreModel extends ChangeNotifier {
  // Patient information
  String _patientName = '';
  String _assessorName = '';
  String _handedness = 'Right';
  DateTime _assessmentDate = DateTime.now();

  // Test scores for different domains
  // Language scores
  int _languageComprehensionRadioValue = 0;
  int _spokenLanguage = 0;

  // Granular language test scores
  int _languageReading = 0;
  int _languageRepetition = 0;
  int _languageComprehensionMoving = 0;
  int _languageWriting = 0;
  int _languageObjectNaming = 0;
  int _languageSpontaneousSpeech = 0;
  int _languageComprehensionThreeStage = 0;

  // Picture Naming Test (detailed scoring)
  int _languagePictureNamingCorrect = 0;
  int _languagePictureNamingTotal = 0;
  int _languagePictureAgnosia = 0;

  // Memory scores
  int _trialOneScore = 0;
  int _trialTwoScore = 0;
  int _trialThreeScore = 0;
  int _tenWordDelay = 0;
  int _shorttermMemoryVerbal = 0;
  int _shorttermMemoryVerbalScore = 0;
  int _scoreVerbalRecognitionMemoryTenWords = 0;
  int _scoreVerbalRecognitionMemoryTenWordsInList = 0;
  int _scoreVerbalRecognitionMemoryTenWordsNotInList = 0;

  // Visual memory scores
  int _shorttermMemoryVisualImage1 = 0;
  int _shorttermMemoryVisualImage2 = 0;
  int _shorttermMemoryVisualImage3 = 0;

  // Additional memory test scores
  int _memorySemanticScore = 0;

  // Visual Working Memory (immediate recall - same images as STM)
  int _memoryVisualWorkingImage1 = 0;
  int _memoryVisualWorkingImage2 = 0;
  int _memoryVisualWorkingImage3 = 0;

  // Short Verbal Memory Test (name/address recall)
  int _memoryShortVerbalCorrect = 0;
  int _memoryShortVerbalTotal = 0;

  // Ten Word Recall recognition test breakdown
  int _memoryTenWordRecognitionCorrect = 0;
  int _memoryTenWordRecognitionFalsePositive = 0;

  // Visuospatial and praxis scores
  int _visuospatialPraxisImage1 = 0;
  int _visuospatialPraxisImage2 = 0;
  int _visuospatialPraxisImage3 = 0;
  int _praxisRight = 0;
  int _praxisLeft = 0;

  // Attention scores
  int _attention = 0;
  int _attentionCorrect = 0;
  int _attentionMistakes = 0;

  // Executive function scores
  int _executiveAnimalNaming = 0;
  int _executiveAnimalNamingCount = 0;
  int _executiveLexicalFluency = 0;
  int _executiveLexicalFluencyCount = 0;
  int _executiveDesignFluency = 0;
  int _executiveFingerNose = 0;
  int _executiveTap = 0;
  int _executiveAlternatingSequences = 0;
  int _executiveLuria = 0;
  int _executiveLuriaScore = 0;
  int _executiveSerial = 0;
  int _executiveSerialScore = 0;
  int _executive = 0;

  // Anomia/agnosia scores
  int _anomiaAgnosia = 0;
  int _agnosia = 0;

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
  int _gnosisVisualNominalDysphasia = 0;
  int _gnosisVisualAgnosia = 0;

  // Tactile Object Identification (astereognosis)
  int _gnosisAstereognosisRight = 0;
  int _gnosisAstereognosisLeft = 0;

  // Clock Drawing Test (5-point criteria)
  int _gnosisClockDrawing = 0;

  // Getters for patient information
  String get patientName => _patientName;
  String get assessorName => _assessorName;
  String get handedness => _handedness;
  DateTime get assessmentDate => _assessmentDate;

  // Getters for language scores
  int get languageComprehensionRadioValue => _languageComprehensionRadioValue;
  int get spokenLanguage => _spokenLanguage;

  // Getters for granular language test scores
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

  // Getters for memory scores
  int get trialOneScore => _trialOneScore;
  int get trialTwoScore => _trialTwoScore;
  int get trialThreeScore => _trialThreeScore;
  int get tenWordDelay => _tenWordDelay;
  int get shorttermMemoryVerbal => _shorttermMemoryVerbal;
  int get shorttermMemoryVerbalScore => _shorttermMemoryVerbalScore;
  int get scoreVerbalRecognitionMemoryTenWords =>
      _scoreVerbalRecognitionMemoryTenWords;
  int get scoreVerbalRecognitionMemoryTenWordsInList =>
      _scoreVerbalRecognitionMemoryTenWordsInList;
  int get scoreVerbalRecognitionMemoryTenWordsNotInList =>
      _scoreVerbalRecognitionMemoryTenWordsNotInList;

  // Getters for visual memory scores
  int get shorttermMemoryVisualImage1 => _shorttermMemoryVisualImage1;
  int get shorttermMemoryVisualImage2 => _shorttermMemoryVisualImage2;
  int get shorttermMemoryVisualImage3 => _shorttermMemoryVisualImage3;

  // Getters for additional memory test scores
  int get memorySemanticScore => _memorySemanticScore;

  int get memoryVisualWorkingImage1 => _memoryVisualWorkingImage1;
  int get memoryVisualWorkingImage2 => _memoryVisualWorkingImage2;
  int get memoryVisualWorkingImage3 => _memoryVisualWorkingImage3;

  int get memoryShortVerbalCorrect => _memoryShortVerbalCorrect;
  int get memoryShortVerbalTotal => _memoryShortVerbalTotal;

  int get memoryTenWordRecognitionCorrect => _memoryTenWordRecognitionCorrect;
  int get memoryTenWordRecognitionFalsePositive => _memoryTenWordRecognitionFalsePositive;

  // Getters for visuospatial and praxis scores
  int get visuospatialPraxisImage1 => _visuospatialPraxisImage1;
  int get visuospatialPraxisImage2 => _visuospatialPraxisImage2;
  int get visuospatialPraxisImage3 => _visuospatialPraxisImage3;
  int get praxisRight => _praxisRight;
  int get praxisLeft => _praxisLeft;

  // Getters for attention scores
  int get attention => _attention;
  int get attentionCorrect => _attentionCorrect;
  int get attentionMistakes => _attentionMistakes;

  // Getters for executive function scores
  int get executiveAnimalNaming => _executiveAnimalNaming;
  int get executiveAnimalNamingCount => _executiveAnimalNamingCount;
  int get executiveLexicalFluency => _executiveLexicalFluency;
  int get executiveLexicalFluencyCount => _executiveLexicalFluencyCount;
  int get executiveDesignFluency => _executiveDesignFluency;
  int get executiveFingerNose => _executiveFingerNose;
  int get executiveTap => _executiveTap;
  int get executiveAlternatingSequences => _executiveAlternatingSequences;
  int get executiveLuria => _executiveLuria;
  int get executiveLuriaScore => _executiveLuriaScore;
  int get executiveSerial => _executiveSerial;
  int get executiveSerialScore => _executiveSerialScore;
  int get executive => _executive;

  // Getters for anomia/agnosia scores
  int get anomiaAgnosia => _anomiaAgnosia;
  int get agnosia => _agnosia;

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

  // Setters for patient information
  void setPatientInfo({
    required String patientName,
    required String assessorName,
    required String handedness,
    required DateTime assessmentDate,
  }) {
    _patientName = patientName;
    _assessorName = assessorName;
    _handedness = handedness;
    _assessmentDate = assessmentDate;
    notifyListeners();
  }

  // Methods to update language scores
  void setLanguageComprehension(int value) {
    _languageComprehensionRadioValue = value;
    notifyListeners();
  }

  void setSpokenLanguage(int value) {
    _spokenLanguage = value;
    notifyListeners();
  }

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

  // Methods to update memory scores
  void setTrialOneScore(int score) {
    _trialOneScore = score;
    notifyListeners();
  }

  void setTrialTwoScore(int score) {
    _trialTwoScore = score;
    notifyListeners();
  }

  void setTrialThreeScore(int score) {
    _trialThreeScore = score;
    notifyListeners();
  }

  void setTenWordDelay(int score) {
    _tenWordDelay = score;
    notifyListeners();
  }

  void setShorttermMemoryVerbal(int score, int verbalScore) {
    _shorttermMemoryVerbal = score;
    _shorttermMemoryVerbalScore = verbalScore;
    notifyListeners();
  }

  void setVerbalRecognitionMemory({
    required int score,
    required int inList,
    required int notInList,
  }) {
    _scoreVerbalRecognitionMemoryTenWords = score;
    _scoreVerbalRecognitionMemoryTenWordsInList = inList;
    _scoreVerbalRecognitionMemoryTenWordsNotInList = notInList;
    notifyListeners();
  }

  // Methods to update visual memory scores
  void setShorttermMemoryVisualImages({
    required int image1,
    required int image2,
    required int image3,
  }) {
    _shorttermMemoryVisualImage1 = image1;
    _shorttermMemoryVisualImage2 = image2;
    _shorttermMemoryVisualImage3 = image3;
    notifyListeners();
  }

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

  // Methods to update visuospatial and praxis scores
  void setVisuospatialPraxisImages({
    required int image1,
    required int image2,
    required int image3,
  }) {
    _visuospatialPraxisImage1 = image1;
    _visuospatialPraxisImage2 = image2;
    _visuospatialPraxisImage3 = image3;
    notifyListeners();
  }

  void setPraxisScores({required int right, required int left}) {
    _praxisRight = right;
    _praxisLeft = left;
    notifyListeners();
  }

  // Methods to update attention scores
  void setAttention({
    required int score,
    required int correct,
    required int mistakes,
  }) {
    _attention = score;
    _attentionCorrect = correct;
    _attentionMistakes = mistakes;
    notifyListeners();
  }

  // Methods to update executive function scores
  void setExecutiveAnimalNaming({
    required int score,
    required int count,
  }) {
    _executiveAnimalNaming = score;
    _executiveAnimalNamingCount = count;
    notifyListeners();
  }

  void setExecutiveLexicalFluency({
    required int score,
    required int count,
  }) {
    _executiveLexicalFluency = score;
    _executiveLexicalFluencyCount = count;
    notifyListeners();
  }

  void setExecutiveDesignFluency(int score) {
    _executiveDesignFluency = score;
    notifyListeners();
  }

  void setExecutiveFingerNose(int score) {
    _executiveFingerNose = score;
    notifyListeners();
  }

  void setExecutiveTap(int score) {
    _executiveTap = score;
    notifyListeners();
  }

  void setExecutiveAlternatingSequences(int score) {
    _executiveAlternatingSequences = score;
    notifyListeners();
  }

  void setExecutiveLuria({
    required int score,
    required int count,
  }) {
    _executiveLuria = score;
    _executiveLuriaScore = count;
    notifyListeners();
  }

  void setExecutiveSerial({
    required int score,
    required int count,
  }) {
    _executiveSerial = score;
    _executiveSerialScore = count;
    notifyListeners();
  }

  void setExecutive(int score) {
    _executive = score;
    notifyListeners();
  }

  // Methods to update anomia/agnosia scores
  void setAnomiaAgnosia(int score) {
    _anomiaAgnosia = score;
    notifyListeners();
  }

  void setAgnosia(int score) {
    _agnosia = score;
    notifyListeners();
  }

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

  // Method to initialize model from test data
  void initFromTestSummary({
    required String patientName,
    required String assessorName,
    required String handedness,
    required DateTime assessmentDate,
    required int languageComprehensionRadioValue,
    required int trialOneScore,
    required int trialTwoScore,
    required int trialThreeScore,
    required int visuospatialPraxisImage1,
    required int visuospatialPraxisImage2,
    required int visuospatialPraxisImage3,
    required int attention,
    required int attentionCorrect,
    required int attentionMistakes,
    required int executiveAnimalNaming,
    required int executiveAnimalNamingCount,
    required int executiveLexicalFluency,
    required int executiveLexicalFluencyCount,
    required int executiveDesignFluency,
    required int executiveFingerNose,
    required int executiveTap,
    required int executiveAlternatingSequences,
    required int executiveLuria,
    required int executiveLuriaScore,
    required int executiveSerial,
    required int executiveSerialScore,
    required int shorttermMemoryVerbal,
    required int shorttermMemoryVerbalScore,
    required int praxisRight,
    required int praxisLeft,
    required int tenWordDelay,
    required int scoreVerbalRecognitionMemoryTenWords,
    required int scoreVerbalRecognitionMemoryTenWordsInList,
    required int scoreVerbalRecognitionMemoryTenWordsNotInList,
    required int shorttermMemoryVisualImage1,
    required int shorttermMemoryVisualImage2,
    required int shorttermMemoryVisualImage3,
    required int anomiaAgnosia,
    required int agnosia,
    required int executive,
    required int spokenLanguage,
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
    _patientName = patientName;
    _assessorName = assessorName;
    _handedness = handedness;
    _assessmentDate = assessmentDate;
    _languageComprehensionRadioValue = languageComprehensionRadioValue;
    _trialOneScore = trialOneScore;
    _trialTwoScore = trialTwoScore;
    _trialThreeScore = trialThreeScore;
    _visuospatialPraxisImage1 = visuospatialPraxisImage1;
    _visuospatialPraxisImage2 = visuospatialPraxisImage2;
    _visuospatialPraxisImage3 = visuospatialPraxisImage3;
    _attention = attention;
    _attentionCorrect = attentionCorrect;
    _attentionMistakes = attentionMistakes;
    _executiveAnimalNaming = executiveAnimalNaming;
    _executiveAnimalNamingCount = executiveAnimalNamingCount;
    _executiveLexicalFluency = executiveLexicalFluency;
    _executiveLexicalFluencyCount = executiveLexicalFluencyCount;
    _executiveDesignFluency = executiveDesignFluency;
    _executiveFingerNose = executiveFingerNose;
    _executiveTap = executiveTap;
    _executiveAlternatingSequences = executiveAlternatingSequences;
    _executiveLuria = executiveLuria;
    _executiveLuriaScore = executiveLuriaScore;
    _executiveSerial = executiveSerial;
    _executiveSerialScore = executiveSerialScore;
    _shorttermMemoryVerbal = shorttermMemoryVerbal;
    _shorttermMemoryVerbalScore = shorttermMemoryVerbalScore;
    _praxisRight = praxisRight;
    _praxisLeft = praxisLeft;
    _tenWordDelay = tenWordDelay;
    _scoreVerbalRecognitionMemoryTenWords =
        scoreVerbalRecognitionMemoryTenWords;
    _scoreVerbalRecognitionMemoryTenWordsInList =
        scoreVerbalRecognitionMemoryTenWordsInList;
    _scoreVerbalRecognitionMemoryTenWordsNotInList =
        scoreVerbalRecognitionMemoryTenWordsNotInList;
    _shorttermMemoryVisualImage1 = shorttermMemoryVisualImage1;
    _shorttermMemoryVisualImage2 = shorttermMemoryVisualImage2;
    _shorttermMemoryVisualImage3 = shorttermMemoryVisualImage3;
    _anomiaAgnosia = anomiaAgnosia;
    _agnosia = agnosia;
    _executive = executive;
    _spokenLanguage = spokenLanguage;

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

  // Method to reset all scores
  void resetScores() {
    _patientName = '';
    _assessorName = '';
    _handedness = 'Right';
    _assessmentDate = DateTime.now();

    // Reset all test scores
    _languageComprehensionRadioValue = 0;
    _spokenLanguage = 0;

    _trialOneScore = 0;
    _trialTwoScore = 0;
    _trialThreeScore = 0;
    _tenWordDelay = 0;
    _shorttermMemoryVerbal = 0;
    _shorttermMemoryVerbalScore = 0;
    _scoreVerbalRecognitionMemoryTenWords = 0;
    _scoreVerbalRecognitionMemoryTenWordsInList = 0;
    _scoreVerbalRecognitionMemoryTenWordsNotInList = 0;

    _shorttermMemoryVisualImage1 = 0;
    _shorttermMemoryVisualImage2 = 0;
    _shorttermMemoryVisualImage3 = 0;

    _visuospatialPraxisImage1 = 0;
    _visuospatialPraxisImage2 = 0;
    _visuospatialPraxisImage3 = 0;
    _praxisRight = 0;
    _praxisLeft = 0;

    _attention = 0;
    _attentionCorrect = 0;
    _attentionMistakes = 0;

    _executiveAnimalNaming = 0;
    _executiveAnimalNamingCount = 0;
    _executiveLexicalFluency = 0;
    _executiveLexicalFluencyCount = 0;
    _executiveDesignFluency = 0;
    _executiveFingerNose = 0;
    _executiveTap = 0;
    _executiveAlternatingSequences = 0;
    _executiveLuria = 0;
    _executiveLuriaScore = 0;
    _executiveSerial = 0;
    _executiveSerialScore = 0;
    _executive = 0;

    _anomiaAgnosia = 0;
    _agnosia = 0;

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
}
