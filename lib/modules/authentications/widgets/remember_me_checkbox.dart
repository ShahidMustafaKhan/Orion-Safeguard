import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_text_styles.dart';

class RememberMeCheckbox extends StatefulWidget {
  const RememberMeCheckbox({super.key});

  @override
  _RememberMeCheckboxState createState() => _RememberMeCheckboxState();
}

class _RememberMeCheckboxState extends State<RememberMeCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          semanticLabel: "Remember Me",
          value: _isChecked,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value!;
            });
          },
          activeColor: Colors.black,
          checkColor: Colors.white,
        ),
        Align(
          alignment: Alignment.center,
          child: Text("Remember me",
              textAlign: TextAlign.left,
              // overflow: TextOverflow.visible,
              style: AppTextStyles.robotoMedium(fontSize: 15.sp)),
        ),
      ],
    );
  }
}
