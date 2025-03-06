import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orion_safeguard/constants/app_text_styles.dart';
import 'package:orion_safeguard/ui/button/primary_button.dart';
import '../../../constants/constants.dart';
import '../../../generated/assets.dart';
import '../../../utils/heights_and_widths.dart';

class Step1 extends StatefulWidget {
  const Step1({super.key});

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      backgroundImage:
                          _imageFile != null ? FileImage(_imageFile!) : null,
                      child: _imageFile == null
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
                onPressed: () => _pickImage(ImageSource.camera),
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
                onPressed: () => _pickImage(ImageSource.gallery),
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
        // h1,
        // PrimaryButton(
        //   height: 60,
        //   hMargin: 0,
        //   backgroundColor: AppColors.primaryColor,
        //   borderRadius: 16.0,
        //   onPressed: () {},
        //   title: "Next",
        // ),
      ],
    );
  }
}
