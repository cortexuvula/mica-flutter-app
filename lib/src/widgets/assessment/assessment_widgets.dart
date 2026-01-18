/// Assessment widgets library.
///
/// Provides reusable UI components for cognitive assessment screens.
///
/// Example usage:
/// ```dart
/// import 'package:mica/src/widgets/assessment/assessment_widgets.dart';
///
/// // Use instruction cards
/// InstructionCard.examiner(text: 'Ask the patient to...');
/// InstructionCard.patient(text: 'Please tell me...');
/// InstructionCard.scoring(text: 'Score the response:');
///
/// // Use scoring radio group
/// ScoringRadioGroup<int>(
///   options: StandardScoringOptions.nei,
///   groupValue: _selectedScore,
///   onChanged: (value) => setState(() => _selectedScore = value),
/// );
///
/// // Use task completion button
/// TaskCompletionButton(
///   onPressed: () {
///     scoreModel.setScore(selectedScore);
///     Navigator.pop(context);
///   },
/// );
/// ```
library;

export 'instruction_card.dart';
export 'scoring_radio_group.dart';
export 'task_completion_button.dart';
