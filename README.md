# Mica - Midland Cognitive Assessment

A Flutter application for cognitive assessment and monitoring.

[![Build All Platforms](https://github.com/cortexuvula/mica-flutter-app/actions/workflows/build.yml/badge.svg)](https://github.com/cortexuvula/mica-flutter-app/actions/workflows/build.yml)

## Description

Mica is a multi-platform application designed to provide cognitive assessments in clinical and research settings. The app delivers standardized tests to measure various cognitive domains while providing an intuitive user experience for both practitioners and patients.

## Downloads

Pre-built binaries are available on the [Releases](https://github.com/cortexuvula/mica-flutter-app/releases/latest) page:

| Platform | Format |
|----------|--------|
| Android | APK, App Bundle |
| iOS | .app (tar.gz) |
| macOS | DMG (signed & notarized) |
| Windows | Executable (tar.gz) |
| Linux | Bundle (tar.gz) |
| Web | Static site (tar.gz) |

## Features

- Interactive cognitive assessment tools across multiple domains
- Comprehensive assessment modules:
  - **Attention & Concentration**: Vigilance tests, digit span, serial 7s
  - **Language**: Speech fluency, comprehension, naming, reading, writing
  - **Memory**: Verbal and visual short-term memory, delayed recall, recognition
  - **Praxis**: Limb-kinetic, ideomotor, ideational, oral, and dressing apraxia tests
  - **Gnosis**: Visual object identification, astereognosis, finger perception, clock drawing
  - **Executive Function**: Luria alternating hand movements, fist-edge-palm, design fluency
- Secure data collection and storage with Provider pattern
- Assessment persistence — resume where you left off
- Results summary with domain-specific scoring, colour-coded indicators, and PDF report generation
- Video instructions for complex assessments
- Cross-platform: Android, iOS, macOS, Windows, Linux, and Web

## Technology Stack

- **Framework**: Flutter 3.41+ / Dart
- **State Management**: Provider pattern with ChangeNotifier
- **PDF Generation**: `pdf` and `printing` packages
- **Video**: `video_player` for instructional content
- **Persistence**: `shared_preferences` for assessment progress
- **CI/CD**: GitHub Actions — builds all 6 platforms on every push

## Installation

### Prerequisites

- Flutter SDK >=3.0.0 <4.0.0
- Android Studio / Xcode (for mobile)
- Git

### Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/cortexuvula/mica-flutter-app.git
   ```

2. Install dependencies:
   ```bash
   cd mica-flutter-app
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run
   ```

### Build for specific platforms

```bash
flutter run -d chrome      # Web
flutter run -d ios          # iOS simulator
flutter run -d android      # Android emulator
flutter run -d macos        # macOS
flutter run -d windows      # Windows
flutter run -d linux        # Linux

flutter build apk --release       # Android APK
flutter build appbundle --release  # Android App Bundle
flutter build ios --release        # iOS
flutter build macos --release      # macOS
flutter build windows --release    # Windows
flutter build linux --release      # Linux
flutter build web                  # Web
```

## Development

### Project Structure

```
lib/
├── main.dart                    # Application entry point
├── resources/
│   ├── const_data.dart          # Constants and static data
│   └── strings/                 # Localizable strings
├── src/
│   ├── domain_testing/          # Assessment modules by domain
│   │   ├── attention_concentration/
│   │   ├── language/
│   │   ├── memory/
│   │   ├── praxis/
│   │   ├── gnosis/
│   │   └── executive_function/
│   ├── domain_results/          # Result display screens
│   ├── models/
│   │   └── mica_score_model.dart  # Central score model
│   ├── providers/
│   │   └── mica_provider.dart     # Provider configuration
│   ├── services/
│   │   └── persistence_service.dart  # Assessment save/restore
│   ├── summary/                 # Summary and report generation
│   │   ├── services/
│   │   │   ├── pdf_generation_service.dart
│   │   │   └── share_service.dart
│   │   └── assessment_color_utils.dart
│   ├── utils/
│   │   ├── navigation_helper.dart
│   │   └── screen_routes.dart
│   └── widgets/                 # Reusable UI components
├── images/                      # Image assets
└── video/                       # Instructional videos (.m4v)
```

### Testing

```bash
flutter test                                          # All tests
flutter test test/src/models/mica_score_model_test.dart  # Specific test
flutter analyze                                       # Static analysis
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

[Specify license information here]
