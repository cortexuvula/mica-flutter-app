import 'package:flutter/material.dart';

/// Types of instruction cards with predefined colors
enum InstructionCardType {
  /// Purple card for examiner instructions
  examiner,

  /// Yellow card for patient instructions
  patient,

  /// Green card for scoring/response sections
  scoring,
}

/// A reusable instruction card widget with consistent styling.
///
/// Used across assessment screens to display instructions with color-coded
/// backgrounds:
/// - Purple (examiner): Instructions for the examiner to follow
/// - Yellow (patient): Instructions to give to the patient
/// - Green (scoring): Scoring criteria or response sections
///
/// Example:
/// ```dart
/// InstructionCard(
///   type: InstructionCardType.examiner,
///   text: 'Ask the patient to...',
/// )
/// ```
class InstructionCard extends StatelessWidget {
  /// The type of instruction card, determines background color
  final InstructionCardType type;

  /// The instruction text to display
  final String text;

  /// Optional custom text style (defaults to black, 16.0, height 1.5)
  final TextStyle? textStyle;

  /// Optional custom padding (defaults to EdgeInsets.all(16.0))
  final EdgeInsets? padding;

  /// Optional custom elevation (defaults to 10.0)
  final double elevation;

  /// Optional child widget to use instead of text
  final Widget? child;

  const InstructionCard({
    super.key,
    required this.type,
    this.text = '',
    this.textStyle,
    this.padding,
    this.elevation = 10.0,
    this.child,
  });

  /// Factory constructor for examiner instruction cards
  factory InstructionCard.examiner({
    Key? key,
    required String text,
    TextStyle? textStyle,
    EdgeInsets? padding,
    double elevation = 10.0,
  }) {
    return InstructionCard(
      key: key,
      type: InstructionCardType.examiner,
      text: text,
      textStyle: textStyle,
      padding: padding,
      elevation: elevation,
    );
  }

  /// Factory constructor for patient instruction cards
  factory InstructionCard.patient({
    Key? key,
    required String text,
    TextStyle? textStyle,
    EdgeInsets? padding,
    double elevation = 10.0,
  }) {
    return InstructionCard(
      key: key,
      type: InstructionCardType.patient,
      text: text,
      textStyle: textStyle,
      padding: padding,
      elevation: elevation,
    );
  }

  /// Factory constructor for scoring/response cards
  factory InstructionCard.scoring({
    Key? key,
    required String text,
    TextStyle? textStyle,
    EdgeInsets? padding,
    double elevation = 10.0,
    Widget? child,
  }) {
    return InstructionCard(
      key: key,
      type: InstructionCardType.scoring,
      text: text,
      textStyle: textStyle,
      padding: padding,
      elevation: elevation,
      child: child,
    );
  }

  Color _getBackgroundColor() {
    switch (type) {
      case InstructionCardType.examiner:
        return Colors.deepPurple.shade300;
      case InstructionCardType.patient:
        return Colors.yellowAccent.shade400;
      case InstructionCardType.scoring:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = TextStyle(
      color: Colors.black,
      fontSize: 16.0,
      height: 1.5,
    );

    return Card(
      elevation: elevation,
      color: _getBackgroundColor(),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16.0),
        child: child ??
            Text(
              text,
              style: textStyle ?? defaultTextStyle,
              textAlign: TextAlign.center,
            ),
      ),
    );
  }
}
