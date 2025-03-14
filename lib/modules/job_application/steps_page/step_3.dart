import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/config/constants/app_colors.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:sizer/sizer.dart';

import '../../../config/constants/asset_paths.dart';
import '../../../ui/input/input_field.dart';
import '../../../utils/heights_and_widths.dart';
import '../widget/custom_date_picker.dart';
import '../widget/custom_drop_down.dart';
import '../widget/custom_radio_button.dart';

class Step3 extends StatefulWidget {
  const Step3({super.key});

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  String _selectedOption = "No"; // Default value
  final List<String> placesList = [
    "Father",
    "Mom",
    "Brother",
    "Sister",
    "Uncle",
    "Son"
  ];
  String? selectedPlace;
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

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
              "Previous last 5 year Address history",
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
                  label: "Enter Your address",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Permanent Address ",
                  hintColor: Colors.grey.shade600,
                  // titleWeight: FontWeight.w600,
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  controller: TextEditingController(),
                  label: "Enter Your postal code",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Post Code",
                  hintColor: Colors.grey.shade600,
                  // titleWeight: FontWeight.w600,
                ),
                h1,
                Row(
                  children: [
                    Expanded(
                      child: DatePickerTextField(
                        text: 'From',
                        hintText: 'From Date',
                        controller: fromDateController,
                      ),
                    ),
                    w1,
                    Expanded(
                      child: DatePickerTextField(
                        text: 'To',
                        hintText: 'From Date',
                        controller: toDateController,
                      ),
                    ),
                  ],
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  controller: TextEditingController(),
                  label: "Enter Your address",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Previous Address",
                  hintColor: Colors.grey.shade600,
                  // titleWeight: FontWeight.w600,
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  controller: TextEditingController(),
                  label: "Enter Your postal code",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Post Code",
                  hintColor: Colors.grey.shade600,
                  // titleWeight: FontWeight.w600,
                ),
                h1,
                Row(
                  children: [
                    Expanded(
                      child: DatePickerTextField(
                        text: 'From',
                        hintText: 'From Date',
                        controller: fromDateController,
                      ),
                    ),
                    w1,
                    Expanded(
                      child: DatePickerTextField(
                        text: 'To',
                        hintText: 'From Date',
                        controller: toDateController,
                      ),
                    ),
                  ],
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  // titleWeight: FontWeight.w600,
                  controller: TextEditingController(),
                  label: "Enter Your Email",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Email",
                  hintColor: Colors.grey.shade600,
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  // titleWeight: FontWeight.w600,
                  controller: TextEditingController(),
                  label: "Enter Your Mobile no",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Mobile no",
                  hintColor: Colors.grey.shade600,
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  // titleWeight: FontWeight.w600,
                  controller: TextEditingController(),
                  label: "Enter Your Telephone no",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Telephone",
                  hintColor: Colors.grey.shade600,
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  // titleWeight: FontWeight.w600,
                  controller: TextEditingController(),
                  label: "Enter Your Nationality",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Nationality",
                  hintColor: Colors.grey.shade600,
                ),
                h1,
                Text(
                  'Date and Place of entry into UK:',
                  style: AppTextStyles.robotoSemiBold(
                    fontSize: 16.0,
                  ),
                ),
                h1,
                Row(
                  children: [
                    Expanded(
                      child: DatePickerTextField(
                        text: 'Date',
                        hintText: 'From Date',
                        controller: fromDateController,
                      ),
                    ),
                    w1,
                    Expanded(
                      child: CustomDropdown<String>(
                        icon: SvgPicture.asset(AssetPaths.dropDownIcon,
                            color: AppColors.black),
                        text: 'Place',
                        hint: "Select place",
                        value: selectedPlace,
                        items: placesList,
                        onChanged: (value) {
                          setState(() {
                            selectedPlace = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                h1,
                CustomRadioButtonGroup(
                  title: "Work Permit",
                  selectedValue: _selectedOption,
                  options: const ["Yes", "No"],
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value;
                    });
                  },
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  // titleWeight: FontWeight.w600,
                  controller: TextEditingController(),
                  label: "Enter Your Insurance Number:",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "National Insurance Number",
                  hintColor: Colors.grey.shade600,
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  // titleWeight: FontWeight.w600,
                  controller: TextEditingController(),
                  label: "Enter Your Passport Number",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Passport Number",
                  hintColor: Colors.grey.shade600,
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  // titleWeight: FontWeight.w600,
                  controller: TextEditingController(),
                  label: "Enter Your SIA License Sector",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "SIA License Sector",
                  hintColor: Colors.grey.shade600,
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  // titleWeight: FontWeight.w600,
                  controller: TextEditingController(),
                  label: "Enter Your SIA License Number",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "SIA License Number",
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
