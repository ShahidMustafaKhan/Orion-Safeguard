import 'package:flutter/cupertino.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_styles.dart';
import '../../generated/assets.dart';

class NoDataFound extends StatelessWidget {
  final String title;
  final String image;
  final double spacer;
  const NoDataFound({
    super.key,
    this.title = "No shifts found",
    this.image = Assets.pngCalendar,
    this.spacer = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 150.0),
        SizedBox(height: spacer),
        Text(
          title,
          style:
              AppTextStyles.robotoBold(fontSize: 16.0, color: AppColors.black),
        ),
      ],
    );
  }
}
