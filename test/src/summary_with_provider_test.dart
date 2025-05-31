import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mica/src/summary_with_provider.dart';
import 'package:mica/src/models/mica_score_model.dart';
import 'package:provider/provider.dart';

void main() {
  late MicaScoreModel scoreModel;
  late TestSummaryWithProviderState testState;

  setUp(() {
    scoreModel = MicaScoreModel();
    testState = TestSummaryWithProviderState();
  });

  group('Color Calculation Tests', () {
    group('attentionCardColor', () {
      test('returns green for normal (0)', () {
        expect(testState.attentionCardColor(0), Colors.green);
      });

      test('returns yellow for equivocal (1)', () {
        expect(testState.attentionCardColor(1), Colors.yellow);
      });

      test('returns red for impaired (2)', () {
        expect(testState.attentionCardColor(2), Colors.red);
      });
    });

    group('languageCardColor', () {
      test('returns red if any value is impaired', () {
        expect(testState.languageCardColor(2, 0), Colors.red);
        expect(testState.languageCardColor(0, 2), Colors.red);
        expect(testState.languageCardColor(2, 2), Colors.red);
      });

      test('returns yellow if any value is equivocal and none impaired', () {
        expect(testState.languageCardColor(1, 0), Colors.yellow);
        expect(testState.languageCardColor(0, 1), Colors.yellow);
        expect(testState.languageCardColor(1, 1), Colors.yellow);
      });

      test('returns green if all values are normal', () {
        expect(testState.languageCardColor(0, 0), Colors.green);
      });
    });

    group('verbalWorkingMemoryCardColor', () {
      test('returns red for value < 3', () {
        expect(testState.verbalWorkingMemoryCardColor(0), Colors.red);
        expect(testState.verbalWorkingMemoryCardColor(3), Colors.red);
      });

      test('returns yellow for value 4-5', () {
        expect(testState.verbalWorkingMemoryCardColor(4), Colors.yellow);
        expect(testState.verbalWorkingMemoryCardColor(5), Colors.yellow);
      });

      test('returns green for value > 5', () {
        expect(testState.verbalWorkingMemoryCardColor(6), Colors.green);
        expect(testState.verbalWorkingMemoryCardColor(10), Colors.green);
      });
    });

    group('valueTrial12ResultToColor', () {
      test('returns red for value < 5', () {
        expect(testState.valueTrial12ResultToColor(0), Colors.red);
        expect(testState.valueTrial12ResultToColor(4), Colors.red);
      });

      test('returns yellow for value 5-6', () {
        expect(testState.valueTrial12ResultToColor(5), Colors.yellow);
        expect(testState.valueTrial12ResultToColor(6), Colors.yellow);
      });

      test('returns green for value > 6', () {
        expect(testState.valueTrial12ResultToColor(7), Colors.green);
        expect(testState.valueTrial12ResultToColor(10), Colors.green);
      });
    });

    group('valueTrial3ResultToColor', () {
      test('returns red for value < 6', () {
        expect(testState.valueTrial3ResultToColor(0), Colors.red);
        expect(testState.valueTrial3ResultToColor(5), Colors.red);
      });

      test('returns yellow for value 6-7', () {
        expect(testState.valueTrial3ResultToColor(6), Colors.yellow);
        expect(testState.valueTrial3ResultToColor(7), Colors.yellow);
      });

      test('returns green for value > 7', () {
        expect(testState.valueTrial3ResultToColor(8), Colors.green);
        expect(testState.valueTrial3ResultToColor(10), Colors.green);
      });
    });

    group('valueDelayResultToColor', () {
      test('returns red for value < 7', () {
        expect(testState.valueDelayResultToColor(0), Colors.red);
        expect(testState.valueDelayResultToColor(6), Colors.red);
      });

      test('returns yellow for value = 7', () {
        expect(testState.valueDelayResultToColor(7), Colors.yellow);
      });

      test('returns green for value > 7', () {
        expect(testState.valueDelayResultToColor(8), Colors.green);
        expect(testState.valueDelayResultToColor(10), Colors.green);
      });
    });

    group('verbalShortTermMemory', () {
      test('returns green when all scores are excellent', () {
        expect(
          testState.verbalShortTermMemory(7, 8, 0, 6, 6),
          Colors.green,
        );
        expect(
          testState.verbalShortTermMemory(10, 10, 5, 10, 10),
          Colors.green,
        );
      });

      test('returns red when any score is impaired', () {
        expect(
          testState.verbalShortTermMemory(4, 8, 0, 6, 6),
          Colors.red,
        );
        expect(
          testState.verbalShortTermMemory(7, 4, 0, 6, 6),
          Colors.red,
        );
        expect(
          testState.verbalShortTermMemory(7, 8, 3, 6, 6),
          Colors.red,
        );
        expect(
          testState.verbalShortTermMemory(7, 8, 0, 4, 6),
          Colors.red,
        );
        expect(
          testState.verbalShortTermMemory(7, 8, 0, 6, 4),
          Colors.red,
        );
      });

      test('returns yellow when any score is equivocal and none impaired', () {
        expect(
          testState.verbalShortTermMemory(5, 8, 0, 6, 6),
          Colors.yellow,
        );
        expect(
          testState.verbalShortTermMemory(6, 8, 0, 6, 6),
          Colors.yellow,
        );
        expect(
          testState.verbalShortTermMemory(7, 5, 0, 6, 6),
          Colors.yellow,
        );
        expect(
          testState.verbalShortTermMemory(7, 7, 0, 6, 6),
          Colors.yellow,
        );
        expect(
          testState.verbalShortTermMemory(7, 8, 4, 6, 6),
          Colors.yellow,
        );
        expect(
          testState.verbalShortTermMemory(7, 8, 0, 5, 6),
          Colors.yellow,
        );
        expect(
          testState.verbalShortTermMemory(7, 8, 0, 6, 5),
          Colors.yellow,
        );
      });
    });

    group('valueVisualResultToColor', () {
      test('calculates visual scores correctly', () {
        scoreModel.setShorttermMemoryVisualImages(
          image1: 0,
          image2: 0,
          image3: 0,
        );
        expect(testState.valueVisualResultToColor(scoreModel), Colors.green);

        scoreModel.setShorttermMemoryVisualImages(
          image1: 1,
          image2: 0,
          image3: 0,
        );
        expect(testState.valueVisualResultToColor(scoreModel), Colors.green);

        scoreModel.setShorttermMemoryVisualImages(
          image1: 1,
          image2: 1,
          image3: 1,
        );
        expect(testState.valueVisualResultToColor(scoreModel), Colors.yellow);

        scoreModel.setShorttermMemoryVisualImages(
          image1: 2,
          image2: 1,
          image3: 1,
        );
        expect(testState.valueVisualResultToColor(scoreModel), Colors.red);
      });
    });

    group('praxisCardColor', () {
      test('returns appropriate colors based on praxis scores', () {
        scoreModel.setVisuospatialPraxisImages(
          image1: 0,
          image2: 0,
          image3: 0,
        );
        scoreModel.setPraxisScores(right: 0, left: 0);
        expect(testState.praxisCardColor(scoreModel), Colors.green);

        scoreModel.setVisuospatialPraxisImages(
          image1: 2,
          image2: 1,
          image3: 1,
        );
        scoreModel.setPraxisScores(right: 0, left: 0);
        expect(testState.praxisCardColor(scoreModel), Colors.yellow);

        scoreModel.setVisuospatialPraxisImages(
          image1: 0,
          image2: 0,
          image3: 0,
        );
        scoreModel.setPraxisScores(right: 2, left: 0);
        expect(testState.praxisCardColor(scoreModel), Colors.red);

        scoreModel.setVisuospatialPraxisImages(
          image1: 0,
          image2: 0,
          image3: 0,
        );
        scoreModel.setPraxisScores(right: 0, left: 2);
        expect(testState.praxisCardColor(scoreModel), Colors.red);
      });
    });

    group('gnosisCardColor', () {
      test('returns appropriate colors based on gnosis scores', () {
        scoreModel.setVisuospatialPraxisImages(
          image1: 0,
          image2: 0,
          image3: 0,
        );
        scoreModel.setAnomiaAgnosia(0);
        expect(testState.gnosisCardColor(scoreModel), Colors.green);

        scoreModel.setVisuospatialPraxisImages(
          image1: 2,
          image2: 1,
          image3: 1,
        );
        scoreModel.setAnomiaAgnosia(0);
        expect(testState.gnosisCardColor(scoreModel), Colors.yellow);

        scoreModel.setVisuospatialPraxisImages(
          image1: 0,
          image2: 0,
          image3: 0,
        );
        scoreModel.setAnomiaAgnosia(2);
        expect(testState.gnosisCardColor(scoreModel), Colors.red);
      });
    });

    group('executiveFunctionCarcColor', () {
      test('returns green for normal (0)', () {
        expect(testState.executiveFunctionCarcColor(0), Colors.green);
      });

      test('returns yellow for equivocal (1)', () {
        expect(testState.executiveFunctionCarcColor(1), Colors.yellow);
      });

      test('returns red for impaired (2)', () {
        expect(testState.executiveFunctionCarcColor(2), Colors.red);
      });
    });

    group('radioValueResultToColor', () {
      test('returns correct colors for radio values', () {
        expect(testState.radioValueResultToColor(0), Colors.green);
        expect(testState.radioValueResultToColor(1), Colors.yellow);
        expect(testState.radioValueResultToColor(2), Colors.red);
      });
    });
  });

  group('String Result Tests', () {
    group('radioValueResultToString', () {
      test('converts radio values to string correctly', () {
        expect(testState.radioValueResultToString(0), 'N');
        expect(testState.radioValueResultToString(1), 'E');
        expect(testState.radioValueResultToString(2), 'I');
        expect(testState.radioValueResultToString(3), 'N'); // default case
      });
    });

    group('valueTrial12ResultToString', () {
      test('converts trial 1 scores to string correctly', () {
        expect(testState.valueTrial1ResultToString(0), 'I');
        expect(testState.valueTrial1ResultToString(3), 'I');
        expect(testState.valueTrial1ResultToString(4), 'E');
        expect(testState.valueTrial1ResultToString(5), 'E');
        expect(testState.valueTrial1ResultToString(6), 'N');
        expect(testState.valueTrial1ResultToString(7), 'N');
        expect(testState.valueTrial1ResultToString(10), 'N');
      });
    });
    group('valueTrial12ResultToString', () {
      test('converts trial 2 scores to string correctly', () {
        expect(testState.valueTrial2ResultToString(0), 'I');
        expect(testState.valueTrial2ResultToString(4), 'I');
        expect(testState.valueTrial2ResultToString(5), 'E');
        expect(testState.valueTrial2ResultToString(6), 'E');
        expect(testState.valueTrial2ResultToString(7), 'N');
        expect(testState.valueTrial2ResultToString(10), 'N');
      });
    });

    group('valueTrial3ResultToString', () {
      test('converts trial 3 scores to string correctly', () {
        expect(testState.valueTrial3ResultToString(0), 'I');
        expect(testState.valueTrial3ResultToString(4), 'I');
        expect(testState.valueTrial3ResultToString(5), 'I');
        expect(testState.valueTrial3ResultToString(6), 'E');
        expect(testState.valueTrial3ResultToString(7), 'E');
        expect(testState.valueTrial3ResultToString(8), 'N');
        expect(testState.valueTrial3ResultToString(10), 'N');
      });
    });

    group('valueDelayResultToString', () {
      test('converts delay scores to string correctly', () {
        expect(testState.valueDelayResultToString(0), 'I');
        expect(testState.valueDelayResultToString(4), 'I');
        expect(testState.valueDelayResultToString(5), 'E');
        expect(testState.valueDelayResultToString(6), 'N');
        expect(testState.valueDelayResultToString(10), 'N');
      });
    });

    group('valueRecognitionResultToString', () {
      test('converts recognition scores to string correctly', () {
        expect(testState.valueRecognitionResultToString(0), 'I');
        expect(testState.valueRecognitionResultToString(13), 'I');
        expect(testState.valueRecognitionResultToString(14), 'E');
        expect(testState.valueRecognitionResultToString(15), 'E');
        expect(testState.valueRecognitionResultToString(16), 'E');
        expect(testState.valueRecognitionResultToString(17), 'N');
        expect(testState.valueRecognitionResultToString(20), 'N');
      });
    });

    group('valueOrientationResultToString', () {
      test('converts orientation scores to string correctly', () {
        expect(testState.valueOrientationResultToString(0), 'I');
        expect(testState.valueOrientationResultToString(3), 'I');
        expect(testState.valueOrientationResultToString(4), 'E');
        expect(testState.valueOrientationResultToString(5), 'N');
        expect(testState.valueOrientationResultToString(6), 'N');
      });
    });

    group('valueVisualResultToString', () {
      test('converts visual scores to string correctly', () {
        scoreModel.setShorttermMemoryVisualImages(
          image1: 3,
          image2: 3,
          image3: 3,
        );
        expect(testState.valueVisualResultToString(scoreModel), 'Impaired');

        scoreModel.setShorttermMemoryVisualImages(
          image1: 2,
          image2: 2,
          image3: 2,
        );
        expect(testState.valueVisualResultToString(scoreModel), 'Impaired');

        scoreModel.setShorttermMemoryVisualImages(
          image1: 2,
          image2: 1,
          image3: 1,
        );
        expect(testState.valueVisualResultToString(scoreModel), 'Impaired');

        scoreModel.setShorttermMemoryVisualImages(
          image1: 1,
          image2: 1,
          image3: 1,
        );
        expect(testState.valueVisualResultToString(scoreModel), 'Impaired');

        scoreModel.setShorttermMemoryVisualImages(
          image1: 1,
          image2: 1,
          image3: 0,
        );
        expect(testState.valueVisualResultToString(scoreModel), 'Equivocal');

        scoreModel.setShorttermMemoryVisualImages(
          image1: 0,
          image2: 0,
          image3: 0,
        );
        expect(testState.valueVisualResultToString(scoreModel), 'Normal');
      });
    });

    group('convertResponseToString', () {
      test('converts N/E/I to full words', () {
        expect(testState.convertResponseToString('N'), 'Normal');
        expect(testState.convertResponseToString('E'), 'Equivocal');
        expect(testState.convertResponseToString('I'), 'Impaired');
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
      expect(testState.radioValueResultToString(scoreModel.attention), 'N');

      scoreModel.setAttention(
        score: 1,
        correct: 29,
        mistakes: 1,
      );
      expect(scoreModel.attentionMistakes, 1);
      expect(testState.radioValueResultToString(scoreModel.attention), 'E');

      scoreModel.setAttention(
        score: 2,
        correct: 28,
        mistakes: 2,
      );
      expect(scoreModel.attentionMistakes, 2);
      expect(testState.radioValueResultToString(scoreModel.attention), 'I');
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

      String shareDoc = testState.shareDoc(scoreModel);

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
      // Images are 0,1,0 so score should be image1 + image2 + image3 = 0+1+0 = 1/9
      expect(shareDoc.contains('Raw score: 1/9'), true); // Visuospatial scores

      // Check N/E/I classifications
      expect(shareDoc.contains('Normal'), true);
      expect(shareDoc.contains('Equivocal'),
          true); // Equivocal does appear in the document
    });
  });

  group('Widget Test', () {
    testWidgets('TestSummaryWithProvider builds correctly',
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
            child: const TestSummaryWithProvider(),
          ),
        ),
      );

      // Check if the widget builds without errors
      expect(find.byType(TestSummaryWithProvider), findsOneWidget);
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
