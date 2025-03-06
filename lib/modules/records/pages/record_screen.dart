import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orion_safeguard/constants/app_colors.dart';
import 'package:orion_safeguard/modules/screen_layout_widget/base_view_layout.dart';
import 'package:orion_safeguard/utils/heights_and_widths.dart';
import 'package:orion_safeguard/utils/helper_widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_text_styles.dart';
import '../../../generated/assets.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseViewLayout(
        pageTitle: 'Records',
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textAlign: TextAlign.left,
                    "Records",
                    style: AppTextStyles.robotoRegular(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        textAlign: TextAlign.left,
                        "Filters",
                        style: AppTextStyles.robotoRegular(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      ),
                      w1,
                      SvgPicture.asset(
                        Assets.svgFilter,
                        height: 12,
                        width: 12,
                      ),
                    ],
                  )
                ],
              ),
              h0P5,
              Expanded(
                child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ),
                    itemBuilder: (context, index) {
                      int divisor =
                          index; // Ensure the divisor is a valid number
                      bool isCompleted =
                          divisor != 0 && 2 % divisor == 0; // Safe check

                      return RecordWidget(
                        isCompleted: !isCompleted,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return customDivider(thickness: 1.2);
                    },
                    itemCount: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RecordWidget extends StatelessWidget {
  const RecordWidget({super.key, this.isCompleted = true});

  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textAlign: TextAlign.left,
              "Shift name",
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
              "Location of Shift",
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
                  "Nov 8, 18:00 - 01:00 ",
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
