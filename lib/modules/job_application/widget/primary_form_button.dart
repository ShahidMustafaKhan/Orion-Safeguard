import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/config/config.dart';
import 'package:orion_safeguard/modules/account_status/pages/under_review_page.dart';
import 'package:orion_safeguard/modules/profile/cubit/profile_cubit/profile_cubit.dart';
import 'package:orion_safeguard/utils/display/display_utils.dart';

import '../../../config/constants/constants.dart';
import '../../../ui/button/primary_button.dart';
import '../../../utils/enums.dart';
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
    return BlocConsumer<JobApplicationCubit, JobApplicationState>(
        listenWhen: (previous, next) =>
            previous.submissionStatus != next.submissionStatus,
        listener: (context, state) {
          if (state.submissionStatus == PostApiStatus.success) {
            DisplayUtils.showSuccessToast(context, "Job Application submitted");
            context
                .read<ProfileCubit>()
                .changeAccountStatusToPending(state.profilePicture, state.niNo);
            NavRouter.pushAndRemoveUntil(context, UnderReviewPage());
          }
          if (state.submissionStatus == PostApiStatus.error) {
            DisplayUtils.showErrorToast(context, state.errorMessage);
          }
        },
        buildWhen: (previous, next) =>
            previous.submissionStatus != next.submissionStatus,
        builder: (context, state) {
          return PrimaryButton(
            height: formTextFieldHeight,
            loading: state.submissionStatus == PostApiStatus.loading,
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
