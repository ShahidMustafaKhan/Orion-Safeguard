import 'package:flutter/material.dart';

import '../../../config/constants/app_colors.dart';
import '../../../ui/input/input_field.dart';
import '../../../utils/utils.dart';

class InputFormField extends StatelessWidget {
  final String? label;
  final String? fieldTitle;
  final TextEditingController controller;
  final Function(String)? onChange;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final Widget? suffixIcon;
  final bool readOnly;
  final int maxLines;
  final bool validate;

  const InputFormField({
    super.key,
    this.label,
    this.readOnly = false,
    this.fieldTitle,
    required this.controller,
    this.onChange,
    this.focusNode,
    this.nextFocusNode,
    this.suffixIcon,
    this.maxLines = 1,
    this.validate = true,
  });

  @override
  Widget build(BuildContext context) {
    return InputField(
      fillColor: AppColors.grey,
      readOnly: readOnly,
      titleSize: 14.0,
      maxLines: maxLines,
      controller: controller,
      onChange: onChange,
      focusNode: focusNode,
      suffixIcon: suffixIcon,
      onFieldSubmitted: (value) {
        if (nextFocusNode == null) return;
        Utils.focusNextField(
            context: context,
            currentFocus: focusNode!,
            nextFocus: nextFocusNode!);
      },
      validator: !validate
          ? null
          : (value) {
              if (value!.isEmpty) {
                return "Required";
              }
              return null;
            },
      label: label ?? '',
      borderRadius: 20.0,
      borderColor: AppColors.greyColor,
      boxConstraints: 12,
      verticalPadding: 17.0,
      fieldTitle: fieldTitle,
      hintColor: Colors.grey.shade600,
      // titleWeight: FontWeight.w600,
    );
  }
}
