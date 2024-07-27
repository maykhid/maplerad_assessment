import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:maplerad_assessment/core/navigation/navigation_service.dart';
import 'package:maplerad_assessment/app/ui/resource/app_colors.dart'
    show AppColors;
import 'package:maplerad_assessment/app/ui/resource/app_text_styles.dart';
import 'package:maplerad_assessment/core/widgets/widgets.dart'
    show AppPasscodeField, AppKeypad;

class PasscodeScreen extends StatefulWidget {
  const PasscodeScreen({super.key});

  @override
  State<PasscodeScreen> createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends State<PasscodeScreen> {
  final navigationService = NavigationService.instance;

  Map _keyMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              'Create pin',
              style: AppTextStyles.headerStyle,
            ),
            Text(
              'Pin should be 6 to 12 digits long',
              style: AppTextStyles.regular14.copyWith(color: AppColors.grey),
            ),
            const Spacer(),

            // passcode field
            AppPasscodeField(keyMap: _keyMap),

           const Spacer(),

            // custom keypad
            AppKeypad(
              onChanged: (input, map) {
                setState(() {
                  _keyMap = map;
                });
              },
              onDoneAction: (input) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Durations.extralong4,
                    content: Text('Your passcode: $input'),
                  ),
                );
                navigationService.popAndPushNamed('/home');
              },
            ),

            const Gap(30),
          ],
        ),
      ),
    );
  }
}
