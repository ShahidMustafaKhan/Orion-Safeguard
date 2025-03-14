import 'package:flutter/material.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:sizer/sizer.dart';

import '../../../config/constants/app_colors.dart';
import '../../../ui/input/input_field.dart';
import '../../../utils/heights_and_widths.dart';
import '../widget/custom_radio_button.dart';

class Step5 extends StatefulWidget {
  const Step5({super.key});

  @override
  State<Step5> createState() => _Step5State();
}

class _Step5State extends State<Step5> {
  String selectTransport = "No";
  String selectDisQualified = "No";
  String selectConviction = "No";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 3.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Driving",
              style: AppTextStyles.robotoSemiBold(
                fontSize: 16.0,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  controller: TextEditingController(),
                  label: "Type of Driving License",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Type of Driving License",
                  hintColor: Colors.grey.shade600,
                  // titleWeight: FontWeight.w600,
                ),
                h1,
                CustomRadioButtonGroup(
                  title: "Own Transport",
                  selectedValue: selectTransport,
                  options: const ["Yes", "No"],
                  onChanged: (value) {
                    setState(() {
                      selectTransport = value; // Update the selected value
                    });
                  },
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  controller: TextEditingController(),
                  label: "Enter Driving License Number",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Driving License Number",
                  hintColor: Colors.grey.shade600,
                  // titleWeight: FontWeight.w600,
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  controller: TextEditingController(),
                  label: "Enter DVLA License Check Code",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "DVLA License Check Code",
                  hintColor: Colors.grey.shade600,
                  // titleWeight: FontWeight.w600,
                ),
                h1,
                CustomRadioButtonGroup(
                  title: "Have you ever been disqualified?",
                  selectedValue: selectDisQualified,
                  options: const ["Yes", "No"],
                  onChanged: (value) {
                    setState(() {
                      selectDisQualified = value; // Update the selected value
                    });
                  },
                ),
                h1,
                CustomRadioButtonGroup(
                  title: "Any Motoring offences/convictions?",
                  selectedValue: selectConviction,
                  options: const ["Yes", "No"],
                  onChanged: (value) {
                    setState(() {
                      selectConviction = value; // Update the selected value
                    });
                  },
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  maxLines: 3,
                  // titleWeight: FontWeight.w600,
                  controller: TextEditingController(),
                  label: "Enter text here",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle:
                      "If yes, please provide description of your offence/s below if no then leave it empty",
                  hintColor: Colors.grey.shade600,
                ),
              ],
            ),
            h1,
          ],
        ),
      ),
    );
  }
}
