import 'package:flutter/material.dart';
import 'package:orion_safeguard/ui/widgets/on_click.dart';

import '../../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';

class CustomSeeAllRowWidget extends StatelessWidget {
  final String text;
  final String secondText;
  final Color? textColor;
  final VoidCallback fun;
  final double? firstTextSize;
  final double? secondTextSize;

  const CustomSeeAllRowWidget(
      {super.key,
      required this.text,
      required this.secondText,
      required this.fun,
      this.textColor = AppColors.black,
      this.firstTextSize,
      this.secondTextSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppTextStyles.robotoSemiBold(
            fontSize: firstTextSize ?? 14.0,
            color: textColor,
          ),
        ),
        OnClick(
          onTap: fun,
          child: Text(
            secondText,
            style: AppTextStyles.robotoMedium(
              fontSize: secondTextSize ?? 14.0,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
