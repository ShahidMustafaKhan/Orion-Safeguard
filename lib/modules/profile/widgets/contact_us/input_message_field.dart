import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/modules/profile/cubit/contact_us/contact_us_cubit.dart';

import '../../../../ui/input/input_field.dart';

class InputMessageField extends StatelessWidget {
  const InputMessageField({
    super.key,
    required this.messageFocusNode,
  });

  final FocusNode messageFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsCubit, ContactUsState>(
        buildWhen: (previous, next) => previous.message != next.message,
        builder: (context, state) {
          return InputField(
            titleWeight: FontWeight.bold,
            titleSize: 14.0,
            onChange: (value) =>
                context.read<ContactUsCubit>().updateMessage(value),
            label: "Enter message",
            focusNode: messageFocusNode,
            borderRadius: 20.0,
            borderColor: Colors.black,
            boxConstraints: 12,
            verticalPadding: 18.0,
            fieldTitle: "Message",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
            hintColor: Colors.grey.shade600,
          );
        });
  }
}
