import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:maplerad_assessment/app/ui/resource/ui.dart';
import 'package:maplerad_assessment/app/ui/screens/home/widgets/get_started_options.dart';
import 'package:maplerad_assessment/app/ui/screens/home/widgets/transaction_options.dart';
import 'package:maplerad_assessment/app/ui/screens/home/widgets/user_account_information.dart';
import 'package:maplerad_assessment/app/ui/screens/home/widgets/user_accounts.dart';
import 'package:maplerad_assessment/app/ui/screens/home/widgets/wirepay_ai_options.dart';
import 'package:maplerad_assessment/core/widgets/widgets.dart' show HomeAppBar;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // user accounts
              UserAccounts(),

              Gap(15),

              // transaction options
              TransactionOptions(),

              Gap(30),

              // get started
              GetStartedOptions(),

              Gap(20),

              // wirepay options
              WirepayAIOptions(),

              Gap(20),

              // user account information
              UserAccountInformation(),

              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
