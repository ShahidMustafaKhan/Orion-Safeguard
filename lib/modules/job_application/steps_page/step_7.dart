import 'package:flutter/material.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_text_styles.dart';
import '../../../ui/input/input_field.dart';
import '../../../utils/heights_and_widths.dart';
import '../widget/custom_date_picker.dart';
import '../widget/custom_drop_down.dart';

class Step7 extends StatefulWidget {
  const Step7({super.key});

  @override
  State<Step7> createState() => _Step7State();
}

class _Step7State extends State<Step7> {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  final List<String> instituteTypeList = [
    "Matriculation",
    "Intermediate",
    "PostGraduate",
    "M.Phill",
    "PHD",
    "Diploma"
  ];
  String? selectInstituteType;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.left,
            "Education",
            style: AppTextStyles.robotoSemiBold(
              fontSize: 18.0,
            ),
          ),
          h0P5,
          CustomDropdown<String>(
            icon: const Icon(Icons.keyboard_arrow_down),
            text: 'Type of Institute ',
            hint: "Select type of education",
            value: selectInstituteType,
            items: instituteTypeList,
            onChanged: (value) {
              setState(() {
                selectInstituteType = value;
              });
            },
          ),
          h1,
          InputField(
            fillColor: AppColors.grey,
            titleSize: 14.0,
            controller: TextEditingController(),
            label: "Enter Name of Institute ",
            borderRadius: 20.0,
            borderColor: AppColors.greyColor,
            boxConstraints: 12,
            verticalPadding: 17.0,
            fieldTitle: "Name of Institute ",
            hintColor: Colors.grey.shade600,
            titleWeight: FontWeight.w600,
          ),
          h1,
          InputField(
            fillColor: AppColors.grey,
            titleSize: 14.0,
            controller: TextEditingController(),
            label: "Enter Address of Institute",
            borderRadius: 20.0,
            borderColor: AppColors.greyColor,
            boxConstraints: 12,
            verticalPadding: 17.0,
            fieldTitle: "Address of Institute",
            hintColor: Colors.grey.shade600,
            titleWeight: FontWeight.w600,
          ),
          h2,
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
            titleWeight: FontWeight.w600,
            controller: TextEditingController(),
            label: "Enter your Grades",
            borderRadius: 20.0,
            borderColor: AppColors.greyColor,
            boxConstraints: 12,
            verticalPadding: 17.0,
            fieldTitle: "Grades",
            hintColor: Colors.grey.shade600,
          ),
          h1,
        ],
      ),
    );
  }
}
