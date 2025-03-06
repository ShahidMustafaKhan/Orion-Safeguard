import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../ui/input/input_field.dart';
import '../../../utils/heights_and_widths.dart';

class Step9 extends StatefulWidget {
  const Step9({super.key});

  @override
  State<Step9> createState() => _Step9State();
}

class _Step9State extends State<Step9> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 8.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.left,
            "Bank Details",
            style: AppTextStyles.robotoSemiBold(
              fontSize: 16.0,
            ),
          ),
          h0P5,
          InputField(
            fillColor: AppColors.grey,
            titleSize: 14.0,
            controller: TextEditingController(),
            label: "Enter Bank Name",
            borderRadius: 20.0,
            borderColor: AppColors.greyColor,
            boxConstraints: 12,
            verticalPadding: 17.0,
            fieldTitle: "Bank Name",
            hintColor: Colors.grey.shade600,
            // titleWeight: FontWeight.w600,
          ),
          h1,
          InputField(
            fillColor: AppColors.grey,
            titleSize: 14.0,
            controller: TextEditingController(),
            label: "Enter Account Holder Name",
            borderRadius: 20.0,
            borderColor: AppColors.greyColor,
            boxConstraints: 12,
            verticalPadding: 17.0,
            fieldTitle: "Account Holder Name",
            hintColor: Colors.grey.shade600,
            // titleWeight: FontWeight.w600,
          ),
          h1,
          InputField(
            fillColor: AppColors.grey,
            titleSize: 14.0,
            controller: TextEditingController(),
            label: "Enter Sort Code",
            borderRadius: 20.0,
            borderColor: AppColors.greyColor,
            boxConstraints: 12,
            verticalPadding: 17.0,
            fieldTitle: "Sort Code",
            hintColor: Colors.grey.shade600,
            // titleWeight: FontWeight.w600,
          ),
          h1,
          InputField(
            titleSize: 14.0,
            // titleWeight: FontWeight.w600,
            controller: TextEditingController(),
            label: "Enter Account No",
            borderRadius: 20.0,
            borderColor: AppColors.greyColor,
            boxConstraints: 12,
            verticalPadding: 17.0,
            fieldTitle: "Account No",
            fillColor: AppColors.grey,
            hintColor: Colors.grey.shade600,
          ),
          h1,
        ],
      ),
    );
  }
}
