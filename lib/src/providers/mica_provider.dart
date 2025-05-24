import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:mica/src/models/mica_score_model.dart';

/// Provider configuration for MICA app
class MicaProviders {
  /// Get all providers used in the app
  static List<SingleChildWidget> getProviders() {
    return [
      ChangeNotifierProvider<MicaScoreModel>(
        create: (_) => MicaScoreModel(),
      ),
      // Add any other providers here as needed
    ];
  }

  /// Method to access the MicaScoreModel from any context
  static MicaScoreModel getScoreModel(BuildContext context,
      {bool listen = true}) {
    return Provider.of<MicaScoreModel>(context, listen: listen);
  }
}
