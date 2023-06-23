import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/design/utils/constants/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    /* General */
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,

    /* AppBar */
    appBarTheme: const AppBarTheme(
      foregroundColor: AppColors.white,
      elevation: 0,
    ),

    /* Bottom Navigation Bar */
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed, //no animation when switching tabs
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      backgroundColor: AppColors.black,
    ),

    /* Elevated Button */
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );

  static final darkTheme = ThemeData();
}
