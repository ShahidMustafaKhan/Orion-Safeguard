// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:orion_safeguard/constants/app_colors.dart';
import 'package:orion_safeguard/constants/app_text_styles.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback? tap;
  final Color? color;
  final Color? textColor;
  final Color? borderCOlor;
  const CustomButton(
      {super.key,
      required this.buttonTitle,
      required this.tap,
      this.color,
      this.textColor,
      this.borderCOlor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: tap,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 9.sp, horizontal: 8)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        backgroundColor:
            MaterialStateProperty.all(color ?? AppColors.primaryColor),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonTitle,
            style: AppTextStyles.robotoMedium()
                .copyWith(color: textColor ?? AppColors.white, fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}

class CustomButtonSearchView extends StatelessWidget {
  final String text;
  final Color textCol;
  final VoidCallback? tap;
  const CustomButtonSearchView(
      {super.key,
      required this.text,
      required this.textCol,
      required this.tap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: tap,
        child: Container(
          height: 30,
          width: 120,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8)),
          child: Center(
              child: Text(
            text,
            style: AppTextStyles.robotoSemiBold(fontSize: 12, color: textCol),
          )),
        ),
      ),
    );
  }
}
