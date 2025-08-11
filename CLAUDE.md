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

# Run tests
flutter test

# Run a specific test
flutter test test/src/summary_with_provider_test.dart

# Format code
dart format .

# Get dependencies
flutter pub get
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
- **MicaProviders.getScoreModel(context, listen: false)** - Use when updating scores to avoid rebuild loops
- Scores are updated via setter methods that call `notifyListeners()`
- Model initialization should be deferred using `WidgetsBinding.instance.addPostFrameCallback` to avoid setState during build

### Navigation Flow
1. **LoadingScreen** → **Welcome** → **PatientInformation** → **DomainSelect**
2. Domain testing flows are organized in subfolders:
   - `attention_concentration/` - Contains vigilance, digit span, serial 7s, etc.
   - `language/` - Language assessments (speech, comprehension, naming, etc.)
   - `memory/` - Memory assessments (ten word verbal recall, visual memory, semantic memory)
   - `praxis/` - Praxis assessments (various apraxia tests and line drawing)
   - `gnosis/` - Gnosis assessments (object identification, finger perception, clock drawing)
3. Results are displayed in domain-specific result screens
4. **Summary** page aggregates all results with tabs for domain breakdown and full report

### Test Implementation Pattern
Each cognitive test follows this structure:
- Video instruction screen (using video_player)
- Test administration screen with scoring logic
- Score saved to MicaScoreModel
- Navigation to next test or domain results
- Most test screens now use `Navigator.pop()` instead of specific navigation

### UI Styling Standards
```dart
// ElevatedButton standard
ElevatedButton(
  style: ElevatedButton.styleFrom(
    elevation: 10.0,
    backgroundColor: Theme.of(context).colorScheme.secondary,
  ),
  child: Text('Button Text', style: TextStyle(color: Colors.black)),
)

// Card standard
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

// Color coding for instruction cards
- Yellow (Colors.yellowAccent.shade400) - Patient instructions
- Purple (Colors.deepPurple.shade300) - Examiner instructions  
- Green (Colors.green) - Response/scoring sections

// Radio button styling in assessment screens
Radio<int>(
  fillColor: WidgetStateProperty.resolveWith<Color>((states) {
    if (states.contains(WidgetState.selected)) {
      return Colors.white;  // White when selected
    }
    return Colors.black;    // Black when unselected
  }),
)

// Table styling for assessment options
Table(
  border: TableBorder.all(
    color: Colors.black54,
    width: 1.0,
  ),
  children: [
    TableRow(
      children: [
        // TableCell with InkWell for tap handling
        // Radio button with label in Row
      ],
    ),
  ],
)
```

### Key Directories
- `/lib/src/domain_testing/` - Test implementation screens organized by domain
  - `attention_concentration/` - Attention and concentration tests
  - `language/` - Language assessment tests
  - `memory/` - Memory assessment tests (verbal and visual)
  - `praxis/` - Praxis assessment tests (limb-kinetic, ideomotor, ideational, oral, dressing)
  - `gnosis/` - Gnosis assessment tests:
    - Visual object identification (nominal dysphasia vs visual object agnosia)
    - Object identification by touch (astereognosis testing)
    - Finger perception test (finger agnosia)
    - Clock drawing test (integrated cognitive assessment)
- `/lib/src/domain_results/` - Result display screens
- `/lib/src/summary/` - Summary screens with modular components
- `/lib/src/providers/` - State management (MicaProviders)
- `/video/` - Instruction videos (.m4v format)
- `/images/` - Test materials and assets
  - `handdiagram1-7.png` - Finger perception test diagrams

## Important Notes

- The app targets Flutter SDK >=3.0.0 <4.0.0
- Uses `flutter_lints` for code analysis - run `flutter analyze` before committing
- Android signing configured via `key.properties` (not in version control)
- Bitbucket Pipelines configured for CI/CD
- Color scheme uses purple/lavender theme (#64638f primary)
- When creating new test screens, follow the established card/button styling patterns
- Summary screen has been refactored into modular components in `/lib/src/summary/`

## Recent Updates

### Gnosis Module (Added)
- Complete Gnosis assessment domain with 4 tests
- Visual object identification test with scoring for nominal dysphasia vs visual object agnosia
- Touch object identification test (astereognosis) with separate scoring for right and left hands
- Finger perception test with 7 hand diagrams and pattern-based scoring
- Clock drawing test with 5-point scoring criteria
- All tests follow the app's standard UI patterns with purple/yellow instruction cards and green scoring sections

### UI Improvements
- Fixed attention screen: double-tap on "A" buttons now marks as mistake instead of deselecting
- Updated ten_word_recognition: Yes/No buttons now have white background with black text
- Fixed Yes button first-click issue in recognition tests

### Image Assets
- Added handdiagram1-7.png for finger perception test
- Images properly configured in pubspec.yaml