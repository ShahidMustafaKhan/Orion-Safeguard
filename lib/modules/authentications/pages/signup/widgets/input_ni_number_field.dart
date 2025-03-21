import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../ui/input/input_field.dart';
import '../../../../../utils/utils.dart';
import '../../../cubit/signup/signup_cubit.dart';

class InputNiNumber extends StatelessWidget {
  const InputNiNumber({
    super.key,
    required this.niNumberFocusNode,
    required this.emailFocusNode,
  });

  final FocusNode niNumberFocusNode;
  final FocusNode emailFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, next) => previous.niNumber != next.niNumber,
        builder: (context, state) {
          return InputField(
            label: "Enter your NI number",
            borderRadius: 20.0,
            borderColor: Colors.black,
            boxConstraints: 12,
            verticalPadding: 17.0,
            focusNode: niNumberFocusNode,
            onChange: (value) =>
                context.read<SignUpCubit>().onNiNumberChanged(value),
            onFieldSubmitted: (_) => Utils.focusNextField(
                context: context,
                currentFocus: niNumberFocusNode,
                nextFocus: emailFocusNode),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your NI number';
              }
              return null;
            },
            fieldTitle: "NI number",
            hintColor: Colors.grey.shade600,
            titleSize: 15.0,
          );
        });
  }
}
