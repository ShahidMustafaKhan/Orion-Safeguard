import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/constants/constants.dart';
import '../../../../../config/routes/nav_router.dart';
import '../../../../../ui/button/primary_button.dart';
import '../../../../../utils/display/display_utils.dart';
import '../../../../../utils/enums.dart';
import '../../../cubit/login/login_cubit.dart';
import '../../signIn/signin_screen.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, next) =>
          previous.postApiStatus != next.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.success) {
          DisplayUtils.showSuccessToast(context, "Password reset link sent");
          Future.delayed(const Duration(seconds: 2), () {
            if (context.mounted) {
              NavRouter.pushAndRemoveUntil(context, LoginScreen());
            }
          });
        } else if (state.postApiStatus == PostApiStatus.error) {
          DisplayUtils.showErrorToast(context, state.message);
        }
      },
      child: BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (previous, next) => true,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
              child: PrimaryButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<LoginCubit>().forgetPassword();
                  }
                },
                loading: state.postApiStatus == PostApiStatus.loading,
                title: "Reset Password",
                backgroundColor: AppColors.primaryColor,
                borderRadius: 12.0,
                height: buttonHeight,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                hMargin: 0.0,
              ),
            );
          }),
    );
  }
}
