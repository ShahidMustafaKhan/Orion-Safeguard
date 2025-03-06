import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_text_styles.dart';
import '../../../generated/assets.dart';
import '../../../utils/heights_and_widths.dart';
import '../../../utils/helper_widgets.dart';

class PersonalDetailsWidget extends StatelessWidget {
  const PersonalDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
              const PersonalDetailsInfo(
                fieldIcon: Assets.svgProfile,
                fieldName: 'John Doe',
              ),
              customDivider(),
              const PersonalDetailsInfo(
                fieldIcon: Assets.svgMail,
                fieldName: 'johndoe@gmail.com',
                isEditable: true,
              ),
              customDivider(),
              const PersonalDetailsInfo(
                fieldIcon: Assets.svgLock,
                fieldName: '************',
                isEditable: true,
              ),
            ],
          ),
        ),
      ],
    );
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
