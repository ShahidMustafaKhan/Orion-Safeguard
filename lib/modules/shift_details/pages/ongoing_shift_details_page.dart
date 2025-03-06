import 'package:flutter/material.dart';
import 'package:orion_safeguard/constants/app_colors.dart';
import 'package:orion_safeguard/constants/app_text_styles.dart';
import 'package:orion_safeguard/modules/screen_layout_widget/screen_layout.dart';
import 'package:orion_safeguard/utils/helper_widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../config/routes/nav_router.dart';
import '../../../ui/button/primary_button.dart';
import '../../../utils/heights_and_widths.dart';
import 'completed_shift_details_page.dart';

class OngoingShiftDetailsPage extends StatefulWidget {
  const OngoingShiftDetailsPage({super.key});

  @override
  State<OngoingShiftDetailsPage> createState() =>
      _OngoingShiftDetailsPageState();
}

class _OngoingShiftDetailsPageState extends State<OngoingShiftDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return OrionLayout(
        pageTitle: "Shift Details",
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shift name",
                          style: AppTextStyles.robotoBold(
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          "Location",
                          style: AppTextStyles.robotoRegular(
                            fontSize: 14.0,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Up Coming Shift",
                      style: AppTextStyles.robotoBold(
                        color: const Color(0xff575757),
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
                h1,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CustomShiftBox(
                      fieldName: 'Date',
                      fieldSubName: 'Nov 8, 2024',
                    ),
                    customVerticalDivider(
                      height: 30.sp,
                      thickness: 4.sp,
                      color: Colors.grey.shade600,
                    ),
                    const CustomShiftBox(
                      fieldName: 'Shift type',
                      fieldSubName: 'Day/Night',
                    ),
                  ],
                ),
                h1,
                customDivider(),
                h1,
                Text(
                  "Shift Description",
                  style: AppTextStyles.robotoSemiBold(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Lorem ipsum dolor sit amet consectetur. Nulla tincidunt interdum auctor massa tempor magna bibendum sapien. Elementum in leo magna molestie. Sem nulla congue donec aliquet aliquet nunc sed faucibus cras. Placerat nisl vitae lobortis vel fringilla pretium faucibus. Nisl ultrices lacus.",
                  style: AppTextStyles.robotoRegular(
                    fontSize: 12.0,
                    color: AppColors.textGrey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                customDivider(),
                h1,
                Text(
                  "Schedule",
                  style: AppTextStyles.robotoSemiBold(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Start Date",
                            style: AppTextStyles.robotoBold(
                              fontSize: 13.0,
                            ),
                          ),
                          Text(
                            "Sept 25, 2024, 8:00 AM",
                            style: AppTextStyles.robotoRegular(
                              fontSize: 14.0,
                            ),
                          )
                        ],
                      ),
                      customDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "End Date",
                            style: AppTextStyles.robotoBold(
                              fontSize: 13.0,
                            ),
                          ),
                          Text(
                            "Sept 25, 2024, 5:00 PM",
                            style: AppTextStyles.robotoRegular(
                              fontSize: 14.0,
                            ),
                          )
                        ],
                      ),
                      customDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Duration",
                            style: AppTextStyles.robotoBold(
                              fontSize: 13.0,
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.left,
                            "9 Hours",
                            style: AppTextStyles.robotoRegular(
                              fontSize: 14.0,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                customDivider(),
                h1,
                PrimaryButton(
                  height: 50,
                  hMargin: 0,
                  backgroundColor: AppColors.primaryColor,
                  borderRadius: 16.0,
                  onPressed: () {
                    NavRouter.push(context, const CompletedShiftDetailsPage());
                  },
                  title: "Approve",
                ),
                h0P5,
                PrimaryOutlineButton(
                  height: 50,
                  borderRadius: 16.0,
                  titleColor: AppColors.primaryColor,
                  borderColor: AppColors.primaryColor,
                  onPressed: () {},
                  title: "Decline",
                )
              ],
            ),
          ),
        ));
  }
}

class CustomShiftBox extends StatelessWidget {
  const CustomShiftBox(
      {super.key, required this.fieldName, required this.fieldSubName});

  final String fieldName;
  final String fieldSubName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.sp,
      width: 50.sp,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          // color: Colors.red.shade100,
          color: AppColors.primaryColor.withOpacity(0.3)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            fieldName,
            style: AppTextStyles.robotoBold(
              fontSize: 14.0,
            ),
          ),
          Text(
            fieldSubName,
            style: AppTextStyles.robotoRegular(
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
