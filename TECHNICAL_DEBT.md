# Technical Debt Tracker

This document tracks known technical debt, areas for improvement, and planned refactoring work in the MICA application.

**Last Updated:** January 17, 2026

---

## Summary

| Category | Priority | Items |
|----------|----------|-------|
| Code Quality | Medium | 1 |
| Testing | - | 0 |
| Architecture | Low | 1 |
| Dependencies | Low | 1 |
| Documentation | Low | 1 |

---

## High Priority

_No high priority items currently._

---

## Medium Priority

### Hardcoded Strings

**Issue:** UI strings are hardcoded throughout the application.

**Current State:**
- Test instructions, labels, and messages are inline
- No internationalization support
- Changing text requires code changes

**Impact:** Difficult to maintain consistency, impossible to localize.

**Recommended Actions:**
1. Extract strings to a centralized location (`lib/resources/strings.dart`)
2. Consider implementing Flutter's `intl` package for localization
3. Group strings by domain/feature

**Effort Estimate:** Medium-High

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

### Error Handling

**Issue:** Limited error handling and user feedback for failures.

**Current State:**
- Video loading failures may show blank screens
- PDF generation errors not gracefully handled
- No offline capability or error recovery

**Recommended Actions:**
1. Add error boundaries around video players
2. Implement graceful degradation for failed operations
3. Add user-friendly error messages
4. Consider implementing retry logic for recoverable errors

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
