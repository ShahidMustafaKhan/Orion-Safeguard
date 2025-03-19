import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/modules/notification/cubits/notification_cubit.dart';

import '../../../config/constants/app_colors.dart';
import '../../../utils/display/display_utils.dart';
import '../../../utils/enums.dart';
import '../../../utils/heights_and_widths.dart';
import '../../screen_layout_widget/custom_see_all_row.dart';
import '../../screen_layout_widget/screen_layout.dart';
import '../model/notification_model.dart';
import '../widgets/notification_data_view.dart';
import '../widgets/notification_empty_view.dart';
import '../widgets/notification_loading_view.dart';

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
        child: BlocProvider<NotificationCubit>(
          create: (BuildContext context) =>
              NotificationCubit()..fetchNotifications(),
          child: BlocConsumer<NotificationCubit, NotificationState>(
              listenWhen: (previous, next) =>
                  previous.notifications.status != next.notifications.status ||
                  previous.notifications.message != next.notifications.message,
              listener: (context, state) {
                if (state.notifications.status == Status.error) {
                  DisplayUtils.showErrorToast(
                      context, state.notifications.message);
                }
              },
              buildWhen: (previous, next) => previous != next,
              builder: (context, state) {
                List<NotificationModel> notifications =
                    state.notifications.data ?? [];
                return Column(
                  children: [
                    h1,
                    CustomSeeAllRowWidget(
                      text: 'Today'.toUpperCase(),
                      secondText: 'Mark all as read',
                      textColor: AppColors.greyColor,
                      fun: () {
                        context
                            .read<NotificationCubit>()
                            .markNotificationsRead();
                      },
                    ),
                    h1,
                    if (state.notifications.status == Status.loading)
                      const NotificationLoadingView()
                    else if (notifications.isEmpty)
                      const NotificationEmptyView()
                    else
                      NotificationDataView(notifications: notifications),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
