import 'package:flutter/material.dart';
import 'package:orion_safeguard/config/constants/app_colors.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:sizer/sizer.dart';

import '../../../ui/input/input_field.dart';
import '../../../utils/heights_and_widths.dart';
import '../widget/custom_drop_down.dart';

class Step4 extends StatefulWidget {
  const Step4({super.key});

  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  final List<String> relationShip = [
    "Father",
    "Mom",
    "Brother",
    "Sister",
    "Uncle",
    "Son"
  ];
  String? selectedRelation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 3.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Person to contact in case of emergency/Next of kin",
              style: AppTextStyles.robotoSemiBold(
                fontSize: 16.0,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDropdown<String>(
                  icon: const Icon(Icons.keyboard_arrow_down),
                  text: 'Relationship to next of kin:',
                  hint: "Select relationship",
                  value: selectedRelation,
                  items: relationShip,
                  onChanged: (value) {
                    setState(() {
                      selectedRelation = value;
                    });
                  },
                ),
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  controller: TextEditingController(),
                  label: "Enter name of kin",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Name",
                  hintColor: Colors.grey.shade600,
                  // titleWeight: FontWeight.w600,
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  controller: TextEditingController(),
                  label: "Enter Telephone no",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Telephone no",
                  hintColor: Colors.grey.shade600,
                  // titleWeight: FontWeight.w600,
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  controller: TextEditingController(),
                  label: "Enter mobile number",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Mobile no",
                  hintColor: Colors.grey.shade600,
                  // titleWeight: FontWeight.w600,
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  controller: TextEditingController(),
                  label: "Enter Kin address",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Address",
                  hintColor: Colors.grey.shade600,
                  // titleWeight: FontWeight.w600,
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  // titleWeight: FontWeight.w600,
                  controller: TextEditingController(),
                  label: "Enter Kin post code",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Post code",
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
