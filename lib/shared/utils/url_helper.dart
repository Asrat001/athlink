import 'package:athlink/shared/constant/constants.dart';

class UrlHelper {
  /// Converts a relative image path to a full URL
  /// Returns empty string if path is null or empty
  /// Returns the path as-is if it already starts with http
  static String getFullImageUrl(String? path) {
    if (path == null || path.isEmpty) return '';
    if (path.startsWith('http')) return path;
    return '$fileBaseUrl$path';
  }
}
