import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/config/constants/constants.dart';
import 'package:orion_safeguard/utils/heights_and_widths.dart';

class CustomDropdown<T> extends StatefulWidget {
  final String hint;
  final String text;
  final T? value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final Widget? icon;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;

  const CustomDropdown({
    super.key,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.text,
    this.icon,
    this.focusNode,
    this.nextFocusNode,
  });

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
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
        _openDropdown();
      });
    }
  }

  void _openDropdown() {
    FocusScope.of(context).unfocus(); // Ensures dropdown opens properly
    showMenu<T>(
      context: context,
      position: RelativeRect.fromLTRB(50, 300, 50, 0), // Adjust if needed
      items: widget.items.map((T item) {
        return PopupMenuItem<T>(
          value: item,
          child: Text(item.toString()),
        );
      }).toList(),
    ).then((selectedItem) {
      if (selectedItem != null) {
        widget.onChanged(selectedItem);

        // Move focus to the next field
        if (widget.nextFocusNode != null) {
          FocusScope.of(context).requestFocus(widget.nextFocusNode);
        }
      } else {
        FocusScope.of(context)
            .requestFocus(widget.focusNode); // Keep focus if canceled
      }
    });
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
          onTap: _openDropdown,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.grey,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(18),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<T>(
                focusNode: widget.focusNode,
                hint: Text(
                  widget.hint,
                  style: const TextStyle(color: Colors.grey),
                ),
                value: widget.value,
                icon: widget.icon ??
                    SvgPicture.asset(AssetPaths.dropDownIcon,
                        color: AppColors.black),
                isExpanded: true,
                items: widget.items.map((T item) {
                  return DropdownMenuItem<T>(
                    value: item,
                    child: Text(item.toString()),
                  );
                }).toList(),
                onChanged: (selectedValue) {
                  widget.onChanged(selectedValue);
                  if (widget.nextFocusNode != null) {
                    FocusScope.of(context).requestFocus(widget.nextFocusNode);
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
