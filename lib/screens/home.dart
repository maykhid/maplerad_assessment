import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maplerad_assessment/model/account_info.dart';
import 'package:maplerad_assessment/model/accounts.dart';
import 'package:maplerad_assessment/shared/ui/app_button.dart';
import 'package:maplerad_assessment/shared/ui/app_colors.dart';
import 'package:maplerad_assessment/shared/ui/app_icons.dart';
import 'package:maplerad_assessment/shared/ui/app_images.dart';
import 'package:maplerad_assessment/shared/ui/sized_context.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:svg_flutter/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _APPBR(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'My Accounts',
                    style: GoogleFonts.bricolageGrotesque(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Hide balance',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const Gap(8),
                  SvgPicture.asset(AppIcons.viewOff),
                ],
              ),
              const Gap(15),
              SizedBox(
                height: 115,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: accountData.accounts.length,
                  itemBuilder: (ctx, index) {
                    final account = accountData.accounts[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Container(
                        height: 115,
                        width: 194,
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  backgroundImage: AssetImage(account.flag),
                                ),
                                const Gap(5),
                                Text(
                                  account.currency,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              account.amount,
                              style: const TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Gap(15),

              // money options
              Row(
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
                    buttonTextStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blue,
                    ),
                    backgroundColor: AppColors.lightBlue,
                    onPressed: () {},
                  ),
                  Container(
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
                  )
                ],
              ),

              const Gap(30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Get started',
                    style: GoogleFonts.bricolageGrotesque(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    'View all steps',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
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
                padding: const EdgeInsets.only(
                    top: 15, left: 15, right: 15, bottom: 12),
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
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          'Submit additional information to\nverify your identity.',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey),
                        ),
                        const Spacer(),
                        AppButton(
                          width: context.width * 0.365,
                          height: 40,
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
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Gap(20),

              Text(
                'Wirepay AI',
                style: GoogleFonts.bricolageGrotesque(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const Gap(15),

              Container(
                width: context.width,
                height: 143,
                padding: const EdgeInsets.only(
                    top: 15, left: 15, right: 15, bottom: 12),
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
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Stash plan',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Verifying identity',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Avenir',
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.orange),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '-\$67.99',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.grey),
                            ),
                            Text(
                              'Pending',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Avenir',
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.orange),
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
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Wedding Trip',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'From USD account',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Avenir',
                                color: AppColors.grey,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Text(
                          '\$2,300.00',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkGreen,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Gap(20),

              Text(
                'Account Information',
                style: GoogleFonts.bricolageGrotesque(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const Gap(15),

              SizedBox(
                height: 126,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: accountInfo.infos.length,
                    itemBuilder: (context, index) {
                      final info = accountInfo.infos[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: context.width * 0.7,
                          padding: const EdgeInsets.only(
                              top: 15, left: 15, right: 15, bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: AppColors.borderGrey,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    info.info,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),

                                  // flags
                                ],
                              ),
                              const Gap(10),
                              Text(
                                info.infoMessage,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.grey,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                info.prompt,
                                style: const TextStyle(
                                  color: AppColors.blue,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.blue,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _APPBR extends PreferredSize {
  _APPBR()
      : super(
            preferredSize: const Size.fromHeight(60.0),
            child: AppBar(
              backgroundColor: AppColors.background,
              title: Image.asset(
                AppImages.user,
                width: 32,
                height: 32,
              ),
              // leading: SizedBox.fromSize(
              //   size: const Size(32, 32),
              //   child: Image.asset(
              //     AppImages.user,
              //     width: 22,
              //     height: 22,
              //     fit: BoxFit.scaleDown,
              //   ),
              // ),
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
