import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../ui/input/input_field.dart';
import '../../../../../utils/utils.dart';
import '../../../cubit/signup/signup_cubit.dart';

class InputLicenseNo extends StatelessWidget {
  const InputLicenseNo({
    super.key,
    required this.licenseNoFocusNode,
    required this.niNumberFocusNode,
  });

  final FocusNode licenseNoFocusNode;
  final FocusNode niNumberFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, next) => previous.licenseNo != next.licenseNo,
        builder: (context, state) {
          return InputField(
            label: "Enter your License no",
            borderRadius: 20.0,
            borderColor: Colors.black,
            boxConstraints: 12,
            verticalPadding: 17.0,
            onChange: (value) =>
                context.read<SignUpCubit>().onLicenseNoChanged(value),
            focusNode: licenseNoFocusNode,
            onFieldSubmitted: (_) => Utils.focusNextField(
                context: context,
                currentFocus: licenseNoFocusNode,
                nextFocus: niNumberFocusNode),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your license no';
              }
              return null;
            },
            fieldTitle: "License no",
            hintColor: Colors.grey.shade600,
            titleSize: 15.0,
          );
        });
  }
}
