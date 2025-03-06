import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/constants/app_colors.dart';
import 'package:orion_safeguard/generated/assets.dart';
import 'package:orion_safeguard/utils/heights_and_widths.dart';

class DatePickerTextField extends StatefulWidget {
  final String hintText;
  final String text;
  final TextEditingController controller;

  DatePickerTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.text})
      : super(key: key);

  @override
  State<DatePickerTextField> createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: const TextStyle(
            color: Colors.black,
            // fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        h1,
        GestureDetector(
          onTap: () async {
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
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.grey,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.controller.text.isEmpty
                      ? widget.hintText
                      : widget.controller.text,
                  style: TextStyle(
                    color: widget.controller.text.isEmpty
                        ? Colors.grey
                        : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SvgPicture.asset(
                  Assets.svgCalender,
                  height: 24,
                  width: 24,
                  color: AppColors.greyColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
