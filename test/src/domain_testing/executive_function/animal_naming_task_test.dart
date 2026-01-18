import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mica/src/domain_testing/executive_function/animal_naming_task.dart';

import '../../../helpers/widget_test_helpers.dart';

void main() {
  group('AnimalNamingTask Widget Tests', () {
    testWidgets('renders correctly with all expected widgets', (tester) async {
      setupTestScreen(tester);
      await tester.pumpWidget(wrapWithProviders(const AnimalNamingTask()));
      await tester.pumpAndSettle();

      // Verify AppBar title
      expect(find.text('Animal Naming Task'), findsOneWidget);

      // Verify timer display (starts at 0:00)
      expect(find.text('0:00'), findsOneWidget);

      // Verify Start button
      expect(find.text('Start'), findsOneWidget);

      // Verify counter display (starts at 0)
      expect(find.text('0'), findsOneWidget);

      // Verify counter buttons
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.remove), findsOneWidget);

      // Verify "Tap to count Words" label
      expect(find.text('Tap to count Words'), findsOneWidget);

      // Verify radio options exist
      expectStandardRadioOptions();

      // Verify Task Completed button exists
      expectTaskCompletedButton();
    });

    testWidgets('counter increment works', (tester) async {
      setupTestScreen(tester);
      await tester.pumpWidget(wrapWithProviders(const AnimalNamingTask()));
      await tester.pumpAndSettle();

      // Verify initial counter is 0
      expect(find.text('0'), findsOneWidget);

      // Tap increment button
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Verify counter is now 1
      expect(find.text('1'), findsOneWidget);

      // Tap increment button 4 more times
      for (int i = 0; i < 4; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pumpAndSettle();
      }

      // Verify counter is now 5
      expect(find.text('5'), findsOneWidget);
    });

    testWidgets('counter decrement works', (tester) async {
      setupTestScreen(tester);
      await tester.pumpWidget(wrapWithProviders(const AnimalNamingTask()));
      await tester.pumpAndSettle();

      // Increment to 3 first
      for (int i = 0; i < 3; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pumpAndSettle();
      }
      expect(find.text('3'), findsOneWidget);

      // Tap decrement button
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pumpAndSettle();

      // Verify counter is now 2
      expect(find.text('2'), findsOneWidget);
    });

    testWidgets('counter cannot go below zero', (tester) async {
      setupTestScreen(tester);
      await tester.pumpWidget(wrapWithProviders(const AnimalNamingTask()));
      await tester.pumpAndSettle();

      // Verify initial counter is 0
      expect(find.text('0'), findsOneWidget);

      // Tap decrement button multiple times
      for (int i = 0; i < 3; i++) {
        await tester.tap(find.byIcon(Icons.remove));
        await tester.pumpAndSettle();
      }

      // Counter should still be 0
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('score auto-updates based on count - Impaired (< 12)',
        (tester) async {
      setupTestScreen(tester);
      await tester.pumpWidget(wrapWithProviders(const AnimalNamingTask()));
      await tester.pumpAndSettle();

      // Default score should be Impaired (2) since count is 0
      expect(isRadioSelected(tester, 2), isTrue);

      // Increment to 11 (still Impaired)
      for (int i = 0; i < 11; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();
      }
      await tester.pumpAndSettle();

      // Should still be Impaired
      expect(isRadioSelected(tester, 2), isTrue);
    });

    testWidgets('score auto-updates based on count - Equivocal (12-14)',
        (tester) async {
      setupTestScreen(tester);
      await tester.pumpWidget(wrapWithProviders(const AnimalNamingTask()));
      await tester.pumpAndSettle();

      // Increment to 12 (Equivocal)
      for (int i = 0; i < 12; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();
      }
      await tester.pumpAndSettle();

      // Should be Equivocal (1)
      expect(isRadioSelected(tester, 1), isTrue);

      // Increment to 14 (still Equivocal)
      for (int i = 0; i < 2; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();
      }
      await tester.pumpAndSettle();

      // Should still be Equivocal
      expect(isRadioSelected(tester, 1), isTrue);
    });

    testWidgets('score auto-updates based on count - Normal (> 14)',
        (tester) async {
      setupTestScreen(tester);
      await tester.pumpWidget(wrapWithProviders(const AnimalNamingTask()));
      await tester.pumpAndSettle();

      // Increment to 15 (Normal)
      for (int i = 0; i < 15; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();
      }
      await tester.pumpAndSettle();

      // Should be Normal (0)
      expect(isRadioSelected(tester, 0), isTrue);
    });

    testWidgets('manual radio selection overrides auto-update', (tester) async {
      setupTestScreen(tester);
      await tester.pumpWidget(wrapWithProviders(const AnimalNamingTask()));
      await tester.pumpAndSettle();

      // Increment to 15 (should auto-select Normal)
      for (int i = 0; i < 15; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();
      }
      await tester.pumpAndSettle();
      expect(isRadioSelected(tester, 0), isTrue);

      // Manually select Impaired
      await tapRadioOption(tester, 'Impaired');

      // Should now be Impaired
      expect(isRadioSelected(tester, 2), isTrue);
    });

    testWidgets('saves both score and count to model on task completed',
        (tester) async {
      setupTestScreen(tester);
      final model = createTestModel();

      await tester.pumpWidget(wrapWithModel(const AnimalNamingTask(), model));
      await tester.pumpAndSettle();

      // Increment counter to 15
      for (int i = 0; i < 15; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();
      }
      await tester.pumpAndSettle();

      // Tap Task Completed
      await tapTaskCompleted(tester);

      // Verify both score and count were saved
      expect(model.executiveAnimalNaming, 0); // Normal
      expect(model.executiveAnimalNamingCount, 15);
    });

    testWidgets('loads saved values from model', (tester) async {
      setupTestScreen(tester);
      final model = createTestModel();
      // Pre-set values
      model.setExecutiveAnimalNaming(score: 1, count: 13);

      await tester.pumpWidget(wrapWithModel(const AnimalNamingTask(), model));
      await tester.pumpAndSettle();

      // Verify counter shows pre-set value
      expect(find.text('13'), findsOneWidget);

      // Verify score shows pre-set value (Equivocal)
      expect(isRadioSelected(tester, 1), isTrue);
    });

    testWidgets('timer starts when Start button is pressed', (tester) async {
      setupTestScreen(tester);
      await tester.pumpWidget(wrapWithProviders(const AnimalNamingTask()));
      await tester.pumpAndSettle();

      // Verify initial timer is 0:00
      expect(find.text('0:00'), findsOneWidget);

      // Tap Start button
      await tester.tap(find.text('Start'));
      await tester.pump();

      // Button should change to "Running"
      expect(find.text('Running'), findsOneWidget);

      // Advance timer by 5 seconds
      await tester.pump(const Duration(seconds: 5));

      // Timer should show 0:05
      expect(find.text('0:05'), findsOneWidget);
    });

    testWidgets('timer stops at 60 seconds', (tester) async {
      setupTestScreen(tester);
      await tester.pumpWidget(wrapWithProviders(const AnimalNamingTask()));
      await tester.pumpAndSettle();

      // Tap Start button
      await tester.tap(find.text('Start'));
      await tester.pump();

      // Advance timer to 60 seconds
      for (int i = 0; i < 60; i++) {
        await tester.pump(const Duration(seconds: 1));
      }
      await tester.pumpAndSettle();

      // Timer should show 1:00
      expect(find.text('1:00'), findsOneWidget);

      // Button should show "Complete"
      expect(find.text('Complete'), findsOneWidget);
    });

    testWidgets('Start button is disabled while timer is running',
        (tester) async {
      setupTestScreen(tester);
      await tester.pumpWidget(wrapWithProviders(const AnimalNamingTask()));
      await tester.pumpAndSettle();

      // Tap Start button
      await tester.tap(find.text('Start'));
      await tester.pump();

      // Advance timer a bit
      await tester.pump(const Duration(seconds: 2));

      // Find the Start/Running button
      final button = tester.widget<ElevatedButton>(
        find.widgetWithText(ElevatedButton, 'Running'),
      );

      // Button should be disabled (onPressed is null)
      expect(button.onPressed, isNull);
    });

    testWidgets('clear button exists in AppBar', (tester) async {
      setupTestScreen(tester);
      await tester.pumpWidget(wrapWithProviders(const AnimalNamingTask()));
      await tester.pumpAndSettle();

      // Find and verify the clear icon button exists
      expect(find.byIcon(Icons.clear), findsOneWidget);
    });
  });
}
