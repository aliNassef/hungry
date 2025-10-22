import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.robotoTextTheme(),
    primarySwatch: Colors.green,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      circularTrackColor: AppColors.primary,
      color: AppColors.lightGrey,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: AppColors.lightGrey,
      selectionHandleColor: AppColors.lightGrey,
      cursorColor: AppColors.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
    ),
  );
}
