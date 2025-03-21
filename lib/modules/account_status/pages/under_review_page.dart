import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/modules/account_status/cubits/subscription_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../config/constants/app_text_styles.dart';
import '../../../config/routes/nav_router.dart';
import '../../../generated/assets.dart';
import '../../../utils/heights_and_widths.dart';
import '../../dashboard/pages/base_screen.dart';
import '../../profile/model/user_model.dart';
import '../../profile/widgets/logout_button.dart';
import 'disapproved_account_page.dart';

class UnderReviewPage extends StatelessWidget {
  const UnderReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SubscriptionCubit>(
        create: (BuildContext context) =>
            SubscriptionCubit()..subscribeToUserStatus(),
        child: BlocListener<SubscriptionCubit, SubscriptionState>(
          listener: (context, state) {
            if (state is SubscriptionUpdated) {
              if (state.status == UserModel.keyAccountStatusTypeApproved) {
                NavRouter.pushAndRemoveUntil(context, const BaseScreen());
              } else if (state.status ==
                  UserModel.keyAccountStatusTypeRejected) {
                NavRouter.pushAndRemoveUntil(
                    context, const DisapprovedAccountPage());
              }
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                ),
                child: SvgPicture.asset(
                  Assets.svgLogo,
                  width: 250,
                  height: 150,
                ),
              ),
              h2,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Waiting for approval",
                      style: AppTextStyles.robotoBold(fontSize: 20.sp)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                        "Your account is currently under review. Upon approval, you will be granted access to the application.",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.robotoMedium(
                            fontSize: 16.sp, fontWeight: FontWeight.w400)),
                  ),
                  h4,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: LogoutButton(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
