import 'package:mica/src/models/mica_score_model.dart';
import 'assessment_constants.dart';

/// Utility class for converting assessment scores to string representations
class AssessmentStringUtils {
  // Convert radio value (0,1,2) to assessment result (N,E,I)
  static String radioValueToString(int radioValue) {
    switch (radioValue) {
      case 0:
        return AssessmentConstants.normal;
      case 1:
        return AssessmentConstants.equivocal;
      case 2:
        return AssessmentConstants.impaired;
      default:
        return AssessmentConstants.normal;
    }
  }

  // Convert assessment result abbreviation to full name
  static String resultToFullName(String result) {
    return AssessmentConstants.resultFullNames[result] ?? 'Unknown';
  }

  // Trial 1 result string (Working Memory)
  static String trial1ResultToString(int value) {
    if (value < 5) {
      return AssessmentConstants.impaired;
    } else if (value == 5 || value == 6) {
      return AssessmentConstants.equivocal;
    } else {
      return AssessmentConstants.normal;
    }
  }

  // Trial 2 result string (Short-term Memory)
  static String trial2ResultToString(int value) {
    if (value < 5) {
      return AssessmentConstants.impaired;
    } else if (value >= 5 && value <= 6) {
      return AssessmentConstants.equivocal;
    } else {
      return AssessmentConstants.normal;
    }
  }

  // Trial 3 result string
  static String trial3ResultToString(int value) {
    if (value < 6) {
      return AssessmentConstants.impaired;
    } else if (value == 6 || value == 7) {
      return AssessmentConstants.equivocal;
    } else {
      return AssessmentConstants.normal;
    }
  }

  // Delay recall result string
  static String delayRecallResultToString(int value) {
    if (value < 5) {
      return AssessmentConstants.impaired;
    } else if (value == 5) {
      return AssessmentConstants.equivocal;
    } else {
      return AssessmentConstants.normal;
    }
  }

  // Recognition result string
  static String recognitionResultToString(int value) {
    if (value < 14) {
      return AssessmentConstants.impaired;
    } else if (value >= 14 && value <= 16) {
      return AssessmentConstants.equivocal;
    } else {
      return AssessmentConstants.normal;
    }
  }

  // Orientation result string
  static String orientationResultToString(int value) {
    if (value < 4) {
      return AssessmentConstants.impaired;
    } else if (value == 4) {
      return AssessmentConstants.equivocal;
    } else {
      return AssessmentConstants.normal;
    }
  }

  // Visual memory result string
  static String visualMemoryResultToString(MicaScoreModel scoreModel) {
    int score1 = 3 - scoreModel.shorttermMemoryVisualImage1;
    int score2 = 3 - scoreModel.shorttermMemoryVisualImage2;
    int score3 = 3 - scoreModel.shorttermMemoryVisualImage3;
    int combinedScore = score1 + score2 + score3;

    if (combinedScore > 7) {
      return "Normal";
    } else if (combinedScore < 7) {
      return "Impaired";
    } else {
      return "Equivocal";
    }
  }

  // Calculate visual memory combined score
  static int calculateVisualMemoryScore(MicaScoreModel scoreModel, bool useShortTermMemory) {
    if (useShortTermMemory) {
      return (3 - scoreModel.shorttermMemoryVisualImage1) +
             (3 - scoreModel.shorttermMemoryVisualImage2) +
             (3 - scoreModel.shorttermMemoryVisualImage3);
    } else {
      return (3 - scoreModel.visuospatialPraxisImage1) +
             (3 - scoreModel.visuospatialPraxisImage2) +
             (3 - scoreModel.visuospatialPraxisImage3);
    }
  }

  // Format patient name with proper capitalization
  static String formatPatientName(String name) {
    if (name.isEmpty) return 'No Name Provided';
    return name[0].toUpperCase() + name.substring(1);
  }

  // Format assessor name with proper capitalization
  static String formatAssessorName(String name) {
    if (name.isEmpty) return 'No Name Provided';
    return name[0].toUpperCase() + name.substring(1);
  }
}