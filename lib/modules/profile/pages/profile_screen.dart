import 'package:flutter/material.dart';
import 'package:orion_safeguard/modules/screen_layout_widget/screen_layout.dart';

import '../../../utils/heights_and_widths.dart';
import '../widgets/contact_us/contact_us_profile_widget.dart';
import '../widgets/logout_button.dart';
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
                const LogoutButton()
              ],
            ),
          ),
        ));
  }
}
