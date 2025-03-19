import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../config/constants/app_text_styles.dart';
import '../../../../ui/button/primary_button.dart';
import '../../../../utils/heights_and_widths.dart';
import '../../../screen_layout_widget/custom_shimmer_widget.dart';

class ActiveShiftsLoadingView extends StatelessWidget {
  const ActiveShiftsLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 85),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return ActiveShiftLoadingWidget();
      },
      separatorBuilder: (BuildContext context, int index) {
        return h1P5;
      },
    );
  }
}

class ActiveShiftLoadingWidget extends StatelessWidget {
  const ActiveShiftLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomShimmerWidget(
      child: Card(
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
              Text(
                "Approved",
                style: AppTextStyles.robotoSemiBold(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                    color: const Color(0xff3EB654)),
              ),
              h1,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Shift Name",
                        style: AppTextStyles.robotoBold(
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        "Location of the shift",
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
                      Bone.circle(),
                      w2,
                      Text(
                        "MAR 12, 10:45 PM",
                        style: AppTextStyles.robotoRegular(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              PrimaryButton(
                title: "Shift Status",
                titleColor: Colors.white,
                fontWeight: FontWeight.bold,
                hMargin: 0,
                borderRadius: 12.0,
                height: 50,
                backgroundColor: const Color(0xff3EB654),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
