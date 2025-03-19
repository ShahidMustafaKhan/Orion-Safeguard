import 'package:flutter/material.dart';
import 'package:orion_safeguard/modules/screen_layout_widget/custom_shimmer_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../utils/heights_and_widths.dart';
import '../../../../utils/helper_widgets.dart';

class CompletedShiftsLoadingView extends StatefulWidget {
  const CompletedShiftsLoadingView({super.key});

  @override
  State<CompletedShiftsLoadingView> createState() =>
      _CompletedShiftsLoadingViewState();
}

class _CompletedShiftsLoadingViewState
    extends State<CompletedShiftsLoadingView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return CompletedShiftsLoadingWidget();
      },
      separatorBuilder: (BuildContext context, int index) {
        return customDivider(
          hPadding: 10.0,
          thickness: 1.2,
          color: Colors.grey.shade300,
        );
      },
    );
  }
}

class CompletedShiftsLoadingWidget extends StatelessWidget {
  const CompletedShiftsLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomShimmerWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Completed",
                    style: AppTextStyles.robotoSemiBold(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff3EB654),
                    ),
                  ),
                  Text(
                    "a",
                    style: AppTextStyles.robotoSemiBold(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Location of the shift",
                    style: AppTextStyles.robotoRegular(
                      fontSize: 12.0,
                    ),
                  ),
                  Row(
                    children: [
                      Bone.circle(),
                      w1,
                      Text(
                        "MAR 12, 10:45 PM",
                        style: AppTextStyles.robotoRegular(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Check-in",
                    style: AppTextStyles.robotoSemiBold(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Text(
                    "10:45 AM",
                    style: AppTextStyles.robotoSemiBold(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff3EB654),
                    ),
                  ),
                  Text(
                    "Check-out",
                    style: AppTextStyles.robotoSemiBold(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Text(
                    "10:45 AM",
                    style: AppTextStyles.robotoSemiBold(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
