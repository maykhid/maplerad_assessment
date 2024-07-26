import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maplerad_assessment/screens/home.dart';
import 'package:maplerad_assessment/screens/passcode.dart';
import 'package:maplerad_assessment/shared/ui/app_colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: kDebugMode,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.background,
              surfaceTintColor: AppColors.background),
          scaffoldBackgroundColor: AppColors.background,
          textTheme: GoogleFonts.nunitoSansTextTheme()),
      home: const PasscodeScreen(),
    );
  }
}
