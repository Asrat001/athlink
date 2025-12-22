const double cPadding = 24.0;
const double cBorderRadius = 5.0;
const double cLineSize = 6.0;
const double cDotSize = 7.0;
const double cSelectedDotSize = 14.0;
const double elevation = 4.0;

// Buttons
const double cButtonSize = 48.0;
const double cButtonPadding = 10.0;

const double cSplashRadius = 32.0;
const double cSmallSplashRadius = 24.0;

//hashmethod

//// base url
const String cBaseUrl = 'http://139.59.141.150:4000/api/v1';
const String fileBaseUrl = 'http://139.59.141.150:4000';

// List Items
const double cListItemPadding = 18.0;
const double cListItemSpace = 12.0;

// Animations
const Duration cFastAnimationDuration = Duration(milliseconds: 150);
const Duration cTransitionDuration = Duration(milliseconds: 300);
const Duration cAnimationDuration = Duration(milliseconds: 500);
const Duration cAnimatedListDuration = Duration(milliseconds: 600);
//
String? emailValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter an email address';
  }

  // Regular expression for email validation
  final emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$',
    caseSensitive: false,
  );

  if (!emailRegex.hasMatch(value.trim())) {
    return 'Please enter a valid email address (e.g., user@domain.com)';
  }
  return null;
}

// BottomSheet
const double cBottomSheetBorderRadius = 28.0;
