import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/ui/widgets/on_click.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/constants/app_text_styles.dart';
import '../../../generated/assets.dart';
import '../../../utils/heights_and_widths.dart';
import '../../../utils/helper_widgets.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.left,
          "Social",
          style: AppTextStyles.robotoRegular(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20.0,
              ),
              border: Border.all(
                color: Colors.grey.shade300,
              )),
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SocialInfoWidget(
                onTap: () {
                  launch(
                      'https://www.facebook.com/share/1DvVTzakam/?mibextid=wwXIfr');
                },
                socialName: 'Facebook',
                socialIcon: Assets.svgFacebook,
              ),
              customDivider(),
              SocialInfoWidget(
                onTap: () {
                  launch(
                      'https://www.instagram.com/wasif.chaudary?igsh=N3RkeDQ0djFpb3d3&utm_source=qr');
                },
                socialName: 'Instagram',
                socialIcon: Assets.svgInstagram,
              ),
              customDivider(),
              SocialInfoWidget(
                onTap: () {
                  print('sds');
                  launch(
                      'https://www.linkedin.com/in/wasif-ali-803207260?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app');
                },
                socialName: 'Linkedin',
                socialIcon: Assets.svgLinkedin,
              ),
              customDivider(),
              SocialInfoWidget(
                socialName: 'Whatsapp',
                onTap: () {
                  launch('https://wa.me/923230143437');
                },
                socialIcon: Assets.svgWhatsapp,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SocialInfoWidget extends StatelessWidget {
  const SocialInfoWidget(
      {super.key,
      required this.socialName,
      required this.socialIcon,
      this.onTap});

  final String socialName;
  final String socialIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return OnClick(
      onTap: onTap ?? () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                socialIcon,
                height: 24,
                width: 24,
              ),
              w3,
              Text(
                socialName,
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
    );
  }
}
