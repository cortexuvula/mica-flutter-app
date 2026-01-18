import 'package:flutter/material.dart';

/// A reusable task completion button widget with consistent styling.
///
/// Used at the bottom of assessment screens to save scores and navigate.
/// Wraps the button in a Card with standard elevation and styling.
///
/// Example:
/// ```dart
/// TaskCompletionButton(
///   onPressed: () {
///     scoreModel.setLanguageComprehension(selectedScore);
///     Navigator.pop(context);
///   },
/// )
/// ```
class TaskCompletionButton extends StatelessWidget {
  /// Callback when button is pressed (typically saves score and navigates)
  final VoidCallback? onPressed;

  /// Button text (defaults to 'Task Completed')
  final String buttonText;

  /// Width multiplier relative to screen width (defaults to 0.9)
  final double widthMultiplier;

  /// Card elevation (defaults to 10.0)
  final double elevation;

  /// Whether the button is enabled (if null, button is always enabled)
  final bool? isEnabled;

  /// Optional message to show when button is disabled
  final String? disabledMessage;

  const TaskCompletionButton({
    super.key,
    required this.onPressed,
    this.buttonText = 'Task Completed',
    this.widthMultiplier = 0.9,
    this.elevation = 10.0,
    this.isEnabled,
    this.disabledMessage,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final effectivelyEnabled = isEnabled ?? true;

    return SizedBox(
      width: width * widthMultiplier,
      child: Card(
        elevation: elevation,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              if (disabledMessage != null && !effectivelyEnabled)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    disabledMessage!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              SizedBox(
                width: width * 0.8,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: elevation,
                    backgroundColor: effectivelyEnabled
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.grey,
                  ),
                  onPressed: effectivelyEnabled ? onPressed : null,
                  child: Text(
                    buttonText,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A variant with automatic navigation after callback.
///
/// Example:
/// ```dart
/// TaskCompletionButtonWithNav(
///   onSave: () => scoreModel.setLanguageComprehension(selectedScore),
/// )
/// ```
class TaskCompletionButtonWithNav extends StatelessWidget {
  /// Callback to save the score (called before navigation)
  final VoidCallback? onSave;

  /// Button text (defaults to 'Task Completed')
  final String buttonText;

  /// Width multiplier relative to screen width (defaults to 0.9)
  final double widthMultiplier;

  /// Whether to pop navigation after saving (defaults to true)
  final bool popAfterSave;

  /// Whether the button is enabled
  final bool? isEnabled;

  /// Optional message to show when button is disabled
  final String? disabledMessage;

  const TaskCompletionButtonWithNav({
    super.key,
    this.onSave,
    this.buttonText = 'Task Completed',
    this.widthMultiplier = 0.9,
    this.popAfterSave = true,
    this.isEnabled,
    this.disabledMessage,
  });

  @override
  Widget build(BuildContext context) {
    return TaskCompletionButton(
      buttonText: buttonText,
      widthMultiplier: widthMultiplier,
      isEnabled: isEnabled,
      disabledMessage: disabledMessage,
      onPressed: () {
        onSave?.call();
        if (popAfterSave) {
          Navigator.of(context).pop();
        }
      },
    );
  }
}
