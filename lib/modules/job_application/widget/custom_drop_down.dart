import 'package:flutter/material.dart';
import 'package:orion_safeguard/config/constants/constants.dart';

class CustomDropdown<T> extends StatefulWidget {
  final String hint;
  final String text;
  final T? value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final Widget? icon;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? borderColor;
  final Color? fillColor;
  final double borderRadius;
  final double horizontalPadding;
  final double verticalPadding;

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
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.borderColor = AppColors.greyColor,
    this.fillColor = AppColors.grey,
    this.borderRadius = 20,
    this.horizontalPadding = 16,
    this.verticalPadding = 16,
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
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 2.0,
            vertical: 4.0,
          ),
          child: Text(
            widget.text,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: AssetPaths.dmSans),
          ),
        ),
        GestureDetector(
          onTap: _openDropdown,
          child: DropdownButtonFormField<T>(
            value: widget.value, // This ensures the selected value is shown
            isExpanded: true,
            style: TextStyle(
                color: Colors.black,
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
                fontFamily: AssetPaths.dmSans),
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: widget.fontSize,
                  fontWeight: widget.fontWeight,
                  fontFamily: AssetPaths.dmSans),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: widget.borderColor ?? Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: widget.borderColor ?? Colors.transparent,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: widget.borderColor ?? Colors.transparent,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: widget.borderColor ?? Colors.transparent,
                ),
              ),
              filled: true,
              fillColor: widget.fillColor,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: widget.horizontalPadding,
                vertical: widget.verticalPadding,
              ),
            ),
            onChanged: (selectedValue) {
              widget.onChanged(selectedValue);
              if (widget.nextFocusNode != null) {
                FocusScope.of(context).requestFocus(widget.nextFocusNode);
              }
            },
            items: widget.items.map<DropdownMenuItem<T>>((T value) {
              return DropdownMenuItem<T>(
                value: value,
                child: Text(
                  value.toString(),
                ),
              );
            }).toList(),
            validator: (value) => value == null ? 'field required' : null,
          ),
        ),
      ],
    );
  }
}
