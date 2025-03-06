import 'package:flutter/material.dart';
import 'package:orion_safeguard/constants/app_colors.dart';
import 'package:orion_safeguard/generated/assets.dart';
import 'package:orion_safeguard/modules/authentications/pages/signin_screen.dart';
import 'package:orion_safeguard/modules/screen_layout_widget/screen_layout.dart';
import 'package:orion_safeguard/ui/button/primary_button.dart';

import '../../../config/routes/nav_router.dart';
import '../../../utils/heights_and_widths.dart';
import '../widgets/contact_us_profile_widget.dart';
import '../widgets/notification_widget.dart';
import '../widgets/personal_details_widget.dart';
import '../widgets/social_profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrionLayout(
        pageTitle: "Profile",
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PersonalDetailsWidget(),
                h2,
                NotificationsWidget(),
                h2,
                const ContactUsWidget(),
                h2,
                const SocialWidget(),
                h3,
                PrimaryIconOutlineButton(
                  onPressed: () {
                    NavRouter.pushAndRemoveUntil(context, const LoginScreen());
                  },
                  title: "Logout",
                  titleColor: AppColors.primaryColor,
                  borderColor: AppColors.primaryColor,
                  height: 64,
                  borderRadius: 16.0,
                  iconSvgPath: Assets.svgLogout,
                )
              ],
            ),
          ),
        ));
  }
}
