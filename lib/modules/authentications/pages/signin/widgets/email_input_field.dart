import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/modules/authentications/cubit/login/login_cubit.dart';

import '../../../../../ui/input/input_field.dart';
import '../../../../../utils/utils.dart';
import '../../../../../utils/validators/email_validator.dart';

class InputEmailField extends StatelessWidget {
  const InputEmailField({
    super.key,
    required this.emailFocusNode,
    required this.passwordFocusNode,
  });

  final FocusNode emailFocusNode;
  final FocusNode? passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, next) => previous.email != next.email,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: InputField(
              titleSize: 15.0,
              label: "Enter your email",
              focusNode: emailFocusNode,
              borderRadius: 20.0,
              borderColor: Colors.black,
              boxConstraints: 12,
              verticalPadding: 17.0,
              fieldTitle: "Email",
              hintColor: Colors.grey.shade600,
              onChange: (value) {
                context.read<LoginCubit>().onEmailChanged(value);
              },
              onFieldSubmitted: (_) {
                if (passwordFocusNode != null) {
                  Utils.focusNextField(
                      context: context,
                      currentFocus: emailFocusNode,
                      nextFocus: passwordFocusNode!);
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email';
                } else if (!EmailValidator.validate(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
          );
        });
  }
}
