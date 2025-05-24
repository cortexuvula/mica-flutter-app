import 'package:flutter/material.dart';
import 'package:mica/src/providers/mica_provider.dart';

/// Utility class to help with transitioning from direct parameter passing to Provider pattern
class MicaStateInitializer {
  /// Initialize the MicaScoreModel with data from the TestSummary widget parameters
  static void initializeFromTestParameters({
    required BuildContext context,
    required String patientName,
    required String assessorName,
    required String handedness,
    required DateTime assessmentDate,
    required int languageComprehensionRadioValue,
    required int trialOneScore,
    required int trialTwoScore,
    required int trialThreeScore,
    required int visuospatialPraxisImage1,
    required int visuospatialPraxisImage2,
    required int visuospatialPraxisImage3,
    required int attention,
    required int attentionCorrect,
    required int attentionMistakes,
    required int executiveAnimalNaming,
    required int executiveAnimalNamingCount,
    required int executiveLuria,
    required int executiveLuriaScore,
    required int executiveSerial,
    required int executiveSerialScore,
    required int shorttermMemoryVerbal,
    required int shorttermMemoryVerbalScore,
    required int praxisRight,
    required int praxisLeft,
    required int tenWordDelay,
    required int scoreVerbalRecognitionMemoryTenWords,
    required int scoreVerbalRecognitionMemoryTenWordsInList,
    required int scoreVerbalRecognitionMemoryTenWordsNotInList,
    required int shorttermMemoryVisualImage1,
    required int shorttermMemoryVisualImage2,
    required int shorttermMemoryVisualImage3,
    required int anomiaAgnosia,
    required int agnosia,
    required int executive,
    required int spokenLanguage,
  }) {
    // Get the model without listening to changes
    final model = MicaProviders.getScoreModel(context, listen: false);

    // Initialize the model with the provided parameters
    model.initFromTestSummary(
      patientName: patientName,
      assessorName: assessorName,
      handedness: handedness,
      assessmentDate: assessmentDate,
      languageComprehensionRadioValue: languageComprehensionRadioValue,
      trialOneScore: trialOneScore,
      trialTwoScore: trialTwoScore,
      trialThreeScore: trialThreeScore,
      visuospatialPraxisImage1: visuospatialPraxisImage1,
      visuospatialPraxisImage2: visuospatialPraxisImage2,
      visuospatialPraxisImage3: visuospatialPraxisImage3,
      attention: attention,
      attentionCorrect: attentionCorrect,
      attentionMistakes: attentionMistakes,
      executiveAnimalNaming: executiveAnimalNaming,
      executiveAnimalNamingCount: executiveAnimalNamingCount,
      executiveLuria: executiveLuria,
      executiveLuriaScore: executiveLuriaScore,
      executiveSerial: executiveSerial,
      executiveSerialScore: executiveSerialScore,
      shorttermMemoryVerbal: shorttermMemoryVerbal,
      shorttermMemoryVerbalScore: shorttermMemoryVerbalScore,
      praxisRight: praxisRight,
      praxisLeft: praxisLeft,
      tenWordDelay: tenWordDelay,
      scoreVerbalRecognitionMemoryTenWords:
          scoreVerbalRecognitionMemoryTenWords,
      scoreVerbalRecognitionMemoryTenWordsInList:
          scoreVerbalRecognitionMemoryTenWordsInList,
      scoreVerbalRecognitionMemoryTenWordsNotInList:
          scoreVerbalRecognitionMemoryTenWordsNotInList,
      shorttermMemoryVisualImage1: shorttermMemoryVisualImage1,
      shorttermMemoryVisualImage2: shorttermMemoryVisualImage2,
      shorttermMemoryVisualImage3: shorttermMemoryVisualImage3,
      anomiaAgnosia: anomiaAgnosia,
      agnosia: agnosia,
      executive: executive,
      spokenLanguage: spokenLanguage,
    );
  }
}
