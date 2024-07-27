import 'package:flutter/material.dart';
import 'package:maplerad_assessment/app/ui/resource/ui.dart' show AppTextStyles, AppColors;
import 'package:maplerad_assessment/core/utils/sized_context.dart';
import 'package:maplerad_assessment/core/widgets/widgets.dart';

class TransactionOptions extends StatelessWidget {
  const TransactionOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppButton(
          width: context.width * 0.4,
          height: 40,
          text: 'Send Money',
          onPressed: () {},
        ),
        AppButton(
          width: context.width * 0.4,
          height: 40,
          text: 'Add Money',
          buttonTextStyle: AppTextStyles.semiBold14.copyWith(
            color: AppColors.blue,
          ),
          backgroundColor: AppColors.lightBlue,
          onPressed: () {},
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: const Icon(
              Icons.more_horiz,
              size: 15,
              color: AppColors.blue,
            ),
          ),
        )
      ],
    );
  }
}
