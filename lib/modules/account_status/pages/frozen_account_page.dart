import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../config/constants/app_text_styles.dart';
import '../../../config/routes/nav_router.dart';
import '../../../generated/assets.dart';
import '../../../utils/heights_and_widths.dart';
import '../../dashboard/pages/base_screen.dart';
import '../../profile/model/user_model.dart';
import '../../profile/widgets/logout_button.dart';
import '../cubits/subscription_cubit.dart';

class FrozenAccountPage extends StatelessWidget {
  const FrozenAccountPage({super.key});

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
                  Text("Account Freezed",
                      style: AppTextStyles.robotoBold(fontSize: 20.sp)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                        "Your account has been frozen by the admin. Please contact the administrator for assistance.",
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
