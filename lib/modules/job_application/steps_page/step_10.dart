import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orion_safeguard/config/constants/app_colors.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:sizer/sizer.dart';

import '../../../config/constants/asset_paths.dart';
import '../../../ui/input/input_field.dart';
import '../../../utils/heights_and_widths.dart';
import '../widget/custom_date_picker.dart';
import '../widget/custom_drop_down.dart';

class Step10 extends StatefulWidget {
  const Step10({super.key});

  @override
  State<Step10> createState() => _Step10State();
}

class _Step10State extends State<Step10> {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  final List<String> placesList = [
    "Father",
    "Mom",
    "Brother",
    "Sister",
    "Uncle",
    "Son"
  ];
  String? selectedPlace;

  // List to hold experience fields, initially containing one experience.
  List<Map<String, dynamic>> experienceList = [
    {
      "addressController": TextEditingController(),
      "sortCodeController": TextEditingController(),
      "postcodeController": TextEditingController(),
      "accountNoController": TextEditingController(),
      "managerController": TextEditingController(),
      "salaryController": TextEditingController(),
      "fromDateController": TextEditingController(),
      "toDateController": TextEditingController(),
      "reasonController": TextEditingController(),
      "selectedPlace": null
    },
  ];

  // Method to add another experience field set
  void _addExperience() {
    if (experienceList.length < 5) {
      setState(() {
        experienceList.add({
          "addressController": TextEditingController(),
          "sortCodeController": TextEditingController(),
          "postcodeController": TextEditingController(),
          "accountNoController": TextEditingController(),
          "managerController": TextEditingController(),
          "salaryController": TextEditingController(),
          "fromDateController": TextEditingController(),
          "toDateController": TextEditingController(),
          "reasonController": TextEditingController(),
          "selectedPlace": null
        });
      });
    }
  }

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
              "Previous Employment",
              style: AppTextStyles.robotoSemiBold(
                fontSize: 16.0,
              ),
            ),
            Text(
              "State all periods of employment, unemployment and self-employment for the last 5 years or since leaving school. For any periods of unemployment, state the address of the Unemployment Benefit Office at which you reported. Start with present situation.",
              style: AppTextStyles.robotoRegular(
                fontSize: 14.0,
              ),
            ),
            Text(
              "Employment Details",
              style: AppTextStyles.robotoSemiBold(
                fontSize: 16.0,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(experienceList.length, (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputField(
                      fillColor: AppColors.grey,
                      titleSize: 14.0,
                      controller: experienceList[index]["addressController"],
                      label: "Enter Address of Institute ",
                      borderRadius: 20.0,
                      borderColor: AppColors.greyColor,
                      boxConstraints: 12,
                      verticalPadding: 17.0,
                      fieldTitle: "Name",
                      hintColor: Colors.grey.shade600,
                    ),
                    h1,
                    InputField(
                      fillColor: AppColors.grey,
                      titleSize: 14.0,
                      controller: experienceList[index]["sortCodeController"],
                      label: "Enter Sort Code",
                      borderRadius: 20.0,
                      borderColor: AppColors.greyColor,
                      boxConstraints: 12,
                      verticalPadding: 17.0,
                      fieldTitle: "Sort Code",
                      hintColor: Colors.grey.shade600,
                    ),
                    h1,
                    InputField(
                      fillColor: AppColors.grey,
                      titleSize: 14.0,
                      controller: experienceList[index]["postcodeController"],
                      label: "Enter Post code",
                      borderRadius: 20.0,
                      borderColor: AppColors.greyColor,
                      boxConstraints: 12,
                      verticalPadding: 17.0,
                      fieldTitle: "Post code",
                      hintColor: Colors.grey.shade600,
                    ),
                    h1,
                    InputField(
                      fillColor: AppColors.grey,
                      titleSize: 14.0,
                      controller: experienceList[index]["accountNoController"],
                      label: "Enter Account No",
                      borderRadius: 20.0,
                      borderColor: AppColors.greyColor,
                      boxConstraints: 12,
                      verticalPadding: 17.0,
                      fieldTitle: "Telephone no",
                      hintColor: Colors.grey.shade600,
                    ),
                    h1,
                    CustomDropdown<String>(
                      icon: SvgPicture.asset(AssetPaths.dropDownIcon,
                          color: AppColors.black),
                      text: 'Position',
                      hint: "Select Position",
                      value: experienceList[index]["selectedPlace"],
                      items: placesList,
                      onChanged: (value) {
                        setState(() {
                          experienceList[index]["selectedPlace"] = value;
                        });
                      },
                    ),
                    h1,
                    InputField(
                      fillColor: AppColors.grey,
                      titleSize: 14.0,
                      controller: experienceList[index]["managerController"],
                      label: "Enter Manager Name",
                      borderRadius: 20.0,
                      borderColor: AppColors.greyColor,
                      boxConstraints: 12,
                      verticalPadding: 17.0,
                      fieldTitle: "Manager name",
                      hintColor: Colors.grey.shade600,
                    ),
                    h1,
                    InputField(
                      fillColor: AppColors.grey,
                      titleSize: 14.0,
                      controller: experienceList[index]["salaryController"],
                      label: "Enter Salary",
                      borderRadius: 20.0,
                      borderColor: AppColors.greyColor,
                      boxConstraints: 12,
                      verticalPadding: 17.0,
                      fieldTitle: "Salary",
                      hintColor: Colors.grey.shade600,
                    ),
                    h2,
                    Row(
                      children: [
                        Expanded(
                          child: DatePickerTextField(
                            text: 'From',
                            hintText: 'From Date',
                            controller: experienceList[index]
                                ["fromDateController"],
                          ),
                        ),
                        w1,
                        Expanded(
                          child: DatePickerTextField(
                            text: 'To',
                            hintText: 'To Date',
                            controller: experienceList[index]
                                ["toDateController"],
                          ),
                        ),
                      ],
                    ),
                    h1,
                    InputField(
                      maxLines: 3,
                      fillColor: AppColors.grey,
                      titleSize: 14.0,
                      controller: experienceList[index]["reasonController"],
                      label: "Enter text here",
                      borderRadius: 20.0,
                      borderColor: AppColors.greyColor,
                      boxConstraints: 12,
                      verticalPadding: 17.0,
                      fieldTitle: "Reason for Leaving",
                      hintColor: Colors.grey.shade600,
                    ),
                    h1,
                  ],
                );
              }),
            ),
            // h1,
            if (experienceList.length <
                5) // Show the "Add another experience" button if there are less than 5 experiences
              GestureDetector(
                onTap: _addExperience,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Add another experience',
                      style: AppTextStyles.robotoSemiBold(fontSize: 14),
                    ),
                    const Spacer(), // This will push the "+" icon to the right
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black),
                      ),
                      child:
                          //  IconButton(
                          //   icon: const

                          Icon(
                        Icons.add,
                        size: 16,
                      ),
                      // onPressed: _addExperience,
                      // ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
