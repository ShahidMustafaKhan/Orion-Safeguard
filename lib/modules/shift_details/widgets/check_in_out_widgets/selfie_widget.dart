import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/heights_and_widths.dart';
import '../../../../utils/image_picker.dart';
import '../../cubits/check_in_out_cubits/check_in_out_cubit.dart';

class SelfieWidget extends StatelessWidget {
  final File? file;
  const SelfieWidget({
    super.key,
    this.file,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () async {
            File? selfie = await ImagePickerService().pickImageFromCamera();
            if (selfie != null) {
              context.read<CheckInOutCubit>().uploadSelfie(selfie);
            }
          },
          child: Container(
            padding: EdgeInsets.all(
              file != null ? 0 : 22.0,
            ),
            decoration: BoxDecoration(
              color: const Color(0xfff3dcdf),
              borderRadius: BorderRadius.circular(
                100.0,
              ),
              border: Border.all(
                color: AppColors.primaryColor,
              ),
            ),
            child: file != null
                ? CircleAvatar(
                    radius: 55,
                    backgroundImage: FileImage(file!),
                  )
                : SvgPicture.asset(
                    Assets.svgCamera,
                    height: 72,
                    width: 72,
                  ),
          ),
        ),
        h1,
        Text(
          "Click on the camera to take a selfie",
          style: AppTextStyles.robotoRegular(
            fontSize: 14.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
