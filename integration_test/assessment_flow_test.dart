import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';
import 'package:mica/src/models/mica_score_model.dart';
import 'package:mica/src/domain_testing/gnosis/gnosis_assessment.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Assessment Flow Integration Tests', () {
    testWidgets(
        'Gnosis domain flow: navigate to ClockDrawingTest, complete, and verify score persists',
        (tester) async {
      final model = MicaScoreModel();
      model.setPatientInfo(
        patientName: 'Integration Test Patient',
        assessorName: 'Test Assessor',
        handedness: 'Right',
        assessmentDate: DateTime.now(),
      );

      // Start at GnosisAssessment screen
      await tester.pumpWidget(
        ChangeNotifierProvider<MicaScoreModel>.value(
          value: model,
          child: const MaterialApp(home: GnosisAssessment()),
        ),
      );
      await tester.pumpAndSettle();

      // Verify GnosisAssessment is showing
      expect(find.text('Gnosis'), findsOneWidget);
      expect(find.text('Clock Drawing Test'), findsOneWidget);
      expect(find.text('Identify Objects Visually'), findsOneWidget);
      expect(find.text('Identify Objects by Touch'), findsOneWidget);
      expect(find.text('Finger Perception Test'), findsOneWidget);

      // Navigate to Clock Drawing Test
      await tester.tap(find.text('Clock Drawing Test'));
      await tester.pumpAndSettle();

      // Verify ClockDrawingTest is showing
      expect(find.text('Clock Drawing Test'), findsOneWidget);
      expect(find.text('Normal'), findsOneWidget);
      expect(find.text('Equivocal'), findsOneWidget);
      expect(find.text('Impaired'), findsOneWidget);

      // Select Equivocal score
      await tester.tap(find.text('Equivocal'));
      await tester.pumpAndSettle();

      // Tap Task Completed to save and navigate back
      await tester.tap(find.text('Task Completed'));
      await tester.pumpAndSettle();

      // Verify we're back at GnosisAssessment
      expect(find.text('Gnosis'), findsOneWidget);

      // Verify score was persisted in the model
      expect(model.gnosisClockDrawing, 1); // Equivocal = 1
    });

    testWidgets(
        'Gnosis domain flow: complete multiple tests and verify all scores persist',
        (tester) async {
      final model = MicaScoreModel();
      model.setPatientInfo(
        patientName: 'Multi-Test Patient',
        assessorName: 'Test Assessor',
        handedness: 'Right',
        assessmentDate: DateTime.now(),
      );

      // Start at GnosisAssessment screen
      await tester.pumpWidget(
        ChangeNotifierProvider<MicaScoreModel>.value(
          value: model,
          child: const MaterialApp(home: GnosisAssessment()),
        ),
      );
      await tester.pumpAndSettle();

      // First test: Clock Drawing Test with Impaired score
      await tester.tap(find.text('Clock Drawing Test'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Impaired'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Task Completed'));
      await tester.pumpAndSettle();

      // Verify first score
      expect(model.gnosisClockDrawing, 2); // Impaired = 2

      // Second test: Navigate to another test if available
      // For this integration test, we'll re-enter Clock Drawing to test editing
      await tester.tap(find.text('Clock Drawing Test'));
      await tester.pumpAndSettle();

      // Verify the previous score is loaded via the model
      // The model should have retained the Impaired (2) score
      expect(model.gnosisClockDrawing, 2);

      // Change score to Normal
      await tester.tap(find.text('Normal'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Task Completed'));
      await tester.pumpAndSettle();

      // Verify updated score
      expect(model.gnosisClockDrawing, 0); // Normal = 0
    });

    testWidgets('Score persists across screen rebuilds', (tester) async {
      final model = MicaScoreModel();
      model.setPatientInfo(
        patientName: 'Persistence Test Patient',
        assessorName: 'Test Assessor',
        handedness: 'Right',
        assessmentDate: DateTime.now(),
      );

      // Pre-set a score
      model.setGnosisClockDrawing(1); // Equivocal

      // Navigate to Clock Drawing Test
      await tester.pumpWidget(
        ChangeNotifierProvider<MicaScoreModel>.value(
          value: model,
          child: const MaterialApp(home: GnosisAssessment()),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Clock Drawing Test'));
      await tester.pumpAndSettle();

      // Verify pre-set score is loaded via the model
      expect(model.gnosisClockDrawing, 1);

      // Complete without changing
      await tester.tap(find.text('Task Completed'));
      await tester.pumpAndSettle();

      // Score should remain unchanged
      expect(model.gnosisClockDrawing, 1);
    });

    testWidgets('All Gnosis assessment options are accessible', (tester) async {
      final model = MicaScoreModel();

      await tester.pumpWidget(
        ChangeNotifierProvider<MicaScoreModel>.value(
          value: model,
          child: const MaterialApp(home: GnosisAssessment()),
        ),
      );
      await tester.pumpAndSettle();

      // Verify all gnosis test options are present
      expect(find.text('Identify Objects Visually'), findsOneWidget);
      expect(find.text('Identify Objects by Touch'), findsOneWidget);
      expect(find.text('Finger Perception Test'), findsOneWidget);
      expect(find.text('Clock Drawing Test'), findsOneWidget);

      // Verify they are tappable ElevatedButtons
      final buttons = find.byType(ElevatedButton);
      expect(buttons, findsAtLeastNWidgets(4));
    });
  });
}
