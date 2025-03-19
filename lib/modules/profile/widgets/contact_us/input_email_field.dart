import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/modules/profile/cubit/contact_us/contact_us_cubit.dart';
import 'package:orion_safeguard/utils/utils.dart';

import '../../../../ui/input/input_field.dart';

class InputEmailField extends StatelessWidget {
  const InputEmailField({
    super.key,
    required this.messageFocusNode,
    required this.emailFocusNode,
  });

  final FocusNode messageFocusNode;
  final FocusNode emailFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsCubit, ContactUsState>(
        buildWhen: (previous, next) => previous.email != next.email,
        builder: (context, state) {
          return InputField(
            titleWeight: FontWeight.bold,
            titleSize: 14.0,
            onFieldSubmitted: (value) => Utils.focusNextField(
                context: context,
                currentFocus: emailFocusNode,
                nextFocus: messageFocusNode),
            onChange: (value) =>
                context.read<ContactUsCubit>().updateEmail(value),
            label: "Enter your email",
            focusNode: emailFocusNode,
            borderRadius: 20.0,
            borderColor: Colors.black,
            boxConstraints: 12,
            verticalPadding: 18.0,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            fieldTitle: "Email",
            hintColor: Colors.grey.shade600,
          );
        });
  }
}
