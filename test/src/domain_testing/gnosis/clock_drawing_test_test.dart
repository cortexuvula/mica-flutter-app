import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mica/src/domain_testing/gnosis/clock_drawing_test.dart';

import '../../../helpers/widget_test_helpers.dart';

void main() {
  group('ClockDrawingTest Widget Tests', () {
    testWidgets('renders correctly with all expected widgets', (tester) async {
      setupTestScreen(tester);
      await tester.pumpWidget(wrapWithProviders(const ClockDrawingTest()));
      await tester.pumpAndSettle();

      // Verify AppBar title
      expect(find.text('Clock Drawing Test'), findsOneWidget);

      // Verify patient instruction (yellow card)
      expect(
        find.textContaining('Draw a clock face'),
        findsOneWidget,
      );

      // Verify radio options exist
      expectStandardRadioOptions();

      // Verify Task Completed button exists
      expectTaskCompletedButton();
    });

    testWidgets('radio selection updates state correctly', (tester) async {
      setupTestScreen(tester);
      await tester.pumpWidget(wrapWithProviders(const ClockDrawingTest()));
      await tester.pumpAndSettle();

      // Initially Normal (0) should be selected (default)
      expect(isRadioSelected(tester, 0), isTrue);

      // Tap Equivocal option
      await tapRadioOption(tester, 'Equivocal');

      // Verify Equivocal (1) is now selected
      expect(isRadioSelected(tester, 1), isTrue);

      // Tap Impaired option
      await tapRadioOption(tester, 'Impaired');

      // Verify Impaired (2) is now selected
      expect(isRadioSelected(tester, 2), isTrue);

      // Tap Normal option again
      await tapRadioOption(tester, 'Normal');

      // Verify Normal (0) is now selected
      expect(isRadioSelected(tester, 0), isTrue);
    });

    testWidgets('loads saved value from model', (tester) async {
      setupTestScreen(tester);
      // Create model with pre-set clock drawing score
      final model = createTestModel();
      model.setGnosisClockDrawing(2); // Pre-set to Impaired

      await tester.pumpWidget(wrapWithModel(const ClockDrawingTest(), model));
      await tester.pumpAndSettle();

      // Verify Impaired (2) is selected based on model value
      expect(isRadioSelected(tester, 2), isTrue);
    });

    testWidgets('saves score to model on task completed', (tester) async {
      setupTestScreen(tester);
      final model = createTestModel();

      await tester.pumpWidget(wrapWithModel(const ClockDrawingTest(), model));
      await tester.pumpAndSettle();

      // Select Impaired (value 2)
      await tapRadioOption(tester, 'Impaired');

      // Tap Task Completed
      await tapTaskCompleted(tester);

      // Verify model was updated
      expect(model.gnosisClockDrawing, 2);
    });

    testWidgets('saves Equivocal score correctly', (tester) async {
      setupTestScreen(tester);
      final model = createTestModel();

      await tester.pumpWidget(wrapWithModel(const ClockDrawingTest(), model));
      await tester.pumpAndSettle();

      // Select Equivocal (value 1)
      await tapRadioOption(tester, 'Equivocal');

      // Tap Task Completed
      await tapTaskCompleted(tester);

      // Verify model was updated
      expect(model.gnosisClockDrawing, 1);
    });

    testWidgets('saves Normal score correctly', (tester) async {
      setupTestScreen(tester);
      final model = createTestModel();
      // Pre-set to something else to verify save works
      model.setGnosisClockDrawing(2);

      await tester.pumpWidget(wrapWithModel(const ClockDrawingTest(), model));
      await tester.pumpAndSettle();

      // Select Normal (value 0) - need to explicitly select after pre-set
      await tapRadioOption(tester, 'Normal');

      // Tap Task Completed
      await tapTaskCompleted(tester);

      // Verify model was updated to 0
      expect(model.gnosisClockDrawing, 0);
    });

    testWidgets('clear button exists in AppBar', (tester) async {
      setupTestScreen(tester);
      await tester.pumpWidget(wrapWithProviders(const ClockDrawingTest()));
      await tester.pumpAndSettle();

      // Find and verify the clear icon button exists
      expect(find.byIcon(Icons.clear), findsOneWidget);
    });

    testWidgets('InkWell tap areas work for radio selection', (tester) async {
      setupTestScreen(tester);
      await tester.pumpWidget(wrapWithProviders(const ClockDrawingTest()));
      await tester.pumpAndSettle();

      // Find InkWell widgets (there should be 3 for the radio options)
      final inkWells = find.byType(InkWell);
      expect(inkWells, findsAtLeastNWidgets(3));
    });
  });
}
