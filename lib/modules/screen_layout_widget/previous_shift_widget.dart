import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:orion_safeguard/generated/assets.dart';
import 'package:orion_safeguard/utils/heights_and_widths.dart';
import 'package:sizer/sizer.dart';

import '../../config/constants/app_colors.dart';
import '../../utils/helper_widgets.dart';
import '../dashboard/model/shifts_model/shifts_model.dart';

class PreviousShiftWidget extends StatelessWidget {
  final String shiftName;
  final String location;
  final String date;
  final String status;

  const PreviousShiftWidget(
      {super.key,
      required this.shiftName,
      required this.location,
      required this.date,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.sp,
        vertical: 12.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            shiftName,
            style: AppTextStyles.robotoMedium(
                fontSize: 16.0, fontWeight: FontWeight.w600),
          ),
          h0P5,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location,
                    style: AppTextStyles.robotoRegular(
                        fontSize: 12.0, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        Assets.svgCalender,
                        height: 16.0,
                        width: 16.0,
                      ),
                      w1,
                      Text(
                        date,
                        style: AppTextStyles.robotoRegular(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                shiftStatus(status),
                style: AppTextStyles.robotoMedium(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: status == ShiftModel.keyShiftStatusCompleted
                        ? AppColors.green
                        : AppColors.primaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
