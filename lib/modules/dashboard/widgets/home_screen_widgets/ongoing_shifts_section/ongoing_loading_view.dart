import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../config/constants/app_colors.dart';
import '../../../../../config/constants/app_text_styles.dart';
import '../../../../../utils/heights_and_widths.dart';
import '../../../../../utils/helper_widgets.dart';
import '../../../../screen_layout_widget/custom_see_all_row.dart';
import '../../../../screen_layout_widget/custom_shimmer_widget.dart';

class OngoingLoadingView extends StatefulWidget {
  const OngoingLoadingView({super.key});

  @override
  State<OngoingLoadingView> createState() => _OngoingLoadingViewState();
}

class _OngoingLoadingViewState extends State<OngoingLoadingView> {
  @override
  Widget build(BuildContext context) {
    return CustomShimmerWidget(
      child: Padding(
        padding: EdgeInsets.only(top: 1.h),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 13.sp),
            child: Column(
              children: [
                CustomSeeAllRowWidget(
                  text: 'On Going Shift',
                  firstTextSize: 16.0,
                  secondText: '',
                  secondTextSize: 12.0,
                  textColor: AppColors.primaryColor,
                  fun: () {},
                ),
                customDivider(
                  vPadding: 4.0,
                ),
                CustomShimmerWidget(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Shift Name",
                              style: AppTextStyles.robotoMedium(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Location of the Shift",
                              style: AppTextStyles.robotoRegular(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            h2,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Bone.circle(
                                  size: 16.0,
                                ),
                                w1,
                                Text("MAR 12, 10:35 PM",
                                    style: AppTextStyles.robotoRegular(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          Text(
                            'Timer',
                            style: AppTextStyles.robotoMedium(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          Text(
                            "0 Minutes",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.robotoMedium(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            'Remaining',
                            style: AppTextStyles.robotoMedium(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
