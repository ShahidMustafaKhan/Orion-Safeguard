import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/modules/profile/cubit/contact_us/contact_us_cubit.dart';
import 'package:orion_safeguard/utils/utils.dart';

import '../../../../ui/input/input_field.dart';

class InputNameField extends StatelessWidget {
  const InputNameField({
    super.key,
    required this.nameFocusNode,
    required this.emailFocusNode,
  });

  final FocusNode nameFocusNode;
  final FocusNode emailFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsCubit, ContactUsState>(
        buildWhen: (previous, next) => previous.name != next.name,
        builder: (context, state) {
          return InputField(
            titleWeight: FontWeight.bold,
            titleSize: 14.0,
            onFieldSubmitted: (value) => Utils.focusNextField(
                context: context,
                currentFocus: nameFocusNode,
                nextFocus: emailFocusNode),
            onChange: (value) =>
                context.read<ContactUsCubit>().updateName(value),
            label: "Enter text name",
            focusNode: nameFocusNode,
            borderRadius: 20.0,
            borderColor: Colors.black,
            boxConstraints: 12,
            verticalPadding: 18.0,
            fieldTitle: "Name",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            hintColor: Colors.grey.shade600,
          );
        });
  }
}
