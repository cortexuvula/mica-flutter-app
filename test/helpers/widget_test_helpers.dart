import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:mica/src/models/mica_score_model.dart';
import 'package:mica/src/providers/mica_provider.dart';

// ============================================================================
// Screen Setup
// ============================================================================

/// Sets up a test-friendly screen size.
///
/// By default, Flutter tests use a small screen size (800x600) which may not
/// render all content in ListView widgets. This function sets a larger screen
/// to ensure all widgets are rendered and accessible.
///
/// IMPORTANT: Call this at the start of each testWidgets BEFORE pumpWidget.
/// Also add the teardown to reset the view after the test.
///
/// Example:
/// ```dart
/// testWidgets('my test', (tester) async {
///   setupTestScreen(tester);
///   await tester.pumpWidget(wrapWithProviders(const MyWidget()));
///   await tester.pumpAndSettle();
///   // ... test assertions
/// });
/// ```
void setupTestScreen(WidgetTester tester) {
  tester.view.physicalSize = const Size(800, 2400);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);
}

// ============================================================================
// Theme Setup
// ============================================================================

/// Creates a themed MaterialApp for testing.
/// This matches the production app's theme configuration.
MaterialApp _createThemedApp(Widget child) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: child,
    theme: ThemeData(
      primaryColor: const Color(0xFF64638f),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF64638f),
        primary: const Color(0xFF64638f),
        secondary: const Color(0xFF9795cf),
        surface: const Color(0xFFaba9e9),
      ),
      splashColor: const Color(0xFFaba9e9),
      scaffoldBackgroundColor: const Color(0xFFcbc9ff),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF9795cf),
        ),
      ),
      dialogTheme: const DialogThemeData(
        backgroundColor: Color(0xFFcbc9ff),
      ),
      cardColor: Colors.white,
    ),
  );
}

/// Wraps a widget with the necessary providers for testing.
/// Uses the standard MicaProviders configuration.
Widget wrapWithProviders(Widget child) {
  return MultiProvider(
    providers: MicaProviders.getProviders(),
    child: _createThemedApp(child),
  );
}

/// Wraps a widget with a specific MicaScoreModel instance for testing.
/// This allows tests to verify model state changes.
Widget wrapWithModel(Widget child, MicaScoreModel model) {
  return ChangeNotifierProvider<MicaScoreModel>.value(
    value: model,
    child: _createThemedApp(child),
  );
}

/// Creates a pre-configured MicaScoreModel with default test data.
MicaScoreModel createTestModel() {
  final model = MicaScoreModel();
  model.setPatientInfo(
    patientName: 'Test Patient',
    assessorName: 'Test Assessor',
    handedness: 'Right',
    assessmentDate: DateTime(2024, 1, 15),
  );
  return model;
}

/// Creates a MicaScoreModel with all scores set to specific values.
MicaScoreModel createTestModelWithScores({
  int attention = 0,
  int languageObjectNaming = 0,
  int executiveAnimalNaming = 0,
  int executiveAnimalNamingCount = 0,
  int gnosisClockDrawing = 0,
}) {
  final model = createTestModel();
  model.setAttention(score: attention, correct: 30, mistakes: 0);
  model.setLanguageObjectNaming(languageObjectNaming);
  model.setExecutiveAnimalNaming(
    score: executiveAnimalNaming,
    count: executiveAnimalNamingCount,
  );
  model.setGnosisClockDrawing(gnosisClockDrawing);
  return model;
}

// ============================================================================
// Common Widget Finders
// ============================================================================

/// Finds the 'Task Completed' button.
Finder findTaskCompletedButton() => find.text('Task Completed');

/// Finds a radio option by its label text.
Finder findRadioOption(String label) => find.text(label);

/// Finds the 'Normal' radio option.
Finder findNormalOption() => find.text('Normal');

/// Finds the 'Equivocal' radio option.
Finder findEquivocalOption() => find.text('Equivocal');

/// Finds the 'Impaired' radio option.
Finder findImpairedOption() => find.text('Impaired');

/// Finds a radio button by its value within a `Radio<int>` widget.
Finder findRadioByValue(int value) {
  return find.byWidgetPredicate(
    (widget) => widget is Radio<int> && widget.value == value,
  );
}

/// Finds the `RadioGroup<int>` widget.
Finder findRadioGroup() {
  return find.byType(RadioGroup<int>);
}

// ============================================================================
// Test Utilities
// ============================================================================

/// Taps a radio option and settles the widget tree.
Future<void> tapRadioOption(WidgetTester tester, String label) async {
  await tester.tap(find.text(label));
  await tester.pumpAndSettle();
}

/// Taps the 'Task Completed' button and settles the widget tree.
Future<void> tapTaskCompleted(WidgetTester tester) async {
  await tester.tap(findTaskCompletedButton());
  await tester.pumpAndSettle();
}

/// Verifies that a radio button with the given value is selected.
/// Returns true if the radio is selected (checked).
///
/// This checks the `RadioGroup<int>` widget's groupValue property.
/// If there are multiple RadioGroup widgets, you can specify which one with [index].
bool isRadioSelected(WidgetTester tester, int value, {int index = 0}) {
  final radioGroups = tester.widgetList<RadioGroup<int>>(findRadioGroup());
  if (radioGroups.isEmpty) {
    throw StateError('No RadioGroup<int> widgets found');
  }
  final radioGroup = radioGroups.elementAt(index);
  return radioGroup.groupValue == value;
}

/// Extension to help verify navigation occurred (screen was popped).
extension NavigationTesting on WidgetTester {
  /// Verifies that navigation has occurred by checking if the current
  /// widget is no longer in the tree.
  bool hasNavigatedAway<T extends Widget>() {
    return find.byType(T).evaluate().isEmpty;
  }
}

// ============================================================================
// Timer Test Utilities
// ============================================================================

/// Advances time for timer-based tests.
/// Use within tester.runAsync() for real async operations.
Future<void> advanceTimer(WidgetTester tester, Duration duration) async {
  await tester.pump(duration);
}

/// Waits for the widget tree to settle with a timeout.
Future<void> settleWithTimeout(
  WidgetTester tester, {
  Duration timeout = const Duration(seconds: 5),
}) async {
  await tester.pumpAndSettle(
    const Duration(milliseconds: 100),
    EnginePhase.sendSemanticsUpdate,
    timeout,
  );
}

// ============================================================================
// Assertion Helpers
// ============================================================================

/// Verifies that all standard radio options (Normal, Equivocal, Impaired) exist.
void expectStandardRadioOptions() {
  expect(findNormalOption(), findsOneWidget);
  expect(findEquivocalOption(), findsOneWidget);
  expect(findImpairedOption(), findsOneWidget);
}

/// Verifies that the Task Completed button exists.
void expectTaskCompletedButton() {
  expect(findTaskCompletedButton(), findsOneWidget);
}
