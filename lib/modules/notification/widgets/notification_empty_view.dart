import 'package:flutter/cupertino.dart';
import 'package:orion_safeguard/modules/screen_layout_widget/no_data_found.dart';

import '../../../generated/assets.dart';

class NotificationEmptyView extends StatelessWidget {
  const NotificationEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: const NoDataFound(
        title: "No notifications found",
        spacer: 2,
        image: Assets.pngNotification,
      ),
    );
  }
}
