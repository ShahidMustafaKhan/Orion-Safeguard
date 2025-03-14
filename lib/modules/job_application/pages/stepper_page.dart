import 'package:flutter/material.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:orion_safeguard/config/constants/constants.dart';
import 'package:orion_safeguard/modules/job_application/steps_page/step_1.dart';
import 'package:orion_safeguard/modules/job_application/steps_page/step_10.dart';
import 'package:orion_safeguard/modules/job_application/steps_page/step_5.dart';
import 'package:orion_safeguard/modules/job_application/steps_page/step_9.dart';
import 'package:orion_safeguard/ui/button/primary_button.dart';
import 'package:orion_safeguard/utils/heights_and_widths.dart';
import 'package:sizer/sizer.dart';

import '../../screen_layout_widget/screen_layout.dart';
import '../steps_page/step_11.dart';
import '../steps_page/step_2.dart';
import '../steps_page/step_3.dart';
import '../steps_page/step_4.dart';
import '../steps_page/step_6.dart';
import '../steps_page/step_7.dart';
import '../steps_page/step_8.dart';

class JobApplicationPage extends StatefulWidget {
  const JobApplicationPage({super.key});

  @override
  State<JobApplicationPage> createState() => _JobApplicationPageState();
}

class _JobApplicationPageState extends State<JobApplicationPage> {
  int currentStep = 0;

  final List<GlobalKey<FormState>> _formKeys =
      List.generate(11, (_) => GlobalKey<FormState>());

  void goToStep(int step) {
    setState(() {
      currentStep = step.clamp(0, 10);
    });
  }

  void _nextStep() {
    if (currentStep < 10) {
      goToStep(currentStep + 1);
    }
  }

  void _previousStep() {
    if (currentStep > 0) {
      goToStep(currentStep - 1);
    } else {
      // If it's at Step 1, navigate back to the previous page
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrionLayout(
      appBarLeading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: _previousStep, // Custom back button logic
      ),
      pageTitle: "Job Application Form",
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            h1,
            Text('${currentStep + 1} Step 11',
                style: AppTextStyles.robotoSemiBold(
                    fontSize: 17.sp, color: AppColors.primaryColor)),
            h1,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                11,
                (index) => AnimatedContainer(
                  margin: EdgeInsets.only(right: 6.sp),
                  duration: const Duration(milliseconds: 300),
                  width: index == currentStep ? 40 : 20,
                  height: 10,
                  decoration: BoxDecoration(
                    color: index <= currentStep
                        ? AppColors.lightGreyColor
                        : AppColors.lightGreyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            h2,
            Expanded(
              child: _getFormForStep(currentStep),
            ),
            PrimaryButton(
              height: formTextFieldHeight,
              hMargin: 0,
              backgroundColor: AppColors.primaryColor,
              borderRadius: 16.0,
              onPressed: _nextStep,
              title: "Next",
            ),
          ],
        ),
      ),
    );
  }

  Widget _getFormForStep(int step) {
    switch (step) {
      case 0:
        return const Step1();
      case 1:
        return const Step2();
      case 2:
        return const Step3();
      case 3:
        return const Step4();
      case 4:
        return const Step5();
      case 5:
        return const Step6();
      case 6:
        return const Step7();
      case 7:
        return const Step8();
      case 8:
        return const Step9();
      case 9:
        return const Step10();
      case 10:
        return const Step11();

      default:
        return Container();
    }
  }
}

class StepOneForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const StepOneForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Enter Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
