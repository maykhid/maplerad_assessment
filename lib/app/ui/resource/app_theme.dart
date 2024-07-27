import 'package:flutter/material.dart';
import 'package:maplerad_assessment/app/ui/resource/ui.dart' show AppColors, AppTextStyles;

class AppTheme {
  // theme
  static get lightTheme => ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedLabelStyle: AppTextStyles.extraBold10,
      unselectedLabelStyle: AppTextStyles.regular10,
      selectedItemColor: AppColors.blue,
      unselectedItemColor: AppColors.grey,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      surfaceTintColor: AppColors.background,
    ),
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: 'NunitoSans',
  );
}
