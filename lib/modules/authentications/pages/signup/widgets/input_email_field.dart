import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../ui/input/input_field.dart';
import '../../../../../utils/utils.dart';
import '../../../../../utils/validators/email_validator.dart';
import '../../../cubit/signup/signup_cubit.dart';

class InputEmail extends StatelessWidget {
  const InputEmail({
    super.key,
    required this.emailFocusNode,
    required this.passwordFocusNode,
  });

  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, next) => previous.email != next.email,
        builder: (context, state) {
          return InputField(
            label: "Enter your Email",
            borderRadius: 20.0,
            borderColor: Colors.black,
            boxConstraints: 12,
            verticalPadding: 17.0,
            fieldTitle: "Email",
            focusNode: emailFocusNode,
            onChange: (value) =>
                context.read<SignUpCubit>().onEmailChanged(value),
            onFieldSubmitted: (_) => Utils.focusNextField(
                context: context,
                currentFocus: emailFocusNode,
                nextFocus: passwordFocusNode),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!EmailValidator.validate(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            hintColor: Colors.grey.shade600,
            titleSize: 15.0,
          );
        });
  }
}
