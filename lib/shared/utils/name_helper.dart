class NameHelper {
  static String getSponsorDisplayName({
    String? topLevelName,
    String? profileName,
    String? email,
  }) {
    if (topLevelName != null && topLevelName.trim().isNotEmpty) {
      return topLevelName.trim();
    }
    if (profileName != null && profileName.trim().isNotEmpty) {
      return profileName.trim();
    }
    if (email != null && email.trim().isNotEmpty) {
      final String prefix = email.split('@').first;
      if (prefix.isNotEmpty) {
        return prefix[0].toUpperCase() + prefix.substring(1);
      }
    }
    return 'Brand';
  }
}
