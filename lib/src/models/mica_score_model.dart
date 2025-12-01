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

  // Getters for patient information
  String get patientName => _patientName;
  String get assessorName => _assessorName;
  String get handedness => _handedness;
  DateTime get assessmentDate => _assessmentDate;

  // Getters for language scores
  int get languageComprehensionRadioValue => _languageComprehensionRadioValue;
  int get spokenLanguage => _spokenLanguage;

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

    notifyListeners();
  }
}
