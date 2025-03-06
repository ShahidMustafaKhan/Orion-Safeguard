import 'package:flutter/material.dart';
import 'package:orion_safeguard/config/config.dart';
import 'package:orion_safeguard/modules/shift_details/pages/check_in_out_page.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../ui/button/primary_button.dart';
import '../../../utils/heights_and_widths.dart';
import '../../../utils/helper_widgets.dart';
import '../../screen_layout_widget/screen_layout.dart';
import 'ongoing_shift_details_page.dart';

class CompletedShiftDetailsPage extends StatefulWidget {
  const CompletedShiftDetailsPage({super.key});

  @override
  State<CompletedShiftDetailsPage> createState() =>
      _CompletedShiftDetailsPageState();
}

class _CompletedShiftDetailsPageState extends State<CompletedShiftDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return OrionLayout(
        pageTitle: "Shift Details",
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
                            fontSize: 12.0,
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
                            fontSize: 12.0,
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
                            fontSize: 12.0,
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
                backgroundColor: AppColors.green,
                borderRadius: 16.0,
                onPressed: () {
                  NavRouter.push(context, const CheckInOutPage());
                },
                title: "Check-In",
              ),
            ],
          ),
        ));
  }
}
