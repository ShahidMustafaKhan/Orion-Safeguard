import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../config/constants/app_text_styles.dart';
import '../../../generated/assets.dart';
import '../../../utils/heights_and_widths.dart';
import '../../profile/widgets/logout_button.dart';

class FrozenAccountPage extends StatelessWidget {
  const FrozenAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
    );
  }
}
