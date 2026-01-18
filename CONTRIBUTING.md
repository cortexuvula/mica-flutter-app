# Contributing to MICA

Thank you for your interest in contributing to the Midland Cognitive Assessment (MICA) application. This document provides guidelines and best practices for contributing to this project.

## Table of Contents

- [Getting Started](#getting-started)
- [Development Environment](#development-environment)
- [Project Structure](#project-structure)
- [Coding Standards](#coding-standards)
- [Testing Guidelines](#testing-guidelines)
- [Submitting Changes](#submitting-changes)
- [Code Review Process](#code-review-process)

## Getting Started

### Prerequisites

- Flutter SDK >=3.0.0 <4.0.0
- Dart SDK (included with Flutter)
- Android Studio or VS Code with Flutter extensions
- Git
- For iOS development: macOS with Xcode

### Development Setup

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd mica-flutter-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Verify setup**
   ```bash
   flutter doctor
   flutter analyze
   ```

4. **Run the app**
   ```bash
   flutter run -d chrome    # Web
   flutter run -d ios       # iOS simulator
   flutter run -d android   # Android emulator
   ```

## Development Environment

### Recommended IDE Setup

- **VS Code**: Install Flutter and Dart extensions
- **Android Studio**: Install Flutter and Dart plugins

### Useful Commands

```bash
# Run tests
flutter test

# Run specific test
flutter test test/src/summary_with_provider_test.dart

# Analyze code for issues
flutter analyze

# Format code
dart format .

# Build releases
flutter build apk --release      # Android APK
flutter build appbundle --release # Android App Bundle
flutter build ios --release       # iOS (requires macOS)
flutter build web                 # Web
```

## Project Structure

```
lib/
├── main.dart                    # Application entry point
├── resources/
│   └── const_data.dart         # Constants and static data
└── src/
    ├── domain_testing/         # Assessment modules by domain
    │   ├── attention_concentration/
    │   ├── language/
    │   ├── memory/
    │   ├── praxis/
    │   └── gnosis/
    ├── domain_results/         # Result display screens
    ├── models/                 # Data models (MicaScoreModel)
    ├── providers/              # State management (MicaProviders)
    ├── summary/                # Summary screens and services
    │   ├── widgets/
    │   └── services/
    ├── utils/                  # Utility functions
    └── widgets/                # Reusable widgets
```

## Coding Standards

### State Management

The app uses the **Provider pattern** with a centralized `MicaScoreModel`:

```dart
// Access score model (listening for changes)
final scoreModel = MicaProviders.getScoreModel(context);

// Access score model (no rebuild on changes - use for updates)
final scoreModel = MicaProviders.getScoreModel(context, listen: false);

// Update scores via setter methods
scoreModel.setTrialOneScore(score);
```

**Important**: Use `listen: false` when updating scores to avoid rebuild loops.

### UI Styling Standards

#### Buttons
```dart
ElevatedButton(
  style: ElevatedButton.styleFrom(
    elevation: 10.0,
    backgroundColor: Theme.of(context).colorScheme.secondary,
  ),
  child: Text('Button Text', style: TextStyle(color: Colors.black)),
)
```

#### Cards
```dart
SizedBox(
  width: width * 0.9,  // 90% of screen width
  child: Card(
    elevation: 10.0,
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [...]),
    ),
  ),
)
```

#### Instruction Card Colors
- **Yellow** (`Colors.yellowAccent.shade400`) - Patient instructions
- **Purple** (`Colors.deepPurple.shade300`) - Examiner instructions
- **Green** (`Colors.green`) - Response/scoring sections

#### Radio Buttons
```dart
Radio<int>(
  fillColor: WidgetStateProperty.resolveWith<Color>((states) {
    if (states.contains(WidgetState.selected)) {
      return Colors.white;  // White when selected
    }
    return Colors.black;    // Black when unselected
  }),
)
```

### Test Implementation Pattern

Each cognitive test should follow this structure:
1. Video instruction screen (using `video_player`)
2. Test administration screen with scoring logic
3. Score saved to `MicaScoreModel`
4. Navigation to next test or domain results
5. Use `Navigator.pop()` for returning from test screens

### General Guidelines

- Run `flutter analyze` before committing - no warnings or errors
- Run `dart format .` to ensure consistent formatting
- Follow existing patterns in the codebase
- Keep UI consistent with the purple/lavender theme (#64638f primary)
- Add meaningful comments for complex logic only
- Prefer explicit types over `var` for better readability

## Testing Guidelines

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/src/summary_with_provider_test.dart

# Run tests with coverage
flutter test --coverage
```

### Writing Tests

- Place tests in `test/src/` mirroring the `lib/src/` structure
- Test state management logic in `MicaScoreModel`
- Test widget rendering and interactions
- Include edge cases and error conditions

### Manual Testing Checklist

Before submitting changes, verify:
- [ ] App runs without errors on target platforms
- [ ] New screens follow UI styling standards
- [ ] Navigation flows work correctly
- [ ] Scores are saved and retrieved properly
- [ ] No regressions in existing functionality

## Submitting Changes

### Branch Naming

Use descriptive branch names:
- `feature/add-new-test-module`
- `fix/score-calculation-bug`
- `refactor/summary-screen-components`
- `docs/update-readme`

### Commit Messages

Write clear, descriptive commit messages:

```
feat: add clock drawing test to gnosis module

- Implement 5-point scoring criteria
- Add video instructions
- Follow standard UI patterns with instruction cards
```

Use conventional commit prefixes:
- `feat:` - New features
- `fix:` - Bug fixes
- `refactor:` - Code refactoring
- `docs:` - Documentation changes
- `test:` - Adding or updating tests
- `chore:` - Maintenance tasks

### Pull Request Process

1. **Create a feature branch** from `main`
2. **Make your changes** following coding standards
3. **Run quality checks**
   ```bash
   flutter analyze
   flutter test
   dart format .
   ```
4. **Commit your changes** with descriptive messages
5. **Push your branch** and create a Pull Request
6. **Fill out the PR template** with:
   - Description of changes
   - Testing performed
   - Screenshots (if UI changes)
   - Related issues

## Code Review Process

### For Contributors

- Respond to review comments promptly
- Make requested changes in new commits (don't force push during review)
- Mark resolved conversations

### For Reviewers

- Check for adherence to coding standards
- Verify UI consistency with existing screens
- Test functionality locally when possible
- Provide constructive feedback
- Approve when all concerns are addressed

## Questions?

If you have questions about contributing, please:
1. Check existing documentation (README.md, CLAUDE.md)
2. Review similar implementations in the codebase
3. Open an issue for discussion

Thank you for contributing to MICA!
