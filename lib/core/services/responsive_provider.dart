
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';





// Provider for responsive design values
final responsiveProvider = Provider.family<ResponsiveValues, BuildContext>((ref, context) {
final screenWidth = MediaQuery.of(context).size.width;
final screenHeight = MediaQuery.of(context).size.height;
final isTablet = screenWidth > 600;

return ResponsiveValues(
screenWidth: screenWidth,
screenHeight: screenHeight,
isTablet: isTablet,
horizontalPadding: isTablet ? 40.0 : 24.0,
verticalPadding: isTablet ? 40.0 : 32.0,
titleFontSize: isTablet ? 36.0 : 28.0,
descriptionFontSize: isTablet ? 18.0 : 16.0,
buttonFontSize: isTablet ? 18.0 : 16.0,
buttonHeight: isTablet ? 60.0 : 50.0,
indicatorSize: isTablet ? 10.0 : 8.0,
activeIndicatorWidth: isTablet ? 24.0 : 20.0,
);
});

class ResponsiveValues {
final double screenWidth;
final double screenHeight;
final bool isTablet;
final double horizontalPadding;
final double verticalPadding;
final double titleFontSize;
final double descriptionFontSize;
final double buttonFontSize;
final double buttonHeight;
final double indicatorSize;
final double activeIndicatorWidth;

ResponsiveValues({
required this.screenWidth,
required this.screenHeight,
required this.isTablet,
required this.horizontalPadding,
required this.verticalPadding,
required this.titleFontSize,
required this.descriptionFontSize,
required this.buttonFontSize,
required this.buttonHeight,
required this.indicatorSize,
required this.activeIndicatorWidth,
});
}