class Validators {
  /// Email validation
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter an email address';
    }

    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$',
      caseSensitive: false,
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email address (e.g., user@domain.com)';
    }
    return null;
  }

  /// Ethiopian phone number validation
  /// - Starts with +251 or 0
  /// - Followed by 9 digits
  static String? ethiopianPhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a phone number';
    }

    final phoneRegex = RegExp(
      r'^(?:\+251|0)?9\d{8}$',
    );

    if (!phoneRegex.hasMatch(value.trim())) {
      return 'Please enter a valid Ethiopian phone number (e.g., +2519XXXXXXXX or 09XXXXXXXX)';
    }
    return null;
  }

  /// Password validation
  /// - At least 8 chars
  /// - Must contain uppercase, lowercase, number, and special char
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }

    final passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );

    if (!passwordRegex.hasMatch(value)) {
      return 'Password must be at least 8 characters long and include upper, lower, number, and special character';
    }
    return null;
  }

  /// Confirm password validation
  static String? confirmPassword(String? value, String? original) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != original) {
      return 'Passwords do not match';
    }
    return null;
  }

  /// Generic required field
  static String? requiredField(String? value, {String fieldName = "This field"}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Number validation
  static String? number(String? value, {bool allowDecimal = false}) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a number';
    }

    final regex = allowDecimal ? RegExp(r'^\d+(\.\d+)?$') : RegExp(r'^\d+$');

    if (!regex.hasMatch(value)) {
      return 'Please enter a valid ${allowDecimal ? "number" : "integer"}';
    }
    return null;
  }
}
