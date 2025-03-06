import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/constants/app_text_styles.dart';
import 'package:orion_safeguard/generated/assets.dart';
import 'package:orion_safeguard/utils/heights_and_widths.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';

class PreviousShiftWidget extends StatelessWidget {
  final String shiftName;
  final String location;
  final String date;

  const PreviousShiftWidget(
      {super.key,
      required this.shiftName,
      required this.location,
      required this.date});

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
                'Completed Shift',
                style: AppTextStyles.robotoMedium(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
