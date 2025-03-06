import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/config/config.dart';
import 'package:orion_safeguard/constants/app_colors.dart';
import 'package:orion_safeguard/constants/app_text_styles.dart';
import 'package:orion_safeguard/modules/alerts_announcements/pages/full_alert_screen.dart';
import 'package:orion_safeguard/ui/widgets/on_click.dart';

import '../../../generated/assets.dart';
import '../../../utils/heights_and_widths.dart';

class AnnouncementWidget extends StatefulWidget {
  const AnnouncementWidget({super.key});

  @override
  State<AnnouncementWidget> createState() => _AnnouncementWidgetState();
}

class _AnnouncementWidgetState extends State<AnnouncementWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        color: AppColors.primaryColor,
      ),
      child: Stack(
        children: [
          Positioned(
            top: -95,
            left: -95,
            child: SvgPicture.asset(Assets.svgLoop),
          ),
          Positioned(
            top: -10,
            right: -90,
            child: SvgPicture.asset(Assets.svgLoop),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Announcements",
                        style: AppTextStyles.robotoBold(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing",
                        style: AppTextStyles.robotoRegular(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                      h1,
                      OnClick(
                        onTap: () {
                          NavRouter.push(context, const FullAlertScreen());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                50.0,
                              )),
                          padding: const EdgeInsets.symmetric(
                            vertical: 6.0,
                            horizontal: 18.0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "View Details",
                                style: AppTextStyles.robotoBold(
                                  color: AppColors.primaryColor,
                                  fontSize: 12.0,
                                ),
                              ),
                              w1,
                              SvgPicture.asset(
                                Assets.svgArrowRight,
                                color: AppColors.primaryColor,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // w2,
              Image.asset(
                Assets.pngMegaphone,
              )
            ],
          ),
        ],
      ),
    );
  }
}
