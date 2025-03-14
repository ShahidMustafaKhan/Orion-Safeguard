import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../ui/input/input_field.dart';
import '../../../cubit/login/login_cubit.dart';

class InputPasswordField extends StatelessWidget {
  const InputPasswordField({
    super.key,
    required this.passwordFocusNode,
  });

  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, next) => previous.password != next.password,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: InputField(
              focusNode: passwordFocusNode,
              label: "Enter your password",
              borderRadius: 20.0,
              borderColor: Colors.black,
              obscureText: true,
              boxConstraints: 12,
              verticalPadding: 17.0,
              fieldTitle: "Password",
              hintColor: Colors.grey.shade600,
              titleSize: 15.0,
              onChange: (value) =>
                  context.read<LoginCubit>().onPasswordChanged(value),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
          );
        });
  }
}
