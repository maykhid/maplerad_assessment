
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:maplerad_assessment/app/ui/resource/ui.dart';
import 'package:maplerad_assessment/core/utils/sized_context.dart';

class WirepayAIOptions extends StatelessWidget {
  const WirepayAIOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Wirepay AI',
          style: AppTextStyles.semiBold18BricolageGrotesque,
        ),
        const Gap(15),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.lightGreen,
                    radius: 22,
                    child: SvgPicture.asset(AppIcons.wallet),
                  ),
                  const Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Stash plan',
                        style: AppTextStyles.medium16,
                      ),
                      Text(
                        'Verifying identity',
                        style: AppTextStyles.regular12Avenir.copyWith(
                          color: AppColors.orange,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '-\$67.99',
                        style: AppTextStyles.medium16
                            .copyWith(color: AppColors.grey),
                      ),
                      Text(
                        'Pending',
                        style: AppTextStyles.regular12Avenir
                            .copyWith(color: AppColors.orange),
                      ),
                    ],
                  ),
                ],
              ),

              const Divider(
                color: AppColors.lightGrey,
              ),

              //
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.lightGreen,
                    radius: 22,
                    child: SvgPicture.asset(AppIcons.wallet),
                  ),
                  const Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Wedding Trip',
                        style: AppTextStyles.medium16,
                      ),
                      Text(
                        'From USD account',
                        style: AppTextStyles.regular12Avenir.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    '\$2,300.00',
                    style: AppTextStyles.medium16.copyWith(
                      color: AppColors.darkGreen,
                    ),
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
