import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/constants/constants.dart';
import '../../../ui/button/primary_button.dart';
import '../cubit/job_application_cubit.dart';

class PrimaryFormButton extends StatelessWidget {
  const PrimaryFormButton({
    super.key,
    this.formKey,
    required this.onPressed,
    this.title,
  });

  final GlobalKey<FormState>? formKey;
  final Function() onPressed;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobApplicationCubit, JobApplicationState>(
        buildWhen: (previous, next) => false,
        builder: (context, state) {
          return PrimaryButton(
            height: formTextFieldHeight,
            hMargin: 0,
            backgroundColor: AppColors.primaryColor,
            borderRadius: 16.0,
            onPressed: () {
              if (formKey?.currentState?.validate() ?? true) {
              onPressed();

              context.read<JobApplicationCubit>().nextStep();
              }
            },
            title: title ?? "Next",
          );
        });
  }
}
