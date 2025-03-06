import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orion_safeguard/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_text_styles.dart';

class AnnouncementCard extends StatelessWidget {
  final String title;
  final String time;
  final String iconPath;
  final String content;
  final bool isUnRead;

  const AnnouncementCard({
    super.key,
    required this.title,
    required this.time,
    required this.content,
    required this.iconPath,
    this.isUnRead = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isUnRead
          ? AppColors.primaryColor.withOpacity(0.10)
          : Colors.transparent,
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: 30.sp,
              width: 30.sp,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(
                    14.0,
                  )),
              // padding: const EdgeInsets.all(
              //   20.0,
              // ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  iconPath,
                  height: 32.0,
                  width: 32.0,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: AppTextStyles.robotoSemiBold(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    width: 70.sp,
                    child: Text(
                        overflow: TextOverflow.ellipsis,
                        content,
                        maxLines: 4,
                        style: AppTextStyles.robotoRegular(
                          fontSize: 14.0,
                          color: Colors.grey.shade600,
                        )),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.topRight,
              child: Text(time,
                  style: AppTextStyles.robotoRegular(
                    fontSize: 12.0,
                    color: Colors.grey.shade600,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
