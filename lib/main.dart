import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maplerad_assessment/navigation/navigation_service.dart';
import 'package:maplerad_assessment/screens/passcode.dart';
import 'package:maplerad_assessment/shared/ui/app_colors.dart';
import 'package:maplerad_assessment/widgets/bottom_nav_bar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationService = NavigationService();
    return MaterialApp(
      debugShowCheckedModeBanner: kDebugMode,
      theme: ThemeData(
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(backgroundColor: Colors.white),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          surfaceTintColor: AppColors.background,
        ),
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'NunitoSans',
        // textTheme: GoogleFonts.nunitoSansTextTheme(textTheme),
      ),
      navigatorKey: navigationService.navigationKey,
      initialRoute: '/',
      routes: {
        '/': (context) => const PasscodeScreen(),
        '/home': (context) => const BottomNavigation(),
      },
    );
  }
}
