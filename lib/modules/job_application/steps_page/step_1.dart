import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:orion_safeguard/modules/job_application/cubit/job_application_cubit.dart';
import 'package:orion_safeguard/modules/job_application/widget/primary_form_button.dart';
import 'package:orion_safeguard/ui/button/primary_button.dart';
import 'package:orion_safeguard/utils/display/display_utils.dart';

import '../../../config/constants/constants.dart';
import '../../../generated/assets.dart';
import '../../../utils/heights_and_widths.dart';
import '../../../utils/image_picker.dart';

class Step1 extends StatelessWidget {
  const Step1({super.key});

  @override
  Widget build(BuildContext context) {
    JobApplicationCubit jobApplicationCubit =
        context.read<JobApplicationCubit>();

    return BlocConsumer<JobApplicationCubit, JobApplicationState>(
        listenWhen: (previous, next) =>
            previous.validationStatus != next.validationStatus ||
            previous.errorValidationMessage != next.errorValidationMessage,
        listener: (context, state) {
          if (state.validationStatus == ValidationStatus.error) {
            DisplayUtils.showErrorToast(context, state.errorValidationMessage);
          }
        },
        buildWhen: (previous, next) => previous != next,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Upload Your Picture",
                style: AppTextStyles.robotoBold(
                  fontSize: 24.0,
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.grey.shade500,
                            backgroundImage: state.profilePicture != null
                                ? FileImage(state.profilePicture!)
                                : null,
                            child: state.profilePicture == null
                                ? SvgPicture.asset(
                                    Assets.svgPerson,
                                    height: 148,
                                    width: 148,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                          Positioned(
                            bottom: 2,
                            right: 2,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      100.0,
                                    ),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.5,
                                    )),
                                child: CircleAvatar(
                                  backgroundColor: AppColors.primaryColor,
                                  radius: 22,
                                  child: SvgPicture.asset(
                                    Assets.svgCameraUnselected,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: PrimaryIconOutlineButton(
                      onPressed: () async {
                        File? file =
                            await ImagePickerService().pickImageFromCamera();
                        if (file != null) {
                          jobApplicationCubit.updateJobApplicationState(
                              state.copyWith(profilePicture: file));
                        }
                      },
                      height: formTextFieldHeight,
                      fontSize: 16.0,
                      title: "Take Picture",
                      iconSvgPath: Assets.svgCameraUnselected,
                      titleColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                      borderRadius: 14.0,
                    ),
                  ),
                  w3,
                  Expanded(
                    child: PrimaryIconOutlineButton(
                      onPressed: () async {
                        File? file =
                            await ImagePickerService().pickImageFromGallery();
                        if (file != null) {
                          jobApplicationCubit.updateJobApplicationState(
                              state.copyWith(profilePicture: file));
                        }
                      },
                      height: formTextFieldHeight,
                      fontSize: 16.0,
                      title: "Upload Gallery",
                      iconSvgPath: Assets.svgGallery,
                      titleColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                      borderRadius: 14.0,
                    ),
                  ),
                ],
              ),
              PrimaryFormButton(
                onPressed: () {},
              ),
            ],
          );
        });
  }
}
