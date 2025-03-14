import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/modules/screen_layout_widget/screen_layout.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../generated/assets.dart';
import '../../../ui/button/primary_button.dart';
import '../../../utils/heights_and_widths.dart';
import '../widgets/decline_reason_dialogue.dart';

class FullAlertScreen extends StatefulWidget {
  const FullAlertScreen({super.key});

  @override
  State<FullAlertScreen> createState() => _FullAlertScreenState();
}

class _FullAlertScreenState extends State<FullAlertScreen> {
  @override
  Widget build(BuildContext context) {
    return OrionLayout(
      pageTitle: "Alerts",
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        100.0,
                      ),
                      color: Colors.red.shade50,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        Assets.svgPerson,
                        height: 16.0,
                        width: 16.0,
                      ),
                    ),
                  ),
                  w2,
                  Column(
                    children: [
                      Text(
                        "Admin",
                        style: AppTextStyles.robotoRegular(
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        "24m Ago",
                        style: AppTextStyles.robotoRegular(
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              h1,
              Text(
                "Lorem ipsum dolor sit amet consectetur. dolor justo erat vulputate arcu leo proin. Fermentum vestibulum dui erat tempor porta. Tellus nullam commodo amet turpis. Lorem ipsum dolor sit amet consectetur. dolor justo erat vulputate arcu leo proin. Fermentum vestibulum dui erat tempor porta.",
                style: AppTextStyles.robotoRegular(
                  fontSize: 14.0,
                ),
              ),
              h1,
              Text(
                "ellus nullam commodo amet turpis. Lorem ipsum dolor sit amet consectetur. dolor justo erat vulputate arcu leo proin. Fermentum vestibulum dui erat tempor porta. Tellus nullam commodo amet turpis. Lorem ipsum dolor sit amet consectetur.",
                style: AppTextStyles.robotoRegular(
                  fontSize: 14.0,
                ),
              ),
              h1,
              Text(
                "dolor justo erat vulputate arcu leo proin. Fermentum vestibulum dui erat tempor porta. Tellus nullam commodo amet turpis. Lorem ipsum dolor sit amet consectetur. dolor justo erat vulputate arcu leo proin. Fermentum vestibulum dui erat tempor porta. Tellus nullam commodo amet turpis. Lorem ipsum dolor sit amet consectetur. dolor justo erat vulputate arcu leo proin. Fermentum vestibulum dui erat tempor porta. Tellus nullam commodo amet turpis.",
                style: AppTextStyles.robotoRegular(
                  fontSize: 14.0,
                ),
              ),
              h1,
              Text(
                "Lorem ipsum dolor sit amet consectetur. dolor justo erat vulputate arcu leo proin. Fermentum vestibulum dui erat tempor porta. Tellus nullam commodo amet turpis.",
                style: AppTextStyles.robotoRegular(
                  fontSize: 14.0,
                ),
              ),
              h1,
              PrimaryButton(
                height: 50,
                hMargin: 0,
                backgroundColor: AppColors.primaryColor,
                borderRadius: 16.0,
                onPressed: () {},
                title: "Approve",
              ),
              h0P5,
              PrimaryOutlineButton(
                height: 50,
                borderRadius: 16.0,
                titleColor: AppColors.primaryColor,
                borderColor: AppColors.primaryColor,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => const DeclineReasonDialogue());
                },
                title: "Decline",
              )
            ],
          ),
        ),
      ),
    );
  }
}
