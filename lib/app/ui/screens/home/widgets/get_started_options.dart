import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:maplerad_assessment/app/ui/resource/ui.dart';
import 'package:maplerad_assessment/core/utils/sized_context.dart';
import 'package:maplerad_assessment/core/widgets/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GetStartedOptions extends StatelessWidget {
  const GetStartedOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Get started',
              style: AppTextStyles.semiBold18BricolageGrotesque,
            ),
            Text(
              'View all steps',
              style: AppTextStyles.medium14.copyWith(
                color: AppColors.blue,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.blue, //
              ),
            ),
          ],
        ),

        const Gap(15),

        // verify identity
        Container(
          width: context.width,
          height: 143,
          padding:
              const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Verify your identity, Miracle!',
                    style: AppTextStyles.medium16,
                  ),
                  Text(
                    'Submit additional information to\nverify your identity.',
                    style:
                        AppTextStyles.regular14.copyWith(color: AppColors.grey),
                  ),
                  const Spacer(),
                  AppButton(
                    // width: context.width * 0.37,
                    height: 32,
                    text: 'Verify Identity',
                    // padding: EdgeInsets.zero,
                    onPressed: () {},
                  ),
                ],
              ),
              Column(
                children: [
                  CircularPercentIndicator(
                    radius: 30,
                    percent: 0.4,
                    center: SvgPicture.asset(AppIcons.securityUser),
                    progressColor: AppColors.blue,
                    backgroundColor: AppColors.lightGrey,
                    animation: true,
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                  const Gap(28),
                  const Text(
                    'Dismiss',
                    style: AppTextStyles.regular14,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
