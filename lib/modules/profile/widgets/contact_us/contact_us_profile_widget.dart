import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/config/config.dart';
import 'package:orion_safeguard/modules/profile/pages/contact_us_page.dart';
import 'package:orion_safeguard/ui/widgets/on_click.dart';

import '../../../../config/constants/app_text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/heights_and_widths.dart';

class ContactUsWidget extends StatelessWidget {
  const ContactUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.left,
          "Contact us",
          style: AppTextStyles.robotoRegular(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        OnClick(
          onTap: () {
            NavRouter.push(context, const ContactUsPage());
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
                border: Border.all(
                  color: Colors.grey.shade300,
                )),
            padding: const EdgeInsets.symmetric(
              vertical: 18.0,
              horizontal: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.svgMail,
                      height: 24,
                      width: 24,
                    ),
                    w3,
                    Text(
                      "Contact us",
                      style: AppTextStyles.robotoRegular(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  Assets.svgArrowRight,
                  height: 24,
                  width: 24,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
