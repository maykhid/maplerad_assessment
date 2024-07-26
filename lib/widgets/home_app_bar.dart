import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:maplerad_assessment/shared/ui/app_colors.dart';
import 'package:maplerad_assessment/shared/ui/app_icons.dart';
import 'package:maplerad_assessment/shared/ui/app_images.dart';
import 'package:svg_flutter/svg.dart';

class HomeAppBar extends PreferredSize {
  HomeAppBar({super.key})
      : super(
            preferredSize: const Size.fromHeight(60.0),
            child: AppBar(
              backgroundColor: AppColors.background,
              title: Image.asset(
                AppImages.user,
                width: 32,
                height: 32,
              ),
             
              actions: [
                Container(
                  width: 102,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(42),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppIcons.gift,
                      ),
                      const Gap(8),
                      const Text(
                        'Earn \$1',
                        style: TextStyle(color: AppColors.blue),
                      )
                    ],
                  ),
                ),
                const Gap(15),
                SvgPicture.asset(AppIcons.scan),
                const Gap(15),
                SvgPicture.asset(AppIcons.notification),
                const Gap(15),
              ],
            ));
  // @override
  // Widget get child => ;
}
