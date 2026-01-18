import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../models/mica_score_model.dart';

/// Service for persisting and restoring assessment progress using SharedPreferences.
///
/// This service provides auto-save functionality so users don't lose progress
/// if the app closes mid-assessment.
class PersistenceService {
  static const String _storageKey = 'mica_assessment_progress';

  /// Debounce timer to prevent excessive writes
  static Timer? _debounceTimer;
  static const Duration _debounceDuration = Duration(milliseconds: 500);

  /// Save current assessment state with debouncing.
  /// Returns true if save was scheduled/completed, false if no data to save.
  static Future<bool> saveProgress(MicaScoreModel model) async {
    if (!model.hasData) return false;

    // Cancel any pending save
    _debounceTimer?.cancel();

    // Schedule a new save after debounce period
    final completer = Completer<bool>();
    _debounceTimer = Timer(_debounceDuration, () async {
      try {
        final result = await _performSave(model);
        if (!completer.isCompleted) {
          completer.complete(result);
        }
      } catch (e) {
        if (!completer.isCompleted) {
          completer.complete(false);
        }
      }
    });

    return completer.future;
  }

  /// Perform the actual save operation
  static Future<bool> _performSave(MicaScoreModel model) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final json = jsonEncode(model.toJson());
      return prefs.setString(_storageKey, json);
    } catch (e) {
      // Log error in debug mode, but don't crash
      assert(() {
        print('PersistenceService: Error saving progress: $e');
        return true;
      }());
      return false;
    }
  }

  /// Force an immediate save (bypasses debouncing).
  /// Use when user explicitly triggers save or before app close.
  static Future<bool> saveProgressImmediate(MicaScoreModel model) async {
    _debounceTimer?.cancel();
    return _performSave(model);
  }

  /// Load saved assessment state.
  /// Returns null if no saved data or if data is corrupted.
  static Future<Map<String, dynamic>?> loadProgress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final json = prefs.getString(_storageKey);
      if (json == null) return null;

      final data = jsonDecode(json) as Map<String, dynamic>;

      // Validate data has expected structure
      if (!_validateData(data)) {
        await clearProgress();
        return null;
      }

      return data;
    } catch (e) {
      // Corrupted data - clear it
      assert(() {
        print('PersistenceService: Error loading progress: $e');
        return true;
      }());
      await clearProgress();
      return null;
    }
  }

  /// Validate loaded data has expected structure
  static bool _validateData(Map<String, dynamic> data) {
    // Check for required fields that should always be present
    return data.containsKey('savedAt') && data.containsKey('patientName');
  }

  /// Check if there's saved progress worth resuming.
  static Future<bool> hasInProgressAssessment() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final json = prefs.getString(_storageKey);
      if (json == null) return false;

      // Validate the data is not corrupted
      final data = jsonDecode(json) as Map<String, dynamic>;
      return _validateData(data);
    } catch (e) {
      return false;
    }
  }

  /// Clear saved progress.
  /// Call this when assessment is completed or explicitly reset.
  static Future<bool> clearProgress() async {
    try {
      _debounceTimer?.cancel();
      final prefs = await SharedPreferences.getInstance();
      return prefs.remove(_storageKey);
    } catch (e) {
      assert(() {
        print('PersistenceService: Error clearing progress: $e');
        return true;
      }());
      return false;
    }
  }

  /// Get saved patient name for display on resume button.
  static Future<String?> getSavedPatientName() async {
    final data = await loadProgress();
    final name = data?['patientName'] as String?;
    return (name != null && name.isNotEmpty) ? name : null;
  }

  /// Get saved timestamp for display.
  static Future<DateTime?> getSavedTimestamp() async {
    final data = await loadProgress();
    final savedAt = data?['savedAt'] as String?;
    if (savedAt == null) return null;
    return DateTime.tryParse(savedAt);
  }

  /// Restore saved progress into a MicaScoreModel.
  /// Returns true if restoration was successful.
  static Future<bool> restoreProgress(MicaScoreModel model) async {
    final data = await loadProgress();
    if (data == null) return false;

    try {
      model.fromJson(data);
      return true;
    } catch (e) {
      assert(() {
        print('PersistenceService: Error restoring progress: $e');
        return true;
      }());
      return false;
    }
  }
}
