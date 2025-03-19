import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/ui/widgets/on_click.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/constants/app_text_styles.dart';
import '../../../generated/assets.dart';
import '../../../utils/display/display_utils.dart';
import '../../../utils/enums.dart';
import '../../../utils/heights_and_widths.dart';
import '../../../utils/helper_widgets.dart';
import '../../common_modules/custom_dialogues/input_text_dialogue.dart';
import '../cubit/profile_cubit/profile_cubit.dart';

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
        BlocConsumer<ProfileCubit, ProfileState>(
            listenWhen: (previous, next) => previous != next,
            listener: (context, state) {
              if (state.userModel.status == Status.completed &&
                  state.updateType == ProfileUpdateType.facebook) {
                DisplayUtils.showSuccessToast(
                    context, "Facebook link updated successfully");
              }
              if (state.userModel.status == Status.completed &&
                  state.updateType == ProfileUpdateType.linkedin) {
                DisplayUtils.showSuccessToast(
                    context, "Linkedin link updated successfully");
              }
              if (state.userModel.status == Status.completed &&
                  state.updateType == ProfileUpdateType.instagram) {
                DisplayUtils.showSuccessToast(
                    context, "Instagram link updated successfully");
              }
              if (state.userModel.status == Status.completed &&
                  state.updateType == ProfileUpdateType.whatsapp) {
                DisplayUtils.showSuccessToast(
                    context, "Whatsapp number updated successfully");
              }
              if (state.updateType == ProfileUpdateType.error) {
                DisplayUtils.showErrorToast(context, state.message ?? "");
              }
            },
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
                      onEdit: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return InputTextDialogue(
                                  title: "Add Facebook Link",
                                  hintText:
                                      "https://www.facebook.com/share/1DvVTzakam/?mibextid=wwXIfr");
                            }).then((value) {
                          if (value != null) {
                            context.read<ProfileCubit>().addFacebookLink(value);
                          }
                        });
                      },
                      onTap: () {
                        if (state.userModel.data?.linkedin != null) {
                          launchUrl(Uri.parse(state.userModel.data!.facebook!));
                        }
                      },
                      socialName: 'Facebook',
                      socialIcon: Assets.svgFacebook,
                    ),
                    customDivider(),
                    SocialInfoWidget(
                      onEdit: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return InputTextDialogue(
                                  title: "Add Instagram Link",
                                  hintText:
                                      "https://www.instagram.com/wasif.chaudary?igsh=N3RkeDQ0djFpb3d3&utm_source=qr");
                            }).then((value) {
                          if (value != null) {
                            context
                                .read<ProfileCubit>()
                                .addInstagramLink(value);
                          }
                        });
                      },
                      onTap: () {
                        if (state.userModel.data?.instagram != null) {
                          launchUrl(
                              Uri.parse(state.userModel.data!.instagram!));
                        }
                      },
                      socialName: 'Instagram',
                      socialIcon: Assets.svgInstagram,
                    ),
                    customDivider(),
                    SocialInfoWidget(
                      onEdit: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return InputTextDialogue(
                                  title: "Add Linkedin Link",
                                  hintText:
                                      "https://www.linkedin.com/in/wasif-ali-803207260?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app");
                            }).then((value) {
                          if (value != null) {
                            context.read<ProfileCubit>().addLinkedinLink(value);
                          }
                        });
                      },
                      onTap: () {
                        if (state.userModel.data?.linkedin != null) {
                          launchUrl(Uri.parse(state.userModel.data!.linkedin!));
                        }
                      },
                      socialName: 'Linkedin',
                      socialIcon: Assets.svgLinkedin,
                    ),
                    customDivider(),
                    SocialInfoWidget(
                      onEdit: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return InputTextDialogue(
                                  title: "Add Whatsapp number",
                                  hintText: "923230143437");
                            }).then((value) {
                          if (value != null) {
                            context
                                .read<ProfileCubit>()
                                .addWhatsappNumber(value);
                          }
                        });
                      },
                      socialName: 'Whatsapp',
                      onTap: () {
                        if (state.userModel.data?.whatsapp != null) {
                          launchUrl(Uri.parse(
                              'https://wa.me/${state.userModel.data!.whatsapp!}'));
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
