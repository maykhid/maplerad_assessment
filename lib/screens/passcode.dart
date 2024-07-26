import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maplerad_assessment/shared/ui/app_colors.dart' show AppColors;
import 'package:maplerad_assessment/shared/ui/app_text_styles.dart';
import 'package:maplerad_assessment/widgets/maplerad_keypad.dart';
import 'package:maplerad_assessment/widgets/passcode_field.dart';

class PasscodeScreen extends StatefulWidget {
  const PasscodeScreen({super.key});

  @override
  State<PasscodeScreen> createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends State<PasscodeScreen> {
  Map _keyMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Create pin',
            style: AppTextStyles.headerStyle,
          ),
          Text(
            'Pin should be 6 to 12 digits long',
            style: GoogleFonts.bricolageGrotesque(
              textStyle:
                  AppTextStyles.regular14.copyWith(color: AppColors.grey),
            ),
          ),
          const Gap(200),

          // passcode field
          PasscodeField(keyMap: _keyMap),

          const Spacer(),

          // custom keypad
          MapleradKeypad(
            onChanged: (input, map) {
              setState(() {
                _keyMap = map;
              });
            },
            onDoneAction: (input) {},
          ),

          const Gap(40),
        ],
      ),
    );
  }
}
