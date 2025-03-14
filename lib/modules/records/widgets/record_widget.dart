import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_text_styles.dart';
import '../../../generated/assets.dart';
import '../../../utils/heights_and_widths.dart';

class RecordWidget extends StatelessWidget {
  final String? name;
  final String? location;
  final String? date;
  final bool isCompleted;

  const RecordWidget(
      {super.key,
      this.isCompleted = true,
      this.name,
      this.location,
      this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textAlign: TextAlign.left,
              name ?? "Name",
              style: AppTextStyles.robotoRegular(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                // color: Colors.grey,
              ),
            ),
            Text(
              textAlign: TextAlign.left,
              isCompleted ? "Completed On" : "Missed/Rejected",
              style: AppTextStyles.robotoRegular(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: isCompleted ? Colors.green : AppColors.primaryColor,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textAlign: TextAlign.left,
              location ?? "Location",
              style: AppTextStyles.robotoRegular(
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
                // color: Colors.grey,
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  Assets.svgCalender,
                ),
                w2,
                Text(
                  textAlign: TextAlign.left,
                  date ?? "",
                  style: AppTextStyles.robotoRegular(
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
