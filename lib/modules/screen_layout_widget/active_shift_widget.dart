import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:orion_safeguard/modules/alerts_announcements/widgets/decline_reason_dialogue.dart';
import 'package:orion_safeguard/ui/button/primary_button.dart';
import 'package:orion_safeguard/utils/enums.dart';
import 'package:orion_safeguard/utils/heights_and_widths.dart';
import 'package:orion_safeguard/utils/helper_widgets.dart';
import 'package:sizer/sizer.dart';

import '../../config/constants/app_colors.dart';
import '../../generated/assets.dart';
import '../dashboard/cubits/my_shifts_cubits/my_shifts_cubit.dart';

class ActiveShiftWidget extends StatelessWidget {
  final String shiftName;
  final String location;
  final String date;
  final String status;
  final bool? isApproved;
  final VoidCallback? shiftStatusCallback;
  final VoidCallback? approveCallback;
  final void Function(String)? declineCallback;
  final String objectId;

  const ActiveShiftWidget({
    super.key,
    required this.shiftName,
    required this.location,
    required this.date,
    required this.status,
    required this.shiftStatusCallback,
    required this.approveCallback,
    required this.declineCallback,
    this.isApproved = false,
    required this.objectId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.grey.shade200,
        ),
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      elevation: 1.5,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 13.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isApproved == true) ...[
              Text(
                shiftStatus(status,
                    removeWordShift: true, includeApproveKeyword: true),
                style: AppTextStyles.robotoSemiBold(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                    color: const Color(0xff3EB654)),
              ),
              h1,
            ],
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      shiftName,
                      style: AppTextStyles.robotoBold(
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      location,
                      style: AppTextStyles.robotoRegular(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    h0P5,
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      Assets.svgCalender,
                      height: 16.0,
                      width: 16.0,
                    ),
                    w2,
                    Text(
                      date,
                      style: AppTextStyles.robotoRegular(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            isApproved == true
                ? PrimaryButton(
                    onPressed: shiftStatusCallback ?? () {},
                    title: "Shift Status",
                    titleColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    hMargin: 0,
                    borderRadius: 12.0,
                    height: 50,
                    backgroundColor: const Color(0xff3EB654),
                  )
                : BlocBuilder<MyShiftsCubit, MyShiftsState>(
                    buildWhen: (previous, next) =>
                        previous.declineStatus != next.declineStatus ||
                        previous.approveStatus != next.approveStatus,
                    builder: (context, state) {
                      return Row(
                        children: [
                          Expanded(
                            child: PrimaryOutlineButton(
                              onPressed: () {
                                showDialog(
                                        context: context,
                                        builder: (context) =>
                                            const DeclineReasonDialogue())
                                    .then((value) {
                                  if (value["status"] == "submitted") {
                                    declineCallback!(value["reason"] ?? '');
                                  }
                                });
                              },
                              title: "Reject",
                              hMargin: 0,
                              borderRadius: 12.0,
                              height: 50.0,
                              titleColor: AppColors.primaryColor,
                              borderColor: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          w2,
                          Expanded(
                            child: PrimaryButton(
                              onPressed: approveCallback ?? () {},
                              loading: state.approveStatus ==
                                      PostApiStatus.loading &&
                                  objectId == state.approveLoadingItemId,
                              title: "Approve",
                              fontWeight: FontWeight.bold,
                              hMargin: 0,
                              borderRadius: 12.0,
                              height: 50,
                              backgroundColor: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      );
                    }),
          ],
        ),
      ),
    );
  }
}
