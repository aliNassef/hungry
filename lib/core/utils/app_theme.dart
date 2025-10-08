import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungry/core/utils/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.robotoTextTheme(),
    primarySwatch: Colors.green, // Your app's primary theme color
    // This is where you customize the selection colors
    textSelectionTheme: TextSelectionThemeData(
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
