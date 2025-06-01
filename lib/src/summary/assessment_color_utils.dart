import 'package:flutter/material.dart';
import 'package:mica/src/models/mica_score_model.dart';

/// Utility class for determining assessment result colors
class AssessmentColorUtils {
  // Radio value colors (0 = Normal/Green, 1 = Equivocal/Yellow, 2 = Impaired/Red)
  static Color radioValueToColor(int radioValue) {
    switch (radioValue) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.yellow;
      case 2:
        return Colors.red;
      default:
        return Colors.green;
    }
  }

  // Trial 1 color (Working Memory)
  static Color trial1Color(int value) {
    if (value < 5) {
      return Colors.red;
    } else if (value == 5 || value == 6) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  // Trial 2 color (Short-term Memory)
  static Color trial2Color(int value) {
    if (value < 5) {
      return Colors.red;
    } else if (value >= 5 && value <= 6) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  // Trial 3 color
  static Color trial3Color(int value) {
    if (value < 6) {
      return Colors.red;
    } else if (value == 6 || value == 7) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  // Delay recall color
  static Color delayRecallColor(int value) {
    if (value < 7) {
      return Colors.red;
    } else if (value == 7) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  // Language domain color
  static Color languageDomainColor(int spokenLanguage, int animalNaming) {
    if (spokenLanguage == 2 || animalNaming == 2) {
      return Colors.red;
    } else if (spokenLanguage == 1 || animalNaming == 1) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  // Verbal Short-Term Memory domain color
  static Color verbalShortTermMemoryColor(
    int trial2Score,
    int trial3Score,
    int orientation,
    int delayRecall,
    int recognition,
  ) {
    // Check if all values have excellent scores
    if (trial2Score >= 7 &&
        trial3Score >= 8 &&
        (orientation == 0 || orientation >= 5) &&
        delayRecall >= 6 &&
        recognition >= 6) {
      return Colors.green;
    }

    // Check if any value indicates impaired
    bool orientationImpaired = orientation != 0 && orientation < 4;
    bool isImpaired = trial2Score < 5 ||
        trial3Score < 5 ||
        orientationImpaired ||
        delayRecall < 5 ||
        recognition < 5;

    if (isImpaired) {
      return Colors.red;
    }

    // Check if any value indicates equivocal
    bool trial2Equivocal = trial2Score == 5 || trial2Score == 6;
    bool trial3Equivocal = trial3Score >= 5 && trial3Score <= 7;
    bool orientationEquivocal = orientation == 4;
    bool delayEquivocal = delayRecall == 5;
    bool recognitionEquivocal = recognition == 5;

    bool isEquivocal = trial2Equivocal ||
        trial3Equivocal ||
        orientationEquivocal ||
        delayEquivocal ||
        recognitionEquivocal;

    if (isEquivocal) {
      return Colors.yellow;
    }
    return Colors.green;
  }

  // Visual Short-Term Memory color
  static Color visualMemoryColor(MicaScoreModel scoreModel) {
    int score1 = 3 - scoreModel.shorttermMemoryVisualImage1;
    int score2 = 3 - scoreModel.shorttermMemoryVisualImage2;
    int score3 = 3 - scoreModel.shorttermMemoryVisualImage3;
    int combinedScore = score1 + score2 + score3;

    if (combinedScore < 6) {
      return Colors.red;
    } else if (combinedScore == 6) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  // Praxis domain color
  static Color praxisDomainColor(MicaScoreModel scoreModel) {
    int score1 = 3 - scoreModel.visuospatialPraxisImage1;
    int score2 = 3 - scoreModel.visuospatialPraxisImage2;
    int score3 = 3 - scoreModel.visuospatialPraxisImage3;
    int combinedScore = score1 + score2 + score3;

    if (combinedScore < 5 ||
        scoreModel.praxisLeft == 2 ||
        scoreModel.praxisRight == 2) {
      return Colors.red;
    } else if (combinedScore == 5 ||
        scoreModel.praxisLeft == 1 ||
        scoreModel.praxisRight == 1) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  // Gnosis domain color
  static Color gnosisDomainColor(MicaScoreModel scoreModel) {
    int score1 = 3 - scoreModel.visuospatialPraxisImage1;
    int score2 = 3 - scoreModel.visuospatialPraxisImage2;
    int score3 = 3 - scoreModel.visuospatialPraxisImage3;
    int combinedScore = score1 + score2 + score3;

    if (combinedScore < 5 || scoreModel.anomiaAgnosia == 2) {
      return Colors.red;
    } else if (combinedScore == 5 || scoreModel.anomiaAgnosia == 1) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  // Executive Function domain color
  static Color executiveFunctionColor(int radioValue) {
    return radioValueToColor(radioValue);
  }

  // Attention domain color
  static Color attentionColor(int radioValue) {
    return radioValueToColor(radioValue);
  }
}