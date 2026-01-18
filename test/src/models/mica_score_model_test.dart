import 'package:flutter_test/flutter_test.dart';
import 'package:mica/src/models/mica_score_model.dart';
import 'package:mica/src/models/score_validation.dart';

void main() {
  late MicaScoreModel model;

  setUp(() {
    model = MicaScoreModel();
  });

  group('Initialization', () {
    test('all int scores default to 0', () {
      // Language
      expect(model.languageComprehensionRadioValue, 0);
      expect(model.spokenLanguage, 0);
      expect(model.languageReading, 0);
      expect(model.languageRepetition, 0);
      expect(model.languageComprehensionMoving, 0);
      expect(model.languageWriting, 0);
      expect(model.languageObjectNaming, 0);
      expect(model.languageSpontaneousSpeech, 0);
      expect(model.languageComprehensionThreeStage, 0);
      expect(model.languagePictureNamingCorrect, 0);
      expect(model.languagePictureNamingTotal, 0);
      expect(model.languagePictureAgnosia, 0);

      // Memory
      expect(model.trialOneScore, 0);
      expect(model.trialTwoScore, 0);
      expect(model.trialThreeScore, 0);
      expect(model.tenWordDelay, 0);
      expect(model.shorttermMemoryVerbal, 0);
      expect(model.shorttermMemoryVerbalScore, 0);
      expect(model.scoreVerbalRecognitionMemoryTenWords, 0);
      expect(model.scoreVerbalRecognitionMemoryTenWordsInList, 0);
      expect(model.scoreVerbalRecognitionMemoryTenWordsNotInList, 0);
      expect(model.shorttermMemoryVisualImage1, 0);
      expect(model.shorttermMemoryVisualImage2, 0);
      expect(model.shorttermMemoryVisualImage3, 0);
      expect(model.memorySemanticScore, 0);
      expect(model.memoryVisualWorkingImage1, 0);
      expect(model.memoryVisualWorkingImage2, 0);
      expect(model.memoryVisualWorkingImage3, 0);
      expect(model.memoryShortVerbalCorrect, 0);
      expect(model.memoryShortVerbalTotal, 0);
      expect(model.memoryTenWordRecognitionCorrect, 0);
      expect(model.memoryTenWordRecognitionFalsePositive, 0);

      // Praxis
      expect(model.visuospatialPraxisImage1, 0);
      expect(model.visuospatialPraxisImage2, 0);
      expect(model.visuospatialPraxisImage3, 0);
      expect(model.praxisRight, 0);
      expect(model.praxisLeft, 0);

      // Attention
      expect(model.attention, 0);
      expect(model.attentionCorrect, 0);
      expect(model.attentionMistakes, 0);

      // Executive
      expect(model.executiveAnimalNaming, 0);
      expect(model.executiveAnimalNamingCount, 0);
      expect(model.executiveLexicalFluency, 0);
      expect(model.executiveLexicalFluencyCount, 0);
      expect(model.executiveDesignFluency, 0);
      expect(model.executiveFingerNose, 0);
      expect(model.executiveTap, 0);
      expect(model.executiveAlternatingSequences, 0);
      expect(model.executiveLuria, 0);
      expect(model.executiveLuriaScore, 0);
      expect(model.executiveSerial, 0);
      expect(model.executiveSerialScore, 0);
      expect(model.executive, 0);

      // Anomia/Agnosia
      expect(model.anomiaAgnosia, 0);
      expect(model.agnosia, 0);

      // Gnosis
      expect(model.gnosisFingerPerceptionPattern1, 0);
      expect(model.gnosisFingerPerceptionPattern2, 0);
      expect(model.gnosisFingerPerceptionPattern3, 0);
      expect(model.gnosisFingerPerceptionPattern4, 0);
      expect(model.gnosisFingerPerceptionPattern5, 0);
      expect(model.gnosisFingerPerceptionPattern6, 0);
      expect(model.gnosisFingerPerceptionPattern7, 0);
      expect(model.gnosisFingerPerceptionTotal, 0);
      expect(model.gnosisVisualNominalDysphasia, 0);
      expect(model.gnosisVisualAgnosia, 0);
      expect(model.gnosisAstereognosisRight, 0);
      expect(model.gnosisAstereognosisLeft, 0);
      expect(model.gnosisClockDrawing, 0);
    });

    test('patient info defaults correctly', () {
      expect(model.patientName, '');
      expect(model.assessorName, '');
      expect(model.handedness, 'Right');
      expect(model.assessmentDate, isA<DateTime>());
    });
  });

  group('Patient Info', () {
    test('setPatientInfo updates all fields', () {
      final testDate = DateTime(2024, 6, 15);
      model.setPatientInfo(
        patientName: 'John Doe',
        assessorName: 'Dr. Smith',
        handedness: 'Left',
        assessmentDate: testDate,
      );

      expect(model.patientName, 'John Doe');
      expect(model.assessorName, 'Dr. Smith');
      expect(model.handedness, 'Left');
      expect(model.assessmentDate, testDate);
    });

    test('setPatientInfo notifies listeners', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setPatientInfo(
        patientName: 'Test',
        assessorName: 'Test',
        handedness: 'Right',
        assessmentDate: DateTime.now(),
      );

      expect(notifyCount, 1);
    });
  });

  group('Language Domain', () {
    test('setLanguageComprehension updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setLanguageComprehension(2);

      expect(model.languageComprehensionRadioValue, 2);
      expect(notifyCount, 1);
    });

    test('setSpokenLanguage updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setSpokenLanguage(1);

      expect(model.spokenLanguage, 1);
      expect(notifyCount, 1);
    });

    test('setLanguageReading updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setLanguageReading(2);

      expect(model.languageReading, 2);
      expect(notifyCount, 1);
    });

    test('setLanguageRepetition updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setLanguageRepetition(1);

      expect(model.languageRepetition, 1);
      expect(notifyCount, 1);
    });

    test('setLanguageComprehensionMoving updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setLanguageComprehensionMoving(2);

      expect(model.languageComprehensionMoving, 2);
      expect(notifyCount, 1);
    });

    test('setLanguageWriting updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setLanguageWriting(1);

      expect(model.languageWriting, 1);
      expect(notifyCount, 1);
    });

    test('setLanguageObjectNaming updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setLanguageObjectNaming(2);

      expect(model.languageObjectNaming, 2);
      expect(notifyCount, 1);
    });

    test('setLanguageSpontaneousSpeech updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setLanguageSpontaneousSpeech(1);

      expect(model.languageSpontaneousSpeech, 1);
      expect(notifyCount, 1);
    });

    test('setLanguageComprehensionThreeStage updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setLanguageComprehensionThreeStage(2);

      expect(model.languageComprehensionThreeStage, 2);
      expect(notifyCount, 1);
    });

    test('setLanguagePictureNaming updates all values and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setLanguagePictureNaming(
        correct: 8,
        total: 10,
        agnosia: 1,
      );

      expect(model.languagePictureNamingCorrect, 8);
      expect(model.languagePictureNamingTotal, 10);
      expect(model.languagePictureAgnosia, 1);
      expect(notifyCount, 1);
    });
  });

  group('Memory Domain', () {
    test('setTrialOneScore updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setTrialOneScore(7);

      expect(model.trialOneScore, 7);
      expect(notifyCount, 1);
    });

    test('setTrialTwoScore updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setTrialTwoScore(8);

      expect(model.trialTwoScore, 8);
      expect(notifyCount, 1);
    });

    test('setTrialThreeScore updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setTrialThreeScore(9);

      expect(model.trialThreeScore, 9);
      expect(notifyCount, 1);
    });

    test('setTenWordDelay updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setTenWordDelay(6);

      expect(model.tenWordDelay, 6);
      expect(notifyCount, 1);
    });

    test('setShorttermMemoryVerbal updates both values and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setShorttermMemoryVerbal(1, 5);

      expect(model.shorttermMemoryVerbal, 1);
      expect(model.shorttermMemoryVerbalScore, 5);
      expect(notifyCount, 1);
    });

    test('setVerbalRecognitionMemory updates all values and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setVerbalRecognitionMemory(
        score: 18,
        inList: 9,
        notInList: 9,
      );

      expect(model.scoreVerbalRecognitionMemoryTenWords, 18);
      expect(model.scoreVerbalRecognitionMemoryTenWordsInList, 9);
      expect(model.scoreVerbalRecognitionMemoryTenWordsNotInList, 9);
      expect(notifyCount, 1);
    });

    test('setShorttermMemoryVisualImages updates all values and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setShorttermMemoryVisualImages(
        image1: 1,
        image2: 2,
        image3: 0,
      );

      expect(model.shorttermMemoryVisualImage1, 1);
      expect(model.shorttermMemoryVisualImage2, 2);
      expect(model.shorttermMemoryVisualImage3, 0);
      expect(notifyCount, 1);
    });

    test('setMemorySemanticScore updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setMemorySemanticScore(2);

      expect(model.memorySemanticScore, 2);
      expect(notifyCount, 1);
    });

    test('setMemoryVisualWorking updates all values and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setMemoryVisualWorking(
        image1: 2,
        image2: 1,
        image3: 3,
      );

      expect(model.memoryVisualWorkingImage1, 2);
      expect(model.memoryVisualWorkingImage2, 1);
      expect(model.memoryVisualWorkingImage3, 3);
      expect(notifyCount, 1);
    });

    test('setMemoryShortVerbal updates all values and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setMemoryShortVerbal(
        correct: 5,
        total: 7,
      );

      expect(model.memoryShortVerbalCorrect, 5);
      expect(model.memoryShortVerbalTotal, 7);
      expect(notifyCount, 1);
    });

    test('setMemoryTenWordRecognition updates all values and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setMemoryTenWordRecognition(
        correct: 9,
        falsePositive: 1,
      );

      expect(model.memoryTenWordRecognitionCorrect, 9);
      expect(model.memoryTenWordRecognitionFalsePositive, 1);
      expect(notifyCount, 1);
    });
  });

  group('Attention Domain', () {
    test('setAttention updates all values and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setAttention(
        score: 1,
        correct: 28,
        mistakes: 2,
      );

      expect(model.attention, 1);
      expect(model.attentionCorrect, 28);
      expect(model.attentionMistakes, 2);
      expect(notifyCount, 1);
    });

    test('setAttention with perfect score', () {
      model.setAttention(
        score: 0,
        correct: 30,
        mistakes: 0,
      );

      expect(model.attention, 0);
      expect(model.attentionCorrect, 30);
      expect(model.attentionMistakes, 0);
    });

    test('setAttention with impaired score', () {
      model.setAttention(
        score: 2,
        correct: 25,
        mistakes: 5,
      );

      expect(model.attention, 2);
      expect(model.attentionCorrect, 25);
      expect(model.attentionMistakes, 5);
    });
  });

  group('Executive Function Domain', () {
    test('setExecutiveAnimalNaming updates values and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setExecutiveAnimalNaming(
        score: 0,
        count: 18,
      );

      expect(model.executiveAnimalNaming, 0);
      expect(model.executiveAnimalNamingCount, 18);
      expect(notifyCount, 1);
    });

    test('setExecutiveLexicalFluency updates values and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setExecutiveLexicalFluency(
        score: 1,
        count: 12,
      );

      expect(model.executiveLexicalFluency, 1);
      expect(model.executiveLexicalFluencyCount, 12);
      expect(notifyCount, 1);
    });

    test('setExecutiveDesignFluency updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setExecutiveDesignFluency(2);

      expect(model.executiveDesignFluency, 2);
      expect(notifyCount, 1);
    });

    test('setExecutiveFingerNose updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setExecutiveFingerNose(1);

      expect(model.executiveFingerNose, 1);
      expect(notifyCount, 1);
    });

    test('setExecutiveTap updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setExecutiveTap(2);

      expect(model.executiveTap, 2);
      expect(notifyCount, 1);
    });

    test('setExecutiveAlternatingSequences updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setExecutiveAlternatingSequences(1);

      expect(model.executiveAlternatingSequences, 1);
      expect(notifyCount, 1);
    });

    test('setExecutiveLuria updates values and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setExecutiveLuria(
        score: 2,
        count: 3,
      );

      expect(model.executiveLuria, 2);
      expect(model.executiveLuriaScore, 3);
      expect(notifyCount, 1);
    });

    test('setExecutiveSerial updates values and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setExecutiveSerial(
        score: 1,
        count: 4,
      );

      expect(model.executiveSerial, 1);
      expect(model.executiveSerialScore, 4);
      expect(notifyCount, 1);
    });

    test('setExecutive updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setExecutive(2);

      expect(model.executive, 2);
      expect(notifyCount, 1);
    });
  });

  group('Praxis Domain', () {
    test('setVisuospatialPraxisImages updates all values and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setVisuospatialPraxisImages(
        image1: 1,
        image2: 2,
        image3: 0,
      );

      expect(model.visuospatialPraxisImage1, 1);
      expect(model.visuospatialPraxisImage2, 2);
      expect(model.visuospatialPraxisImage3, 0);
      expect(notifyCount, 1);
    });

    test('setPraxisScores updates values and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setPraxisScores(right: 1, left: 2);

      expect(model.praxisRight, 1);
      expect(model.praxisLeft, 2);
      expect(notifyCount, 1);
    });
  });

  group('Gnosis Domain', () {
    test('setGnosisFingerPerception updates all patterns and calculates total',
        () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setGnosisFingerPerception(
        pattern1: 2,
        pattern2: 1,
        pattern3: 2,
        pattern4: 0,
        pattern5: 1,
        pattern6: 2,
        pattern7: 1,
      );

      expect(model.gnosisFingerPerceptionPattern1, 2);
      expect(model.gnosisFingerPerceptionPattern2, 1);
      expect(model.gnosisFingerPerceptionPattern3, 2);
      expect(model.gnosisFingerPerceptionPattern4, 0);
      expect(model.gnosisFingerPerceptionPattern5, 1);
      expect(model.gnosisFingerPerceptionPattern6, 2);
      expect(model.gnosisFingerPerceptionPattern7, 1);
      // Total should be 2+1+2+0+1+2+1 = 9
      expect(model.gnosisFingerPerceptionTotal, 9);
      expect(notifyCount, 1);
    });

    test('setGnosisFingerPerception with all zeros gives total of 0', () {
      model.setGnosisFingerPerception(
        pattern1: 0,
        pattern2: 0,
        pattern3: 0,
        pattern4: 0,
        pattern5: 0,
        pattern6: 0,
        pattern7: 0,
      );

      expect(model.gnosisFingerPerceptionTotal, 0);
    });

    test('setGnosisFingerPerception with max values gives total of 14', () {
      model.setGnosisFingerPerception(
        pattern1: 2,
        pattern2: 2,
        pattern3: 2,
        pattern4: 2,
        pattern5: 2,
        pattern6: 2,
        pattern7: 2,
      );

      expect(model.gnosisFingerPerceptionTotal, 14);
    });

    test('setGnosisVisualIdentification updates values and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setGnosisVisualIdentification(
        nominalDysphasia: 1,
        visualAgnosia: 2,
      );

      expect(model.gnosisVisualNominalDysphasia, 1);
      expect(model.gnosisVisualAgnosia, 2);
      expect(notifyCount, 1);
    });

    test('setGnosisAstereognosis updates values and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setGnosisAstereognosis(
        rightHand: 1,
        leftHand: 0,
      );

      expect(model.gnosisAstereognosisRight, 1);
      expect(model.gnosisAstereognosisLeft, 0);
      expect(notifyCount, 1);
    });

    test('setGnosisClockDrawing updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setGnosisClockDrawing(4);

      expect(model.gnosisClockDrawing, 4);
      expect(notifyCount, 1);
    });
  });

  group('Anomia/Agnosia', () {
    test('setAnomiaAgnosia updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setAnomiaAgnosia(2);

      expect(model.anomiaAgnosia, 2);
      expect(notifyCount, 1);
    });

    test('setAgnosia updates value and notifies', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.setAgnosia(1);

      expect(model.agnosia, 1);
      expect(notifyCount, 1);
    });
  });

  group('initFromTestSummary', () {
    test('sets all fields correctly', () {
      final testDate = DateTime(2024, 3, 20);

      model.initFromTestSummary(
        patientName: 'Test Patient',
        assessorName: 'Test Assessor',
        handedness: 'Left',
        assessmentDate: testDate,
        languageComprehensionRadioValue: 1,
        trialOneScore: 7,
        trialTwoScore: 8,
        trialThreeScore: 9,
        visuospatialPraxisImage1: 1,
        visuospatialPraxisImage2: 2,
        visuospatialPraxisImage3: 0,
        attention: 1,
        attentionCorrect: 28,
        attentionMistakes: 2,
        executiveAnimalNaming: 0,
        executiveAnimalNamingCount: 15,
        executiveLexicalFluency: 1,
        executiveLexicalFluencyCount: 10,
        executiveDesignFluency: 2,
        executiveFingerNose: 0,
        executiveTap: 1,
        executiveAlternatingSequences: 2,
        executiveLuria: 1,
        executiveLuriaScore: 3,
        executiveSerial: 0,
        executiveSerialScore: 5,
        shorttermMemoryVerbal: 1,
        shorttermMemoryVerbalScore: 4,
        praxisRight: 2,
        praxisLeft: 1,
        tenWordDelay: 6,
        scoreVerbalRecognitionMemoryTenWords: 18,
        scoreVerbalRecognitionMemoryTenWordsInList: 9,
        scoreVerbalRecognitionMemoryTenWordsNotInList: 9,
        shorttermMemoryVisualImage1: 1,
        shorttermMemoryVisualImage2: 0,
        shorttermMemoryVisualImage3: 2,
        anomiaAgnosia: 1,
        agnosia: 0,
        executive: 1,
        spokenLanguage: 2,
        // Gnosis parameters
        gnosisFingerPerceptionPattern1: 2,
        gnosisFingerPerceptionPattern2: 1,
        gnosisFingerPerceptionPattern3: 0,
        gnosisFingerPerceptionPattern4: 2,
        gnosisFingerPerceptionPattern5: 1,
        gnosisFingerPerceptionPattern6: 0,
        gnosisFingerPerceptionPattern7: 2,
        gnosisFingerPerceptionTotal: 8,
        gnosisVisualNominalDysphasia: 1,
        gnosisVisualAgnosia: 2,
        gnosisAstereognosisRight: 0,
        gnosisAstereognosisLeft: 1,
        gnosisClockDrawing: 4,
        // Language parameters
        languageReading: 1,
        languageRepetition: 0,
        languageComprehensionMoving: 2,
        languageWriting: 1,
        languageObjectNaming: 0,
        languageSpontaneousSpeech: 2,
        languageComprehensionThreeStage: 1,
        languagePictureNamingCorrect: 8,
        languagePictureNamingTotal: 10,
        languagePictureAgnosia: 2,
        // Memory parameters
        memorySemanticScore: 1,
        memoryVisualWorkingImage1: 2,
        memoryVisualWorkingImage2: 0,
        memoryVisualWorkingImage3: 1,
        memoryShortVerbalCorrect: 5,
        memoryShortVerbalTotal: 7,
        memoryTenWordRecognitionCorrect: 8,
        memoryTenWordRecognitionFalsePositive: 2,
      );

      // Verify patient info
      expect(model.patientName, 'Test Patient');
      expect(model.assessorName, 'Test Assessor');
      expect(model.handedness, 'Left');
      expect(model.assessmentDate, testDate);

      // Verify language
      expect(model.languageComprehensionRadioValue, 1);
      expect(model.spokenLanguage, 2);
      expect(model.languageReading, 1);
      expect(model.languageRepetition, 0);
      expect(model.languageComprehensionMoving, 2);
      expect(model.languageWriting, 1);
      expect(model.languageObjectNaming, 0);
      expect(model.languageSpontaneousSpeech, 2);
      expect(model.languageComprehensionThreeStage, 1);
      expect(model.languagePictureNamingCorrect, 8);
      expect(model.languagePictureNamingTotal, 10);
      expect(model.languagePictureAgnosia, 2);

      // Verify memory
      expect(model.trialOneScore, 7);
      expect(model.trialTwoScore, 8);
      expect(model.trialThreeScore, 9);
      expect(model.tenWordDelay, 6);
      expect(model.shorttermMemoryVerbal, 1);
      expect(model.shorttermMemoryVerbalScore, 4);
      expect(model.scoreVerbalRecognitionMemoryTenWords, 18);
      expect(model.scoreVerbalRecognitionMemoryTenWordsInList, 9);
      expect(model.scoreVerbalRecognitionMemoryTenWordsNotInList, 9);
      expect(model.shorttermMemoryVisualImage1, 1);
      expect(model.shorttermMemoryVisualImage2, 0);
      expect(model.shorttermMemoryVisualImage3, 2);
      expect(model.memorySemanticScore, 1);
      expect(model.memoryVisualWorkingImage1, 2);
      expect(model.memoryVisualWorkingImage2, 0);
      expect(model.memoryVisualWorkingImage3, 1);
      expect(model.memoryShortVerbalCorrect, 5);
      expect(model.memoryShortVerbalTotal, 7);
      expect(model.memoryTenWordRecognitionCorrect, 8);
      expect(model.memoryTenWordRecognitionFalsePositive, 2);

      // Verify praxis
      expect(model.visuospatialPraxisImage1, 1);
      expect(model.visuospatialPraxisImage2, 2);
      expect(model.visuospatialPraxisImage3, 0);
      expect(model.praxisRight, 2);
      expect(model.praxisLeft, 1);

      // Verify attention
      expect(model.attention, 1);
      expect(model.attentionCorrect, 28);
      expect(model.attentionMistakes, 2);

      // Verify executive
      expect(model.executiveAnimalNaming, 0);
      expect(model.executiveAnimalNamingCount, 15);
      expect(model.executiveLexicalFluency, 1);
      expect(model.executiveLexicalFluencyCount, 10);
      expect(model.executiveDesignFluency, 2);
      expect(model.executiveFingerNose, 0);
      expect(model.executiveTap, 1);
      expect(model.executiveAlternatingSequences, 2);
      expect(model.executiveLuria, 1);
      expect(model.executiveLuriaScore, 3);
      expect(model.executiveSerial, 0);
      expect(model.executiveSerialScore, 5);
      expect(model.executive, 1);

      // Verify anomia/agnosia
      expect(model.anomiaAgnosia, 1);
      expect(model.agnosia, 0);

      // Verify gnosis
      expect(model.gnosisFingerPerceptionPattern1, 2);
      expect(model.gnosisFingerPerceptionPattern2, 1);
      expect(model.gnosisFingerPerceptionPattern3, 0);
      expect(model.gnosisFingerPerceptionPattern4, 2);
      expect(model.gnosisFingerPerceptionPattern5, 1);
      expect(model.gnosisFingerPerceptionPattern6, 0);
      expect(model.gnosisFingerPerceptionPattern7, 2);
      expect(model.gnosisFingerPerceptionTotal, 8);
      expect(model.gnosisVisualNominalDysphasia, 1);
      expect(model.gnosisVisualAgnosia, 2);
      expect(model.gnosisAstereognosisRight, 0);
      expect(model.gnosisAstereognosisLeft, 1);
      expect(model.gnosisClockDrawing, 4);
    });

    test('notifies listeners once', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.initFromTestSummary(
        patientName: 'Test',
        assessorName: 'Test',
        handedness: 'Right',
        assessmentDate: DateTime.now(),
        languageComprehensionRadioValue: 0,
        trialOneScore: 0,
        trialTwoScore: 0,
        trialThreeScore: 0,
        visuospatialPraxisImage1: 0,
        visuospatialPraxisImage2: 0,
        visuospatialPraxisImage3: 0,
        attention: 0,
        attentionCorrect: 0,
        attentionMistakes: 0,
        executiveAnimalNaming: 0,
        executiveAnimalNamingCount: 0,
        executiveLexicalFluency: 0,
        executiveLexicalFluencyCount: 0,
        executiveDesignFluency: 0,
        executiveFingerNose: 0,
        executiveTap: 0,
        executiveAlternatingSequences: 0,
        executiveLuria: 0,
        executiveLuriaScore: 0,
        executiveSerial: 0,
        executiveSerialScore: 0,
        shorttermMemoryVerbal: 0,
        shorttermMemoryVerbalScore: 0,
        praxisRight: 0,
        praxisLeft: 0,
        tenWordDelay: 0,
        scoreVerbalRecognitionMemoryTenWords: 0,
        scoreVerbalRecognitionMemoryTenWordsInList: 0,
        scoreVerbalRecognitionMemoryTenWordsNotInList: 0,
        shorttermMemoryVisualImage1: 0,
        shorttermMemoryVisualImage2: 0,
        shorttermMemoryVisualImage3: 0,
        anomiaAgnosia: 0,
        agnosia: 0,
        executive: 0,
        spokenLanguage: 0,
        gnosisFingerPerceptionPattern1: 0,
        gnosisFingerPerceptionPattern2: 0,
        gnosisFingerPerceptionPattern3: 0,
        gnosisFingerPerceptionPattern4: 0,
        gnosisFingerPerceptionPattern5: 0,
        gnosisFingerPerceptionPattern6: 0,
        gnosisFingerPerceptionPattern7: 0,
        gnosisFingerPerceptionTotal: 0,
        gnosisVisualNominalDysphasia: 0,
        gnosisVisualAgnosia: 0,
        gnosisAstereognosisRight: 0,
        gnosisAstereognosisLeft: 0,
        gnosisClockDrawing: 0,
        languageReading: 0,
        languageRepetition: 0,
        languageComprehensionMoving: 0,
        languageWriting: 0,
        languageObjectNaming: 0,
        languageSpontaneousSpeech: 0,
        languageComprehensionThreeStage: 0,
        languagePictureNamingCorrect: 0,
        languagePictureNamingTotal: 0,
        languagePictureAgnosia: 0,
        memorySemanticScore: 0,
        memoryVisualWorkingImage1: 0,
        memoryVisualWorkingImage2: 0,
        memoryVisualWorkingImage3: 0,
        memoryShortVerbalCorrect: 0,
        memoryShortVerbalTotal: 0,
        memoryTenWordRecognitionCorrect: 0,
        memoryTenWordRecognitionFalsePositive: 0,
      );

      expect(notifyCount, 1);
    });
  });

  group('resetScores', () {
    test('resets all scores to default values', () {
      // First set some values
      model.setPatientInfo(
        patientName: 'John',
        assessorName: 'Dr. Smith',
        handedness: 'Left',
        assessmentDate: DateTime(2024, 5, 15),
      );
      model.setTrialOneScore(8);
      model.setAttention(score: 2, correct: 25, mistakes: 5);
      model.setGnosisClockDrawing(5);

      // Now reset
      model.resetScores();

      // Verify patient info is reset
      expect(model.patientName, '');
      expect(model.assessorName, '');
      expect(model.handedness, 'Right');

      // Verify scores are reset to 0
      expect(model.trialOneScore, 0);
      expect(model.attention, 0);
      expect(model.attentionCorrect, 0);
      expect(model.attentionMistakes, 0);
      expect(model.gnosisClockDrawing, 0);

      // Verify other fields are reset
      expect(model.languageComprehensionRadioValue, 0);
      expect(model.spokenLanguage, 0);
      expect(model.executive, 0);
    });

    test('notifies listeners', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      model.resetScores();

      expect(notifyCount, 1);
    });
  });

  group('Listener Notifications', () {
    test('each setter calls notifyListeners exactly once', () {
      int notifyCount = 0;
      model.addListener(() => notifyCount++);

      // Call various setters
      model.setLanguageComprehension(1);
      expect(notifyCount, 1);

      model.setTrialOneScore(5);
      expect(notifyCount, 2);

      model.setAttention(score: 0, correct: 30, mistakes: 0);
      expect(notifyCount, 3);

      model.setGnosisClockDrawing(3);
      expect(notifyCount, 4);
    });

    test('listener can be removed', () {
      int notifyCount = 0;
      void listener() => notifyCount++;

      model.addListener(listener);
      model.setTrialOneScore(5);
      expect(notifyCount, 1);

      model.removeListener(listener);
      model.setTrialOneScore(6);
      expect(notifyCount, 1); // Should not increment
    });
  });

  group('ScoreValidation Constants', () {
    test('radio value range is 0-2', () {
      expect(ScoreValidation.radioMin, 0);
      expect(ScoreValidation.radioMax, 2);
    });

    test('ten word trial range is 0-10', () {
      expect(ScoreValidation.tenWordTrialMin, 0);
      expect(ScoreValidation.tenWordTrialMax, 10);
    });

    test('image score range is 0-3', () {
      expect(ScoreValidation.imageScoreMin, 0);
      expect(ScoreValidation.imageScoreMax, 3);
    });

    test('attention counter range is 0-30', () {
      expect(ScoreValidation.attentionCounterMin, 0);
      expect(ScoreValidation.attentionCounterMax, 30);
    });

    test('clock drawing range is 0-5', () {
      expect(ScoreValidation.clockDrawingMin, 0);
      expect(ScoreValidation.clockDrawingMax, 5);
    });

    test('short verbal memory range is 0-7', () {
      expect(ScoreValidation.shortVerbalMemoryMin, 0);
      expect(ScoreValidation.shortVerbalMemoryMax, 7);
    });

    test('picture naming range is 0-10', () {
      expect(ScoreValidation.pictureNamingMin, 0);
      expect(ScoreValidation.pictureNamingMax, 10);
    });

    test('finger perception total range is 0-14', () {
      expect(ScoreValidation.fingerPerceptionTotalMin, 0);
      expect(ScoreValidation.fingerPerceptionTotalMax, 14);
    });
  });

  group('ScoreValidation Helper Methods', () {
    test('isValidRadioValue returns correct results', () {
      expect(ScoreValidation.isValidRadioValue(-1), false);
      expect(ScoreValidation.isValidRadioValue(0), true);
      expect(ScoreValidation.isValidRadioValue(1), true);
      expect(ScoreValidation.isValidRadioValue(2), true);
      expect(ScoreValidation.isValidRadioValue(3), false);
    });

    test('isValidTenWordTrialScore returns correct results', () {
      expect(ScoreValidation.isValidTenWordTrialScore(-1), false);
      expect(ScoreValidation.isValidTenWordTrialScore(0), true);
      expect(ScoreValidation.isValidTenWordTrialScore(10), true);
      expect(ScoreValidation.isValidTenWordTrialScore(11), false);
    });

    test('isValidImageScore returns correct results', () {
      expect(ScoreValidation.isValidImageScore(-1), false);
      expect(ScoreValidation.isValidImageScore(0), true);
      expect(ScoreValidation.isValidImageScore(3), true);
      expect(ScoreValidation.isValidImageScore(4), false);
    });

    test('isValidAttentionCounter returns correct results', () {
      expect(ScoreValidation.isValidAttentionCounter(-1), false);
      expect(ScoreValidation.isValidAttentionCounter(0), true);
      expect(ScoreValidation.isValidAttentionCounter(30), true);
      expect(ScoreValidation.isValidAttentionCounter(31), false);
    });

    test('isValidClockDrawingScore returns correct results', () {
      expect(ScoreValidation.isValidClockDrawingScore(-1), false);
      expect(ScoreValidation.isValidClockDrawingScore(0), true);
      expect(ScoreValidation.isValidClockDrawingScore(5), true);
      expect(ScoreValidation.isValidClockDrawingScore(6), false);
    });

    test('isValidCorrectTotal validates relationship', () {
      expect(ScoreValidation.isValidCorrectTotal(5, 10), true);
      expect(ScoreValidation.isValidCorrectTotal(10, 10), true);
      expect(ScoreValidation.isValidCorrectTotal(0, 0), true);
      expect(ScoreValidation.isValidCorrectTotal(11, 10), false);
      expect(ScoreValidation.isValidCorrectTotal(-1, 10), false);
    });

    test('isValidAttentionSum validates sum constraint', () {
      expect(ScoreValidation.isValidAttentionSum(30, 0), true);
      expect(ScoreValidation.isValidAttentionSum(28, 2), true);
      expect(ScoreValidation.isValidAttentionSum(15, 15), true);
      expect(ScoreValidation.isValidAttentionSum(20, 15), false);
      expect(ScoreValidation.isValidAttentionSum(-1, 5), false);
    });
  });
}
