import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../ui/input/input_field.dart';
import '../../../../../utils/utils.dart';
import '../../../cubit/signup/signup_cubit.dart';

class InputLastName extends StatelessWidget {
  const InputLastName({
    super.key,
    required this.lastNameFocusNode,
    required this.licenseNoFocusNode,
  });

  final FocusNode lastNameFocusNode;
  final FocusNode licenseNoFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, next) => previous.lastName != next.lastName,
        builder: (context, state) {
          return InputField(
            label: "Enter your last name",
            borderRadius: 20.0,
            borderColor: Colors.black,
            boxConstraints: 12,
            verticalPadding: 17.0,
            focusNode: lastNameFocusNode,
            onChange: (value) =>
                context.read<SignUpCubit>().onLastNameChanged(value),
            onFieldSubmitted: (_) => Utils.focusNextField(
                context: context,
                currentFocus: lastNameFocusNode,
                nextFocus: licenseNoFocusNode),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your last name';
              }
              return null;
            },
            fieldTitle: "Last Name",
            hintColor: Colors.grey.shade600,
            titleSize: 15.0,
          );
        });
  }
}
