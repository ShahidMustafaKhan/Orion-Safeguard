import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orion_safeguard/constants/app_colors.dart';
import 'package:orion_safeguard/constants/app_text_styles.dart';

import '../../generated/assets.dart';
import '../../utils/heights_and_widths.dart';

class CompletedShiftsWidget extends StatelessWidget {
  const CompletedShiftsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  "Shift name",
                  style: AppTextStyles.robotoSemiBold(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Location of the Shift",
                  style: AppTextStyles.robotoRegular(
                    fontSize: 12.0,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.svgCalender,
                      height: 16.0,
                      width: 16.0,
                    ),
                    w1,
                    Text(
                      "Nov 8, 18:00 - 01:00",
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
                  "10:00",
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
                  "22:00",
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
    );
  }
}
