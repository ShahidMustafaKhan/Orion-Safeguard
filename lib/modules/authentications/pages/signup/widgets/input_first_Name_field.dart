import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../ui/input/input_field.dart';
import '../../../../../utils/utils.dart';
import '../../../cubit/signup/signup_cubit.dart';

class InputFirstName extends StatelessWidget {
  const InputFirstName({
    super.key,
    required this.firstNameFocusNode,
    required this.lastNameFocusNode,
  });

  final FocusNode firstNameFocusNode;
  final FocusNode lastNameFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, next) => previous.firstName != next.firstName,
        builder: (context, state) {
          return InputField(
            label: "Enter your first name",
            focusNode: firstNameFocusNode,
            onFieldSubmitted: (_) => Utils.focusNextField(
                context: context,
                currentFocus: firstNameFocusNode,
                nextFocus: lastNameFocusNode),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            },
            onChange: (value) {
              context.read<SignUpCubit>().onFirstNameChanged(value);
            },
            borderRadius: 20.0,
            borderColor: Colors.black,
            boxConstraints: 12,
            verticalPadding: 17.0,
            fieldTitle: "First Name",
            hintColor: Colors.grey.shade600,
            titleSize: 15.0,
          );
        });
  }
}
