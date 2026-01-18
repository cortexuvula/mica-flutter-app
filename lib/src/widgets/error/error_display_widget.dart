import 'package:flutter/material.dart';

/// A reusable widget for displaying error states with optional retry functionality.
///
/// Use this widget when an operation fails and you want to show the user
/// a clear error message with the option to retry.
class ErrorDisplayWidget extends StatelessWidget {
  /// The error message to display
  final String message;

  /// Optional callback for retry functionality
  final VoidCallback? onRetry;

  /// Optional icon to display (defaults to error icon)
  final IconData icon;

  /// Optional icon color (defaults to red)
  final Color iconColor;

  /// Optional title text (defaults to 'Something went wrong')
  final String title;

  /// Optional retry button text (defaults to 'Try Again')
  final String retryButtonText;

  const ErrorDisplayWidget({
    super.key,
    required this.message,
    this.onRetry,
    this.icon = Icons.error_outline,
    this.iconColor = Colors.red,
    this.title = 'Something went wrong',
    this.retryButtonText = 'Try Again',
  });

  /// Factory constructor for video loading errors
  factory ErrorDisplayWidget.videoError({
    Key? key,
    required String message,
    VoidCallback? onRetry,
  }) {
    return ErrorDisplayWidget(
      key: key,
      message: message,
      onRetry: onRetry,
      icon: Icons.videocam_off,
      title: 'Video Unavailable',
      retryButtonText: 'Retry Loading',
    );
  }

  /// Factory constructor for file operation errors
  factory ErrorDisplayWidget.fileError({
    Key? key,
    required String message,
    VoidCallback? onRetry,
  }) {
    return ErrorDisplayWidget(
      key: key,
      message: message,
      onRetry: onRetry,
      icon: Icons.folder_off,
      title: 'File Error',
      retryButtonText: 'Try Again',
    );
  }

  /// Factory constructor for network errors
  factory ErrorDisplayWidget.networkError({
    Key? key,
    required String message,
    VoidCallback? onRetry,
  }) {
    return ErrorDisplayWidget(
      key: key,
      message: message,
      onRetry: onRetry,
      icon: Icons.wifi_off,
      title: 'Connection Error',
      retryButtonText: 'Retry',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 64,
              color: iconColor,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: Text(retryButtonText),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Colors.black,
                  elevation: 4,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
