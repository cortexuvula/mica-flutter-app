import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:mica/src/models/mica_score_model.dart';
import 'package:mica/src/services/persistence_service.dart';

/// Provider configuration for MICA app
class MicaProviders {
  /// Get all providers used in the app
  static List<SingleChildWidget> getProviders() {
    return [
      ChangeNotifierProvider<MicaScoreModel>(
        create: (_) => _createModelWithPersistence(),
      ),
      // Add any other providers here as needed
    ];
  }

  /// Create a MicaScoreModel with auto-save persistence listener
  static MicaScoreModel _createModelWithPersistence() {
    final model = MicaScoreModel();

    // Add listener to auto-save on every change
    model.addListener(() {
      // Save is debounced in PersistenceService to avoid excessive writes
      PersistenceService.saveProgress(model);
    });

    return model;
  }

  /// Method to access the MicaScoreModel from any context
  static MicaScoreModel getScoreModel(BuildContext context,
      {bool listen = true}) {
    return Provider.of<MicaScoreModel>(context, listen: listen);
  }
}
