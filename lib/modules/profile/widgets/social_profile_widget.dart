import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/modules/profile/cubit/company_details/company_details_cubit.dart';
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
        BlocBuilder<CompanyDetailsCubit, CompanyDetailsState>(
            buildWhen: (previous, next) => previous != next,
            builder: (context, state) {
              return Container(
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
                        if (state.companyDetailsModel.data?.facebook != null) {
                          launchUrl(Uri.parse(
                              state.companyDetailsModel.data!.facebook!));
                        }
                      },
                      socialName: 'Facebook',
                      socialIcon: Assets.svgFacebook,
                    ),
                    customDivider(),
                    SocialInfoWidget(
                      onTap: () {
                        if (state.companyDetailsModel.data?.instagram != null) {
                          launchUrl(Uri.parse(
                              state.companyDetailsModel.data!.instagram!));
                        }
                      },
                      socialName: 'Instagram',
                      socialIcon: Assets.svgInstagram,
                    ),
                    customDivider(),
                    SocialInfoWidget(
                      onTap: () {
                        if (state.companyDetailsModel.data?.linkedin != null) {
                          launchUrl(Uri.parse(
                              state.companyDetailsModel.data!.linkedin!));
                        }
                      },
                      socialName: 'Linkedin',
                      socialIcon: Assets.svgLinkedin,
                    ),
                    customDivider(),
                    SocialInfoWidget(
                      socialName: 'Whatsapp',
                      onTap: () {
                        if (state.companyDetailsModel.data?.whatsapp != null) {
                          launchUrl(Uri.parse(
                              'https://wa.me/${state.companyDetailsModel.data!.whatsapp!}'));
                        }
                      },
                      socialIcon: Assets.svgWhatsapp,
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }
}

class SocialInfoWidget extends StatelessWidget {
  const SocialInfoWidget(
      {super.key,
      required this.socialName,
      required this.socialIcon,
      this.onTap,
      this.onEdit});

  final String socialName;
  final String socialIcon;
  final VoidCallback? onEdit;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return OnClick(
      onTap: onEdit ?? () {},
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
          GestureDetector(
            onTap: onTap ?? () {},
            child: SvgPicture.asset(
              Assets.svgArrowRight,
              height: 24,
              width: 24,
            ),
          ),
        ],
      ),
    );
  }
}
