/// Constants and data structures for MICA assessments
class AssessmentConstants {
  // Scoring thresholds
  static const Map<String, Map<String, dynamic>> scoringGuides = {
    'trial1': {
      'guide': 'N > 5, E = 4-5, I < 4',
      'normal': 6,
      'equivocal_min': 4,
      'equivocal_max': 5,
    },
    'trial2': {
      'guide': 'N > 6, E = 5-6, I < 5',
      'normal': 7,
      'equivocal_min': 5,
      'equivocal_max': 6,
    },
    'trial3': {
      'guide': 'N > 7, E = 6-7, I < 6',
      'normal': 8,
      'equivocal_min': 6,
      'equivocal_max': 7,
    },
    'delay': {
      'guide': 'N > 5, E = 5, I < 5',
      'normal': 6,
      'equivocal': 5,
    },
    'recognition': {
      'guide': 'N > 16, E = 14-16, I < 14',
      'normal': 17,
      'equivocal_min': 14,
      'equivocal_max': 16,
    },
    'orientation': {
      'guide': 'N = 5, E = 4, I < 4',
      'normal': 5,
      'equivocal': 4,
    },
    'visual': {
      'guide': 'N > 5, E = 5, I < 5',
      'normal': 6,
      'equivocal': 5,
    },
    'attention': {
      'guide': 'N = no mistakes, E = one mistake and I = > 1 mistake',
    },
    'animalNaming': {
      'guide': '>14 = N, 12-14 = E, <12 =I',
      'normal': 15,
      'equivocal_min': 12,
      'equivocal_max': 14,
    },
  };

  // Assessment result abbreviations
  static const String normal = 'N';
  static const String equivocal = 'E';
  static const String impaired = 'I';

  // Assessment result full names
  static const Map<String, String> resultFullNames = {
    'N': 'Normal',
    'E': 'Equivocal',
    'I': 'Impaired',
  };
}

/// Domain information structure
class DomainInfo {
  final String name;
  final String displayName;
  final bool useResultColumn; // true for 'Result', false for 'Estimate'

  const DomainInfo({
    required this.name,
    required this.displayName,
    this.useResultColumn = false,
  });
}

/// Assessment task information
class AssessmentTask {
  final String name;
  final String scoringGuide;
  final bool isClinical;

  const AssessmentTask({
    required this.name,
    required this.scoringGuide,
    this.isClinical = false,
  });
}