import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maplerad_assessment/core/navigation/navigation_service.dart';
import 'package:maplerad_assessment/app/screens/passcode_screen.dart';
import 'package:maplerad_assessment/app/resource/app_colors.dart';
import 'package:maplerad_assessment/core/widgets/widgets.dart' show AppBottomNavigation;


class MapleradApp extends StatelessWidget {
  const MapleradApp({super.key});

  @override
  Widget build(BuildContext context) {
    // navigation instance
    final navigationService = NavigationService.instance;

    // theme
    final themeData = ThemeData(
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: Colors.white),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
      ),
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'NunitoSans',
    );

    return MaterialApp(
      debugShowCheckedModeBanner: kDebugMode,
      theme: themeData,
      navigatorKey: navigationService.navigationKey,
      initialRoute: '/',
      routes: {
        '/': (context) => const PasscodeScreen(),
        '/home': (context) => const AppBottomNavigation(),
      },
    );
  }
}
