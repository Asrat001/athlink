# Refactoring Plan: posts_widget.dart (Updated with Shared Components)

## Problem Statement

The `posts_widget.dart` file has grown to **1449 lines** with multiple responsibilities. This violates the **Single Responsibility Principle** and makes the file difficult to maintain.

## Architecture Principle: Shared vs Feature-Specific

**Rule**: If a component is used (or could be used) in **more than one feature**, it belongs in `shared/widgets/`. Otherwise, it stays in the feature folder.

### Analysis of Current Components:

| Component | Used In | Location |
|-----------|---------|----------|
| Currency Dropdown | Profile (job posts), potentially Manage (milestones) | ✅ **shared/** |
| Date Picker Field | Profile, Manage (milestones), potentially others | ✅ **shared/** |
| Media Picker | Profile, potentially Manage, potentially Messages | ✅ **shared/** |
| Sport Category Chips | Profile only (athlete sports) | ❌ **profile/** |
| Post Card | Profile only (job posts display) | ❌ **profile/** |
| Post Feed Section | Profile only | ❌ **profile/** |
| Job Creation Modal | Profile only | ❌ **profile/** |
| Job Form Steps | Profile only | ❌ **profile/** |
| Info Item | Profile only (could be shared later) | ❌ **profile/** |
| Divider Line | Already exists in Flutter, not needed | 🗑️ **Delete** |

---

## Proposed Directory Structure

```
lib/
├── shared/
│   └── widgets/
│       ├── forms/
│       │   ├── custom_email_field.dart          # Existing
│       │   ├── custom_password_field.dart       # Existing
│       │   ├── custom_text_field.dart           # Existing
│       │   ├── input_field.dart                 # Existing
│       │   ├── rounded_button.dart              # Existing
│       │   ├── currency_dropdown.dart           # ✨ NEW - Shared
│       │   ├── date_picker_field.dart           # ✨ NEW - Shared
│       │   └── media_picker_box.dart            # ✨ NEW - Shared
│       └── common/
│           └── info_item.dart                   # ✨ NEW - Shared (future-proof)
│
└── features/
    └── profile/
        └── presentation/
            └── screens/
                └── widgets/
                    └── job_post/
                        ├── post_feed_section.dart       # Feature-specific
                        ├── post_card.dart               # Feature-specific
                        ├── create_job_modal.dart        # Feature-specific
                        ├── job_form_step_one.dart       # Feature-specific
                        ├── job_form_step_two.dart       # Feature-specific
                        └── sport_category_chips.dart    # Feature-specific
```

---

## File Breakdown

### 📦 **SHARED COMPONENTS** (5 files)

#### 1. **shared/widgets/forms/currency_dropdown.dart** (~80 lines)
**Purpose**: Reusable currency dropdown for any financial input

**Why Shared**: 
- Used in Profile (job budget)
- Could be used in Manage (milestone funds)
- Could be used in any payment/budget feature

**Contents**:
```dart
class CurrencyDropdown extends StatelessWidget {
  final String selectedCurrency;
  final Function(String) onChanged;
  final List<String> currencies;
  
  // Predefined: ['Yuan', 'USD', 'EUR', 'GBP', 'JPY', 'ETB']
}
```

---

#### 2. **shared/widgets/forms/date_picker_field.dart** (~100 lines)
**Purpose**: Reusable date picker text field

**Why Shared**:
- Used in Profile (job timeline)
- Used in Manage (milestone timeline) ✅ Already confirmed
- Could be used in any date input scenario

**Contents**:
```dart
class DatePickerField extends StatelessWidget {
  final String? selectedDate;
  final String hint;
  final Function(DateTime) onDateSelected;
  final DateTime? firstDate;
  final DateTime? lastDate;
  
  // Includes date picker dialog with app theme
}
```

**Note**: This will **replace** the duplicate date picker logic in `create_milestone_widget.dart`

---

#### 3. **shared/widgets/forms/media_picker_box.dart** (~180 lines)
**Purpose**: Media upload box for images and videos

**Why Shared**:
- Used in Profile (job media)
- Could be used in Messages (send media)
- Could be used in any media upload scenario

**Contents**:
```dart
class MediaPickerBox extends StatefulWidget {
  final MediaType type; // image or video
  final File? selectedFile;
  final Uint8List? thumbnail;
  final Function(File, Uint8List?) onMediaSelected;
  final VoidCallback? onRemove;
  
  // Handles image/video picking, preview, and removal
}
```

---

#### 4. **shared/widgets/common/info_item.dart** (~40 lines)
**Purpose**: Display value + label pair (e.g., "500 $/m", "6 months")

**Why Shared**:
- Used in Profile (job post cards)
- Could be used in Manage (milestone stats)
- Could be used in any stats/info display

**Contents**:
```dart
class InfoItem extends StatelessWidget {
  final String value;
  final String label;
  final Color? valueColor;
  final Color? labelColor;
}
```

---

### 🎯 **PROFILE-SPECIFIC COMPONENTS** (6 files)

#### 5. **profile/presentation/screens/widgets/job_post/post_feed_section.dart** (~120 lines)
**Purpose**: Display list of job posts with "Add" button

**Why Profile-Specific**: Only used in profile screen to show job posts

**Contents**:
- `PostFeedSection` widget
- `_calculateDuration()` helper
- `_openCreateJobModal()` function

---

#### 6. **profile/presentation/screens/widgets/job_post/post_card.dart** (~200 lines)
**Purpose**: Display individual job post card

**Why Profile-Specific**: Specific to job post data structure

**Contents**:
- `PostCard` widget
- Job-specific layout (image, title, description, budget, duration, agency)

---

#### 7. **profile/presentation/screens/widgets/job_post/create_job_modal.dart** (~200 lines)
**Purpose**: Container for 2-step job creation flow

**Why Profile-Specific**: Specific to job creation workflow

**Contents**:
- `CreateJobModal` widget
- State management for form
- Navigation between steps
- `_submitJobPost()` method

---

#### 8. **profile/presentation/screens/widgets/job_post/job_form_step_one.dart** (~150 lines)
**Purpose**: First step of job creation (basic info)

**Why Profile-Specific**: Specific to job post fields

**Contents**:
- `JobFormStepOne` widget
- Fields: Title, Category, Location, Description, Budget, Currency
- Uses shared `CurrencyDropdown`

---

#### 9. **profile/presentation/screens/widgets/job_post/job_form_step_two.dart** (~350 lines)
**Purpose**: Second step of job creation (media, dates, requirements)

**Why Profile-Specific**: Specific to job post creation

**Contents**:
- `JobFormStepTwo` widget
- Uses shared `MediaPickerBox`
- Uses shared `DatePickerField`
- Requirements field

---

#### 10. **profile/presentation/screens/widgets/job_post/sport_category_chips.dart** (~100 lines)
**Purpose**: Horizontal scrollable sport category chips

**Why Profile-Specific**: Specific to athlete sports/categories

**Contents**:
- `SportCategoryChips` widget
- Chip selection logic
- Horizontal scroll

---

## Migration Strategy

### Phase 1: Create Shared Components (2 hours)
1. ✅ Create `shared/widgets/forms/currency_dropdown.dart`
2. ✅ Create `shared/widgets/forms/date_picker_field.dart`
3. ✅ Create `shared/widgets/forms/media_picker_box.dart`
4. ✅ Create `shared/widgets/common/info_item.dart`

### Phase 2: Create Profile-Specific Components (2 hours)
1. ✅ Create `profile/.../job_post/` directory
2. ✅ Create `post_feed_section.dart`
3. ✅ Create `post_card.dart`
4. ✅ Create `create_job_modal.dart`
5. ✅ Create `job_form_step_one.dart`
6. ✅ Create `job_form_step_two.dart`
7. ✅ Create `sport_category_chips.dart`

### Phase 3: Update Dependencies (1 hour)
1. ✅ Update imports in all new files
2. ✅ Update `post_feed_section.dart` to use new components
3. ✅ Update `create_job_modal.dart` to use new components

### Phase 4: Refactor Manage Feature (1 hour)
1. ✅ Update `create_milestone_widget.dart` to use shared `DatePickerField`
2. ✅ Remove duplicate date picker logic
3. ✅ Test milestone creation

### Phase 5: Testing (1-2 hours)
1. ✅ Test job post display
2. ✅ Test job creation flow
3. ✅ Test milestone creation (to verify shared components)
4. ✅ Test media upload
5. ✅ Test date selection

### Phase 6: Cleanup (30 min)
1. ✅ Delete old `posts_widget.dart`
2. ✅ Update external imports
3. ✅ Run linter

---

## Benefits

### ✅ **Reusability**
- Shared components can be used across features
- Reduces code duplication
- Consistent UI/UX across the app

### ✅ **Maintainability**
- Single source of truth for shared components
- Fix bugs once, benefit everywhere
- Clear separation of concerns

### ✅ **Scalability**
- Easy to add new features using existing components
- Easy to extend shared components with new features

### ✅ **Developer Experience**
- Clear architecture: shared vs feature-specific
- Easy to find components
- Faster development

---

## Bonus: Refactor Manage Feature

As a bonus, we'll refactor `create_milestone_widget.dart` to use the new shared `DatePickerField`:

**Before** (duplicate code):
```dart
// In create_milestone_widget.dart
Future<void> _pickDate({required bool isStart}) async {
  final picked = await showDatePicker(...);
  // 30+ lines of duplicate code
}
```

**After** (using shared component):
```dart
// In create_milestone_widget.dart
DatePickerField(
  hint: "Start Date",
  selectedDate: _startDate,
  onDateSelected: (date) => setState(() => _startDate = date),
)
```

**Savings**: ~60 lines removed from `create_milestone_widget.dart`

---

## Estimated Effort

- **Phase 1**: 2 hours (shared components)
- **Phase 2**: 2 hours (profile components)
- **Phase 3**: 1 hour (dependencies)
- **Phase 4**: 1 hour (manage refactor)
- **Phase 5**: 1-2 hours (testing)
- **Phase 6**: 30 minutes (cleanup)

**Total**: ~7-8 hours

---

## Summary

This refactoring follows the **shared vs feature-specific** principle:

- **5 shared components** → Can be used across features
- **6 profile-specific components** → Only used in profile feature
- **Bonus**: Refactor manage feature to use shared components
- **Result**: Better architecture, less duplication, more reusability
