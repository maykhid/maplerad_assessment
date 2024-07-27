import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maplerad_assessment/navigation/app_navigation_config.dart';
import 'package:maplerad_assessment/shared/ui/app_colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(
      debugShowCheckedModeBanner: kDebugMode,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          surfaceTintColor: AppColors.background,
        ),
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'NunitoSans',
        // textTheme: GoogleFonts.nunitoSansTextTheme(textTheme),
      ),
      routerConfig: AppRouterConfig.goRouter,
    );
  }
}
