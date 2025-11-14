/// Centralized asset path constants
///
/// Provides a single source of truth for all asset paths used in the app.
/// This helps prevent typos and makes it easier to refactor asset locations.
class AssetPaths {
  // Private constructor to prevent instantiation
  AssetPaths._();

  // ==================== Images ====================

  /// Athlete placeholder image
  static const String athletePlaceholder = 'assets/images/athlete.png';

  /// Country flag placeholder
  static const String flagPlaceholder = 'assets/images/flag.png';

  /// Onboarding images
  static const String onboarding1 = 'assets/images/on1.jpg';
  static const String onboarding2 = 'assets/images/on2.jpg';
  static const String onboarding3 = 'assets/images/on3.jpg';

  /// Search icon (PNG)
  static const String searchIcon = 'assets/images/search.png';

  /// Company icon
  static const String companyIcon = 'assets/images/company.png';

  /// Social login icons
  static const String googleIcon = 'assets/images/google_icon.png';
  static const String appleIcon = 'assets/images/apple_icon.png';
  static const String googleLogo = 'assets/images/google_logo.png';

  /// Edit icon
  static const String editIcon = 'assets/images/edit.svg';

  // ==================== SVG Icons ====================

  /// Close icon (SVG)
  static const String closeSvg = 'assets/images/close.svg';

  /// Search icon (SVG)
  static const String searchSvg = 'assets/images/search.svg';

  /// Filter icons
  static const String filterSvg = 'assets/images/filter.svg';
  static const String filterFilledSvg = 'assets/images/filter_filled.svg';

  /// Home icon
  static const String homeSvg = 'assets/images/home.svg';

  /// Athlink logo
  static const String athlinkLogo = 'assets/images/atlink_logo.svg';

  // ==================== Logo Icons ====================

  /// Bottom navigation bar logos
  static const String homeNavLogo = 'assets/logos/home.svg';
  static const String settingNavLogo = 'assets/logos/setting.svg';
  static const String createNavLogo = 'assets/logos/create.svg';
  static const String watchlistNavLogo = 'assets/logos/watchlist.svg';
  static const String accountNavLogo = 'assets/logos/account.svg';
}
