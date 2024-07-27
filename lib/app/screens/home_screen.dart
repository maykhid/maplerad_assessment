import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:maplerad_assessment/app/data/model/account_info.dart';
import 'package:maplerad_assessment/app/data/model/accounts.dart';
import 'package:maplerad_assessment/app/resource/ui.dart';
import 'package:maplerad_assessment/core/utils/sized_context.dart';
import 'package:maplerad_assessment/core/widgets/widgets.dart' show AppButton, HomeAppBar;

import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'My Accounts',
                    style: AppTextStyles.semiBold18BricolageGrotesque,
                  ),
                  const Spacer(),
                  const Text(
                    'Hide balance',
                    style: AppTextStyles.medium14,
                  ),
                  const Gap(8),
                  SvgPicture.asset(AppIcons.viewOff),
                ],
              ),
              const Gap(15),

              // user accounts
              const _UserAccounts(),

              const Gap(15),

              // transaction options
              const _TransactionOptions(),

              const Gap(30),

              // get started
              const _GetStartedOptions(),

              const Gap(20),

              // wirepay options
              const _WirepayAIOptions(),

              const Gap(20),

              // user account information
              const _UserAccountInformation(),

              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserAccountInformation extends StatelessWidget {
  const _UserAccountInformation();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Account Information',
          style: AppTextStyles.semiBold18BricolageGrotesque,
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
                              style: AppTextStyles.bold16,
                            ),

                            const Spacer(),

                            // flags
                            const Stack(
                              children: [
                                CircleAvatar(
                                  // backgroundColor: Colors.amber,
                                  radius: 12,
                                  backgroundImage: AssetImage(AppImages.us),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 12),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 14,
                                    child: CircleAvatar(
                                      // backgroundColor: Colors.red,
                                      radius: 12,
                                      backgroundImage: AssetImage(AppImages.ng),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Gap(10),
                        Text(
                          info.infoMessage,
                          style: AppTextStyles.medium10.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          info.prompt,
                          style: AppTextStyles.medium14.copyWith(
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
    );
  }
}

class _WirepayAIOptions extends StatelessWidget {
  const _WirepayAIOptions();

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

class _GetStartedOptions extends StatelessWidget {
  const _GetStartedOptions();

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
                    width: context.width * 0.37,
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

class _TransactionOptions extends StatelessWidget {
  const _TransactionOptions();

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

class _UserAccounts extends StatelessWidget {
  const _UserAccounts();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: accountData.accounts.length,
        itemBuilder: (ctx, index) {
          final account = accountData.accounts[index];
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
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
                            style: AppTextStyles.medium14,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        account.amount,
                        style: AppTextStyles.extraBold20Avenir,
                      )
                    ],
                  ),
                ),
              ),
              if (index == accountData.accounts.length - 1) ...[
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: DottedBorder(
                    color: AppColors.pinGrey,
                    strokeWidth: 1,
                    dashPattern: const [8, 4],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                                color: AppColors.pinGrey,
                                borderRadius: BorderRadius.circular(16)),
                            child: const Icon(Icons.add),
                          ),
                          const Text(
                            'Add another currency to your account',
                            style: AppTextStyles.medium14,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}
