import 'package:athlink/shared/theme/text_style.dart';
import 'package:athlink/shared/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: AppTextStyles.fontFamily,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.lightGrey,
        error: AppColors.error,
        surface: AppColors.black,
      ),
      // backgroundColor: AppColors.black,
      scaffoldBackgroundColor: AppColors.black,
      textTheme: GoogleFonts.archivoTextTheme(
          TextThemes.darkTextTheme
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.black,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.lightGrey,
        selectedIconTheme:IconThemeData(
            color: AppColors.primary
        ) ,
        unselectedIconTheme: IconThemeData(
            color: AppColors.lightGrey
        ),
      ),
      primaryTextTheme: TextThemes.primaryTextTheme,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.black,
        titleTextStyle: AppTextStyles.h1,
      ),
    );
  }

  /// Light theme data of the app
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      textTheme: GoogleFonts.archivoTextTheme(
        TextThemes.darkTextTheme
      ),
      primaryTextTheme: TextThemes.primaryTextTheme,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.lightGrey,
        error: AppColors.error,
      ),
      appBarTheme:  AppBarTheme(
        backgroundColor: AppColors.black,
        scrolledUnderElevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.black,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.black,
        ),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 6,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.black,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.lightGrey,
        selectedIconTheme:IconThemeData(
          color: AppColors.primary
        ) ,
        unselectedIconTheme: IconThemeData(
          color: AppColors.lightGrey
        ),
        showUnselectedLabels: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      scaffoldBackgroundColor: AppColors.black.withOpacity(0.45),
      useMaterial3: true,
    );
  }
}