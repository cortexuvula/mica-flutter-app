import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mica/src/services/persistence_service.dart';
import 'package:mica/src/models/mica_score_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    // Set up mock SharedPreferences with empty values before each test
    SharedPreferences.setMockInitialValues({});
  });

  group('PersistenceService', () {
    group('hasInProgressAssessment', () {
      test('returns false when no saved data exists', () async {
        final hasProgress = await PersistenceService.hasInProgressAssessment();
        expect(hasProgress, isFalse);
      });

      test('returns true when valid saved data exists', () async {
        // Pre-populate with valid data
        SharedPreferences.setMockInitialValues({
          'mica_assessment_progress':
              '{"savedAt":"2024-01-15T10:00:00.000","patientName":"Test Patient"}',
        });

        final hasProgress = await PersistenceService.hasInProgressAssessment();
        expect(hasProgress, isTrue);
      });

      test('returns false when saved data is corrupted', () async {
        SharedPreferences.setMockInitialValues({
          'mica_assessment_progress': 'not valid json',
        });

        final hasProgress = await PersistenceService.hasInProgressAssessment();
        expect(hasProgress, isFalse);
      });

      test('returns false when saved data is missing required fields', () async {
        SharedPreferences.setMockInitialValues({
          'mica_assessment_progress': '{"someField":"someValue"}',
        });

        final hasProgress = await PersistenceService.hasInProgressAssessment();
        expect(hasProgress, isFalse);
      });
    });

    group('saveProgress', () {
      test('saves model with data to SharedPreferences', () async {
        final model = MicaScoreModel();
        model.setPatientInfo(
          patientName: 'Test Patient',
          assessorName: 'Dr. Test',
          handedness: 'Right',
          assessmentDate: DateTime(2024, 1, 15),
        );

        // Save with immediate save to bypass debounce
        final result = await PersistenceService.saveProgressImmediate(model);
        expect(result, isTrue);

        // Verify data was saved
        final hasProgress = await PersistenceService.hasInProgressAssessment();
        expect(hasProgress, isTrue);
      });

      test('does not save model without data', () async {
        final model = MicaScoreModel();

        final result = await PersistenceService.saveProgress(model);
        expect(result, isFalse);
      });
    });

    group('loadProgress', () {
      test('returns null when no saved data exists', () async {
        final data = await PersistenceService.loadProgress();
        expect(data, isNull);
      });

      test('returns data when valid saved data exists', () async {
        SharedPreferences.setMockInitialValues({
          'mica_assessment_progress':
              '{"savedAt":"2024-01-15T10:00:00.000","patientName":"Test Patient","assessorName":"Dr. Test"}',
        });

        final data = await PersistenceService.loadProgress();
        expect(data, isNotNull);
        expect(data!['patientName'], equals('Test Patient'));
        expect(data['assessorName'], equals('Dr. Test'));
      });

      test('returns null and clears corrupted data', () async {
        SharedPreferences.setMockInitialValues({
          'mica_assessment_progress': 'corrupted data',
        });

        final data = await PersistenceService.loadProgress();
        expect(data, isNull);

        // Verify corrupted data was cleared
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.containsKey('mica_assessment_progress'), isFalse);
      });
    });

    group('clearProgress', () {
      test('removes saved data from SharedPreferences', () async {
        SharedPreferences.setMockInitialValues({
          'mica_assessment_progress':
              '{"savedAt":"2024-01-15T10:00:00.000","patientName":"Test Patient"}',
        });

        // Verify data exists first
        var hasProgress = await PersistenceService.hasInProgressAssessment();
        expect(hasProgress, isTrue);

        // Clear it
        final result = await PersistenceService.clearProgress();
        expect(result, isTrue);

        // Verify data is gone
        hasProgress = await PersistenceService.hasInProgressAssessment();
        expect(hasProgress, isFalse);
      });

      test('succeeds even when no saved data exists', () async {
        final result = await PersistenceService.clearProgress();
        expect(result, isTrue);
      });
    });

    group('getSavedPatientName', () {
      test('returns null when no saved data exists', () async {
        final name = await PersistenceService.getSavedPatientName();
        expect(name, isNull);
      });

      test('returns patient name when data exists', () async {
        SharedPreferences.setMockInitialValues({
          'mica_assessment_progress':
              '{"savedAt":"2024-01-15T10:00:00.000","patientName":"John Doe"}',
        });

        final name = await PersistenceService.getSavedPatientName();
        expect(name, equals('John Doe'));
      });

      test('returns null when patient name is empty string', () async {
        SharedPreferences.setMockInitialValues({
          'mica_assessment_progress':
              '{"savedAt":"2024-01-15T10:00:00.000","patientName":""}',
        });

        final name = await PersistenceService.getSavedPatientName();
        expect(name, isNull);
      });
    });

    group('getSavedTimestamp', () {
      test('returns null when no saved data exists', () async {
        final timestamp = await PersistenceService.getSavedTimestamp();
        expect(timestamp, isNull);
      });

      test('returns timestamp when data exists', () async {
        SharedPreferences.setMockInitialValues({
          'mica_assessment_progress':
              '{"savedAt":"2024-01-15T10:30:00.000","patientName":"Test"}',
        });

        final timestamp = await PersistenceService.getSavedTimestamp();
        expect(timestamp, isNotNull);
        expect(timestamp!.year, equals(2024));
        expect(timestamp.month, equals(1));
        expect(timestamp.day, equals(15));
      });
    });

    group('restoreProgress', () {
      test('restores model from saved data', () async {
        SharedPreferences.setMockInitialValues({
          'mica_assessment_progress':
              '{"savedAt":"2024-01-15T10:00:00.000","patientName":"Restored Patient","assessorName":"Dr. Restore","handedness":"Left","assessmentDate":"2024-01-15T00:00:00.000","trialOneScore":5,"attention":1}',
        });

        final model = MicaScoreModel();
        final result = await PersistenceService.restoreProgress(model);

        expect(result, isTrue);
        expect(model.patientName, equals('Restored Patient'));
        expect(model.assessorName, equals('Dr. Restore'));
        expect(model.handedness, equals('Left'));
        expect(model.trialOneScore, equals(5));
        expect(model.attention, equals(1));
      });

      test('returns false when no saved data exists', () async {
        final model = MicaScoreModel();
        final result = await PersistenceService.restoreProgress(model);
        expect(result, isFalse);
      });
    });

    group('MicaScoreModel serialization', () {
      test('toJson includes all fields', () {
        final model = MicaScoreModel();
        model.setPatientInfo(
          patientName: 'Test Patient',
          assessorName: 'Dr. Test',
          handedness: 'Left',
          assessmentDate: DateTime(2024, 1, 15),
        );
        model.setTrialOneScore(7);
        model.setAttention(score: 2, correct: 25, mistakes: 2);
        model.setGnosisClockDrawing(4);

        final json = model.toJson();

        expect(json['patientName'], equals('Test Patient'));
        expect(json['assessorName'], equals('Dr. Test'));
        expect(json['handedness'], equals('Left'));
        expect(json['trialOneScore'], equals(7));
        expect(json['attention'], equals(2));
        expect(json['attentionCorrect'], equals(25));
        expect(json['attentionMistakes'], equals(2));
        expect(json['gnosisClockDrawing'], equals(4));
        expect(json.containsKey('savedAt'), isTrue);
        expect(json.containsKey('version'), isTrue);
      });

      test('fromJson restores all fields', () {
        final json = {
          'patientName': 'Restored Patient',
          'assessorName': 'Dr. Restored',
          'handedness': 'Left',
          'assessmentDate': '2024-01-15T00:00:00.000',
          'trialOneScore': 8,
          'trialTwoScore': 9,
          'trialThreeScore': 10,
          'attention': 2,
          'attentionCorrect': 28,
          'attentionMistakes': 1,
          'gnosisClockDrawing': 5,
          'executiveAnimalNamingCount': 15,
        };

        final model = MicaScoreModel();
        model.fromJson(json);

        expect(model.patientName, equals('Restored Patient'));
        expect(model.assessorName, equals('Dr. Restored'));
        expect(model.handedness, equals('Left'));
        expect(model.trialOneScore, equals(8));
        expect(model.trialTwoScore, equals(9));
        expect(model.trialThreeScore, equals(10));
        expect(model.attention, equals(2));
        expect(model.attentionCorrect, equals(28));
        expect(model.attentionMistakes, equals(1));
        expect(model.gnosisClockDrawing, equals(5));
        expect(model.executiveAnimalNamingCount, equals(15));
      });

      test('fromJson handles missing fields gracefully', () {
        final json = {
          'patientName': 'Partial Data',
          'savedAt': '2024-01-15T10:00:00.000',
        };

        final model = MicaScoreModel();
        model.fromJson(json);

        expect(model.patientName, equals('Partial Data'));
        expect(model.assessorName, equals(''));
        expect(model.handedness, equals('Right')); // Default value
        expect(model.trialOneScore, equals(0));
      });

      test('hasData returns true when patient name is set', () {
        final model = MicaScoreModel();
        expect(model.hasData, isFalse);

        model.setPatientInfo(
          patientName: 'Test',
          assessorName: '',
          handedness: 'Right',
          assessmentDate: DateTime.now(),
        );
        expect(model.hasData, isTrue);
      });

      test('hasData returns true when scores are set', () {
        final model = MicaScoreModel();
        expect(model.hasData, isFalse);

        model.setTrialOneScore(5);
        expect(model.hasData, isTrue);
      });

      test('hasData returns false for empty model', () {
        final model = MicaScoreModel();
        expect(model.hasData, isFalse);
      });
    });

    group('Round-trip persistence', () {
      test('model data survives save and restore cycle', () async {
        // Create model with various data
        final originalModel = MicaScoreModel();
        originalModel.setPatientInfo(
          patientName: 'Round Trip Patient',
          assessorName: 'Dr. Round',
          handedness: 'Left',
          assessmentDate: DateTime(2024, 3, 20),
        );
        originalModel.setTrialOneScore(6);
        originalModel.setTrialTwoScore(7);
        originalModel.setTrialThreeScore(8);
        originalModel.setAttention(score: 1, correct: 20, mistakes: 5);
        originalModel.setGnosisClockDrawing(3);

        // Save it
        await PersistenceService.saveProgressImmediate(originalModel);

        // Restore into new model
        final restoredModel = MicaScoreModel();
        final result = await PersistenceService.restoreProgress(restoredModel);

        expect(result, isTrue);
        expect(restoredModel.patientName, equals('Round Trip Patient'));
        expect(restoredModel.assessorName, equals('Dr. Round'));
        expect(restoredModel.handedness, equals('Left'));
        expect(restoredModel.trialOneScore, equals(6));
        expect(restoredModel.trialTwoScore, equals(7));
        expect(restoredModel.trialThreeScore, equals(8));
        expect(restoredModel.attention, equals(1));
        expect(restoredModel.attentionCorrect, equals(20));
        expect(restoredModel.attentionMistakes, equals(5));
        expect(restoredModel.gnosisClockDrawing, equals(3));
      });
    });
  });
}
