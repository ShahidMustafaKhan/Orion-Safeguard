import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/assets.dart';
import '../../../utils/helper_widgets.dart';
import '../../../utils/time_utils.dart';
import '../cubits/notification_cubit.dart';
import '../model/notification_model.dart';
import 'custom_notification_widget.dart';
import 'notification_loading_view.dart';

class NotificationDataView extends StatelessWidget {
  const NotificationDataView({
    super.key,
    required this.notifications,
  });

  final List<NotificationModel> notifications;

  @override
  Widget build(BuildContext context) {
    NotificationState state = context.read<NotificationCubit>().state;
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.only(bottom: 35),
        itemCount: notifications.length + (state.hasMoreData ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == (notifications.length - 1) && state.hasMoreData) {
            context
                .read<NotificationCubit>()
                .fetchNotifications(loadMore: true);
          }
          if (index == (notifications.length) && state.hasMoreData) {
            return AnnouncementLoadingCard();
          }

          return AnnouncementCard(
            isUnRead: notifications[index].status ==
                NotificationModel.keyStatusUnread,
            title: notifications[index].title ?? '',
            time: timeAgo(notifications[index].createdAt),
            content: notifications[index].description ?? '',
            iconPath: returnIcon(notifications[index].type ?? '')!,
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
    );
  }
}

String? returnIcon(String type) {
  if (type == NotificationModel.keyTypeUpComingShift) {
    return Assets.svgCalendarTick;
  } else if (type == NotificationModel.keyTypeShiftChange) {
    return Assets.svgRepeat;
  } else if (type == NotificationModel.keyTypeAnnouncement) {
    return Assets.svgUserAdd;
  }
  return Assets.svgUserAdd;
}
