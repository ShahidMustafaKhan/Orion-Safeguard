import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/modules/profile/cubit/profile_cubit/profile_cubit.dart';
import 'package:orion_safeguard/modules/profile/model/user_model.dart';
import 'package:orion_safeguard/modules/screen_layout_widget/screen_layout.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_text_styles.dart';
import '../../../generated/assets.dart';
import '../../../ui/button/primary_button.dart';
import '../../../utils/heights_and_widths.dart';
import '../../../utils/time_utils.dart';
import '../cubits/alerts_cubit.dart';
import '../helper/helper_functions.dart';
import '../model/announcement_model.dart';
import '../widgets/decline_reason_dialogue.dart';

class FullAlertScreen extends StatefulWidget {
  final AnnouncementModel? announcementModel;
  const FullAlertScreen({super.key, this.announcementModel});

  @override
  State<FullAlertScreen> createState() => _FullAlertScreenState();
}

class _FullAlertScreenState extends State<FullAlertScreen> {
  UserModel? userModel;
  @override
  void initState() {
    userModel = context.read<ProfileCubit>().state.userModel.data;
    context.read<AlertsCubit>().updateSelectedAlert(widget.announcementModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrionLayout(
      pageTitle: "Alerts",
      child: SingleChildScrollView(
        child: BlocBuilder<AlertsCubit, AlertsState>(
            buildWhen: (previous, next) => previous != next,
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Admin",
                                    style: AppTextStyles.robotoRegular(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Text(
                                      isApproved(state
                                                  .selectedAlert?.approveList ??
                                              [])
                                          ? "Approved"
                                          : isDeclined(state.selectedAlert
                                                      ?.declineList ??
                                                  [])
                                              ? "Declined"
                                              : "",
                                      style: AppTextStyles.robotoMedium(
                                        fontSize: 14.0,
                                        color: isApproved(state.selectedAlert
                                                    ?.approveList ??
                                                [])
                                            ? AppColors.green
                                            : AppColors.primaryColor,
                                      )),
                                ],
                              ),
                              Text(
                                timeAgo(state.selectedAlert?.createdAt),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: splitTextIntoParagraphs(
                        state.selectedAlert?.announcement ?? "",
                        TextStyle(fontSize: 14.0),
                        4.5,
                      ),
                    ),
                    h1,
                    if (!isApproved(state.selectedAlert?.approveList ?? []) &&
                        !isDeclined(state.selectedAlert?.declineList ?? []))
                      Column(
                        children: [
                          PrimaryButton(
                            height: 50,
                            hMargin: 0,
                            backgroundColor: AppColors.primaryColor,
                            borderRadius: 16.0,
                            onPressed: () {
                              context.read<AlertsCubit>().approve(
                                  state.selectedAlert,
                                  selectedAlert: true,
                                  userModel: userModel);
                            },
                            title: "Approve",
                          ),
                          h0P5,
                          PrimaryOutlineButton(
                            height: 50,
                            borderRadius: 16.0,
                            titleColor: AppColors.primaryColor,
                            borderColor: AppColors.primaryColor,
                            onPressed: () {
                              showDialog(
                                      context: context,
                                      builder: (context) =>
                                          const InputReasonDialogue())
                                  .then((value) {
                                if (value?["status"] == "submitted") {
                                  context.read<AlertsCubit>().decline(
                                      state.selectedAlert,
                                      value["reason"] ?? '',
                                      selectedAlert: true,
                                      userModel: userModel);
                                }
                              });
                            },
                            title: "Decline",
                          )
                        ],
                      )
                  ],
                ),
              );
            }),
      ),
    );
  }

  List<Widget> splitTextIntoParagraphs(
      String text, TextStyle style, double maxLines) {
    const int avgCharsPerLine = 40; // Approximate characters per line
    int maxChars = (avgCharsPerLine * maxLines).toInt();

    List<String> paragraphs = [];
    StringBuffer buffer = StringBuffer();

    for (String word in text.split(' ')) {
      if ((buffer.length + word.length) > maxChars) {
        paragraphs.add(buffer.toString());
        buffer.clear();
      }
      buffer.write('$word ');
    }
    if (buffer.isNotEmpty) {
      paragraphs.add(buffer.toString());
    }

    return paragraphs
        .map((para) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(para.trim(), style: style),
            ))
        .toList();
  }
}
