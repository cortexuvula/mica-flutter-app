# Mica - Midland Cognitive Assessment

A Flutter application for cognitive assessment and monitoring.

## Description

Mica is a mobile application designed to provide cognitive assessments in clinical and research settings. The app delivers standardized tests to measure various cognitive domains while providing an intuitive user experience for both practitioners and patients.

## Features

- Interactive cognitive assessment tools
- Secure data collection and storage
- Cross-platform support (iOS and Android)
- Responsive UI design for various device sizes
- Results summary and visualization

## Technology Stack

- Flutter for cross-platform development
- Dart programming language
- State management: Basic Flutter state management (setState)

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
├── main.dart         # Application entry point
├── models/           # Data models
├── screens/          # UI screens
├── services/         # Business logic and services
├── utils/            # Utility functions
└── widgets/          # Reusable UI components
```

### State Management

The application uses Flutter's built-in state management approach with StatefulWidget and setState() for handling component state. This approach works well for this application's needs, providing simplicity and directness for managing UI state.

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
