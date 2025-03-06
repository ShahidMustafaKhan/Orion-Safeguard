import 'package:flutter/material.dart';
import 'package:orion_safeguard/constants/app_colors.dart';
import 'package:orion_safeguard/constants/app_text_styles.dart';
import 'package:sizer/sizer.dart';
import '../../../ui/input/input_field.dart';
import '../../../utils/heights_and_widths.dart';

class Step8 extends StatefulWidget {
  const Step8({super.key});

  @override
  State<Step8> createState() => _Step8State();
}

class _Step8State extends State<Step8> {
  String _selectedOption = "Asian";
  final List<String> _options = [
    "British",
    "African",
    "Asian",
    "Caribbean",
    "Chinese",
    "White",
    "Other",
  ];
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
              "Equal Opportunities",
              style: AppTextStyles.robotoSemiBold(
                fontSize: 16.0,
              ),
            ),
            Text(
              'This section is voluntary and will NOT be used in assessing your application. Orion Safeguarding Ltd is an equal opportunities employer. If you decide to complete this section, it will help us to monitor the effectiveness of our Equal Opportunities Policy. Please tick the appropriate box below',
              style: AppTextStyles.robotoRegular(
                fontSize: 14.0,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                h0P5,
                Text(
                  "My Ethnic origin is",
                  style: AppTextStyles.robotoSemiBold(
                    fontSize: 15.0,
                  ),
                ),
                Column(
                  children: _options.map((option) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedOption = option;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: AppColors.greyColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                option,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            Radio<String>(
                              value: option,
                              groupValue: _selectedOption,
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    _selectedOption = value;
                                  });
                                }
                              },
                              activeColor: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                // h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  // titleWeight: FontWeight.w600,
                  controller: TextEditingController(),
                  label: "Enter Ethnic origin",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "If other, please specify ",
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
