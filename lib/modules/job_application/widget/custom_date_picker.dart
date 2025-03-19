import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/config/constants/app_colors.dart';
import 'package:orion_safeguard/generated/assets.dart';
import 'package:orion_safeguard/utils/heights_and_widths.dart';

import '../../../ui/input/input_field.dart';

class DatePickerTextField extends StatefulWidget {
  final String hintText;
  final String text;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;

  const DatePickerTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.text,
    this.focusNode,
    this.nextFocusNode,
  });

  @override
  State<DatePickerTextField> createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode?.removeListener(_handleFocusChange);
    super.dispose();
  }

  void _handleFocusChange() {
    if (widget.focusNode!.hasFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _openDatePicker();
      });
    }
  }

  Future<void> _openDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            primaryColor: AppColors.primaryColor,
            colorScheme: const ColorScheme.dark(
              primary: AppColors.greyColor,
              onPrimary: Colors.white,
              surface: AppColors.primaryColor,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        widget.controller.text =
            "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
      });

      // Move focus to next field
      if (widget.nextFocusNode != null) {
        FocusScope.of(context).requestFocus(widget.nextFocusNode);
      }
    } else {
      // If no date is picked, keep focus on the field
      FocusScope.of(context).requestFocus(widget.focusNode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        h1,
        GestureDetector(
          onTap: _openDatePicker,
          child: InputField(
            fillColor: AppColors.grey,
            readOnly: true,
            titleSize: 14.0,
            controller: widget.controller,
            suffixIcon: SvgPicture.asset(
              Assets.svgCalender,
              height: 24,
              width: 24,
              color: AppColors.greyColor,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Required";
              }
              return null;
            },
            label: widget.hintText,
            borderRadius: 18.0,
            borderColor: AppColors.greyColor,
            boxConstraints: 12,
            verticalPadding: 17.0,
            hintColor: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
