import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:maplerad_assessment/app/data/model/account_info.dart';
import 'package:maplerad_assessment/app/ui/resource/ui.dart';
import 'package:maplerad_assessment/core/utils/sized_context.dart';

class UserAccountInformation extends StatelessWidget {
  const UserAccountInformation({super.key});

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
          height: 130,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: accountInfo.infos.length,
              itemBuilder: (context, index) {
                final info = accountInfo.infos[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    width: context.width * 0.73,
                    // height: context.height * 0.2,
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
