import 'package:flutter/material.dart';
import 'package:maplerad_assessment/app/resource/app_colors.dart';

class AppPasscodeField extends StatelessWidget {
  const AppPasscodeField({
    this.keyMap = const {},
    this.fieldLength = 6,
    super.key,
  });

  final Map keyMap;
  final int fieldLength;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(fieldLength, (index) {
          return _PasscodeDot(
            hasChar: keyMap.containsKey(index),
          );
        }),
      ),
    );
  }
}

class _PasscodeDot extends StatelessWidget {
  const _PasscodeDot({
    required this.hasChar,
  });

  final bool hasChar;

  @override
  Widget build(BuildContext context) {
    return hasChar
        ? Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.circular(6),
            ),
            child: UnconstrainedBox(
              child: AnimatedContainer(
                duration: const Duration(seconds: 5),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          )
        : Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: AppColors.pinGrey,
              borderRadius: BorderRadius.circular(7),
            ),
          );
  }
}
