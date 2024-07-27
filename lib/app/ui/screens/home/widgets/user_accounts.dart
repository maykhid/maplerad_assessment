import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:maplerad_assessment/app/data/model/accounts.dart';
import 'package:maplerad_assessment/app/ui/resource/ui.dart';

class UserAccounts extends StatelessWidget {
  const UserAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(
          height: 115,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: accountData.accounts.length,
            itemBuilder: (ctx, index) {
              final account = accountData.accounts[index];
              return Row(
                children: [
                  // account card
                  _AccountCard(
                    account: account,
                  ),

                  if (index == accountData.accounts.length - 1) ...[
                    const _AddAccountCard(),
                  ]
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _AddAccountCard extends StatelessWidget {
  const _AddAccountCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

class _AccountCard extends StatelessWidget {
  const _AccountCard({
    required this.account,
  });

  final Account account;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
