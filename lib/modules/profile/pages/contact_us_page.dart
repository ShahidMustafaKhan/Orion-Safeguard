import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orion_safeguard/constants/app_text_styles.dart';
import 'package:orion_safeguard/modules/screen_layout_widget/screen_layout.dart';

import '../../../constants/app_colors.dart';
import '../../../generated/assets.dart';
import '../../../ui/button/primary_button.dart';
import '../../../ui/input/input_field.dart';
import '../../../utils/heights_and_widths.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return OrionLayout(
        pageTitle: 'Contact us',
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContactDetailsWidget(),
                h2,
                Text(
                  "Send us a message",
                  style: AppTextStyles.robotoSemiBold(
                    fontSize: 20.0,
                  ),
                ),
                h2,
                Form(
                    child: Column(
                  children: [
                    InputField(
                      titleWeight: FontWeight.bold,
                      titleSize: 14.0,
                      controller: TextEditingController(),
                      label: "Enter text name",
                      borderRadius: 20.0,
                      borderColor: Colors.black,
                      boxConstraints: 12,
                      verticalPadding: 18.0,
                      fieldTitle: "Name",
                      hintColor: Colors.grey.shade600,
                    ),
                    h1,
                    InputField(
                      titleWeight: FontWeight.bold,
                      titleSize: 14.0,
                      controller: TextEditingController(),
                      label: "Enter your email",
                      borderRadius: 20.0,
                      borderColor: Colors.black,
                      boxConstraints: 12,
                      verticalPadding: 18.0,
                      fieldTitle: "Email",
                      hintColor: Colors.grey.shade600,
                    ),
                    h1,
                    InputField(
                      titleWeight: FontWeight.bold,
                      titleSize: 14.0,
                      maxLines: 4,
                      controller: TextEditingController(),
                      label: "Enter message",
                      borderRadius: 20.0,
                      borderColor: Colors.black,
                      boxConstraints: 12,
                      verticalPadding: 18.0,
                      fieldTitle: "Message",
                      hintColor: Colors.grey.shade600,
                    ),
                    h2,
                    PrimaryButton(
                      fontSize: 16.0,
                      height: 50,
                      hMargin: 0,
                      backgroundColor: AppColors.primaryColor,
                      borderRadius: 16.0,
                      onPressed: () {},
                      title: "Send",
                    ),
                  ],
                ))
              ],
            )));
  }
}

class ContactDetailsWidget extends StatelessWidget {
  const ContactDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ContactDetailInfo(
          fieldName: '+ 44 563 4568',
          fieldSvg: Assets.svgCall,
        ),
        h1,
        const ContactDetailInfo(
          fieldName: 'Orionsafeguard@gmail.com',
          fieldSvg: Assets.svgSms,
        ),
        h1,
        const ContactDetailInfo(
          fieldName: '123 Dummy Address New York, USA',
          fieldSvg: Assets.svgLocation,
        ),
        h1,
      ],
    );
  }
}

class ContactDetailInfo extends StatelessWidget {
  const ContactDetailInfo(
      {super.key, required this.fieldName, required this.fieldSvg});

  final String fieldName, fieldSvg;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              100.0,
            ),
            color: Colors.red.shade50,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              fieldSvg,
              height: 16.0,
              width: 16.0,
            ),
          ),
        ),
        w2,
        Text(
          fieldName,
          style: AppTextStyles.robotoMedium(
            fontSize: 14.0,
          ),
        )
      ],
    );
  }
}
