import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// Application title displayed in app bar and browser tab
  ///
  /// In en, this message translates to:
  /// **'Midlands Cognitive Assessment'**
  String get appTitle;

  /// No description provided for @taskCompleted.
  ///
  /// In en, this message translates to:
  /// **'Task Completed'**
  String get taskCompleted;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get normal;

  /// No description provided for @equivocal.
  ///
  /// In en, this message translates to:
  /// **'Equivocal'**
  String get equivocal;

  /// No description provided for @impaired.
  ///
  /// In en, this message translates to:
  /// **'Impaired'**
  String get impaired;

  /// No description provided for @scoreSummary.
  ///
  /// In en, this message translates to:
  /// **'Score Summary'**
  String get scoreSummary;

  /// No description provided for @results.
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get results;

  /// No description provided for @scrollDownToReveal.
  ///
  /// In en, this message translates to:
  /// **'Scroll down to reveal more instructions'**
  String get scrollDownToReveal;

  /// No description provided for @noteResponseAndScore.
  ///
  /// In en, this message translates to:
  /// **'Note the response of the patient and score as below.'**
  String get noteResponseAndScore;

  /// No description provided for @toPatient.
  ///
  /// In en, this message translates to:
  /// **'To Patient:'**
  String get toPatient;

  /// No description provided for @examinerInstructions.
  ///
  /// In en, this message translates to:
  /// **'Examiner Instructions:'**
  String get examinerInstructions;

  /// No description provided for @scoring.
  ///
  /// In en, this message translates to:
  /// **'Scoring:'**
  String get scoring;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name:'**
  String get nameLabel;

  /// No description provided for @testDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Test Date:'**
  String get testDateLabel;

  /// No description provided for @assessorLabel.
  ///
  /// In en, this message translates to:
  /// **'Assessor:'**
  String get assessorLabel;

  /// No description provided for @handednessLabel.
  ///
  /// In en, this message translates to:
  /// **'Handedness:'**
  String get handednessLabel;

  /// No description provided for @rightHanded.
  ///
  /// In en, this message translates to:
  /// **'Right'**
  String get rightHanded;

  /// No description provided for @leftHanded.
  ///
  /// In en, this message translates to:
  /// **'Left'**
  String get leftHanded;

  /// No description provided for @ambidextrous.
  ///
  /// In en, this message translates to:
  /// **'Ambidextrous'**
  String get ambidextrous;

  /// No description provided for @domainAttention.
  ///
  /// In en, this message translates to:
  /// **'Attention'**
  String get domainAttention;

  /// No description provided for @domainLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get domainLanguage;

  /// No description provided for @domainMemory.
  ///
  /// In en, this message translates to:
  /// **'Memory'**
  String get domainMemory;

  /// No description provided for @domainPraxis.
  ///
  /// In en, this message translates to:
  /// **'Praxis'**
  String get domainPraxis;

  /// No description provided for @domainGnosis.
  ///
  /// In en, this message translates to:
  /// **'Gnosis'**
  String get domainGnosis;

  /// No description provided for @domainExecutive.
  ///
  /// In en, this message translates to:
  /// **'Executive'**
  String get domainExecutive;

  /// No description provided for @trial1.
  ///
  /// In en, this message translates to:
  /// **'Trial 1'**
  String get trial1;

  /// No description provided for @trial2.
  ///
  /// In en, this message translates to:
  /// **'Trial 2'**
  String get trial2;

  /// No description provided for @trial3.
  ///
  /// In en, this message translates to:
  /// **'Trial 3'**
  String get trial3;

  /// No description provided for @verbal.
  ///
  /// In en, this message translates to:
  /// **'Verbal'**
  String get verbal;

  /// No description provided for @visual.
  ///
  /// In en, this message translates to:
  /// **'Visual'**
  String get visual;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Midland Cognitive Assessment'**
  String get appName;

  /// No description provided for @disclaimer.
  ///
  /// In en, this message translates to:
  /// **'The Midland Cognitive Assessment App does not provide medical advice and cannot replace good clinical practice. It is intended for health professionals familiar with this type of assessment. You use this App as is and at your own risk. You are strongly encouraged to first read the Full Instructions and Teaching Booklet.'**
  String get disclaimer;

  /// No description provided for @disclaimer2.
  ///
  /// In en, this message translates to:
  /// **'The Midland Cognitive Assessment App is intended for use by health professionals familiar with this type of cognitive assessment. It does not provide medical advice and cannot replace good clinical practice. It should be used at your own discretion. You are strongly encouraged to first read the full instructions and teaching booklet.'**
  String get disclaimer2;

  /// No description provided for @disclaimer3.
  ///
  /// In en, this message translates to:
  /// **'The following abbreviations are used:\nN = Normal, E = Equivocal, I = Impaired\n\nCut scores are estimates only.'**
  String get disclaimer3;

  /// No description provided for @appDescription.
  ///
  /// In en, this message translates to:
  /// **'The Midland Cognitive Assessment (MICA) is a collection of cognitive tasks that can be done in full or in part. Emphasis is on cognitive domain assessment and not on a total score. For full instructions see the accompanying booklet - Bedside Cognitive Assessment.'**
  String get appDescription;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome, what would you like to do today?'**
  String get welcomeTitle;

  /// No description provided for @welcomeOption1.
  ///
  /// In en, this message translates to:
  /// **'Administer the Midland Cognitive Assessment (MICA). A 15 minute cognitive assessment tool that covers most of the important cognitive domains.'**
  String get welcomeOption1;

  /// No description provided for @welcomeOption2.
  ///
  /// In en, this message translates to:
  /// **'Assess specific cognitive domain(s)'**
  String get welcomeOption2;

  /// No description provided for @welcomeOption3.
  ///
  /// In en, this message translates to:
  /// **'Learn more about the assessment of patients with specific clinical presentations.'**
  String get welcomeOption3;

  /// No description provided for @welcomeButtonMica.
  ///
  /// In en, this message translates to:
  /// **'MICA'**
  String get welcomeButtonMica;

  /// No description provided for @welcomeButtonDomains.
  ///
  /// In en, this message translates to:
  /// **'Domains'**
  String get welcomeButtonDomains;

  /// No description provided for @welcomeButtonClinicalCases.
  ///
  /// In en, this message translates to:
  /// **'Clinical Cases'**
  String get welcomeButtonClinicalCases;

  /// No description provided for @welcomeButtonBooklet.
  ///
  /// In en, this message translates to:
  /// **'Bedside Cognitive Assessment Booklet'**
  String get welcomeButtonBooklet;

  /// No description provided for @welcomeButtonVideos.
  ///
  /// In en, this message translates to:
  /// **'Educational Videos'**
  String get welcomeButtonVideos;

  /// No description provided for @domainSelect.
  ///
  /// In en, this message translates to:
  /// **'Domain Select'**
  String get domainSelect;

  /// No description provided for @domainSelectInfo.
  ///
  /// In en, this message translates to:
  /// **'Select a cognitive domain below to see how to assess for it.'**
  String get domainSelectInfo;

  /// No description provided for @domainSelectAttention.
  ///
  /// In en, this message translates to:
  /// **'Attention and Concentration'**
  String get domainSelectAttention;

  /// No description provided for @domainSelectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get domainSelectLanguage;

  /// No description provided for @domainSelectMemory.
  ///
  /// In en, this message translates to:
  /// **'Memory'**
  String get domainSelectMemory;

  /// No description provided for @domainSelectPraxis.
  ///
  /// In en, this message translates to:
  /// **'Praxis'**
  String get domainSelectPraxis;

  /// No description provided for @domainSelectGnosis.
  ///
  /// In en, this message translates to:
  /// **'Gnosis'**
  String get domainSelectGnosis;

  /// No description provided for @domainSelectExecutive.
  ///
  /// In en, this message translates to:
  /// **'Executive functions'**
  String get domainSelectExecutive;

  /// No description provided for @clinicalSelectTitle.
  ///
  /// In en, this message translates to:
  /// **'Clinical Cases'**
  String get clinicalSelectTitle;

  /// No description provided for @clinicalAlzheimersEarly.
  ///
  /// In en, this message translates to:
  /// **'Early or Mild Alzheimer\'s disease'**
  String get clinicalAlzheimersEarly;

  /// No description provided for @clinicalAlzheimersModerate.
  ///
  /// In en, this message translates to:
  /// **'Moderate Alzheimer\'s disease'**
  String get clinicalAlzheimersModerate;

  /// No description provided for @clinicalVascularDementia.
  ///
  /// In en, this message translates to:
  /// **'Vascular dementia'**
  String get clinicalVascularDementia;

  /// No description provided for @clinicalSchizophrenia.
  ///
  /// In en, this message translates to:
  /// **'Schizophrenia'**
  String get clinicalSchizophrenia;

  /// No description provided for @clinicalDepression.
  ///
  /// In en, this message translates to:
  /// **'Depression'**
  String get clinicalDepression;

  /// No description provided for @resourceButtonBooklet.
  ///
  /// In en, this message translates to:
  /// **'Bedside Cognitive Assessment Booklet'**
  String get resourceButtonBooklet;

  /// No description provided for @resourceButtonVideo.
  ///
  /// In en, this message translates to:
  /// **'Educational Videos'**
  String get resourceButtonVideo;

  /// No description provided for @bookletButton.
  ///
  /// In en, this message translates to:
  /// **'Bedside Cognitive Assessment Booklet'**
  String get bookletButton;

  /// No description provided for @fullTestButton.
  ///
  /// In en, this message translates to:
  /// **'Start Full Test'**
  String get fullTestButton;

  /// No description provided for @fullTestText.
  ///
  /// In en, this message translates to:
  /// **'Ensure that all testing is done in a quiet environment without any disturbance. You will need two blank sheets of A4 paper and a pen or pencil.'**
  String get fullTestText;

  /// No description provided for @startTesting.
  ///
  /// In en, this message translates to:
  /// **'We are now going to do some tests of your memory and thinking. Some of the tests will be easy and others difficult. Just try your best. Any questions?'**
  String get startTesting;

  /// No description provided for @testDescription.
  ///
  /// In en, this message translates to:
  /// **'Task Description:'**
  String get testDescription;

  /// No description provided for @testToPatient.
  ///
  /// In en, this message translates to:
  /// **'To Patient:'**
  String get testToPatient;

  /// No description provided for @testResponse.
  ///
  /// In en, this message translates to:
  /// **'Response:'**
  String get testResponse;

  /// No description provided for @attentionDomainTitle.
  ///
  /// In en, this message translates to:
  /// **'Assessment of Attention'**
  String get attentionDomainTitle;

  /// No description provided for @attentionDomainSubtitle.
  ///
  /// In en, this message translates to:
  /// **'and Concentration'**
  String get attentionDomainSubtitle;

  /// No description provided for @attentionVigilanceButton.
  ///
  /// In en, this message translates to:
  /// **'1. Vigilance test'**
  String get attentionVigilanceButton;

  /// No description provided for @attentionSpellWordButton.
  ///
  /// In en, this message translates to:
  /// **'2. Spell a 5 letter word backwards'**
  String get attentionSpellWordButton;

  /// No description provided for @attentionSerialButton.
  ///
  /// In en, this message translates to:
  /// **'3. Serial 7s or 3s'**
  String get attentionSerialButton;

  /// No description provided for @attentionDigitSpanButton.
  ///
  /// In en, this message translates to:
  /// **'4. Digit span'**
  String get attentionDigitSpanButton;

  /// No description provided for @attentionObservationButton.
  ///
  /// In en, this message translates to:
  /// **'5. Observation'**
  String get attentionObservationButton;

  /// No description provided for @attentionVigilanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Attention'**
  String get attentionVigilanceTitle;

  /// No description provided for @attentionVigilanceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Vigilance Task'**
  String get attentionVigilanceSubtitle;

  /// No description provided for @attentionVigilancePatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"I am going to read some letters to you. Tap the table as soon as you hear the letter A.\"'**
  String get attentionVigilancePatientInstruction;

  /// No description provided for @attentionVigilanceExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Read the following letter sequence slowly and clearly: (at one per second)'**
  String get attentionVigilanceExaminerInstruction;

  /// No description provided for @attentionVigilanceResponseInstruction.
  ///
  /// In en, this message translates to:
  /// **'A mistake is an omission or inclusion.'**
  String get attentionVigilanceResponseInstruction;

  /// No description provided for @attentionVigilanceResponseNormal.
  ///
  /// In en, this message translates to:
  /// **'No mistakes.'**
  String get attentionVigilanceResponseNormal;

  /// No description provided for @attentionVigilanceResponseEquivocal.
  ///
  /// In en, this message translates to:
  /// **'1 mistake.'**
  String get attentionVigilanceResponseEquivocal;

  /// No description provided for @attentionVigilanceResponseImpaired.
  ///
  /// In en, this message translates to:
  /// **'> 1 mistake.'**
  String get attentionVigilanceResponseImpaired;

  /// No description provided for @attentionVigilanceLettersLabel.
  ///
  /// In en, this message translates to:
  /// **'Letters'**
  String get attentionVigilanceLettersLabel;

  /// No description provided for @attentionVigilanceCorrectLabel.
  ///
  /// In en, this message translates to:
  /// **'Correct:'**
  String get attentionVigilanceCorrectLabel;

  /// No description provided for @attentionVigilanceMistakesLabel.
  ///
  /// In en, this message translates to:
  /// **'Mistakes:'**
  String get attentionVigilanceMistakesLabel;

  /// No description provided for @attentionSpellWordTitle.
  ///
  /// In en, this message translates to:
  /// **'Spelling Words Backwards'**
  String get attentionSpellWordTitle;

  /// No description provided for @attentionSpellWordPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"I want you to spell the word \"WORLD\" forwards.\"  \"Good. Now spell it backwards.\"'**
  String get attentionSpellWordPatientInstruction;

  /// No description provided for @attentionSpellWordAlternativeInstruction.
  ///
  /// In en, this message translates to:
  /// **'Alternative words: April or March'**
  String get attentionSpellWordAlternativeInstruction;

  /// No description provided for @attentionSerialTitle.
  ///
  /// In en, this message translates to:
  /// **'Serial 7\'s And 3\'s'**
  String get attentionSerialTitle;

  /// No description provided for @attentionSerialSevenHeader.
  ///
  /// In en, this message translates to:
  /// **'Serial 7\'s'**
  String get attentionSerialSevenHeader;

  /// No description provided for @attentionSerialThreeHeader.
  ///
  /// In en, this message translates to:
  /// **'Serial 3\'s'**
  String get attentionSerialThreeHeader;

  /// No description provided for @attentionSerialSevenPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Subtract seven from one hundred.\"'**
  String get attentionSerialSevenPatientInstruction;

  /// No description provided for @attentionSerialSevenExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Wait for the response.'**
  String get attentionSerialSevenExaminerInstruction;

  /// No description provided for @attentionSerialSevenPatientInstruction2.
  ///
  /// In en, this message translates to:
  /// **'\"Continue to take 7 away from that number.\" (say this only if they stop)'**
  String get attentionSerialSevenPatientInstruction2;

  /// No description provided for @attentionSerialThreePatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Subtract three from twenty.\"'**
  String get attentionSerialThreePatientInstruction;

  /// No description provided for @attentionSerialThreeExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Wait for the response.'**
  String get attentionSerialThreeExaminerInstruction;

  /// No description provided for @attentionSerialThreePatientInstruction2.
  ///
  /// In en, this message translates to:
  /// **'\"Continue to take 3 away from that number.\" (say this only if they stop)'**
  String get attentionSerialThreePatientInstruction2;

  /// No description provided for @attentionDigitSpanTitle.
  ///
  /// In en, this message translates to:
  /// **'Digit Span'**
  String get attentionDigitSpanTitle;

  /// No description provided for @attentionDigitSpanPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"I am going to say some numbers, and when I stop, you repeat them.\"'**
  String get attentionDigitSpanPatientInstruction;

  /// No description provided for @attentionDigitSpanExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Say one digit per second. Tap the check box for each correct response.'**
  String get attentionDigitSpanExaminerInstruction;

  /// No description provided for @attentionDigitSpanNumbers1.
  ///
  /// In en, this message translates to:
  /// **'\"5 4 8 1\"'**
  String get attentionDigitSpanNumbers1;

  /// No description provided for @attentionDigitSpanNumbers1Sub.
  ///
  /// In en, this message translates to:
  /// **'if required: \"6 4 1 7\"'**
  String get attentionDigitSpanNumbers1Sub;

  /// No description provided for @attentionDigitSpanNumbers2.
  ///
  /// In en, this message translates to:
  /// **'\"5 3 9 5 3\"'**
  String get attentionDigitSpanNumbers2;

  /// No description provided for @attentionDigitSpanNumbers2Sub.
  ///
  /// In en, this message translates to:
  /// **'if required: \"9 6 3 8 4\"'**
  String get attentionDigitSpanNumbers2Sub;

  /// No description provided for @attentionDigitSpanNumbers3.
  ///
  /// In en, this message translates to:
  /// **'\"8 6 3 2 8 5\"'**
  String get attentionDigitSpanNumbers3;

  /// No description provided for @attentionDigitSpanNumbers3Sub.
  ///
  /// In en, this message translates to:
  /// **'if required: \"5 2 9 7 4 3\"'**
  String get attentionDigitSpanNumbers3Sub;

  /// No description provided for @attentionDigitSpanNumbers4.
  ///
  /// In en, this message translates to:
  /// **'\"2 8 5 4 8 4 2\"'**
  String get attentionDigitSpanNumbers4;

  /// No description provided for @attentionDigitSpanNumbers4Sub.
  ///
  /// In en, this message translates to:
  /// **'if required: \"3 7 4 2 8 4 1\"'**
  String get attentionDigitSpanNumbers4Sub;

  /// No description provided for @attentionObservationTitle.
  ///
  /// In en, this message translates to:
  /// **'Attention'**
  String get attentionObservationTitle;

  /// No description provided for @attentionObservationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Observation'**
  String get attentionObservationSubtitle;

  /// No description provided for @attentionObservationExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Note the language and behaviour of the patient and score as below.'**
  String get attentionObservationExaminerInstruction;

  /// No description provided for @attentionObservationResponseInstruction.
  ///
  /// In en, this message translates to:
  /// **'Rate the patient\'s spontaneous speech'**
  String get attentionObservationResponseInstruction;

  /// No description provided for @languageDomainTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageDomainTitle;

  /// No description provided for @languageSelectAssessmentInstruction.
  ///
  /// In en, this message translates to:
  /// **'SELECT A LANGUAGE ASSESSMENT BELOW'**
  String get languageSelectAssessmentInstruction;

  /// No description provided for @languageSpontaneousSpeechButton.
  ///
  /// In en, this message translates to:
  /// **'Spontaneous Speech'**
  String get languageSpontaneousSpeechButton;

  /// No description provided for @languageComprehensionThreeStageButton.
  ///
  /// In en, this message translates to:
  /// **'Comprehension: 3 Stage Command Task'**
  String get languageComprehensionThreeStageButton;

  /// No description provided for @languageComprehensionMovingObjectsButton.
  ///
  /// In en, this message translates to:
  /// **'Comprehension: Moving 3 Objects Task'**
  String get languageComprehensionMovingObjectsButton;

  /// No description provided for @languageRepetitionButton.
  ///
  /// In en, this message translates to:
  /// **'Repetition'**
  String get languageRepetitionButton;

  /// No description provided for @languageNamingButton.
  ///
  /// In en, this message translates to:
  /// **'Naming'**
  String get languageNamingButton;

  /// No description provided for @languageReadingButton.
  ///
  /// In en, this message translates to:
  /// **'Reading'**
  String get languageReadingButton;

  /// No description provided for @languageWritingButton.
  ///
  /// In en, this message translates to:
  /// **'Writing'**
  String get languageWritingButton;

  /// No description provided for @languagePictureNamingButton.
  ///
  /// In en, this message translates to:
  /// **'Picture Naming'**
  String get languagePictureNamingButton;

  /// No description provided for @languageObjectNamingButton.
  ///
  /// In en, this message translates to:
  /// **'Object Naming'**
  String get languageObjectNamingButton;

  /// No description provided for @languageSpontaneousSpeechTitle.
  ///
  /// In en, this message translates to:
  /// **'Spontaneous Speech'**
  String get languageSpontaneousSpeechTitle;

  /// No description provided for @languageSpontaneousSpeechExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Evaluate free speech by listening for impairments of fluency, articulation and the presence of paraphasias. Paraphasias are word substitutions and can be phonemic i.e. \"sitter\" for \"sister\" or semantic i.e. \"jug\" for \"glass.\"'**
  String get languageSpontaneousSpeechExaminerInstruction;

  /// No description provided for @languageComprehensionThreeStageTitle.
  ///
  /// In en, this message translates to:
  /// **'Comprehension'**
  String get languageComprehensionThreeStageTitle;

  /// No description provided for @languageComprehensionThreeStageExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Evaluate comprehension by using a 3-stage command. Intact basic comprehension ensures good compliance with any test procedures that follow.'**
  String get languageComprehensionThreeStageExaminerInstruction;

  /// No description provided for @languageComprehensionThreeStagePatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Can you point with your finger to the ceiling, the floor and the door.\"'**
  String get languageComprehensionThreeStagePatientInstruction;

  /// No description provided for @languageComprehensionThreeStageResponseNormal.
  ///
  /// In en, this message translates to:
  /// **'3 stages complete without an error'**
  String get languageComprehensionThreeStageResponseNormal;

  /// No description provided for @languageComprehensionThreeStageResponseEquivocal.
  ///
  /// In en, this message translates to:
  /// **'Some difficulty'**
  String get languageComprehensionThreeStageResponseEquivocal;

  /// No description provided for @languageComprehensionThreeStageResponseImpaired.
  ///
  /// In en, this message translates to:
  /// **'1 or more clear errors'**
  String get languageComprehensionThreeStageResponseImpaired;

  /// No description provided for @languageComprehensionMovingObjectsTitle.
  ///
  /// In en, this message translates to:
  /// **'Comprehension: Moving 3 Objects Task'**
  String get languageComprehensionMovingObjectsTitle;

  /// No description provided for @languageComprehensionMovingObjectsExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Place 3 objects in front of the patient and name them while they are being placed to exclude naming ability and object agnosia as confounding factors. Common objects such as a coin, keys and a piece of paper can be used. Begin with simple commands and then move to more complex instructions.'**
  String get languageComprehensionMovingObjectsExaminerInstruction;

  /// No description provided for @languageComprehensionMovingObjectsPatientInstruction1.
  ///
  /// In en, this message translates to:
  /// **'\"Turn the coin over\"'**
  String get languageComprehensionMovingObjectsPatientInstruction1;

  /// No description provided for @languageComprehensionMovingObjectsPatientInstruction2.
  ///
  /// In en, this message translates to:
  /// **'\"Place the keys on the other side of the paper\"'**
  String get languageComprehensionMovingObjectsPatientInstruction2;

  /// No description provided for @languageComprehensionMovingObjectsPatientInstruction3.
  ///
  /// In en, this message translates to:
  /// **'\"Place the coin between the keys and the paper, and then turn over the paper.\"'**
  String get languageComprehensionMovingObjectsPatientInstruction3;

  /// No description provided for @languageRepetitionTitle.
  ///
  /// In en, this message translates to:
  /// **'Repetition'**
  String get languageRepetitionTitle;

  /// No description provided for @languageRepetitionExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Ask the patient to repeat the following.'**
  String get languageRepetitionExaminerInstruction;

  /// No description provided for @languageRepetitionPatientInstruction1.
  ///
  /// In en, this message translates to:
  /// **'\"No ifs ands or buts.\"'**
  String get languageRepetitionPatientInstruction1;

  /// No description provided for @languageRepetitionPatientInstruction2.
  ///
  /// In en, this message translates to:
  /// **'\"The little boy went to the shopping mall to spend his money.\"'**
  String get languageRepetitionPatientInstruction2;

  /// No description provided for @languageNamingTitle.
  ///
  /// In en, this message translates to:
  /// **'Naming'**
  String get languageNamingTitle;

  /// No description provided for @languageObjectNamingTitle.
  ///
  /// In en, this message translates to:
  /// **'Naming'**
  String get languageObjectNamingTitle;

  /// No description provided for @languageObjectNamingExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Point towards the following objects and ask the patient to name it. Inability to name objects (nominal dysphasia) must be distinguished from visual object agnosia.'**
  String get languageObjectNamingExaminerInstruction;

  /// No description provided for @languageObjectNamingPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Can you tell me what this is?\"'**
  String get languageObjectNamingPatientInstruction;

  /// No description provided for @languageObjectNamingCommonObjects.
  ///
  /// In en, this message translates to:
  /// **'Point to a watch, pen, tissue, button, shoe, and shirt.'**
  String get languageObjectNamingCommonObjects;

  /// No description provided for @languageObjectNamingUncommonObjects.
  ///
  /// In en, this message translates to:
  /// **'Less common objects are: knuckles, ring finger, eyebrow, winder of a watch, and collar.'**
  String get languageObjectNamingUncommonObjects;

  /// No description provided for @languageObjectNamingDistinguishInstruction.
  ///
  /// In en, this message translates to:
  /// **'To distinguish between nominal aphasia and visual object agnosia, ask the patient to describe the object or its use. If this can be done adequately then visual perception might be normal and the deficit is more likely language based. Language deficits can be further examined by providing the patient with language cues by saying either a part of the word or giving a phonetic clue. For example, say \"col...\" for collar or say it sounds like \"dollar\" Some patients may then be able to progress and say the word, the deficit is then more likely to be nominal aphasia.'**
  String get languageObjectNamingDistinguishInstruction;

  /// No description provided for @languagePictureNamingTitle.
  ///
  /// In en, this message translates to:
  /// **'Picture Naming'**
  String get languagePictureNamingTitle;

  /// No description provided for @languagePictureNamingPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Name the following pictures.\"'**
  String get languagePictureNamingPatientInstruction;

  /// No description provided for @languagePictureNamingExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Compare the ability to name pictures with naming of real objects.'**
  String get languagePictureNamingExaminerInstruction;

  /// No description provided for @languagePictureNamingAnomiaResponse.
  ///
  /// In en, this message translates to:
  /// **'Anomia: Cannot name picture.'**
  String get languagePictureNamingAnomiaResponse;

  /// No description provided for @languagePictureNamingAgnosiaResponse.
  ///
  /// In en, this message translates to:
  /// **'Agnosia: Cannot describe object.'**
  String get languagePictureNamingAgnosiaResponse;

  /// No description provided for @languagePictureNamingResponseNormal.
  ///
  /// In en, this message translates to:
  /// **'All correct'**
  String get languagePictureNamingResponseNormal;

  /// No description provided for @languagePictureNamingResponseEquivocal.
  ///
  /// In en, this message translates to:
  /// **'1 mistake'**
  String get languagePictureNamingResponseEquivocal;

  /// No description provided for @languagePictureNamingResponseImpaired.
  ///
  /// In en, this message translates to:
  /// **'> 1 mistake'**
  String get languagePictureNamingResponseImpaired;

  /// No description provided for @languageReadingTitle.
  ///
  /// In en, this message translates to:
  /// **'Reading'**
  String get languageReadingTitle;

  /// No description provided for @languageReadingExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Can you read this sentence and do what it says so that I can be sure you understood it?'**
  String get languageReadingExaminerInstruction;

  /// No description provided for @languageReadingPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'CLOSE YOUR EYES'**
  String get languageReadingPatientInstruction;

  /// No description provided for @languageWritingTitle.
  ///
  /// In en, this message translates to:
  /// **'Writing'**
  String get languageWritingTitle;

  /// No description provided for @languageWritingExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Can you write a sentence for me here?\"'**
  String get languageWritingExaminerInstruction;

  /// No description provided for @languageWritingPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'Provide the patient with a piece of paper and a pen.'**
  String get languageWritingPatientInstruction;

  /// No description provided for @memoryDomainTitle.
  ///
  /// In en, this message translates to:
  /// **'Memory'**
  String get memoryDomainTitle;

  /// No description provided for @memoryShortVerbalMemoryButton.
  ///
  /// In en, this message translates to:
  /// **'Short Verbal Memory Test'**
  String get memoryShortVerbalMemoryButton;

  /// No description provided for @memoryTenWordVerbalRecallButton.
  ///
  /// In en, this message translates to:
  /// **'10-Word Verbal Recall'**
  String get memoryTenWordVerbalRecallButton;

  /// No description provided for @memoryVisualWorkingMemoryButton.
  ///
  /// In en, this message translates to:
  /// **'Visual Working Memory'**
  String get memoryVisualWorkingMemoryButton;

  /// No description provided for @memoryVisualShortTermMemoryButton.
  ///
  /// In en, this message translates to:
  /// **'Visual Short-Term Memory'**
  String get memoryVisualShortTermMemoryButton;

  /// No description provided for @memorySemanticMemoryButton.
  ///
  /// In en, this message translates to:
  /// **'Semantic memory'**
  String get memorySemanticMemoryButton;

  /// No description provided for @memoryShortVerbalTitle.
  ///
  /// In en, this message translates to:
  /// **'Short Verbal Memory Test'**
  String get memoryShortVerbalTitle;

  /// No description provided for @memoryShortVerbalPatientInstruction1.
  ///
  /// In en, this message translates to:
  /// **'\"I would like you to remember a name and address. Listen carefully as I will say it only once. Are you ready?\"'**
  String get memoryShortVerbalPatientInstruction1;

  /// No description provided for @memoryShortVerbalPatientInstruction2.
  ///
  /// In en, this message translates to:
  /// **'\"Peter Black, 25 Market Close, Northam, Wheatbelt. Can you repeat that?\"'**
  String get memoryShortVerbalPatientInstruction2;

  /// No description provided for @memoryShortVerbalPatientReminder.
  ///
  /// In en, this message translates to:
  /// **'\"Remember the name and address as I will ask for it later.\"'**
  String get memoryShortVerbalPatientReminder;

  /// No description provided for @memoryShortVerbalDelayedInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Tell me the name and address that you learned earlier.\"'**
  String get memoryShortVerbalDelayedInstruction;

  /// No description provided for @memoryShortVerbalCuedInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Did I ask you to remember...?\"'**
  String get memoryShortVerbalCuedInstruction;

  /// No description provided for @memoryShortVerbalTapWordsInstruction.
  ///
  /// In en, this message translates to:
  /// **'Tap on words correctly recalled.'**
  String get memoryShortVerbalTapWordsInstruction;

  /// No description provided for @memoryShortVerbalRepeatInstruction.
  ///
  /// In en, this message translates to:
  /// **'If the patient is able to recall without error then continue. If unable, then the name and address can be repeated up to 3 times asking for recall each time. This is not scored.'**
  String get memoryShortVerbalRepeatInstruction;

  /// No description provided for @memoryShortVerbalDistractionInstruction.
  ///
  /// In en, this message translates to:
  /// **'Allow about 5 minutes to pass by using distraction'**
  String get memoryShortVerbalDistractionInstruction;

  /// No description provided for @memoryShortVerbalCuedExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Test for cued recall by giving alternatives as indicated below.'**
  String get memoryShortVerbalCuedExaminerInstruction;

  /// No description provided for @memoryShortVerbalCuedTapInstruction.
  ///
  /// In en, this message translates to:
  /// **'Read 2 alternatives and target word.\nTap on words correctly recalled.'**
  String get memoryShortVerbalCuedTapInstruction;

  /// No description provided for @memoryShortVerbalRecognitionMemoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Name and Address: Recognition Memory'**
  String get memoryShortVerbalRecognitionMemoryTitle;

  /// No description provided for @memoryShortVerbalContinueDelayed.
  ///
  /// In en, this message translates to:
  /// **'Continue to Delayed Recall'**
  String get memoryShortVerbalContinueDelayed;

  /// No description provided for @memoryShortVerbalContinueCued.
  ///
  /// In en, this message translates to:
  /// **'Continue to Cued Recall'**
  String get memoryShortVerbalContinueCued;

  /// No description provided for @memoryShortVerbalNoErrors.
  ///
  /// In en, this message translates to:
  /// **'No errors'**
  String get memoryShortVerbalNoErrors;

  /// No description provided for @memoryShortVerbalOneError.
  ///
  /// In en, this message translates to:
  /// **'1 error'**
  String get memoryShortVerbalOneError;

  /// No description provided for @memoryShortVerbalMoreThanOneError.
  ///
  /// In en, this message translates to:
  /// **'> 1 error'**
  String get memoryShortVerbalMoreThanOneError;

  /// No description provided for @memoryTenWordWorkingMemoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Working Memory'**
  String get memoryTenWordWorkingMemoryTitle;

  /// No description provided for @memoryTenWordIntermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Word Intermission'**
  String get memoryTenWordIntermissionTitle;

  /// No description provided for @memoryTenWordShortTermTitle.
  ///
  /// In en, this message translates to:
  /// **'Short-Term Memory'**
  String get memoryTenWordShortTermTitle;

  /// No description provided for @memoryTenWordMemoryTestTitle.
  ///
  /// In en, this message translates to:
  /// **'Memory Test'**
  String get memoryTenWordMemoryTestTitle;

  /// No description provided for @memoryTenWordResultsTitle.
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get memoryTenWordResultsTitle;

  /// No description provided for @memoryTenWordVerbalTrial1.
  ///
  /// In en, this message translates to:
  /// **'Verbal Trial 1'**
  String get memoryTenWordVerbalTrial1;

  /// No description provided for @memoryTenWordVerbalTrial2.
  ///
  /// In en, this message translates to:
  /// **'Verbal Trial 2'**
  String get memoryTenWordVerbalTrial2;

  /// No description provided for @memoryTenWordVerbalTrial3.
  ///
  /// In en, this message translates to:
  /// **'Verbal Trial 3'**
  String get memoryTenWordVerbalTrial3;

  /// No description provided for @memoryTenWordDelayedRecall.
  ///
  /// In en, this message translates to:
  /// **'Verbal Delayed Recall'**
  String get memoryTenWordDelayedRecall;

  /// No description provided for @memoryTenWordRecognition.
  ///
  /// In en, this message translates to:
  /// **'Verbal Recognition'**
  String get memoryTenWordRecognition;

  /// No description provided for @memoryTenWordScrollInstruction.
  ///
  /// In en, this message translates to:
  /// **'Scroll down to reveal more instructions'**
  String get memoryTenWordScrollInstruction;

  /// No description provided for @memoryTenWordTrial1PatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"I am going to read you a list of 10 words. Remember these words, as I will ask you what you can remember afterwards. Please repeat each word after I have said it, so that I can be sure that you have heard it correctly. Do you understand? Are you ready? Let\'s go!\"'**
  String get memoryTenWordTrial1PatientInstruction;

  /// No description provided for @memoryTenWordRepeatWordInstruction.
  ///
  /// In en, this message translates to:
  /// **'If the patient does not repeat the word say: \"Please repeat the word.\" Read the words from left to right. Carry on with the rest of the list.'**
  String get memoryTenWordRepeatWordInstruction;

  /// No description provided for @memoryTenWordWhatWereThoseWords.
  ///
  /// In en, this message translates to:
  /// **'\"What were those words?\"'**
  String get memoryTenWordWhatWereThoseWords;

  /// No description provided for @memoryTenWordReadWordsInstruction.
  ///
  /// In en, this message translates to:
  /// **'Read the words aloud again from left to right, asking for repetition after every word.'**
  String get memoryTenWordReadWordsInstruction;

  /// No description provided for @memoryTenWordTapRecalledInstruction.
  ///
  /// In en, this message translates to:
  /// **'Tap on each word correctly recalled.'**
  String get memoryTenWordTapRecalledInstruction;

  /// No description provided for @memoryTenWordRememberLaterInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Now try to remember the words because I will ask you again later.\"'**
  String get memoryTenWordRememberLaterInstruction;

  /// No description provided for @memoryTenWordIntermissionInstruction.
  ///
  /// In en, this message translates to:
  /// **'Allow about 5 minutes to pass by using distraction tasks such as Months Backwards, Design Fluency and/or Luria Alternating Hand Movements.'**
  String get memoryTenWordIntermissionInstruction;

  /// No description provided for @memoryTenWordDelayedRecallInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Tell me the words you learned during this memory test.\"'**
  String get memoryTenWordDelayedRecallInstruction;

  /// No description provided for @memoryTenWordRecognitionPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"I am now going to read a list of words. Some of the words are from the list that I asked you to remember and some of the words are new. Say yes if you recognise the word and no if it was not in the list I asked you to memorise. If you don\'t know the answer just guess.\"'**
  String get memoryTenWordRecognitionPatientInstruction;

  /// No description provided for @memoryTenWordRecognitionExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'The instructions may be repeated if forgotten. To select correct responses, tap on Yes or No for each word. (Words from the original memory list are in BOLD.)'**
  String get memoryTenWordRecognitionExaminerInstruction;

  /// No description provided for @memoryTenWordScoreSummary.
  ///
  /// In en, this message translates to:
  /// **'Score Summary'**
  String get memoryTenWordScoreSummary;

  /// No description provided for @memoryTenWordWorkingMemoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Working Memory:'**
  String get memoryTenWordWorkingMemoryLabel;

  /// No description provided for @memoryTenWordShortTermMemoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Short-Term Memory:'**
  String get memoryTenWordShortTermMemoryLabel;

  /// No description provided for @memoryVisualWorkingTitle.
  ///
  /// In en, this message translates to:
  /// **'Visual Working Memory'**
  String get memoryVisualWorkingTitle;

  /// No description provided for @memoryVisualWorkingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Visual - Copy'**
  String get memoryVisualWorkingSubtitle;

  /// No description provided for @memoryVisualWorkingPrepareInstruction.
  ///
  /// In en, this message translates to:
  /// **'Prepare by having available 3 sheets of blank paper. The patient draws each figure on a separate sheet. Tap on the picture below to enlarge.'**
  String get memoryVisualWorkingPrepareInstruction;

  /// No description provided for @memoryVisualWorkingPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"I will show you a sketch for 10 seconds. Try to memorise it during this time. I will then remove it and we will wait 10 seconds. Then draw what you can remember. Ready?\"'**
  String get memoryVisualWorkingPatientInstruction;

  /// No description provided for @memoryVisualWorkingVisuospatialTitle.
  ///
  /// In en, this message translates to:
  /// **'Visuospatial Working Memory'**
  String get memoryVisualWorkingVisuospatialTitle;

  /// No description provided for @memoryVisualWorkingTapToEnlarge.
  ///
  /// In en, this message translates to:
  /// **'Tap image to enlarge'**
  String get memoryVisualWorkingTapToEnlarge;

  /// No description provided for @memoryVisualWorkingCloseHint.
  ///
  /// In en, this message translates to:
  /// **'Tap anywhere or press X to close'**
  String get memoryVisualWorkingCloseHint;

  /// No description provided for @memoryVisualShortTermTitle.
  ///
  /// In en, this message translates to:
  /// **'Visual Short-Term Memory'**
  String get memoryVisualShortTermTitle;

  /// No description provided for @memoryVisualShortTermSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Visual - 3 Shapes'**
  String get memoryVisualShortTermSubtitle;

  /// No description provided for @memoryVisualShortTermDelayInstruction.
  ///
  /// In en, this message translates to:
  /// **'Allow 5 minutes or more to pass before testing recall of the line drawings shown in Visual Working Memory.'**
  String get memoryVisualShortTermDelayInstruction;

  /// No description provided for @memoryVisualShortTermPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Earlier I showed you some drawings to test your memory. Can you still remember them? Please draw what you can remember here.\"'**
  String get memoryVisualShortTermPatientInstruction;

  /// No description provided for @memoryVisualShortTermProvideBlankPaper.
  ///
  /// In en, this message translates to:
  /// **'Provide the patient with a blank sheet of paper.'**
  String get memoryVisualShortTermProvideBlankPaper;

  /// No description provided for @memoryVisualMemoryImageHeader.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get memoryVisualMemoryImageHeader;

  /// No description provided for @memoryVisualMemoryNoMistakes.
  ///
  /// In en, this message translates to:
  /// **'No Mistakes'**
  String get memoryVisualMemoryNoMistakes;

  /// No description provided for @memoryVisualMemoryFewOmissions.
  ///
  /// In en, this message translates to:
  /// **'Few Omissions'**
  String get memoryVisualMemoryFewOmissions;

  /// No description provided for @memoryVisualMemoryPoor.
  ///
  /// In en, this message translates to:
  /// **'Poor'**
  String get memoryVisualMemoryPoor;

  /// No description provided for @memoryVisualMemoryNoDrawing.
  ///
  /// In en, this message translates to:
  /// **'No Drawing'**
  String get memoryVisualMemoryNoDrawing;

  /// No description provided for @memoryVisualMemoryImage1.
  ///
  /// In en, this message translates to:
  /// **'Image 1'**
  String get memoryVisualMemoryImage1;

  /// No description provided for @memoryVisualMemoryImage2.
  ///
  /// In en, this message translates to:
  /// **'Image 2'**
  String get memoryVisualMemoryImage2;

  /// No description provided for @memoryVisualMemoryImage3.
  ///
  /// In en, this message translates to:
  /// **'Image 3'**
  String get memoryVisualMemoryImage3;

  /// No description provided for @memorySemanticTitle.
  ///
  /// In en, this message translates to:
  /// **'Semantic memory'**
  String get memorySemanticTitle;

  /// No description provided for @memorySemanticTapInstruction.
  ///
  /// In en, this message translates to:
  /// **'Tap on the button to log answer'**
  String get memorySemanticTapInstruction;

  /// No description provided for @memorySemanticScoringNote.
  ///
  /// In en, this message translates to:
  /// **'Most people will be able to give a correct answer for 3 or more of the questions.'**
  String get memorySemanticScoringNote;

  /// No description provided for @praxisDomainTitle.
  ///
  /// In en, this message translates to:
  /// **'Praxis'**
  String get praxisDomainTitle;

  /// No description provided for @praxisLimbKineticButton.
  ///
  /// In en, this message translates to:
  /// **'Limb-kinetic Apraxia'**
  String get praxisLimbKineticButton;

  /// No description provided for @praxisIdeomotorButton.
  ///
  /// In en, this message translates to:
  /// **'Ideomotor Apraxia'**
  String get praxisIdeomotorButton;

  /// No description provided for @praxisIdeationalButton.
  ///
  /// In en, this message translates to:
  /// **'Ideational Apraxia'**
  String get praxisIdeationalButton;

  /// No description provided for @praxisOralButton.
  ///
  /// In en, this message translates to:
  /// **'Oral Apraxia'**
  String get praxisOralButton;

  /// No description provided for @praxisDressingButton.
  ///
  /// In en, this message translates to:
  /// **'Dressing Apraxia'**
  String get praxisDressingButton;

  /// No description provided for @praxisLineDrawingButton.
  ///
  /// In en, this message translates to:
  /// **'Line Drawing'**
  String get praxisLineDrawingButton;

  /// No description provided for @praxisLimbKineticTitle.
  ///
  /// In en, this message translates to:
  /// **'Limb-kinetic Apraxia'**
  String get praxisLimbKineticTitle;

  /// No description provided for @praxisLimbKineticPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Take this pen and rotate it with your fingers as fast as you can.\"'**
  String get praxisLimbKineticPatientInstruction;

  /// No description provided for @praxisLimbKineticExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Test both hands.'**
  String get praxisLimbKineticExaminerInstruction;

  /// No description provided for @praxisIdeomotorTitle.
  ///
  /// In en, this message translates to:
  /// **'Ideomotor Apraxia'**
  String get praxisIdeomotorTitle;

  /// No description provided for @praxisIdeomotorExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'This is a failure to correctly position and move a limb in space. It can be assessed by asking the patient to mime tasks.'**
  String get praxisIdeomotorExaminerInstruction;

  /// No description provided for @praxisIdeomotorPatientInstruction1.
  ///
  /// In en, this message translates to:
  /// **'\"Show with your right hand how you would pour a cup of tea, add sugar and stir it.\"'**
  String get praxisIdeomotorPatientInstruction1;

  /// No description provided for @praxisIdeomotorPatientInstruction2.
  ///
  /// In en, this message translates to:
  /// **'\"Now do the same with your left hand.\"'**
  String get praxisIdeomotorPatientInstruction2;

  /// No description provided for @praxisIdeationalTitle.
  ///
  /// In en, this message translates to:
  /// **'Ideational Apraxia'**
  String get praxisIdeationalTitle;

  /// No description provided for @praxisIdeationalExaminerInstruction1.
  ///
  /// In en, this message translates to:
  /// **'This is the ability to correctly sequence a series of well-learned motor acts that lead to a goal. The patient is given an A4 sheet of paper, an envelope and a pencil.'**
  String get praxisIdeationalExaminerInstruction1;

  /// No description provided for @praxisIdeationalPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Pretend that you have written a letter and would like to post it. Fold the sheet of paper so that it fits into the envelope, then seal the envelope and address it to yourself and then indicate where you will put a stamp.\"'**
  String get praxisIdeationalPatientInstruction;

  /// No description provided for @praxisIdeationalExaminerInstruction2.
  ///
  /// In en, this message translates to:
  /// **'The instructions can be repeated, as this is not a test of memory. Most individuals are able to do this task without any difficulty.'**
  String get praxisIdeationalExaminerInstruction2;

  /// No description provided for @praxisOralTitle.
  ///
  /// In en, this message translates to:
  /// **'Oral Apraxia'**
  String get praxisOralTitle;

  /// No description provided for @praxisOralExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Oral apraxia is an inability to perform orobuccal movements.'**
  String get praxisOralExaminerInstruction;

  /// No description provided for @praxisOralPatientInstruction1.
  ///
  /// In en, this message translates to:
  /// **'\"Show me how you would blow out a match.\"'**
  String get praxisOralPatientInstruction1;

  /// No description provided for @praxisOralPatientInstruction2.
  ///
  /// In en, this message translates to:
  /// **'\"Lick crumbs from your lips?\"'**
  String get praxisOralPatientInstruction2;

  /// No description provided for @praxisOralPatientInstruction3.
  ///
  /// In en, this message translates to:
  /// **'\"Blow a kiss?\"'**
  String get praxisOralPatientInstruction3;

  /// No description provided for @praxisDressingTitle.
  ///
  /// In en, this message translates to:
  /// **'Dressing Apraxia'**
  String get praxisDressingTitle;

  /// No description provided for @praxisDressingExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'This task involves limb-kinetic, ideomotor, and to some extent ideational praxis. It is assessed by asking the patient to put on a hospital gown or other suitable piece of clothing such as a cardigan. Observe if the patient is able to put their hands and arms through the sleeves correctly and is able to fasten the buttons.'**
  String get praxisDressingExaminerInstruction;

  /// No description provided for @praxisLineDrawingTitle.
  ///
  /// In en, this message translates to:
  /// **'Line Drawing'**
  String get praxisLineDrawingTitle;

  /// No description provided for @praxisLineDrawingExaminerInstruction1.
  ///
  /// In en, this message translates to:
  /// **'Line drawings are presented, and the patient is asked to copy them. The ability to successfully copy a line drawing depends on correct recognition of the drawing with visual processing. This input function is part of gnosis. Drawing with the dominant hand is an output function and part of praxis as it involves motor planning.'**
  String get praxisLineDrawingExaminerInstruction1;

  /// No description provided for @praxisLineDrawingExaminerInstruction2.
  ///
  /// In en, this message translates to:
  /// **'The patient can be asked if their drawing resembles the stimulus drawing. If the patient says the drawing differs from the stimulus, but they do not know how to draw it correctly then it may indicate visual perception is intact but not higher order motor control.'**
  String get praxisLineDrawingExaminerInstruction2;

  /// No description provided for @praxisLineDrawingPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Copy these drawings.\"'**
  String get praxisLineDrawingPatientInstruction;

  /// No description provided for @praxisLineDrawingScoringHeader.
  ///
  /// In en, this message translates to:
  /// **'Cannot name picture'**
  String get praxisLineDrawingScoringHeader;

  /// No description provided for @praxisNoErrors.
  ///
  /// In en, this message translates to:
  /// **'No errors'**
  String get praxisNoErrors;

  /// No description provided for @praxisSomeDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Some difficulty'**
  String get praxisSomeDifficulty;

  /// No description provided for @praxisClearDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Clear difficulty'**
  String get praxisClearDifficulty;

  /// No description provided for @praxisRight.
  ///
  /// In en, this message translates to:
  /// **'Right'**
  String get praxisRight;

  /// No description provided for @praxisLeft.
  ///
  /// In en, this message translates to:
  /// **'Left'**
  String get praxisLeft;

  /// No description provided for @praxisImageHeader.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get praxisImageHeader;

  /// No description provided for @praxisNoMistakes.
  ///
  /// In en, this message translates to:
  /// **'No Mistakes'**
  String get praxisNoMistakes;

  /// No description provided for @praxisFewOmissions.
  ///
  /// In en, this message translates to:
  /// **'Few Omissions'**
  String get praxisFewOmissions;

  /// No description provided for @praxisPoor.
  ///
  /// In en, this message translates to:
  /// **'Poor'**
  String get praxisPoor;

  /// No description provided for @praxisNoDrawing.
  ///
  /// In en, this message translates to:
  /// **'No Drawing'**
  String get praxisNoDrawing;

  /// No description provided for @praxisImage1.
  ///
  /// In en, this message translates to:
  /// **'Image 1'**
  String get praxisImage1;

  /// No description provided for @praxisImage2.
  ///
  /// In en, this message translates to:
  /// **'Image 2'**
  String get praxisImage2;

  /// No description provided for @praxisImage3.
  ///
  /// In en, this message translates to:
  /// **'Image 3'**
  String get praxisImage3;

  /// No description provided for @gnosisDomainTitle.
  ///
  /// In en, this message translates to:
  /// **'Gnosis'**
  String get gnosisDomainTitle;

  /// No description provided for @gnosisIdentifyObjectsVisually.
  ///
  /// In en, this message translates to:
  /// **'Identify Objects Visually'**
  String get gnosisIdentifyObjectsVisually;

  /// No description provided for @gnosisIdentifyObjectsByTouch.
  ///
  /// In en, this message translates to:
  /// **'Identify Objects by Touch'**
  String get gnosisIdentifyObjectsByTouch;

  /// No description provided for @gnosisFingerPerceptionTest.
  ///
  /// In en, this message translates to:
  /// **'Finger Perception Test'**
  String get gnosisFingerPerceptionTest;

  /// No description provided for @gnosisClockDrawingTest.
  ///
  /// In en, this message translates to:
  /// **'Clock Drawing Test'**
  String get gnosisClockDrawingTest;

  /// No description provided for @gnosisClockDrawingExplanation.
  ///
  /// In en, this message translates to:
  /// **'Drawing a clock requires a number of cognitive domains to work together. Guiding the hand involves praxis. Planning the task is executive functioning. Monitoring the result visually is gnosis.'**
  String get gnosisClockDrawingExplanation;

  /// No description provided for @gnosisClockDrawingPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Draw a clock face with the time set to 10 past five. It must have all the numbers and hands so that a child can read the time\"'**
  String get gnosisClockDrawingPatientInstruction;

  /// No description provided for @gnosisClockDrawingScoringIntro.
  ///
  /// In en, this message translates to:
  /// **'The instructions may be repeated once if required. A total of five points are awarded.\nMost people would be able to score full marks.'**
  String get gnosisClockDrawingScoringIntro;

  /// No description provided for @gnosisClockDrawingScoreCriteria1.
  ///
  /// In en, this message translates to:
  /// **'- Score one point if the outer circle is present.'**
  String get gnosisClockDrawingScoreCriteria1;

  /// No description provided for @gnosisClockDrawingScoreCriteria2.
  ///
  /// In en, this message translates to:
  /// **'- Score one point if all the numbers are present, in the correct order and in the appropriate quadrant. No other numbers or letters are allowed.'**
  String get gnosisClockDrawingScoreCriteria2;

  /// No description provided for @gnosisClockDrawingScoreCriteria3.
  ///
  /// In en, this message translates to:
  /// **'- Score one point if all the hands are present. The minute hand must be longer than the hour hand.'**
  String get gnosisClockDrawingScoreCriteria3;

  /// No description provided for @gnosisClockDrawingScoreCriteria4.
  ///
  /// In en, this message translates to:
  /// **'- Score one point if the time is correctly indicated.'**
  String get gnosisClockDrawingScoreCriteria4;

  /// No description provided for @gnosisClockDrawingScoreCriteria5.
  ///
  /// In en, this message translates to:
  /// **'- Score one point for good overall planning (starts with a circle and plans the writing of the numbers in appropriate quadrants).'**
  String get gnosisClockDrawingScoreCriteria5;

  /// No description provided for @gnosisVisualIdentificationExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Point towards the following objects and ask the patient to name it. Inability to name objects (nominal dysphasia) must be distinguished from visual object agnosia.'**
  String get gnosisVisualIdentificationExaminerInstruction;

  /// No description provided for @gnosisVisualIdentificationPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Can you tell me what this is?\"'**
  String get gnosisVisualIdentificationPatientInstruction;

  /// No description provided for @gnosisVisualIdentificationCommonObjects.
  ///
  /// In en, this message translates to:
  /// **'Point to a watch, pen, tissue, button, shoe, and shirt.'**
  String get gnosisVisualIdentificationCommonObjects;

  /// No description provided for @gnosisVisualIdentificationUncommonObjects.
  ///
  /// In en, this message translates to:
  /// **'Less common objects are: knuckles, ring finger, eyebrow, winder of a watch, and collar.'**
  String get gnosisVisualIdentificationUncommonObjects;

  /// No description provided for @gnosisVisualIdentificationDistinguishing.
  ///
  /// In en, this message translates to:
  /// **'To distinguish between nominal aphasia and visual object agnosia, ask the patient to describe the object or its use. If this can be done adequately then visual perception might be normal and the deficit is more likely language based. Language deficits can be further examined by providing the patient with language cues by saying either a part of the word or giving a phonetic clue. For example, say \"col...\" for collar or say it sounds like \"dollar\" Some patients may then be able to progress and say the word, the deficit is then more likely to be nominal aphasia.'**
  String get gnosisVisualIdentificationDistinguishing;

  /// No description provided for @gnosisTouchIdentificationPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Please hold out your right hand. I am going to ask you to close your eyes and then I will place an object in your hand. Identify this by touch only.\"'**
  String get gnosisTouchIdentificationPatientInstruction;

  /// No description provided for @gnosisTouchIdentificationExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Place common objects such as keys, coin or pen in the patient\'s right hand. Repeat the same with the left hand. An inability to identify objects by touch is known as astereognosis.'**
  String get gnosisTouchIdentificationExaminerInstruction;

  /// No description provided for @gnosisTouchIdentificationRightHand.
  ///
  /// In en, this message translates to:
  /// **'Right'**
  String get gnosisTouchIdentificationRightHand;

  /// No description provided for @gnosisTouchIdentificationLeftHand.
  ///
  /// In en, this message translates to:
  /// **'Left'**
  String get gnosisTouchIdentificationLeftHand;

  /// No description provided for @gnosisTouchIdentificationNoErrors.
  ///
  /// In en, this message translates to:
  /// **'No errors'**
  String get gnosisTouchIdentificationNoErrors;

  /// No description provided for @gnosisTouchIdentificationSomeDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Some difficulty'**
  String get gnosisTouchIdentificationSomeDifficulty;

  /// No description provided for @gnosisTouchIdentificationClearDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Clear difficulty'**
  String get gnosisTouchIdentificationClearDifficulty;

  /// No description provided for @gnosisFingerPerceptionPatientInstruction1.
  ///
  /// In en, this message translates to:
  /// **'\"Place your hands on the table in front of you. I am now going to touch two of your fingers and you must say how many of your other fingers are in between my fingers.\"'**
  String get gnosisFingerPerceptionPatientInstruction1;

  /// No description provided for @gnosisFingerPerceptionExaminerInstruction1.
  ///
  /// In en, this message translates to:
  /// **'Touch the fingers indicated in the picture below, on the black markings. The patient should answer \"one.\"'**
  String get gnosisFingerPerceptionExaminerInstruction1;

  /// No description provided for @gnosisFingerPerceptionPatientInstruction2.
  ///
  /// In en, this message translates to:
  /// **'\"Now close your eyes while I continue this test. How many of your fingers are in between the fingers that I touch?\"'**
  String get gnosisFingerPerceptionPatientInstruction2;

  /// No description provided for @gnosisFingerPerceptionExaminerInstruction2.
  ///
  /// In en, this message translates to:
  /// **'Continue to touch the patient\'s fingers as indicated below and rate the response.'**
  String get gnosisFingerPerceptionExaminerInstruction2;

  /// No description provided for @gnosisFingerPerceptionSummaryNote.
  ///
  /// In en, this message translates to:
  /// **'Most people should be able to complete this test without any mistakes.'**
  String get gnosisFingerPerceptionSummaryNote;

  /// No description provided for @gnosisFingerPerceptionSummaryScore.
  ///
  /// In en, this message translates to:
  /// **'Summary Score:'**
  String get gnosisFingerPerceptionSummaryScore;

  /// No description provided for @gnosisFingerPerceptionHandDiagram.
  ///
  /// In en, this message translates to:
  /// **'Hand Diagram'**
  String get gnosisFingerPerceptionHandDiagram;

  /// No description provided for @executiveDomainTitle.
  ///
  /// In en, this message translates to:
  /// **'Executive Functions'**
  String get executiveDomainTitle;

  /// No description provided for @executiveLuriaAlternatingButton.
  ///
  /// In en, this message translates to:
  /// **'Luria Alternating Hand Movements'**
  String get executiveLuriaAlternatingButton;

  /// No description provided for @executiveLuriaFistEdgePalmButton.
  ///
  /// In en, this message translates to:
  /// **'Luria Fist-Edge-Palm Movement'**
  String get executiveLuriaFistEdgePalmButton;

  /// No description provided for @executiveAnimalNamingButton.
  ///
  /// In en, this message translates to:
  /// **'Animal Naming Task'**
  String get executiveAnimalNamingButton;

  /// No description provided for @executiveLexicalFluencyButton.
  ///
  /// In en, this message translates to:
  /// **'Lexical Fluency Test'**
  String get executiveLexicalFluencyButton;

  /// No description provided for @executiveDesignFluencyButton.
  ///
  /// In en, this message translates to:
  /// **'Design Fluency Task'**
  String get executiveDesignFluencyButton;

  /// No description provided for @executiveFingerNoseButton.
  ///
  /// In en, this message translates to:
  /// **'Finger-Nose Task'**
  String get executiveFingerNoseButton;

  /// No description provided for @executiveTapTaskButton.
  ///
  /// In en, this message translates to:
  /// **'Tap Task'**
  String get executiveTapTaskButton;

  /// No description provided for @executiveAlternatingSequencesButton.
  ///
  /// In en, this message translates to:
  /// **'Alternating Sequences'**
  String get executiveAlternatingSequencesButton;

  /// No description provided for @executiveMonthsBackwardsButton.
  ///
  /// In en, this message translates to:
  /// **'Months of the Year Backwards'**
  String get executiveMonthsBackwardsButton;

  /// No description provided for @executiveLuriaAlternatingTitle.
  ///
  /// In en, this message translates to:
  /// **'Luria Alternating Hand Movements'**
  String get executiveLuriaAlternatingTitle;

  /// No description provided for @executiveLuriaAlternatingPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Place both hands on the table like I do. Watch me carefully because I want you to do the same as I am doing. Can you see that I am making a fist with one hand? Now swap the hands over. Can you do that as fast as you can?\"'**
  String get executiveLuriaAlternatingPatientInstruction;

  /// No description provided for @executiveTapToCountCycles.
  ///
  /// In en, this message translates to:
  /// **'Tap to count Cycles'**
  String get executiveTapToCountCycles;

  /// No description provided for @executiveFiveCyclesNoMistakes.
  ///
  /// In en, this message translates to:
  /// **'5 cycles without any mistakes'**
  String get executiveFiveCyclesNoMistakes;

  /// No description provided for @executiveOneMistake.
  ///
  /// In en, this message translates to:
  /// **'1 mistake'**
  String get executiveOneMistake;

  /// No description provided for @executiveTwoOrMoreMistakes.
  ///
  /// In en, this message translates to:
  /// **'2 or more mistakes'**
  String get executiveTwoOrMoreMistakes;

  /// No description provided for @executiveLuriaFistEdgePalmTitle.
  ///
  /// In en, this message translates to:
  /// **'Luria Fist-Edge-Palm Movement'**
  String get executiveLuriaFistEdgePalmTitle;

  /// No description provided for @executiveLuriaFistEdgePalmExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'The examiner performs alternating movements with the right hand by making a fist, then opening the hand with the edge touching the surface, and then the palm touching the surface. The patient is first asked to imitate the series and then continue on his/her own.'**
  String get executiveLuriaFistEdgePalmExaminerInstruction;

  /// No description provided for @executiveLuriaFistEdgePalmPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Can you see what I am doing? Please join me and do the same.\"'**
  String get executiveLuriaFistEdgePalmPatientInstruction;

  /// No description provided for @executiveLuriaFistEdgePalmScoringNote.
  ///
  /// In en, this message translates to:
  /// **'The patient should be able to perform 5 cycles correctly. Test both hands.'**
  String get executiveLuriaFistEdgePalmScoringNote;

  /// No description provided for @executiveRightHand.
  ///
  /// In en, this message translates to:
  /// **'Right Hand'**
  String get executiveRightHand;

  /// No description provided for @executiveLeftHand.
  ///
  /// In en, this message translates to:
  /// **'Left Hand'**
  String get executiveLeftHand;

  /// No description provided for @executiveAnimalNamingTitle.
  ///
  /// In en, this message translates to:
  /// **'Animal Naming Task'**
  String get executiveAnimalNamingTitle;

  /// No description provided for @executiveAnimalNamingPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"I am going to give you one minute to name as many animals as possible.\"'**
  String get executiveAnimalNamingPatientInstruction;

  /// No description provided for @executiveAnimalNamingExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'The patient can name mammals, birds, reptiles or fish. Repetitions are not scored.'**
  String get executiveAnimalNamingExaminerInstruction;

  /// No description provided for @executiveAnimalNamingResponseNormal.
  ///
  /// In en, this message translates to:
  /// **'> 14 Names'**
  String get executiveAnimalNamingResponseNormal;

  /// No description provided for @executiveAnimalNamingResponseEquivocal.
  ///
  /// In en, this message translates to:
  /// **'12 - 14 Names'**
  String get executiveAnimalNamingResponseEquivocal;

  /// No description provided for @executiveAnimalNamingResponseImpaired.
  ///
  /// In en, this message translates to:
  /// **'< 12 Names'**
  String get executiveAnimalNamingResponseImpaired;

  /// No description provided for @executiveLexicalFluencyTitle.
  ///
  /// In en, this message translates to:
  /// **'Lexical Fluency Test'**
  String get executiveLexicalFluencyTitle;

  /// No description provided for @executiveLexicalFluencyPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Say as many words as you can beginning with the letter \'S\', any words except names of people or places. I will give you one minute to complete the task. Are you ready? Go.\"'**
  String get executiveLexicalFluencyPatientInstruction;

  /// No description provided for @executiveLexicalFluencyExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Repetitions are not scored but should be noted as it may indicate perseveration. The letters \'F\' and \'A\' can also be used.'**
  String get executiveLexicalFluencyExaminerInstruction;

  /// No description provided for @executiveLexicalFluencyResponseNormal.
  ///
  /// In en, this message translates to:
  /// **'> 14 Names'**
  String get executiveLexicalFluencyResponseNormal;

  /// No description provided for @executiveLexicalFluencyResponseEquivocal.
  ///
  /// In en, this message translates to:
  /// **'12 - 14 Names'**
  String get executiveLexicalFluencyResponseEquivocal;

  /// No description provided for @executiveLexicalFluencyResponseImpaired.
  ///
  /// In en, this message translates to:
  /// **'< 12 Names'**
  String get executiveLexicalFluencyResponseImpaired;

  /// No description provided for @executiveDesignFluencyTitle.
  ///
  /// In en, this message translates to:
  /// **'Design Fluency Task'**
  String get executiveDesignFluencyTitle;

  /// No description provided for @executiveDesignFluencyPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"You have one minute to draw anything using four lines. The drawings must be different and I must be able to count the lines. I will give you two examples.\"'**
  String get executiveDesignFluencyPatientInstruction;

  /// No description provided for @executiveDesignFluencyPatientInstruction2.
  ///
  /// In en, this message translates to:
  /// **'\"Do you have any questions? Your minute starts now.\"'**
  String get executiveDesignFluencyPatientInstruction2;

  /// No description provided for @executiveDesignFluencyExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Draw the following two examples on the same paper that the patient will use. Count the lines from 1 - 4 while you are drawing.'**
  String get executiveDesignFluencyExaminerInstruction;

  /// No description provided for @executiveDesignFluencyResponseNormal.
  ///
  /// In en, this message translates to:
  /// **'> 7 drawings'**
  String get executiveDesignFluencyResponseNormal;

  /// No description provided for @executiveDesignFluencyResponseEquivocal.
  ///
  /// In en, this message translates to:
  /// **'5 - 7 drawings'**
  String get executiveDesignFluencyResponseEquivocal;

  /// No description provided for @executiveDesignFluencyResponseImpaired.
  ///
  /// In en, this message translates to:
  /// **'< 5 drawings'**
  String get executiveDesignFluencyResponseImpaired;

  /// No description provided for @executiveFingerNoseTitle.
  ///
  /// In en, this message translates to:
  /// **'Finger-Nose Task'**
  String get executiveFingerNoseTitle;

  /// No description provided for @executiveFingerNoseExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'The examiner lifts their finger and in response the patient touches their nose. When the examiner touches his nose, the patient responds by lifting his finger.'**
  String get executiveFingerNoseExaminerInstruction;

  /// No description provided for @executiveFingerNosePatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Listen carefully. When I touch my nose, you raise your finger like this.\"\n\"When I raise my finger, you touch your nose. Let\'s try it now.\"'**
  String get executiveFingerNosePatientInstruction;

  /// No description provided for @executiveFingerNoseVariationsInstruction.
  ///
  /// In en, this message translates to:
  /// **'The examiner performs five variations such as Finger-Nose-Nose-Finger-Nose. Most individuals can complete this task without making a mistake.'**
  String get executiveFingerNoseVariationsInstruction;

  /// No description provided for @executiveFingerNoseResponse.
  ///
  /// In en, this message translates to:
  /// **'Note the response of the patient and score as below.'**
  String get executiveFingerNoseResponse;

  /// No description provided for @executiveTapTaskTitle.
  ///
  /// In en, this message translates to:
  /// **'Tap Task'**
  String get executiveTapTaskTitle;

  /// No description provided for @executiveTapTaskPatientInstruction.
  ///
  /// In en, this message translates to:
  /// **'\"Tap once when I tap once. Do not tap when I tap twice.\"'**
  String get executiveTapTaskPatientInstruction;

  /// No description provided for @executiveTapTaskExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Perform a random series of tapping once or twice and note the patient\'s response. Most people can do this without any mistakes.'**
  String get executiveTapTaskExaminerInstruction;

  /// No description provided for @executiveTapTaskResponse.
  ///
  /// In en, this message translates to:
  /// **'Note the response of the patient and score as below.'**
  String get executiveTapTaskResponse;

  /// No description provided for @executiveAlternatingSequencesTitle.
  ///
  /// In en, this message translates to:
  /// **'Alternating Sequences'**
  String get executiveAlternatingSequencesTitle;

  /// No description provided for @executiveAlternatingSequencesPatientInstruction1.
  ///
  /// In en, this message translates to:
  /// **'\"I will say a sequence of letters and numbers. Listen carefully as I would like you to complete it for me. A 1 B 2 C...?\"'**
  String get executiveAlternatingSequencesPatientInstruction1;

  /// No description provided for @executiveAlternatingSequencesPatientInstruction2.
  ///
  /// In en, this message translates to:
  /// **'\"Good, now start from A and say this sequence until I ask you to stop.\"'**
  String get executiveAlternatingSequencesPatientInstruction2;

  /// No description provided for @executiveAlternatingSequencesExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Score the sequence below. Most people can complete this task without any mistakes.\n\nA 1 B 2 C 3 D 4 E 5'**
  String get executiveAlternatingSequencesExaminerInstruction;

  /// No description provided for @executiveAlternatingSequencesResponse.
  ///
  /// In en, this message translates to:
  /// **'Note the response of the patient and score as below.'**
  String get executiveAlternatingSequencesResponse;

  /// No description provided for @executiveMonthsBackwardsTitle.
  ///
  /// In en, this message translates to:
  /// **'Months of the Year Backwards'**
  String get executiveMonthsBackwardsTitle;

  /// No description provided for @executiveMonthsBackwardsPatientInstruction1.
  ///
  /// In en, this message translates to:
  /// **'\"Say the months of the year starting with January.\"'**
  String get executiveMonthsBackwardsPatientInstruction1;

  /// No description provided for @executiveMonthsBackwardsPatientInstruction2.
  ///
  /// In en, this message translates to:
  /// **'\"Now start with December and go backwards.\"'**
  String get executiveMonthsBackwardsPatientInstruction2;

  /// No description provided for @executiveMonthsBackwardsExaminerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Allow person to complete the sequence January to December.'**
  String get executiveMonthsBackwardsExaminerInstruction;

  /// No description provided for @executiveMonthsBackwardsResponse.
  ///
  /// In en, this message translates to:
  /// **'Stop the person when he reaches July or makes 2 or more mistakes.'**
  String get executiveMonthsBackwardsResponse;

  /// No description provided for @executiveMonthsBackwardsResponseNormal.
  ///
  /// In en, this message translates to:
  /// **'No errors'**
  String get executiveMonthsBackwardsResponseNormal;

  /// No description provided for @executiveMonthsBackwardsResponseEquivocal.
  ///
  /// In en, this message translates to:
  /// **'1 error'**
  String get executiveMonthsBackwardsResponseEquivocal;

  /// No description provided for @executiveMonthsBackwardsResponseImpaired.
  ///
  /// In en, this message translates to:
  /// **'> 1 error'**
  String get executiveMonthsBackwardsResponseImpaired;

  /// No description provided for @executiveTapToScore.
  ///
  /// In en, this message translates to:
  /// **'Tap to score'**
  String get executiveTapToScore;

  /// No description provided for @executiveTimerStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get executiveTimerStart;

  /// No description provided for @executiveTimerRunning.
  ///
  /// In en, this message translates to:
  /// **'Running'**
  String get executiveTimerRunning;

  /// No description provided for @executiveTimerComplete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get executiveTimerComplete;

  /// No description provided for @executiveTapToCountWords.
  ///
  /// In en, this message translates to:
  /// **'Tap to count Words'**
  String get executiveTapToCountWords;

  /// No description provided for @summaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summaryTitle;

  /// No description provided for @summaryShareSummaryTooltip.
  ///
  /// In en, this message translates to:
  /// **'Share Summary'**
  String get summaryShareSummaryTooltip;

  /// No description provided for @summaryDownloadPdfTooltip.
  ///
  /// In en, this message translates to:
  /// **'Download PDF'**
  String get summaryDownloadPdfTooltip;

  /// No description provided for @summaryGoHomeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Go Home'**
  String get summaryGoHomeTooltip;

  /// No description provided for @summaryDomainResultsTab.
  ///
  /// In en, this message translates to:
  /// **'Domain Results'**
  String get summaryDomainResultsTab;

  /// No description provided for @summaryFullReportTab.
  ///
  /// In en, this message translates to:
  /// **'Full Report'**
  String get summaryFullReportTab;

  /// No description provided for @summaryNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name: '**
  String get summaryNameLabel;

  /// No description provided for @summaryHandednessLabel.
  ///
  /// In en, this message translates to:
  /// **'Handedness: '**
  String get summaryHandednessLabel;

  /// No description provided for @summaryTestDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Test Date: '**
  String get summaryTestDateLabel;

  /// No description provided for @summaryAssessorLabel.
  ///
  /// In en, this message translates to:
  /// **'Assessor: '**
  String get summaryAssessorLabel;

  /// No description provided for @summaryDateOfAssessmentLabel.
  ///
  /// In en, this message translates to:
  /// **'Date of Assessment: '**
  String get summaryDateOfAssessmentLabel;

  /// No description provided for @summaryInfoCardText.
  ///
  /// In en, this message translates to:
  /// **'Some tasks have a numerical raw score. Other tasks provide an estimate based on clinical judgement which is indicated by the word \"Clinical\" in the table below.'**
  String get summaryInfoCardText;

  /// No description provided for @summaryAttentionDomain.
  ///
  /// In en, this message translates to:
  /// **'Attention & Concentration'**
  String get summaryAttentionDomain;

  /// No description provided for @summaryLanguageDomain.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get summaryLanguageDomain;

  /// No description provided for @summaryVerbalWorkingMemoryDomain.
  ///
  /// In en, this message translates to:
  /// **'Verbal Working Memory'**
  String get summaryVerbalWorkingMemoryDomain;

  /// No description provided for @summaryVerbalShortTermMemoryDomain.
  ///
  /// In en, this message translates to:
  /// **'Verbal Short-Term Memory'**
  String get summaryVerbalShortTermMemoryDomain;

  /// No description provided for @summaryVisualShortTermMemoryDomain.
  ///
  /// In en, this message translates to:
  /// **'Visual Short-Term Memory'**
  String get summaryVisualShortTermMemoryDomain;

  /// No description provided for @summaryPraxisDomain.
  ///
  /// In en, this message translates to:
  /// **'Praxis'**
  String get summaryPraxisDomain;

  /// No description provided for @summaryGnosisDomain.
  ///
  /// In en, this message translates to:
  /// **'Gnosis'**
  String get summaryGnosisDomain;

  /// No description provided for @summaryExecutiveFunctionDomain.
  ///
  /// In en, this message translates to:
  /// **'Executive Function'**
  String get summaryExecutiveFunctionDomain;

  /// No description provided for @summaryTaskHeader.
  ///
  /// In en, this message translates to:
  /// **'Task'**
  String get summaryTaskHeader;

  /// No description provided for @summaryScoringGuideHeader.
  ///
  /// In en, this message translates to:
  /// **'Scoring Guide'**
  String get summaryScoringGuideHeader;

  /// No description provided for @summaryResultHeader.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get summaryResultHeader;

  /// No description provided for @summaryEstimateHeader.
  ///
  /// In en, this message translates to:
  /// **'Estimate'**
  String get summaryEstimateHeader;

  /// No description provided for @summaryNeiHeader.
  ///
  /// In en, this message translates to:
  /// **'N / E / I'**
  String get summaryNeiHeader;

  /// No description provided for @summaryClinicalResult.
  ///
  /// In en, this message translates to:
  /// **'Clinical'**
  String get summaryClinicalResult;

  /// No description provided for @summaryTaskAttentionVigilance.
  ///
  /// In en, this message translates to:
  /// **'Attention: Vigilance Test'**
  String get summaryTaskAttentionVigilance;

  /// No description provided for @summaryTaskAnomiaNaming.
  ///
  /// In en, this message translates to:
  /// **'Anomia: Naming Pictures'**
  String get summaryTaskAnomiaNaming;

  /// No description provided for @summaryTaskSpokenLanguage.
  ///
  /// In en, this message translates to:
  /// **'Spoken Language'**
  String get summaryTaskSpokenLanguage;

  /// No description provided for @summaryTaskWorkingMemoryTrial1.
  ///
  /// In en, this message translates to:
  /// **'Working Memory Verbal Trial 1: 10 Word Recall'**
  String get summaryTaskWorkingMemoryTrial1;

  /// No description provided for @summaryTaskShortTermTrial2.
  ///
  /// In en, this message translates to:
  /// **'Short-term Memory Verbal Trial 2: 10 Word Recall'**
  String get summaryTaskShortTermTrial2;

  /// No description provided for @summaryTaskShortTermTrial3.
  ///
  /// In en, this message translates to:
  /// **'Short-term Memory Verbal Trial 3: 10 Word Recall'**
  String get summaryTaskShortTermTrial3;

  /// No description provided for @summaryTaskDelayedRecall.
  ///
  /// In en, this message translates to:
  /// **'Short-Term Memory Verbal: Delayed Recall Of 10 Words'**
  String get summaryTaskDelayedRecall;

  /// No description provided for @summaryTaskRecognitionTotal.
  ///
  /// In en, this message translates to:
  /// **'Short-Term Memory Verbal Recognition: Total Score'**
  String get summaryTaskRecognitionTotal;

  /// No description provided for @summaryTaskOrientation.
  ///
  /// In en, this message translates to:
  /// **'Short-Term Memory Verbal Recall: Orientation'**
  String get summaryTaskOrientation;

  /// No description provided for @summaryTaskVisualLineDrawing.
  ///
  /// In en, this message translates to:
  /// **'Short-term Memory Visual: Line Drawing Recall'**
  String get summaryTaskVisualLineDrawing;

  /// No description provided for @summaryTaskPraxisRight.
  ///
  /// In en, this message translates to:
  /// **'Praxis: Finger-hand Dexterity: Right'**
  String get summaryTaskPraxisRight;

  /// No description provided for @summaryTaskPraxisLeft.
  ///
  /// In en, this message translates to:
  /// **'Praxis: Finger-hand Dexterity: Left'**
  String get summaryTaskPraxisLeft;

  /// No description provided for @summaryTaskVisuospatialPraxis.
  ///
  /// In en, this message translates to:
  /// **'Visuospatial & Praxis: Line Drawing Copy'**
  String get summaryTaskVisuospatialPraxis;

  /// No description provided for @summaryTaskAgnosiaRecognition.
  ///
  /// In en, this message translates to:
  /// **'Agnosia: Recognition of Pictures'**
  String get summaryTaskAgnosiaRecognition;

  /// No description provided for @summaryTaskAnimalNaming.
  ///
  /// In en, this message translates to:
  /// **'Executive: Animal Naming Task'**
  String get summaryTaskAnimalNaming;

  /// No description provided for @summaryTaskDesignFluency.
  ///
  /// In en, this message translates to:
  /// **'Executive: Design Fluency'**
  String get summaryTaskDesignFluency;

  /// No description provided for @summaryTaskLuriaAlternating.
  ///
  /// In en, this message translates to:
  /// **'Executive: Luria Alternating Hand Movements'**
  String get summaryTaskLuriaAlternating;

  /// No description provided for @summaryTaskSerialOrderReversal.
  ///
  /// In en, this message translates to:
  /// **'Executive: Serial Order Reversal Task'**
  String get summaryTaskSerialOrderReversal;

  /// No description provided for @summaryScoreGuideAttention.
  ///
  /// In en, this message translates to:
  /// **'N = no mistakes, E = one mistake and I = > 1 mistake'**
  String get summaryScoreGuideAttention;

  /// No description provided for @summaryScoreGuideAnomia.
  ///
  /// In en, this message translates to:
  /// **'N = all correct, E = 1 error, I >1 error'**
  String get summaryScoreGuideAnomia;

  /// No description provided for @summaryScoreGuideSpokenLanguage.
  ///
  /// In en, this message translates to:
  /// **'N = Normal speech, E = Equivocal, I = definite impairment'**
  String get summaryScoreGuideSpokenLanguage;

  /// No description provided for @summaryScoreGuideTrial1.
  ///
  /// In en, this message translates to:
  /// **'N > 6, E = 5-6, I < 5'**
  String get summaryScoreGuideTrial1;

  /// No description provided for @summaryScoreGuideTrial2.
  ///
  /// In en, this message translates to:
  /// **'N > 6, E = 5-6, I < 5'**
  String get summaryScoreGuideTrial2;

  /// No description provided for @summaryScoreGuideTrial3.
  ///
  /// In en, this message translates to:
  /// **'N > 7, E = 5-7, I < 5'**
  String get summaryScoreGuideTrial3;

  /// No description provided for @summaryScoreGuideDelayedRecall.
  ///
  /// In en, this message translates to:
  /// **'N >5, E = 5, I < 5'**
  String get summaryScoreGuideDelayedRecall;

  /// No description provided for @summaryScoreGuideRecognition.
  ///
  /// In en, this message translates to:
  /// **'N > 16, E = 14 - 16, I < 14'**
  String get summaryScoreGuideRecognition;

  /// No description provided for @summaryScoreGuideOrientation.
  ///
  /// In en, this message translates to:
  /// **'N = 5, E = 4, I < 4'**
  String get summaryScoreGuideOrientation;

  /// No description provided for @summaryScoreGuideVisualMemory.
  ///
  /// In en, this message translates to:
  /// **'N >5, E = 5, I < 5'**
  String get summaryScoreGuideVisualMemory;

  /// No description provided for @summaryScoreGuidePraxis.
  ///
  /// In en, this message translates to:
  /// **'N = No errors, E = Some difficulty, I = Clear difficulty'**
  String get summaryScoreGuidePraxis;

  /// No description provided for @summaryScoreGuidePraxisAlt.
  ///
  /// In en, this message translates to:
  /// **'N = no errors, E = some difficulty, I = Clear difficulty'**
  String get summaryScoreGuidePraxisAlt;

  /// No description provided for @summaryScoreGuideVisuospatial.
  ///
  /// In en, this message translates to:
  /// **'N > 6, E = 6, I < 6'**
  String get summaryScoreGuideVisuospatial;

  /// No description provided for @summaryScoreGuideAgnosia.
  ///
  /// In en, this message translates to:
  /// **'N = all correct, E = 1 error, I >1 error'**
  String get summaryScoreGuideAgnosia;

  /// No description provided for @summaryScoreGuideAnimalNaming.
  ///
  /// In en, this message translates to:
  /// **'>14 = N, 12-14 = E, <12 =I'**
  String get summaryScoreGuideAnimalNaming;

  /// No description provided for @summaryScoreGuideDesignFluency.
  ///
  /// In en, this message translates to:
  /// **'N > 7 drawings, E = 5-7 drawings, I< 5 drawings'**
  String get summaryScoreGuideDesignFluency;

  /// No description provided for @summaryScoreGuideLuria.
  ///
  /// In en, this message translates to:
  /// **'N = 3 cycles without mistakes, E = able to do 1-2 cycles, I = unable to complete task'**
  String get summaryScoreGuideLuria;

  /// No description provided for @summaryScoreGuideSerialOrder.
  ///
  /// In en, this message translates to:
  /// **'N = no errors, E = 1 error, I > 1 error'**
  String get summaryScoreGuideSerialOrder;

  /// No description provided for @summaryReportCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Report copied to clipboard!'**
  String get summaryReportCopiedToClipboard;

  /// No description provided for @summaryShareDialogOpened.
  ///
  /// In en, this message translates to:
  /// **'Share dialog opened'**
  String get summaryShareDialogOpened;

  /// No description provided for @summaryErrorSharing.
  ///
  /// In en, this message translates to:
  /// **'Error sharing: '**
  String get summaryErrorSharing;

  /// No description provided for @summaryPdfDownloadedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'PDF downloaded successfully'**
  String get summaryPdfDownloadedSuccessfully;

  /// No description provided for @summaryErrorGeneratingPdf.
  ///
  /// In en, this message translates to:
  /// **'Error generating PDF: '**
  String get summaryErrorGeneratingPdf;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
