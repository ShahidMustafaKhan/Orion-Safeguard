import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/modules/common_modules/custom_dialogues/input_text_dialogue.dart';
import 'package:orion_safeguard/modules/profile/cubit/profile_cubit/profile_cubit.dart';
import 'package:orion_safeguard/utils/display/display_utils.dart';

import '../../../config/constants/app_text_styles.dart';
import '../../../generated/assets.dart';
import '../../../utils/enums.dart';
import '../../../utils/heights_and_widths.dart';
import '../../../utils/helper_widgets.dart';

class PersonalDetailsWidget extends StatelessWidget {
  const PersonalDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
        listenWhen: (previous, next) => previous != next,
        listener: (context, state) {
          if (state.userModel.status == Status.completed &&
              state.updateType == ProfileUpdateType.email) {
            DisplayUtils.showSuccessToast(
                context, "Email updated successfully");
          }
          if (state.userModel.status == Status.completed &&
              state.updateType == ProfileUpdateType.password) {
            DisplayUtils.showSuccessToast(
                context, "Password updated successfully");
          }
          if (state.updateType == ProfileUpdateType.error) {
            DisplayUtils.showErrorToast(context, state.message ?? "");
          }
        },
        buildWhen: (previous, next) => previous != next,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.left,
                "Personal Details",
                style: AppTextStyles.robotoRegular(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              h1,
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
                    PersonalDetailsInfo(
                      fieldIcon: Assets.svgProfile,
                      fieldName: state.userModel.data?.name ?? '',
                    ),
                    customDivider(),
                    PersonalDetailsInfo(
                      fieldIcon: Assets.svgMail,
                      fieldName: state.userModel.data?.email ?? '',
                      isEditable: true,
                      onEdit: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return InputTextDialogue(
                                  title: "Reset Email",
                                  hintText: "Enter New Email");
                            }).then((email) {
                          if (email != null) {
                            context.read<ProfileCubit>().resetEmail(email);
                          }
                        });
                      },
                    ),
                    customDivider(),
                    PersonalDetailsInfo(
                      fieldIcon: Assets.svgLock,
                      fieldName: '************',
                      isEditable: true,
                      onEdit: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return InputTextDialogue(
                                  title: "Update Password",
                                  hintText: "Enter New Password");
                            }).then((password) {
                          if (password != null) {
                            context
                                .read<ProfileCubit>()
                                .updatePassword(password);
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}

class PersonalDetailsInfo extends StatelessWidget {
  const PersonalDetailsInfo(
      {super.key,
      required this.fieldIcon,
      required this.fieldName,
      this.onEdit,
      this.isEditable = false});

  final String fieldIcon;
  final String fieldName;
  final bool? isEditable;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              fieldIcon,
              height: 20,
              width: 20,
            ),
            w2,
            Text(
              fieldName,
              style: AppTextStyles.robotoRegular(
                fontWeight: FontWeight.normal,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        if (isEditable!)
          InkWell(
            onTap: onEdit,
            child: SvgPicture.asset(
              Assets.svgEdit,
              height: 20,
              width: 20,
            ),
          ),
      ],
    );
  }
}
