import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;

  double widthPct(double percent) => screenWidth * percent;
  double heightPct(double percent) => screenHeight * percent;

  double get shortestSide => screenSize.shortestSide;

  bool get isSmallDevice => shortestSide < 600;
  bool get isTablet => shortestSide >= 600 && shortestSide < 1024;
  bool get isDesktop => shortestSide >= 1024;
}