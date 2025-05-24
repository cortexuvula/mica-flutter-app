# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

### Development
```bash
# Run the app in debug mode
flutter run

# Run on specific device/platform
flutter run -d chrome    # Web
flutter run -d ios       # iOS simulator
flutter run -d android   # Android emulator

# Analyze code for issues
flutter analyze

# Run tests (if any exist)
flutter test

# Format code
dart format .
```

### Build
```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS (requires macOS with Xcode)
flutter build ios --release

# Web
flutter build web
```

## Architecture

### State Management
The app uses Provider pattern with a centralized `MicaScoreModel` (ChangeNotifier) that holds all test scores and patient information. Key patterns:

- **MicaProviders.getProviders()** - Returns MultiProvider configuration for app initialization
- **MicaProviders.getScoreModel(context)** - Static method to access the score model from any screen
- Scores are updated via setter methods that call `notifyListeners()`
- Use `listen: false` when updating scores to avoid rebuild loops during the same frame

### Navigation Flow
1. **LoadingScreen** → **Welcome** → **PatientInformation** → **DomainSelect**
2. Each domain has its own testing flow with multiple screens
3. Results are displayed in domain-specific result screens
4. **Summary** page aggregates all results with tabs for domain breakdown and full report

### Test Implementation Pattern
Each cognitive test follows this structure:
- Video instruction screen (using video_player)
- Test administration screen with scoring logic
- Score saved to MicaScoreModel
- Navigation to next test or domain results

### Key Directories
- `/lib/src/domain_testing/` - Test implementation screens
- `/lib/src/domain_results/` - Result display screens
- `/video/` - Instruction videos (.m4v format)
- `/images/` - Test materials and assets

## Important Notes

- The app targets Flutter SDK >=3.0.0 <4.0.0
- Uses `flutter_lints` for code analysis - run `flutter analyze` before committing
- Android signing configured via `key.properties` (not in version control)
- Bitbucket Pipelines configured for CI/CD
- Color scheme uses purple/lavender theme (#64638f primary)