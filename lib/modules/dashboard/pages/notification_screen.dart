import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../generated/assets.dart';
import '../../../utils/heights_and_widths.dart';
import '../../../utils/helper_widgets.dart';
import '../../screen_layout_widget/custom_notification_widget.dart';
import '../../screen_layout_widget/custom_see_all_row.dart';
import '../../screen_layout_widget/screen_layout.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrionLayout(
      pageTitle: 'Notifications',
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            h1,
            CustomSeeAllRowWidget(
              text: 'Today'.toUpperCase(),
              secondText: 'Mark all as read',
              textColor: AppColors.greyColor,
              fun: () {
                // NavRouter.pushAndRemoveUntil(context,  AllProductsScreen());
              },
            ),
            h1,
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                // shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: 30,
                itemBuilder: (context, index) {
                  return AnnouncementCard(
                    isUnRead: index % 3 == 2,
                    title: returnTitle(index)!,
                    time: "20 min",
                    content:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
                    iconPath: returnIcon(index)!,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return customDivider(
                    hPadding: 0.0,
                    thickness: 1.2,
                    color: Colors.grey.shade300,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String? returnIcon(int index) {
  if (index % 3 == 0) {
    return Assets.svgCalendarTick;
  } else if (index % 3 == 1) {
    return Assets.svgRepeat;
  } else if (index % 3 == 2) {
    return Assets.svgUserAdd;
  }
  return null;
}

String? returnTitle(int index) {
  if (index % 3 == 0) {
    return "Your Up-Coming Shift";
  } else if (index % 3 == 1) {
    return "Shift change";
  } else if (index % 3 == 2) {
    return "Announcement from admin";
  }
  return null;
}
