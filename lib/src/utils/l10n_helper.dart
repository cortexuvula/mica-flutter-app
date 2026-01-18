import 'package:flutter/widgets.dart';
import 'package:mica/l10n/app_localizations.dart';

/// Extension for easy access to localized strings.
///
/// Usage:
/// ```dart
/// import 'package:mica/src/utils/l10n_helper.dart';
///
/// // In a widget's build method:
/// Text(context.l10n.appTitle)
/// ```
extension LocalizationExtension on BuildContext {
  /// Returns the [AppLocalizations] instance for the current context.
  AppLocalizations get l10n => AppLocalizations.of(this);
}
