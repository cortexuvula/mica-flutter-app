import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mica/src/domain_testing/language/object_naming.dart';

import '../../../helpers/widget_test_helpers.dart';

void main() {
  group('ObjectNaming Widget Tests', () {
    testWidgets('renders correctly with all expected widgets', (tester) async {
      setupTestScreen(tester);
      await tester.pumpWidget(wrapWithProviders(const ObjectNaming()));
      await tester.pumpAndSettle();

      // Verify AppBar title
      expect(find.text('Naming'), findsOneWidget);

      // Verify purple instruction card
      expect(
        find.textContaining('Point towards the following objects'),
        findsOneWidget,
      );

      // Verify yellow patient instruction card
      expect(
        find.text('"Can you tell me what this is?"'),
        findsOneWidget,
      );

      // Verify detailed instructions about objects to name
      expect(find.textContaining('watch, pen, tissue'), findsOneWidget);
      expect(find.textContaining('knuckles, ring finger'), findsOneWidget);

      // Verify scoring note
      expect(
        find.text('Note the response of the patient and score as below.'),
        findsOneWidget,
      );

      // Verify radio options exist
      expectStandardRadioOptions();

      // Verify Task Completed button exists
      expectTaskCompletedButton();
    });

    testWidgets('radio selection updates state correctly', (tester) async {
      setupTestScreen(tester);
      await tester.pumpWidget(wrapWithProviders(const ObjectNaming()));
      await tester.pumpAndSettle();

      // Tap Normal option
      await tapRadioOption(tester, 'Normal');

      // Verify Normal (0) is now selected
      expect(isRadioSelected(tester, 0), isTrue);

      // Tap Equivocal option
      await tapRadioOption(tester, 'Equivocal');

      // Verify Equivocal (1) is now selected
      expect(isRadioSelected(tester, 1), isTrue);

      // Tap Impaired option
      await tapRadioOption(tester, 'Impaired');

      // Verify Impaired (2) is now selected
      expect(isRadioSelected(tester, 2), isTrue);
    });

    testWidgets('saves Normal score to model on task completed',
        (tester) async {
      setupTestScreen(tester);
      final model = createTestModel();

      await tester.pumpWidget(wrapWithModel(const ObjectNaming(), model));
      await tester.pumpAndSettle();

      // Select Normal (value 0)
      await tapRadioOption(tester, 'Normal');

      // Tap Task Completed
      await tapTaskCompleted(tester);

      // Verify model was updated
      expect(model.languageObjectNaming, 0);
    });

    testWidgets('saves Equivocal score to model on task completed',
        (tester) async {
      setupTestScreen(tester);
      final model = createTestModel();

      await tester.pumpWidget(wrapWithModel(const ObjectNaming(), model));
      await tester.pumpAndSettle();

      // Select Equivocal (value 1)
      await tapRadioOption(tester, 'Equivocal');

      // Tap Task Completed
      await tapTaskCompleted(tester);

      // Verify model was updated
      expect(model.languageObjectNaming, 1);
    });

    testWidgets('saves Impaired score to model on task completed',
        (tester) async {
      setupTestScreen(tester);
      final model = createTestModel();

      await tester.pumpWidget(wrapWithModel(const ObjectNaming(), model));
      await tester.pumpAndSettle();

      // Select Impaired (value 2)
      await tapRadioOption(tester, 'Impaired');

      // Tap Task Completed
      await tapTaskCompleted(tester);

      // Verify model was updated
      expect(model.languageObjectNaming, 2);
    });

    testWidgets('does not save score if no option selected', (tester) async {
      setupTestScreen(tester);
      final model = createTestModel();
      // Pre-set a value to verify it doesn't get overwritten
      model.setLanguageObjectNaming(1);

      await tester.pumpWidget(wrapWithModel(const ObjectNaming(), model));
      await tester.pumpAndSettle();

      // Don't select any option, just tap Task Completed
      await tapTaskCompleted(tester);

      // Model should retain original value since nothing was selected
      expect(model.languageObjectNaming, 1);
    });

    testWidgets('InkWell tap areas work for radio selection', (tester) async {
      setupTestScreen(tester);
      await tester.pumpWidget(wrapWithProviders(const ObjectNaming()));
      await tester.pumpAndSettle();

      // Find InkWell widgets (there should be 3 for the radio options)
      final inkWells = find.byType(InkWell);
      expect(inkWells, findsAtLeastNWidgets(3));
    });

    testWidgets('instruction text explains nominal dysphasia vs agnosia',
        (tester) async {
      setupTestScreen(tester);
      await tester.pumpWidget(wrapWithProviders(const ObjectNaming()));
      await tester.pumpAndSettle();

      // Verify the explanation about distinguishing between conditions
      expect(
        find.textContaining('nominal dysphasia'),
        findsOneWidget,
      );
      expect(
        find.textContaining('visual object agnosia'),
        findsNWidgets(2), // Appears in two places
      );
    });

    testWidgets('has correct card colors', (tester) async {
      setupTestScreen(tester);
      await tester.pumpWidget(wrapWithProviders(const ObjectNaming()));
      await tester.pumpAndSettle();

      // Find all Card widgets
      final cards = tester.widgetList<Card>(find.byType(Card));

      // Should have at least 4 cards (purple x2, yellow x1, green x1, white x1)
      expect(cards.length, greaterThanOrEqualTo(4));

      // Verify green scoring card exists
      final greenCards = cards.where((card) => card.color == Colors.green);
      expect(greenCards.length, 1);

      // Verify yellow instruction card exists
      final yellowCards =
          cards.where((card) => card.color == Colors.yellowAccent.shade400);
      expect(yellowCards.length, 1);
    });
  });
}
