import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/constants/constants.dart';
import '../../../../../config/routes/nav_router.dart';
import '../../../../../ui/button/primary_button.dart';
import '../../../../../utils/display/display_utils.dart';
import '../../../../../utils/enums.dart';
import '../../../../account_status/pages/under_review_page.dart';
import '../../../../common_modules/custom_dialogues/select_user_dialogue.dart';
import '../../../../job_application/pages/stepper_view.dart';
import '../../../../profile/cubit/profile_cubit/profile_cubit.dart';
import '../../../cubit/signup/signup_cubit.dart';

class SignUpButton extends StatelessWidget {
  final GlobalKey<FormState> globalKey;
  const SignUpButton({
    super.key,
    required this.globalKey,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, next) =>
          previous.postApiStatus != next.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.success) {
          DisplayUtils.showSuccessToast(
              context, "Account created Successfully");
          context.read<ProfileCubit>().updateUserModel(state.userModel);
          if (state.employmentStatus == EmploymentStatus.applying) {
            NavRouter.pushAndRemoveUntil(context, const JobApplicationView());
          } else if (state.employmentStatus == EmploymentStatus.existing) {
            NavRouter.pushAndRemoveUntil(context, const UnderReviewPage());
          }
        } else if (state.postApiStatus == PostApiStatus.error) {
          DisplayUtils.showErrorToast(context, state.message);
        }
      },
      child: BlocBuilder<SignUpCubit, SignUpState>(
          buildWhen: (previous, next) => true,
          builder: (context, state) {
            return PrimaryButton(
              onPressed: () {
                if (globalKey.currentState!.validate()) {
                  final signUpCubit = context.read<SignUpCubit>();

                  showDialog(
                    context: context,
                    builder: (context) => const SelectUserDialogue(),
                  ).then((value) {
                    FocusScope.of(context).unfocus();
                    if (value == "applyingForJob") {
                      signUpCubit
                          .onEmploymentStatusChanged(EmploymentStatus.applying);
                      signUpCubit.onSignUpButtonClicked();
                    } else if (value == "existingEmployee") {
                      signUpCubit
                          .onEmploymentStatusChanged(EmploymentStatus.existing);
                      signUpCubit.onSignUpButtonClicked();
                    }
                  });
                }
                // }
              },
              title: "Sign Up",
              loading: state.postApiStatus == PostApiStatus.loading,
              backgroundColor: AppColors.primaryColor,
              borderRadius: 12.0,
              height: buttonHeight,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              hMargin: 0.0,
            );
          }),
    );
  }
}
