import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mica/src/summary/summary_with_provider_refactored.dart';
import 'package:mica/src/summary/assessment_color_utils.dart';
import 'package:mica/src/summary/assessment_string_utils.dart';
import 'package:mica/src/summary/services/share_service.dart';
import 'package:mica/src/models/mica_score_model.dart';
import 'package:provider/provider.dart';

void main() {
  late MicaScoreModel scoreModel;

  setUp(() {
    scoreModel = MicaScoreModel();
  });

  group('Color Calculation Tests', () {
    group('attentionColor', () {
      test('returns green for normal (0)', () {
        expect(AssessmentColorUtils.attentionColor(0), Colors.green);
      });

      test('returns yellow for equivocal (1)', () {
        expect(AssessmentColorUtils.attentionColor(1), Colors.yellow);
      });

      test('returns red for impaired (2)', () {
        expect(AssessmentColorUtils.attentionColor(2), Colors.red);
      });
    });

    group('languageDomainColor', () {
      test('returns red if any value is impaired', () {
        expect(AssessmentColorUtils.languageDomainColor(2, 0), Colors.red);
        expect(AssessmentColorUtils.languageDomainColor(0, 2), Colors.red);
        expect(AssessmentColorUtils.languageDomainColor(2, 2), Colors.red);
      });

      test('returns yellow if any value is equivocal and none impaired', () {
        expect(AssessmentColorUtils.languageDomainColor(1, 0), Colors.yellow);
        expect(AssessmentColorUtils.languageDomainColor(0, 1), Colors.yellow);
        expect(AssessmentColorUtils.languageDomainColor(1, 1), Colors.yellow);
      });

      test('returns green if all values are normal', () {
        expect(AssessmentColorUtils.languageDomainColor(0, 0), Colors.green);
      });
    });

    group('trial1Color', () {
      test('returns red for value < 5', () {
        expect(AssessmentColorUtils.trial1Color(0), Colors.red);
        expect(AssessmentColorUtils.trial1Color(4), Colors.red);
      });

      test('returns yellow for value 5-6', () {
        expect(AssessmentColorUtils.trial1Color(5), Colors.yellow);
        expect(AssessmentColorUtils.trial1Color(6), Colors.yellow);
      });

      test('returns green for value > 6', () {
        expect(AssessmentColorUtils.trial1Color(7), Colors.green);
        expect(AssessmentColorUtils.trial1Color(10), Colors.green);
      });
    });

    group('trial2Color', () {
      test('returns red for value < 5', () {
        expect(AssessmentColorUtils.trial2Color(0), Colors.red);
        expect(AssessmentColorUtils.trial2Color(4), Colors.red);
      });

      test('returns yellow for value 5-6', () {
        expect(AssessmentColorUtils.trial2Color(5), Colors.yellow);
        expect(AssessmentColorUtils.trial2Color(6), Colors.yellow);
      });

      test('returns green for value > 6', () {
        expect(AssessmentColorUtils.trial2Color(7), Colors.green);
        expect(AssessmentColorUtils.trial2Color(10), Colors.green);
      });
    });

    group('trial3Color', () {
      test('returns red for value < 6', () {
        expect(AssessmentColorUtils.trial3Color(0), Colors.red);
        expect(AssessmentColorUtils.trial3Color(5), Colors.red);
      });

      test('returns yellow for value 6-7', () {
        expect(AssessmentColorUtils.trial3Color(6), Colors.yellow);
        expect(AssessmentColorUtils.trial3Color(7), Colors.yellow);
      });

      test('returns green for value > 7', () {
        expect(AssessmentColorUtils.trial3Color(8), Colors.green);
        expect(AssessmentColorUtils.trial3Color(10), Colors.green);
      });
    });

    group('delayRecallColor', () {
      test('returns red for value < 5', () {
        expect(AssessmentColorUtils.delayRecallColor(0), Colors.red);
        expect(AssessmentColorUtils.delayRecallColor(4), Colors.red);
      });

      test('returns yellow for value = 5', () {
        expect(AssessmentColorUtils.delayRecallColor(5), Colors.yellow);
      });

      test('returns green for value > 5', () {
        expect(AssessmentColorUtils.delayRecallColor(6), Colors.green);
        expect(AssessmentColorUtils.delayRecallColor(10), Colors.green);
      });
    });

    group('verbalShortTermMemoryColor', () {
      test('returns green when all scores are excellent', () {
        expect(
          AssessmentColorUtils.verbalShortTermMemoryColor(7, 8, 0, 6, 6),
          Colors.green,
        );
        expect(
          AssessmentColorUtils.verbalShortTermMemoryColor(10, 10, 5, 10, 10),
          Colors.green,
        );
      });

      test('returns red when any score is impaired', () {
        expect(
          AssessmentColorUtils.verbalShortTermMemoryColor(4, 8, 0, 6, 6),
          Colors.red,
        );
        expect(
          AssessmentColorUtils.verbalShortTermMemoryColor(7, 4, 0, 6, 6),
          Colors.red,
        );
        expect(
          AssessmentColorUtils.verbalShortTermMemoryColor(7, 8, 3, 6, 6),
          Colors.red,
        );
        expect(
          AssessmentColorUtils.verbalShortTermMemoryColor(7, 8, 0, 4, 6),
          Colors.red,
        );
        expect(
          AssessmentColorUtils.verbalShortTermMemoryColor(7, 8, 0, 6, 4),
          Colors.red,
        );
      });

      test('returns yellow when any score is equivocal and none impaired', () {
        expect(
          AssessmentColorUtils.verbalShortTermMemoryColor(5, 8, 0, 6, 6),
          Colors.yellow,
        );
        expect(
          AssessmentColorUtils.verbalShortTermMemoryColor(6, 8, 0, 6, 6),
          Colors.yellow,
        );
        expect(
          AssessmentColorUtils.verbalShortTermMemoryColor(7, 5, 0, 6, 6),
          Colors.yellow,
        );
        expect(
          AssessmentColorUtils.verbalShortTermMemoryColor(7, 7, 0, 6, 6),
          Colors.yellow,
        );
        expect(
          AssessmentColorUtils.verbalShortTermMemoryColor(7, 8, 4, 6, 6),
          Colors.yellow,
        );
        expect(
          AssessmentColorUtils.verbalShortTermMemoryColor(7, 8, 0, 5, 6),
          Colors.yellow,
        );
        expect(
          AssessmentColorUtils.verbalShortTermMemoryColor(7, 8, 0, 6, 5),
          Colors.yellow,
        );
      });
    });

    group('visualMemoryColor', () {
      test('calculates visual scores correctly', () {
        scoreModel.setShorttermMemoryVisualImages(
          image1: 0,
          image2: 0,
          image3: 0,
        );
        expect(AssessmentColorUtils.visualMemoryColor(scoreModel), Colors.green);

        scoreModel.setShorttermMemoryVisualImages(
          image1: 1,
          image2: 0,
          image3: 0,
        );
        expect(AssessmentColorUtils.visualMemoryColor(scoreModel), Colors.green);

        scoreModel.setShorttermMemoryVisualImages(
          image1: 1,
          image2: 1,
          image3: 1,
        );
        expect(AssessmentColorUtils.visualMemoryColor(scoreModel), Colors.yellow);

        scoreModel.setShorttermMemoryVisualImages(
          image1: 2,
          image2: 1,
          image3: 1,
        );
        expect(AssessmentColorUtils.visualMemoryColor(scoreModel), Colors.red);
      });
    });

    group('praxisDomainColor', () {
      test('returns appropriate colors based on praxis scores', () {
        scoreModel.setVisuospatialPraxisImages(
          image1: 0,
          image2: 0,
          image3: 0,
        );
        scoreModel.setPraxisScores(right: 0, left: 0);
        expect(AssessmentColorUtils.praxisDomainColor(scoreModel), Colors.green);

        scoreModel.setVisuospatialPraxisImages(
          image1: 2,
          image2: 1,
          image3: 1,
        );
        scoreModel.setPraxisScores(right: 0, left: 0);
        expect(AssessmentColorUtils.praxisDomainColor(scoreModel), Colors.yellow);

        scoreModel.setVisuospatialPraxisImages(
          image1: 0,
          image2: 0,
          image3: 0,
        );
        scoreModel.setPraxisScores(right: 2, left: 0);
        expect(AssessmentColorUtils.praxisDomainColor(scoreModel), Colors.red);

        scoreModel.setVisuospatialPraxisImages(
          image1: 0,
          image2: 0,
          image3: 0,
        );
        scoreModel.setPraxisScores(right: 0, left: 2);
        expect(AssessmentColorUtils.praxisDomainColor(scoreModel), Colors.red);
      });
    });

    group('gnosisDomainColor', () {
      test('returns appropriate colors based on gnosis scores', () {
        scoreModel.setVisuospatialPraxisImages(
          image1: 0,
          image2: 0,
          image3: 0,
        );
        scoreModel.setAnomiaAgnosia(0);
        expect(AssessmentColorUtils.gnosisDomainColor(scoreModel), Colors.green);

        scoreModel.setVisuospatialPraxisImages(
          image1: 2,
          image2: 1,
          image3: 1,
        );
        scoreModel.setAnomiaAgnosia(0);
        expect(AssessmentColorUtils.gnosisDomainColor(scoreModel), Colors.yellow);

        scoreModel.setVisuospatialPraxisImages(
          image1: 0,
          image2: 0,
          image3: 0,
        );
        scoreModel.setAnomiaAgnosia(2);
        expect(AssessmentColorUtils.gnosisDomainColor(scoreModel), Colors.red);
      });
    });

    group('executiveFunctionColor', () {
      test('returns green for normal (0)', () {
        expect(AssessmentColorUtils.executiveFunctionColor(0), Colors.green);
      });

      test('returns yellow for equivocal (1)', () {
        expect(AssessmentColorUtils.executiveFunctionColor(1), Colors.yellow);
      });

      test('returns red for impaired (2)', () {
        expect(AssessmentColorUtils.executiveFunctionColor(2), Colors.red);
      });
    });

    group('radioValueToColor', () {
      test('returns correct colors for radio values', () {
        expect(AssessmentColorUtils.radioValueToColor(0), Colors.green);
        expect(AssessmentColorUtils.radioValueToColor(1), Colors.yellow);
        expect(AssessmentColorUtils.radioValueToColor(2), Colors.red);
      });
    });
  });

  group('String Result Tests', () {
    group('radioValueToString', () {
      test('converts radio values to string correctly', () {
        expect(AssessmentStringUtils.radioValueToString(0), 'N');
        expect(AssessmentStringUtils.radioValueToString(1), 'E');
        expect(AssessmentStringUtils.radioValueToString(2), 'I');
        expect(AssessmentStringUtils.radioValueToString(3), 'N'); // default case
      });
    });

    group('trial1ResultToString', () {
      test('converts trial 1 scores to string correctly', () {
        expect(AssessmentStringUtils.trial1ResultToString(0), 'I');
        expect(AssessmentStringUtils.trial1ResultToString(3), 'I');
        expect(AssessmentStringUtils.trial1ResultToString(4), 'I');
        expect(AssessmentStringUtils.trial1ResultToString(5), 'E');
        expect(AssessmentStringUtils.trial1ResultToString(6), 'E');
        expect(AssessmentStringUtils.trial1ResultToString(7), 'N');
        expect(AssessmentStringUtils.trial1ResultToString(10), 'N');
      });
    });
    group('trial2ResultToString', () {
      test('converts trial 2 scores to string correctly', () {
        expect(AssessmentStringUtils.trial2ResultToString(0), 'I');
        expect(AssessmentStringUtils.trial2ResultToString(4), 'I');
        expect(AssessmentStringUtils.trial2ResultToString(5), 'E');
        expect(AssessmentStringUtils.trial2ResultToString(6), 'E');
        expect(AssessmentStringUtils.trial2ResultToString(7), 'N');
        expect(AssessmentStringUtils.trial2ResultToString(10), 'N');
      });
    });

    group('trial3ResultToString', () {
      test('converts trial 3 scores to string correctly', () {
        expect(AssessmentStringUtils.trial3ResultToString(0), 'I');
        expect(AssessmentStringUtils.trial3ResultToString(4), 'I');
        expect(AssessmentStringUtils.trial3ResultToString(5), 'I');
        expect(AssessmentStringUtils.trial3ResultToString(6), 'E');
        expect(AssessmentStringUtils.trial3ResultToString(7), 'E');
        expect(AssessmentStringUtils.trial3ResultToString(8), 'N');
        expect(AssessmentStringUtils.trial3ResultToString(10), 'N');
      });
    });

    group('delayRecallResultToString', () {
      test('converts delay scores to string correctly', () {
        expect(AssessmentStringUtils.delayRecallResultToString(0), 'I');
        expect(AssessmentStringUtils.delayRecallResultToString(4), 'I');
        expect(AssessmentStringUtils.delayRecallResultToString(5), 'E');
        expect(AssessmentStringUtils.delayRecallResultToString(6), 'N');
        expect(AssessmentStringUtils.delayRecallResultToString(10), 'N');
      });
    });

    group('recognitionResultToString', () {
      test('converts recognition scores to string correctly', () {
        expect(AssessmentStringUtils.recognitionResultToString(0), 'I');
        expect(AssessmentStringUtils.recognitionResultToString(13), 'I');
        expect(AssessmentStringUtils.recognitionResultToString(14), 'E');
        expect(AssessmentStringUtils.recognitionResultToString(15), 'E');
        expect(AssessmentStringUtils.recognitionResultToString(16), 'E');
        expect(AssessmentStringUtils.recognitionResultToString(17), 'N');
        expect(AssessmentStringUtils.recognitionResultToString(20), 'N');
      });
    });

    group('orientationResultToString', () {
      test('converts orientation scores to string correctly', () {
        expect(AssessmentStringUtils.orientationResultToString(0), 'I');
        expect(AssessmentStringUtils.orientationResultToString(3), 'I');
        expect(AssessmentStringUtils.orientationResultToString(4), 'E');
        expect(AssessmentStringUtils.orientationResultToString(5), 'N');
        expect(AssessmentStringUtils.orientationResultToString(6), 'N');
      });
    });

    group('visualMemoryResultToString', () {
      test('converts visual scores to string correctly', () {
        scoreModel.setShorttermMemoryVisualImages(
          image1: 3,
          image2: 3,
          image3: 3,
        );
        expect(AssessmentStringUtils.visualMemoryResultToString(scoreModel), 'Impaired');

        scoreModel.setShorttermMemoryVisualImages(
          image1: 2,
          image2: 2,
          image3: 2,
        );
        expect(AssessmentStringUtils.visualMemoryResultToString(scoreModel), 'Impaired');

        scoreModel.setShorttermMemoryVisualImages(
          image1: 2,
          image2: 1,
          image3: 1,
        );
        expect(AssessmentStringUtils.visualMemoryResultToString(scoreModel), 'Impaired');

        scoreModel.setShorttermMemoryVisualImages(
          image1: 1,
          image2: 1,
          image3: 1,
        );
        expect(AssessmentStringUtils.visualMemoryResultToString(scoreModel), 'Impaired');

        scoreModel.setShorttermMemoryVisualImages(
          image1: 1,
          image2: 1,
          image3: 0,
        );
        expect(AssessmentStringUtils.visualMemoryResultToString(scoreModel), 'Equivocal');

        scoreModel.setShorttermMemoryVisualImages(
          image1: 0,
          image2: 0,
          image3: 0,
        );
        expect(AssessmentStringUtils.visualMemoryResultToString(scoreModel), 'Normal');
      });
    });

    group('resultToFullName', () {
      test('converts N/E/I to full words', () {
        expect(AssessmentStringUtils.resultToFullName('N'), 'Normal');
        expect(AssessmentStringUtils.resultToFullName('E'), 'Equivocal');
        expect(AssessmentStringUtils.resultToFullName('I'), 'Impaired');
      });
    });
  });

  group('Score Calculation Tests', () {
    test('visual memory score calculation in table', () {
      scoreModel.setShorttermMemoryVisualImages(
        image1: 0,
        image2: 0,
        image3: 0,
      );
      // Score = (3-0) + (3-0) + (3-0) = 9
      int expectedScore = 9;
      int actualScore = (3 - scoreModel.shorttermMemoryVisualImage1) +
          (3 - scoreModel.shorttermMemoryVisualImage2) +
          (3 - scoreModel.shorttermMemoryVisualImage3);
      expect(actualScore, expectedScore);

      scoreModel.setShorttermMemoryVisualImages(
        image1: 1,
        image2: 2,
        image3: 0,
      );
      // Score = (3-1) + (3-2) + (3-0) = 2 + 1 + 3 = 6
      expectedScore = 6;
      actualScore = (3 - scoreModel.shorttermMemoryVisualImage1) +
          (3 - scoreModel.shorttermMemoryVisualImage2) +
          (3 - scoreModel.shorttermMemoryVisualImage3);
      expect(actualScore, expectedScore);
    });

    test('visuospatial praxis score calculation in table', () {
      scoreModel.setVisuospatialPraxisImages(
        image1: 0,
        image2: 0,
        image3: 0,
      );
      // Score = (3-0) + (3-0) + (3-0) = 9
      int expectedScore = 9;
      int actualScore = (3 - scoreModel.visuospatialPraxisImage1) +
          (3 - scoreModel.visuospatialPraxisImage2) +
          (3 - scoreModel.visuospatialPraxisImage3);
      expect(actualScore, expectedScore);

      scoreModel.setVisuospatialPraxisImages(
        image1: 3,
        image2: 3,
        image3: 3,
      );
      // Score = (3-3) + (3-3) + (3-3) = 0
      expectedScore = 0;
      actualScore = (3 - scoreModel.visuospatialPraxisImage1) +
          (3 - scoreModel.visuospatialPraxisImage2) +
          (3 - scoreModel.visuospatialPraxisImage3);
      expect(actualScore, expectedScore);
    });

    test('verbal recognition memory total score calculation', () {
      scoreModel.setVerbalRecognitionMemory(
        score: 16,
        inList: 8,
        notInList: 8,
      );
      expect(scoreModel.scoreVerbalRecognitionMemoryTenWords, 16);

      scoreModel.setVerbalRecognitionMemory(
        score: 20,
        inList: 10,
        notInList: 10,
      );
      expect(scoreModel.scoreVerbalRecognitionMemoryTenWords, 20);
    });

    test('attention score calculation', () {
      scoreModel.setAttention(
        score: 0,
        correct: 30,
        mistakes: 0,
      );
      expect(scoreModel.attentionMistakes, 0);
      expect(AssessmentStringUtils.radioValueToString(scoreModel.attention), 'N');

      scoreModel.setAttention(
        score: 1,
        correct: 29,
        mistakes: 1,
      );
      expect(scoreModel.attentionMistakes, 1);
      expect(AssessmentStringUtils.radioValueToString(scoreModel.attention), 'E');

      scoreModel.setAttention(
        score: 2,
        correct: 28,
        mistakes: 2,
      );
      expect(scoreModel.attentionMistakes, 2);
      expect(AssessmentStringUtils.radioValueToString(scoreModel.attention), 'I');
    });
  });

  group('Share Document Generation Tests', () {
    test('generates share document with correct content', () {
      scoreModel.setPatientInfo(
        patientName: 'John Doe',
        assessorName: 'Dr. Smith',
        handedness: 'Right',
        assessmentDate: DateTime(2024, 1, 15),
      );

      scoreModel.setTrialOneScore(7);
      scoreModel.setTrialTwoScore(6);
      scoreModel.setTrialThreeScore(8);
      scoreModel.setTenWordDelay(6);
      scoreModel.setVerbalRecognitionMemory(
        score: 18,
        inList: 9,
        notInList: 9,
      );
      scoreModel.setShorttermMemoryVerbal(0, 5);
      scoreModel.setVisuospatialPraxisImages(
        image1: 0,
        image2: 1,
        image3: 0,
      );
      scoreModel.setShorttermMemoryVisualImages(
        image1: 0,
        image2: 1,
        image3: 0,
      );
      scoreModel.setAttention(
        score: 0,
        correct: 30,
        mistakes: 0,
      );
      scoreModel.setExecutiveAnimalNaming(
        score: 0,
        count: 15,
      );

      String shareDoc = ShareService.generateShareContent(scoreModel);

      expect(shareDoc.contains('MICA Assessment Report'), true);
      expect(shareDoc.contains('Name: John Doe'), true);
      expect(shareDoc.contains('Assessor: Dr. Smith'), true);
      expect(shareDoc.contains('Handedness: Right'), true);
      // Date format check - the actual format might vary, so check for the year
      expect(shareDoc.contains('2024'), true);
      expect(shareDoc.contains('Test Date:'), true);

      // Check trial scores
      expect(shareDoc.contains('Raw score: 7/10'), true);
      expect(shareDoc.contains('Raw score: 6/10'), true);
      expect(shareDoc.contains('Raw score: 8/10'), true);

      // Check calculated scores for visuospatial
      // Images errors are 0,1,0 so correct score = (3-0)+(3-1)+(3-0) = 8/9
      expect(shareDoc.contains('Raw score: 8/9'), true); // Visuospatial scores

      // Check N/E/I classifications
      expect(shareDoc.contains('Normal'), true);
      expect(shareDoc.contains('Equivocal'),
          true); // Equivocal does appear in the document
    });
  });

  group('Widget Test', () {
    testWidgets('TestSummaryWithProviderRefactored builds correctly',
        (WidgetTester tester) async {
      final scoreModel = MicaScoreModel();
      scoreModel.setPatientInfo(
        patientName: 'Test Patient',
        assessorName: 'Test Assessor',
        handedness: 'Right',
        assessmentDate: DateTime.now(),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<MicaScoreModel>.value(
            value: scoreModel,
            child: const TestSummaryWithProviderRefactored(),
          ),
        ),
      );

      // Check if the widget builds without errors
      expect(find.byType(TestSummaryWithProviderRefactored), findsOneWidget);
      expect(find.byType(DefaultTabController), findsOneWidget);
      expect(find.byType(TabBar), findsOneWidget);
      expect(find.byType(TabBarView), findsOneWidget);

      // Check for tab titles
      expect(find.text('Domain Results'), findsOneWidget);
      expect(find.text('Full Report'), findsOneWidget);

      // Check for patient name in the content
      await tester.tap(find.text('Domain Results'));
      await tester.pumpAndSettle();
      expect(find.textContaining('Test Patient'), findsAtLeastNWidgets(1));
    });
  });
}
