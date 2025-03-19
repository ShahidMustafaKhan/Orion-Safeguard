import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:orion_safeguard/config/constants/constants.dart';
import 'package:orion_safeguard/modules/job_application/cubit/job_application_cubit.dart';
import 'package:orion_safeguard/utils/heights_and_widths.dart';
import 'package:sizer/sizer.dart';

import '../../screen_layout_widget/screen_layout.dart';
import '../common/constants/constants.dart';

class JobApplicationPage extends StatelessWidget {
  const JobApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JobApplicationCubit>(
      create: (BuildContext context) => JobApplicationCubit(),
      child: BlocBuilder<JobApplicationCubit, JobApplicationState>(
          buildWhen: (previous, next) =>
              previous.currentStep != next.currentStep,
          builder: (context, state) {
            return OrionLayout(
              appBarLeading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: context
                    .read<JobApplicationCubit>()
                    .previousStep, // Custom back button logic
              ),
              pageTitle: "Job Application Form",
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    h1,
                    Text('${(state.currentStep) + 1} Step 11',
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
                          width: index == (state.currentStep) ? 40 : 20,
                          height: 10,
                          decoration: BoxDecoration(
                            color: index <= (state.currentStep)
                                ? AppColors.lightGreyColor
                                : AppColors.lightGreyColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    h2,
                    Expanded(
                      child: getFormForStep(state.currentStep),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
