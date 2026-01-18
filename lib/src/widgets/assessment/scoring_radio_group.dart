import 'package:flutter/material.dart';

/// A scoring option with a value and label
class ScoringOption<T> {
  final T value;
  final String label;

  const ScoringOption({
    required this.value,
    required this.label,
  });
}

/// Standard N/E/I (Normal/Equivocal/Impaired) scoring options
class StandardScoringOptions {
  static const List<ScoringOption<int>> nei = [
    ScoringOption(value: 0, label: 'Normal'),
    ScoringOption(value: 1, label: 'Equivocal'),
    ScoringOption(value: 2, label: 'Impaired'),
  ];

  /// Reversed for cases where lower is better
  static const List<ScoringOption<int>> neiReversed = [
    ScoringOption(value: 2, label: 'Impaired'),
    ScoringOption(value: 1, label: 'Equivocal'),
    ScoringOption(value: 0, label: 'Normal'),
  ];
}

/// A reusable radio button group widget for scoring assessments.
///
/// Displays radio buttons in a table layout with consistent styling.
/// Supports generic value types for flexibility.
///
/// Example:
/// ```dart
/// ScoringRadioGroup<int>(
///   options: StandardScoringOptions.nei,
///   groupValue: _selectedScore,
///   onChanged: (value) => setState(() => _selectedScore = value),
/// )
/// ```
class ScoringRadioGroup<T> extends StatelessWidget {
  /// The available scoring options
  final List<ScoringOption<T>> options;

  /// The currently selected value
  final T? groupValue;

  /// Callback when selection changes
  final ValueChanged<T?> onChanged;

  /// Background color for the table (defaults to green)
  final Color backgroundColor;

  /// Text color for labels (defaults to black)
  final Color textColor;

  /// Radio fill color when selected (defaults to white)
  final Color selectedRadioColor;

  /// Radio fill color when unselected (defaults to black)
  final Color unselectedRadioColor;

  /// Optional title to display above the radio group
  final String? title;

  /// Whether to show the table border (defaults to true)
  final bool showBorder;

  const ScoringRadioGroup({
    super.key,
    required this.options,
    required this.groupValue,
    required this.onChanged,
    this.backgroundColor = Colors.green,
    this.textColor = Colors.black,
    this.selectedRadioColor = Colors.white,
    this.unselectedRadioColor = Colors.black,
    this.title,
    this.showBorder = true,
  });

  /// Factory constructor for standard N/E/I scoring
  factory ScoringRadioGroup.nei({
    Key? key,
    required int? groupValue,
    required ValueChanged<int?> onChanged,
    Color backgroundColor = Colors.green,
    String? title,
  }) {
    return ScoringRadioGroup<int>(
      key: key,
      options: StandardScoringOptions.nei
          .map((e) => ScoringOption<int>(value: e.value, label: e.label))
          .toList(),
      groupValue: groupValue,
      onChanged: onChanged,
      backgroundColor: backgroundColor,
      title: title,
    ) as ScoringRadioGroup<T>;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (title != null) ...[
              Text(
                title!,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
            ],
            Table(
              border: showBorder
                  ? TableBorder.all(
                      color: Colors.black54,
                      width: 1.0,
                    )
                  : null,
              children: [
                TableRow(
                  children: options.map((option) {
                    return _buildTableCell(option);
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableCell(ScoringOption<T> option) {
    return TableCell(
      child: InkWell(
        onTap: () => onChanged(option.value),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio<T>(
                value: option.value,
                groupValue: groupValue,
                onChanged: onChanged,
                fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.selected)) {
                    return selectedRadioColor;
                  }
                  return unselectedRadioColor;
                }),
              ),
              Text(
                option.label,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A vertical variant of the scoring radio group for longer option lists.
class ScoringRadioGroupVertical<T> extends StatelessWidget {
  final List<ScoringOption<T>> options;
  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final Color backgroundColor;
  final Color textColor;
  final Color selectedRadioColor;
  final Color unselectedRadioColor;
  final String? title;

  const ScoringRadioGroupVertical({
    super.key,
    required this.options,
    required this.groupValue,
    required this.onChanged,
    this.backgroundColor = Colors.green,
    this.textColor = Colors.black,
    this.selectedRadioColor = Colors.white,
    this.unselectedRadioColor = Colors.black,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (title != null) ...[
              Text(
                title!,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
            ],
            ...options.map((option) => _buildRadioTile(option)),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioTile(ScoringOption<T> option) {
    return InkWell(
      onTap: () => onChanged(option.value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: <Widget>[
            Radio<T>(
              value: option.value,
              groupValue: groupValue,
              onChanged: onChanged,
              fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.selected)) {
                  return selectedRadioColor;
                }
                return unselectedRadioColor;
              }),
            ),
            Expanded(
              child: Text(
                option.label,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
