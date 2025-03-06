import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';
import '../../constants/asset_paths.dart';

class TextWithCheckBox extends StatefulWidget {
  final String title;

  const TextWithCheckBox({super.key, required this.title});

  @override
  _TextWithCheckBoxState createState() => _TextWithCheckBoxState();
}

class _TextWithCheckBoxState extends State<TextWithCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
          checkColor: Colors.white,
          activeColor: AppColors.green,
          side: BorderSide(
            color: isChecked ? Colors.white : Colors.black,
            width: 1.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        Text(widget.title),
        const SizedBox(
          width: 12,
        ),
        SvgPicture.asset(AssetPaths.icQuestions)
      ],
    );
  }
}
