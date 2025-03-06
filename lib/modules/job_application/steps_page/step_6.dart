import 'package:flutter/material.dart';
import 'package:orion_safeguard/constants/app_text_styles.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_colors.dart';
import '../../../ui/input/input_field.dart';
import '../../../utils/heights_and_widths.dart';
import '../widget/custom_radio_button.dart';

class Step6 extends StatefulWidget {
  const Step6({super.key});

  @override
  State<Step6> createState() => _Step6State();
}

class _Step6State extends State<Step6> {
  String selectConviction1 = "No";
  String selectConviction2 = "No";
  String selectConviction3 = "No";
  String selectConviction4 = "No";
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
              "Criminal Convictions",
              style: AppTextStyles.robotoSemiBold(
                fontSize: 16.0,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                h1,
                CustomRadioButtonGroup(
                  title:
                      "Have you, ever been fined, cautioned, sentenced to imprisonment or placed on probation for a criminalact (subject to the Rehabilitation of Offenders Act)?",
                  selectedValue: selectConviction1,
                  options: const ["Yes", "No"],
                  onChanged: (value) {
                    setState(() {
                      selectConviction1 = value; // Update the selected value
                    });
                  },
                ),
                h1,
                CustomRadioButtonGroup(
                  title:
                      "Are there any alleged offences outstanding against you?",
                  selectedValue: selectConviction2,
                  options: const ["Yes", "No"],
                  onChanged: (value) {
                    setState(() {
                      selectConviction2 = value; // Update the selected value
                    });
                  },
                ),
                h1,
                CustomRadioButtonGroup(
                  title:
                      "Have you, ever been made bankrupt or have any Court Judgements against you, whether satisfied ornot, within the last 6 years?",
                  selectedValue: selectConviction3,
                  options: const ["Yes", "No"],
                  onChanged: (value) {
                    setState(() {
                      selectConviction3 = value; // Update the selected value
                    });
                  },
                ),
                h1,
                CustomRadioButtonGroup(
                  title:
                      "Has any order been made against you by a Civil or Military Court or Public Authority?",
                  selectedValue: selectConviction4,
                  options: const ["Yes", "No"],
                  onChanged: (value) {
                    setState(() {
                      selectConviction4 = value; // Update the selected value
                    });
                  },
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  maxLines: 3,
                  titleWeight: FontWeight.w500,
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
