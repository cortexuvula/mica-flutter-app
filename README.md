# Mica - Midland Cognitive Assessment

A Flutter application for cognitive assessment and monitoring.

## Description

Mica is a mobile application designed to provide cognitive assessments in clinical and research settings. The app delivers standardized tests to measure various cognitive domains while providing an intuitive user experience for both practitioners and patients.

## Features

- Interactive cognitive assessment tools across multiple domains
- Comprehensive assessment modules:
  - **Attention & Concentration**: Vigilance tests, digit span, serial 7s
  - **Language**: Speech fluency, comprehension, naming, reading, writing
  - **Memory**: Verbal and visual short-term memory, delayed recall, recognition
  - **Praxis**: Limb-kinetic, ideomotor, ideational, oral, and dressing apraxia tests
  - **Gnosis**: Visual object identification, astereognosis, finger perception, clock drawing
- Secure data collection and storage with Provider pattern
- Cross-platform support (iOS and Android)
- Responsive UI design for various device sizes
- Results summary with domain-specific scoring and PDF generation
- Video instructions for complex assessments

## Technology Stack

- Flutter for cross-platform development
- Dart programming language
- State management: Provider pattern with ChangeNotifier
- PDF generation for assessment reports
- Video player for instructional content

## Installation

### Prerequisites

- Flutter SDK (latest stable version)
- Android Studio / Xcode
- Git

### Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/cortexuvula/mica-flutter-app.git
   ```

2. Navigate to the project directory:
   ```bash
   cd mica-flutter-app
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the application:
   ```bash
   flutter run
   ```

## Development

### Project Structure

```
lib/
├── main.dart                    # Application entry point
├── resources/
│   └── const_data.dart         # Constants and static data
├── src/
│   ├── domain_testing/         # Assessment modules by domain
│   │   ├── attention_concentration/
│   │   ├── language/
│   │   ├── memory/
│   │   ├── praxis/
│   │   └── gnosis/            # Gnosis assessment tests
│   │       ├── gnosis_assessment.dart
│   │       ├── identify_objects_visually.dart
│   │       ├── identify_objects_by_touch.dart
│   │       ├── finger_perception_test.dart
│   │       └── clock_drawing_test.dart
│   ├── domain_results/         # Result display screens
│   ├── models/                 # Data models
│   │   └── mica_score_model.dart
│   ├── providers/              # State management
│   │   └── mica_provider.dart
│   ├── summary/                # Summary and report generation
│   │   └── services/
│   │       └── pdf_generation_service.dart
│   └── utils/                  # Utility functions
│       └── navigation_helper.dart
├── images/                     # Image assets
│   └── handdiagram1-7.png    # Finger perception test diagrams
└── video/                      # Instructional videos
```

### State Management

The application uses the Provider pattern with ChangeNotifier for state management. The centralized `MicaScoreModel` holds all test scores and patient information, providing a single source of truth across the application. Key patterns include:

- `MicaProviders.getProviders()` - Returns MultiProvider configuration
- `MicaProviders.getScoreModel(context)` - Access the score model from any screen
- Deferred initialization using `WidgetsBinding.instance.addPostFrameCallback`

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

[Specify license information here]

---

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
