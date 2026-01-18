# Technical Debt Tracker

This document tracks known technical debt, areas for improvement, and planned refactoring work in the MICA application.

**Last Updated:** January 17, 2026

---

## Summary

| Category | Priority | Items |
|----------|----------|-------|
| Code Quality | Medium | 0 |
| Testing | - | 0 |
| Architecture | Low | 1 |
| Dependencies | Low | 0 |
| Documentation | Low | 1 |

---

## High Priority

_No high priority items currently._

---

## Medium Priority

_No medium priority items currently._

---

## Low Priority

### Summary Screen Complexity

**Issue:** Summary screen has grown complex despite modularization.

**Location:** `lib/src/summary/`

**Current State:**
- Refactored into modular components (widgets/, services/)
- Still handles many responsibilities
- PDF generation service could be further isolated

**Recommended Actions:**
1. Consider separating PDF generation into a background isolate for large reports
2. Add caching for computed summary data
3. Implement lazy loading for domain tabs

**Effort Estimate:** Medium

---

### State Persistence

**Issue:** No persistence of assessment state across app restarts.

**Current State:**
- All state held in memory via Provider
- App restart loses all progress
- No draft/resume capability

**Impact:** Users lose progress if app is closed mid-assessment.

**Recommended Actions:**
1. Implement local storage for assessment progress
2. Add "Resume" functionality for incomplete assessments
3. Consider using `shared_preferences` or `hive` for persistence

**Effort Estimate:** High

---

## Completed Items

### Error Handling Improvements (Completed January 2026)

**Issue:** Limited error handling and user feedback for failures.

**Resolution:**
- Created reusable error handling widgets at `lib/src/widgets/error/`:
  - `ErrorDisplayWidget` - Displays error states with retry functionality, factory constructors for video/file/network errors
  - `SnackbarHelper` - Consistent snackbar messages (success, error, warning, info, loading)
  - `error_widgets.dart` - Barrel file for easy imports
- Added error handling to video player (`lib/src/video_page.dart`):
  - Try-catch around video initialization
  - Error state UI with retry functionality
  - Null-safe controller disposal
- Enhanced PDF generation service (`lib/src/summary/services/pdf_generation_service.dart`):
  - Created `PdfGenerationException` custom exception
  - Added try-catch around PDF generation and file saving
  - Safer filename generation with invalid character removal
- Enhanced share service (`lib/src/summary/services/share_service.dart`):
  - Created `ShareException` custom exception
  - Added try-catch around clipboard and share operations
- Fixed URL launcher in welcome screen (`lib/src/welcome.dart`):
  - Try-catch around URL launch
  - User-friendly error snackbar instead of thrown exception

**Files Added:**
- `lib/src/widgets/error/error_display_widget.dart`
- `lib/src/widgets/error/snackbar_helper.dart`
- `lib/src/widgets/error/error_widgets.dart`

**Files Modified:**
- `lib/src/video_page.dart`
- `lib/src/summary/services/pdf_generation_service.dart`
- `lib/src/summary/services/share_service.dart`
- `lib/src/welcome.dart`

---

### Hardcoded Strings Organization (Completed January 2026)

**Issue:** UI strings were hardcoded throughout the application.

**Resolution:**
- Created centralized string constants directory at `lib/resources/strings/`
- Organized strings by domain with dedicated files:
  - `common_strings.dart` - Shared UI labels, button text, form labels
  - `attention_strings.dart` - Attention domain instructions and labels
  - `language_strings.dart` - Language domain strings
  - `memory_strings.dart` - Memory domain strings
  - `praxis_strings.dart` - Praxis domain strings
  - `gnosis_strings.dart` - Gnosis domain strings
  - `executive_strings.dart` - Executive function domain strings
  - `summary_strings.dart` - Summary/results screen strings
  - `strings.dart` - Barrel file for centralized exports
- Updated 50+ screen files to use string constants
- Extracted 300+ hardcoded strings

**Files Added:**
- `lib/resources/strings/` directory with 9 new files

**Files Modified:**
- 48 domain testing and summary screen files

**Commit:** `974db12 feat: organize hardcoded strings into domain-specific constant classes`

**Next Steps:** Consider implementing Flutter's `intl` package for full internationalization support.

---

### Navigation Pattern Standardization (Completed January 2026)

**Issue:** Mixed navigation approaches across test screens.

**Resolution:**
- Audited all 45+ domain testing screens for navigation patterns
- Confirmed consistent use of `Navigator.pop()` for returning from test screens (15+ screens verified)
- All assessment screens properly use `Navigator.of(context).pop()` after task completion
- Navigation patterns documented in CLAUDE.md

**Findings:**
- Assessment screens: All use `Navigator.pop()` correctly
- Video instruction screens: Properly navigate to next screen after video completion
- No inconsistent navigation patterns found

---

### Video Player Resource Management (Completed January 2026)

**Issue:** Video controllers may not be properly disposed in all screens.

**Resolution:**
- Audited all video player usages across domain testing screens
- All video controllers are properly disposed in `dispose()` methods
- Video players correctly call `_controller.dispose()` when widget is removed from tree
- No memory leaks detected from video player usage

**Findings:**
- All video instruction screens properly implement `dispose()` method
- Video controllers are disposed before `super.dispose()` is called
- No orphaned video controllers found in codebase

---

### Widget Tests for Assessment Screens (Completed January 2026)

**Issue:** Domain testing screens lacked widget tests.

**Resolution:**
- Created reusable test utilities at `test/helpers/widget_test_helpers.dart`:
  - `setupTestScreen()` - Configures test screen size for proper ListView rendering
  - `wrapWithProviders()` / `wrapWithModel()` - Provider wrappers for widget tests
  - `createTestModel()` / `createTestModelWithScores()` - Test model factories
  - Common finders: `findTaskCompletedButton()`, `findRadioOption()`, `findRadioGroup()`
  - Helper functions: `tapRadioOption()`, `tapTaskCompleted()`, `isRadioSelected()`
- Created widget tests for representative assessment screens:
  - `test/src/domain_testing/gnosis/clock_drawing_test_test.dart` (8 tests)
  - `test/src/domain_testing/language/object_naming_test.dart` (8 tests)
  - `test/src/domain_testing/executive_function/animal_naming_task_test.dart` (16 tests)
- Created integration tests at `integration_test/assessment_flow_test.dart` (4 tests):
  - Navigation flow tests
  - Score persistence across screens
  - Score editing and persistence
  - All assessment options accessibility

**Test Coverage:**
- Total tests: 143 (up from 111)
- New widget tests: 32
- New integration tests: 4

**Files Added:**
- `test/helpers/widget_test_helpers.dart`
- `test/src/domain_testing/gnosis/clock_drawing_test_test.dart`
- `test/src/domain_testing/language/object_naming_test.dart`
- `test/src/domain_testing/executive_function/animal_naming_task_test.dart`
- `integration_test/assessment_flow_test.dart`

---

### Widget Reuse Opportunities (Completed January 2026)

**Issue:** Similar UI patterns repeated across assessment screens.

**Resolution:**
- Created reusable assessment widget library at `lib/src/widgets/assessment/`
- Extracted common patterns into shared widgets:
  - `InstructionCard` - Color-coded instruction cards (purple=examiner, yellow=patient, green=scoring) with factory constructors
  - `ScoringRadioGroup` - Radio button scoring tables with standard N/E/I options and vertical variant
  - `TaskCompletionButton` - Consistent completion button with optional navigation and disabled state support
- Created barrel file for easy imports

**Files Added:**
- `lib/src/widgets/assessment/instruction_card.dart`
- `lib/src/widgets/assessment/scoring_radio_group.dart`
- `lib/src/widgets/assessment/task_completion_button.dart`
- `lib/src/widgets/assessment/assessment_widgets.dart` (barrel file)

**Next Steps:** Existing screens can be incrementally updated to use these shared widgets.

---

### Commented-Out Dependencies (Completed January 2026)

**Issue:** Unused dependencies commented out in `pubspec.yaml`.

**Resolution:**
- Removed commented `pdf_render_flutter` and `ping_flutter` dependencies from pubspec.yaml
- These were legacy dependencies that were never used in the codebase

---

### Model Validation and Testing (Completed January 2026)

**Issue:** `initFromTestSummary` method lacked validation; MicaScoreModel lacked unit tests.

**Resolution:**
- Created `score_validation.dart` with validation constants for all score types
- Added debug assertions to all setters in MicaScoreModel for range/relationship validation
- Created comprehensive unit test suite (`test/src/models/mica_score_model_test.dart`) with 68 tests:
  - Initialization tests (all defaults)
  - Patient info setter tests
  - Language, Memory, Attention, Executive, Praxis, Gnosis domain setter tests
  - initFromTestSummary and resetScores tests
  - Listener notification tests
  - ScoreValidation constant and helper method tests

**Files Added:**
- `lib/src/models/score_validation.dart` - Validation constants and helpers
- `test/src/models/mica_score_model_test.dart` - Comprehensive unit tests

**Files Modified:**
- `lib/src/models/mica_score_model.dart` - Added debug assertions to ~30 setters

---

### Model Expansion (Completed January 2026)

**Issue:** MicaScoreModel lacked granular scoring for all cognitive domains.

**Resolution:**
- Added 31 new fields for Gnosis, Language, and Memory domains
- Implemented corresponding getters and setters
- Updated `initFromTestSummary` and `resetScores` methods
- Resolved 26 TODO items across domain testing screens

**Commit:** `56989a9 feat: expand MicaScoreModel with granular scoring for all cognitive domains`

---

### RadioGroup Pattern Migration (Completed January 2026)

**Issue:** Inconsistent scoring UI patterns across assessment screens.

**Resolution:**
- Migrated multiple screens to standardized RadioGroup pattern
- Screens updated: visuospatial_praxis, shortterm_memory_visual, line_drawing, visual_working_memory

**Commits:**
- `df92e65 feat: migrate visuospatial_praxis to RadioGroup pattern - FINAL FILE`
- `04f40b5 feat: migrate shortterm_memory_visual to RadioGroup pattern`
- `2c9f286 feat: migrate line_drawing to RadioGroup pattern`
- `e068d1c feat: migrate visual_working_memory to RadioGroup pattern`

---

## How to Use This Document

### Adding New Items

When identifying technical debt:
1. Add entry under appropriate priority section
2. Include: Issue, Location (if applicable), Current State, Impact, Recommended Actions, Effort Estimate
3. Update the Summary table

### Resolving Items

When fixing technical debt:
1. Move item to "Completed Items" section
2. Add resolution description and relevant commit(s)
3. Update the Summary table
4. Update "Last Updated" date

### Priority Definitions

- **High**: Actively causing issues or blocking improvements
- **Medium**: Should be addressed in next few sprints
- **Low**: Nice to have, address when convenient

### Effort Estimates

- **Trivial**: < 1 hour
- **Low**: 1-4 hours
- **Medium**: 1-2 days
- **High**: 3+ days or requires architectural changes
