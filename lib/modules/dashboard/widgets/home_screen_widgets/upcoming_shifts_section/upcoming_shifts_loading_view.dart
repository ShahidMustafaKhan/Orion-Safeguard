import 'package:flutter/material.dart';
import 'package:orion_safeguard/modules/screen_layout_widget/custom_shimmer_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../config/constants/app_text_styles.dart';
import '../../../../../utils/heights_and_widths.dart';

class UpcomingShiftsLoadingView extends StatelessWidget {
  const UpcomingShiftsLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return UpComingShiftLoadingWidget();
          },
          separatorBuilder: (context, index) {
            return w2P5;
          },
          itemCount: 5),
    );
  }
}

class UpComingShiftLoadingWidget extends StatelessWidget {
  const UpComingShiftLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomShimmerWidget(
      child: Container(
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
                "Shift Name",
                style: AppTextStyles.robotoMedium(
                    fontSize: 14.0, fontWeight: FontWeight.w600),
              ),
              Text(
                'Location of the shift',
                style: AppTextStyles.robotoRegular(
                    fontSize: 12.0, fontWeight: FontWeight.w400),
              ),
              h0P5,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Bone.circle(),
                  w1,
                  Text("Mar 12, 10:00 AM",
                      style: AppTextStyles.robotoRegular(
                          fontSize: 12.0, fontWeight: FontWeight.w400)),
                ],
              ),
              h1,
              Bone.button(
                  height: 30,
                  width: 120,
                  borderRadius: BorderRadius.circular(8))
            ],
          ),
        ),
      ),
    );
  }
}
