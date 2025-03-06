import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orion_safeguard/constants/app_colors.dart';
import 'package:orion_safeguard/constants/app_text_styles.dart';
import 'package:sizer/sizer.dart';

import '../../../generated/assets.dart';
import '../../../ui/input/input_field.dart';
import '../../../utils/heights_and_widths.dart';

class Step2 extends StatefulWidget {
  const Step2({super.key});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  final TextEditingController _controller = TextEditingController();
  void _removeFile() {
    setState(() {
      pickedFileName = null;
      _controller.clear();
    });
  }

  String? pickedFileName;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        pickedFileName = result.files.single.name;
        _controller.text = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 3.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Form",
              style: AppTextStyles.robotoBold(
                fontSize: 24.0,
              ),
            ),
            h0P2,

            Text(
              "Fill up your job application",
              style: AppTextStyles.robotoRegular(
                fontSize: 16.0,
              ),
            ),
            h1,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  controller: TextEditingController(),
                  label: "Enter Position",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Position Applied for",
                  hintColor: Colors.grey.shade600,
                  titleWeight: FontWeight.w600,
                ),
                h1,
                GestureDetector(
                  onTap: _pickFile,
                  child: InputField(
                    fillColor: AppColors.grey,
                    titleSize: 14.0,
                    controller: TextEditingController(),
                    label: "Select Document",
                    borderRadius: 20.0,
                    borderColor: AppColors.greyColor,
                    boxConstraints: 12,
                    verticalPadding: 17.0,
                    fieldTitle: "Attached Document",
                    suffixIcon: SvgPicture.asset(
                      Assets.svgClip,
                    ),
                    hintColor: Colors.grey.shade600,
                    titleWeight: FontWeight.w600,
                    readOnly: true,
                  ),
                ),
                if (pickedFileName != null) ...[
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Selected: $pickedFileName",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.red),
                        onPressed: _removeFile,
                      ),
                    ],
                  ),
                ],
                h1,
                Text(
                  textAlign: TextAlign.left,
                  "Personal information",
                  style: AppTextStyles.robotoRegular(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                h0P5,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  controller: TextEditingController(),
                  label: "Enter Your title",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Title",
                  hintColor: Colors.grey.shade600,
                  titleWeight: FontWeight.w600,
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  controller: TextEditingController(),
                  label: "Enter your surname",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Surname",
                  hintColor: Colors.grey.shade600,
                  titleWeight: FontWeight.w600,
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  controller: TextEditingController(),
                  label: "Enter your forename",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Forename",
                  hintColor: Colors.grey.shade600,
                  titleWeight: FontWeight.w600,
                ),
                h1,
                InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  titleWeight: FontWeight.w600,
                  controller: TextEditingController(),
                  label: "Enter your Surname at Birth",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Surname at Birth",
                  hintColor: Colors.grey.shade600,
                ),
              ],
            ),
            h1,
            // PrimaryButton(
            //   height: 60,
            //   hMargin: 0,
            //   backgroundColor: AppColors.primaryColor,
            //   borderRadius: 16.0,
            //   onPressed: () {},
            //   title: "Send",
            // ),
          ],
        ),
      ),
    );
  }
}
