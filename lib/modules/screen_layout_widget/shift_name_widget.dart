import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/constants/app_text_styles.dart';
import 'package:orion_safeguard/utils/heights_and_widths.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';
import '../../generated/assets.dart';
import 'custom_button.dart';

class UpComingShiftWidget extends StatelessWidget {
  final String shiftName;
  final String location;
  final String date;
  final VoidCallback? onDetailView;

  const UpComingShiftWidget(
      {super.key,
      required this.shiftName,
      required this.location,
      required this.date,
      this.onDetailView});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              shiftName,
              style: AppTextStyles.robotoMedium(
                  fontSize: 14.0, fontWeight: FontWeight.w600),
            ),
            Text(
              location,
              style: AppTextStyles.robotoRegular(
                  fontSize: 12.0, fontWeight: FontWeight.w400),
            ),
            h0P5,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  Assets.svgCalender,
                ),
                w1,
                Text(date,
                    style: AppTextStyles.robotoRegular(
                        fontSize: 12.0, fontWeight: FontWeight.w400)),
              ],
            ),
            h1,
            CustomButtonSearchView(
              tap: onDetailView,
              text: 'View Detail',
              textCol: AppColors.white,
            )
          ],
        ),
      ),
    );
  }
}
