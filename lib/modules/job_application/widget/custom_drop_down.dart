import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/constants/app_colors.dart';
import 'package:orion_safeguard/constants/constants.dart';
import 'package:orion_safeguard/utils/heights_and_widths.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String hint;
  final String text;
  final T? value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final Widget? icon;

  CustomDropdown({
    Key? key,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.text,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            // fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        h1,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.grey,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(18),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              hint: Text(
                hint,
                style: const TextStyle(color: Colors.grey),
              ),
              value: value,
              icon: icon ??
                  SvgPicture.asset(AssetPaths.dropDownIcon,
                      color: AppColors.black),
              isExpanded: true,
              items: items.map((T item) {
                return DropdownMenuItem<T>(
                  value: item,
                  child: Text(item.toString()),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
