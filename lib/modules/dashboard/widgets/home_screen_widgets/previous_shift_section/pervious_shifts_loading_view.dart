import 'package:flutter/material.dart';
import 'package:orion_safeguard/modules/screen_layout_widget/custom_shimmer_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../config/constants/app_text_styles.dart';
import '../../../../../utils/heights_and_widths.dart';
import '../../../../../utils/helper_widgets.dart';

class PreviousShiftsLoadingView extends StatelessWidget {
  const PreviousShiftsLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 8, bottom: 8),
          itemCount: 7,
          itemBuilder: (context, index) {
            return PreviousShiftLoadingWidget();
          },
          separatorBuilder: (BuildContext context, int index) {
            return customDivider(
              vPadding: 0.0,
              hPadding: 10.0,
            );
          },
        ));
  }
}

class PreviousShiftLoadingWidget extends StatelessWidget {
  const PreviousShiftLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.sp,
          vertical: 12.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Shift Name",
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
                      "Location of the shift",
                      style: AppTextStyles.robotoRegular(
                          fontSize: 12.0, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Bone.circle(),
                        w1,
                        Text(
                          "10:00 AM - 11:00 AM Mar 12, 2023",
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
                  "Completed Shift",
                  style: AppTextStyles.robotoMedium(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
