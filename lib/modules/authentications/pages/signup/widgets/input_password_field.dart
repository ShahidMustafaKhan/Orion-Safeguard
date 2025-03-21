import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../ui/input/input_field.dart';
import '../../../../../utils/utils.dart';
import '../../../cubit/signup/signup_cubit.dart';

class InputPassword extends StatelessWidget {
  const InputPassword({
    super.key,
    required this.passwordFocusNode,
    required this.confirmPasswordFocusNode,
  });

  final FocusNode passwordFocusNode;
  final FocusNode confirmPasswordFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, next) =>
            previous.password != next.password ||
            previous.confirmPassword != next.confirmPassword ||
            previous.hidePassword != next.hidePassword,
        builder: (context, state) {
          return InputField(
            label: "Enter your Password",
            borderRadius: 20.0,
            borderColor: Colors.black,
            boxConstraints: 12,
            verticalPadding: 17.0,
            fieldTitle: "Password",
            focusNode: passwordFocusNode,
            suffixIcon: IconButton(
              icon: Icon(state.hidePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility),
              onPressed: () {
                context.read<SignUpCubit>().onPasswordVisibilityChanged();
              },
            ),
            onChange: (value) =>
                context.read<SignUpCubit>().onPasswordChanged(value),
            onFieldSubmitted: (_) => Utils.focusNextField(
                context: context,
                currentFocus: passwordFocusNode,
                nextFocus: confirmPasswordFocusNode),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            hintColor: Colors.grey.shade600,
            titleSize: 15.0,
            obscureText: state.hidePassword ? true : false,
          );
        });
  }
}
