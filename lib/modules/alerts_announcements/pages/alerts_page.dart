import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/modules/alerts_announcements/cubits/alerts_cubit.dart';
import 'package:orion_safeguard/modules/alerts_announcements/model/announcement_model.dart';
import 'package:orion_safeguard/modules/profile/cubit/profile_cubit/profile_cubit.dart';

import '../../../utils/enums.dart';
import '../../profile/model/user_model.dart';
import '../../screen_layout_widget/base_view_layout.dart';
import '../widgets/alert_empty_view.dart';
import '../widgets/alert_loading_view.dart';
import '../widgets/alert_widget.dart';

class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel? userModel = context.read<ProfileCubit>().state.userModel.data;
    context.read<AlertsCubit>().fetchAlerts(userModel: userModel);
    return Scaffold(
      body: BaseViewLayout(
        pageTitle: "Alerts",
        child: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: BlocBuilder<AlertsCubit, AlertsState>(
              buildWhen: (previous, next) =>
                  previous.announcements != next.announcements,
              builder: (context, state) {
                List<AnnouncementModel> announcements =
                    state.announcements.data ?? [];
                if (state.announcements.status == Status.loading) {
                  return AlertLoadingView();
                }
                if (announcements.isEmpty == true) {
                  return AlertEmptyView();
                }
                return ListView.builder(
                    itemBuilder: (context, index) {
                      if (index == (announcements.length - 1) &&
                          state.hasMoreData) {
                        context
                            .read<AlertsCubit>()
                            .fetchAlerts(loadMore: true, userModel: userModel);
                      }
                      if (index == (announcements.length) &&
                          state.hasMoreData) {
                        return AlertLoadingWidget();
                      }
                      return AlertWidget(
                        announcementModel: announcements[index],
                        userModel: userModel,
                      );
                    },
                    itemCount:
                        announcements.length + (state.hasMoreData ? 1 : 0));
              }),
        ),
      ),
    );
  }
}
