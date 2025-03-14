import 'package:flutter/material.dart';
import 'package:orion_safeguard/utils/extensions/extended_context.dart';

import '../../../constants/app_colors.dart';

class TextTabWidget extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final Color borderColor;
  final double borderRadius;
  final double fontSize;
  final int maxLines;

  const TextTabWidget(
      {super.key,
      required this.text,
      this.bgColor = AppColors.greyColor,
      this.textColor = AppColors.white,
      this.borderRadius = 4,
      this.fontSize = 14,
      this.borderColor = Colors.transparent,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 2),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: borderColor)),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium?.copyWith(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: fontSize),
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        ));
  }
}
