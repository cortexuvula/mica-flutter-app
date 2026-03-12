import 'package:flutter/material.dart';

/// Shows a confirmation dialog before discarding assessment data.
/// Returns true if the user confirms they want to discard, false otherwise.
Future<bool> showDiscardConfirmation(BuildContext context) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Discard Assessment?'),
      content: const Text(
        'All assessment data will be lost. This cannot be undone.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Discard'),
        ),
      ],
    ),
  );
  return result ?? false;
}
