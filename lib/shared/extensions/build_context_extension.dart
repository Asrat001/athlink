import 'package:athlink/shared/utils/app_helpers.dart';
import 'package:flutter/material.dart';

/// Extension methods for BuildContext to provide convenient access to common utilities
extension BuildContextX on BuildContext {
  /// Display a success toast message
  ///
  /// Usage: `context.showSuccess('Operation completed successfully');`
  void showSuccess(String message) {
    AppHelpers.showSuccessToast(this, message);
  }

  /// Display an error toast message
  ///
  /// Usage: `context.showError('Something went wrong');`
  void showError(String message) {
    AppHelpers.showErrorToast(this, message);
  }

  /// Display an info toast message
  ///
  /// Usage: `context.showInfo('New feature available');`
  void showInfo(String message) {
    AppHelpers.showInfoToast(this, message);
  }

  /// Display a warning toast message
  ///
  /// Usage: `context.showWarning('Please check your input');`
  void showWarning(String message) {
    AppHelpers.showWarningToast(this, message);
  }

  /// Display a loading toast message
  ///
  /// Usage: `context.showLoading('Processing...');`
  void showLoading(String message) {
    AppHelpers.showLoadingToast(this, message);
  }

  /// Display a no connection toast message
  ///
  /// Usage: `context.showNoConnection();`
  void showNoConnection() {
    AppHelpers.showNoConnectionSnackBar(this);
  }

  /// Dismiss the keyboard
  ///
  /// Usage: `context.dismissKeyboard();`
  void dismissKeyboard() {
    AppHelpers.dismissKeyboard(this);
  }

  /// Get screen width
  ///
  /// Usage: `context.width`
  double get width => MediaQuery.of(this).size.width;

  /// Get screen height
  ///
  /// Usage: `context.height`
  double get height => MediaQuery.of(this).size.height;

  /// Check if keyboard is visible
  ///
  /// Usage: `if (context.isKeyboardVisible) { ... }`
  bool get isKeyboardVisible => MediaQuery.of(this).viewInsets.bottom > 0;
}
