import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maplerad_assessment/app/ui/resource/ui.dart';
import 'package:maplerad_assessment/core/navigation/navigation_service.dart';
import 'package:maplerad_assessment/app/ui/screens/passcode/passcode_screen.dart';
import 'package:maplerad_assessment/core/widgets/widgets.dart'
    show AppBottomNavigation;

class MapleradApp extends StatelessWidget {
  const MapleradApp({super.key});

  @override
  Widget build(BuildContext context) {
    // navigation instance
    final navigationService = NavigationService.instance;

    return MaterialApp(
      debugShowCheckedModeBanner: kDebugMode,
      theme: AppTheme.lightTheme,
      navigatorKey: navigationService.navigationKey,
      initialRoute: '/',
      routes: {
        '/': (context) => const PasscodeScreen(),
        '/home': (context) => const AppBottomNavigation(),
      },
    );
  }
}
