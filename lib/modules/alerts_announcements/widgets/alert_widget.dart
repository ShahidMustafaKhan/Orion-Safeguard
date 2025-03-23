import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orion_safeguard/config/constants/app_colors.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:orion_safeguard/modules/alerts_announcements/cubits/alerts_cubit.dart';
import 'package:orion_safeguard/modules/alerts_announcements/helper/helper_functions.dart';
import 'package:orion_safeguard/modules/alerts_announcements/model/announcement_model.dart';
import 'package:orion_safeguard/modules/alerts_announcements/pages/full_alert_screen.dart';
import 'package:orion_safeguard/modules/alerts_announcements/widgets/decline_reason_dialogue.dart';
import 'package:orion_safeguard/ui/button/primary_button.dart';
import 'package:orion_safeguard/ui/widgets/on_click.dart';

import '../../../config/routes/nav_router.dart';
import '../../../generated/assets.dart';
import '../../../utils/enums.dart';
import '../../../utils/heights_and_widths.dart';
import '../../../utils/time_utils.dart';
import '../../profile/model/user_model.dart';

class AlertWidget extends StatelessWidget {
  final AnnouncementModel? announcementModel;
  final UserModel? userModel;
  const AlertWidget({super.key, this.announcementModel, this.userModel});

  @override
  Widget build(BuildContext context) {
    return OnClick(
      onTap: () {
        NavRouter.push(
            context, FullAlertScreen(announcementModel: announcementModel));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        100.0,
                      ),
                      color: Colors.red.shade50,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        Assets.svgPerson,
                        height: 16.0,
                        width: 16.0,
                      ),
                    ),
                  ),
                  w2,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Admin",
                              style: AppTextStyles.robotoRegular(
                                fontSize: 14.0,
                              ),
                            ),
                            Text(
                                isApproved(announcementModel?.approveList ?? [])
                                    ? "Approved"
                                    : isDeclined(
                                            announcementModel?.declineList ??
                                                [])
                                        ? "Declined"
                                        : "",
                                style: AppTextStyles.robotoMedium(
                                  fontSize: 14.0,
                                  color: isApproved(
                                          announcementModel?.approveList ?? [])
                                      ? AppColors.green
                                      : AppColors.primaryColor,
                                )),
                          ],
                        ),
                        Text(
                          timeAgo(announcementModel?.createdAt),
                          style: AppTextStyles.robotoRegular(
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              h1,
              Text(
                announcementModel?.announcement ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.robotoRegular(
                  fontSize: 14.0,
                ),
              ),
              h1,
              BlocBuilder<AlertsCubit, AlertsState>(
                  buildWhen: (previous, next) =>
                      previous.approveStatus != next.approveStatus ||
                      previous.declineStatus != next.declineStatus,
                  builder: (context, state) {
                    if (isApproved(
                          announcementModel?.approveList ?? [],
                        ) ||
                        isDeclined(
                          announcementModel?.declineList ?? [],
                        )) {
                      return SizedBox();
                    }
                    return Row(
                      children: [
                        Expanded(
                            child: PrimaryOutlineButton(
                          height: 40,
                          borderRadius: 16.0,
                          titleColor: AppColors.primaryColor,
                          borderColor: AppColors.primaryColor,
                          onPressed: () {
                            showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const DeclineReasonDialogue())
                                .then((value) {
                              if (value?["status"] == "submitted") {
                                context.read<AlertsCubit>().decline(
                                    announcementModel, value["reason"] ?? '',
                                    userModel: userModel);
                              }
                            });
                          },
                          title: "Reject",
                        )),
                        w2,
                        Expanded(
                            child: PrimaryButton(
                          height: 40,
                          hMargin: 0,
                          loading:
                              state.approveStatus == PostApiStatus.loading &&
                                  state.approveLoadingItemId ==
                                      announcementModel?.objectId,
                          backgroundColor: AppColors.primaryColor,
                          borderRadius: 16.0,
                          onPressed: () {
                            context.read<AlertsCubit>().approve(
                                announcementModel,
                                userModel: userModel);
                          },
                          title: "Approve",
                        )),
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
