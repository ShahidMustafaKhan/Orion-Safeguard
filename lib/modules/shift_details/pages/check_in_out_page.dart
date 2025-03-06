import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orion_safeguard/constants/app_colors.dart';
import 'package:orion_safeguard/constants/app_text_styles.dart';
import 'package:orion_safeguard/modules/screen_layout_widget/screen_layout.dart';
import 'package:orion_safeguard/ui/button/primary_button.dart';
import 'package:sizer/sizer.dart';

import '../../../generated/assets.dart';
import '../../../utils/heights_and_widths.dart';

class CheckInOutPage extends StatefulWidget {
  const CheckInOutPage({super.key});

  @override
  State<CheckInOutPage> createState() => _CheckInOutPageState();
}

class _CheckInOutPageState extends State<CheckInOutPage> {
  @override
  Widget build(BuildContext context) {
    return OrionLayout(
        pageTitle: "Check In",
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Expanded(
                flex: 2,
                child: ShiftTimeBox(),
              ),
              h1,
              Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(
                          22.0,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xfff3dcdf),
                          borderRadius: BorderRadius.circular(
                            100.0,
                          ),
                          border: Border.all(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        child: SvgPicture.asset(
                          Assets.svgCamera,
                          height: 72,
                          width: 72,
                        ),
                      ),
                      h1,
                      Text(
                        "Click on the camera to take a selfie",
                        style: AppTextStyles.robotoRegular(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )),
              PrimaryButton(
                height: 50,
                hMargin: 0,
                backgroundColor: AppColors.primaryColor,
                borderRadius: 16.0,
                onPressed: () {},
                title: "Check-In",
              ),
            ],
          ),
        ));
  }
}

class ShiftTimeBox extends StatelessWidget {
  const ShiftTimeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xfff3dcdf),
        borderRadius: BorderRadius.circular(
          18.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Shift starts in",
            style: AppTextStyles.robotoBold(
              fontSize: 15.sp,
            ),
          ),
          Text(
            "00:43 Minutes",
            style: AppTextStyles.robotoSemiBold(
              fontSize: 15.sp,
              color: Colors.grey.shade600,
            ),
          ),
          h1,
          Text(
            "00:19:11",
            style: AppTextStyles.robotoSemiBold(
              fontSize: 19.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
          Text(
            "You can’t check-in before 10:00AM",
            style: AppTextStyles.robotoSemiBold(
              fontSize: 15.sp,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
