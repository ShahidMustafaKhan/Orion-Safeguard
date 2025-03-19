import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/config/constants/app_colors.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:orion_safeguard/modules/job_application/cubit/job_application_cubit.dart';
import 'package:orion_safeguard/modules/job_application/widget/primary_form_button.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/heights_and_widths.dart';
import '../common/constants/constants.dart';
import '../widget/input_form_field.dart';

class Step8 extends StatefulWidget {
  const Step8({super.key});

  @override
  State<Step8> createState() => _Step8State();
}

class _Step8State extends State<Step8> {
  final formKey = GlobalKey<FormState>();

  late String _selectedOption;
  TextEditingController otherGender = TextEditingController();

  @override
  void initState() {
    JobApplicationCubit cubit = context.read<JobApplicationCubit>();

    _selectedOption =
        cubit.state.ethnicOrigin == "" ? "Asian" : cubit.state.ethnicOrigin;

    if (ethnicOrigin().contains(cubit.state.ethnicOrigin) == false) {
      _selectedOption = "Other";
      otherGender.text = cubit.state.ethnicOrigin;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
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
                        children: ethnicOrigin().map((option) {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
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
                      if (_selectedOption == "Other")
                        Form(
                          child: InputFormField(
                            controller: otherGender,
                            label: "Enter Ethnic origin",
                            fieldTitle: "If other, please specify ",
                          ),
                        )
                    ],
                  ),
                  h1,
                ],
              ),
            ),
          ),
          PrimaryFormButton(
            onPressed: () {
              JobApplicationCubit cubit = context.read<JobApplicationCubit>();
              cubit.updateJobApplicationState(
                cubit.state.copyWith(
                  ethnicOrigin: _selectedOption == "Other"
                      ? otherGender.text
                      : _selectedOption,
                ),
              );
            },
            formKey: formKey,
          )
        ],
      ),
    );
  }
}
