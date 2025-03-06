import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orion_safeguard/constants/app_colors.dart';
import 'package:orion_safeguard/constants/app_text_styles.dart';
import 'package:orion_safeguard/modules/alerts_announcements/pages/full_alert_screen.dart';
import 'package:orion_safeguard/modules/alerts_announcements/widgets/decline_reason_dialogue.dart';
import 'package:orion_safeguard/modules/screen_layout_widget/base_view_layout.dart';
import 'package:orion_safeguard/ui/button/primary_button.dart';
import 'package:orion_safeguard/ui/widgets/on_click.dart';

import '../../../config/routes/nav_router.dart';
import '../../../generated/assets.dart';
import '../../../utils/heights_and_widths.dart';

class AlertsPage extends StatefulWidget {
  const AlertsPage({super.key});

  @override
  State<AlertsPage> createState() => _AlertsPageState();
}

class _AlertsPageState extends State<AlertsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseViewLayout(
        pageTitle: "Alerts",
        child: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: ListView.builder(
              itemBuilder: (context, index) {
                return const AlertWidget();
              },
              itemCount: 20),
        ),
      ),
    );
  }
}

class AlertWidget extends StatelessWidget {
  const AlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OnClick(
      onTap: () {
        NavRouter.push(context, const FullAlertScreen());
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                "Lorem ipsum dolor sit amet consectetur. dolor justo erat vulputate arcu leo proin. Fermentum vestibulum dui erat tempor porta. Tellus nullam commodo amet turpis.",
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.robotoRegular(
                  fontSize: 14.0,
                ),
              ),
              h1,
              Row(
                children: [
                  Expanded(
                      child: PrimaryOutlineButton(
                    height: 40,
                    borderRadius: 16.0,
                    titleColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => const DeclineReasonDialogue());
                    },
                    title: "Reject",
                  )),
                  w2,
                  Expanded(
                      child: PrimaryButton(
                    height: 40,
                    hMargin: 0,
                    backgroundColor: AppColors.primaryColor,
                    borderRadius: 16.0,
                    onPressed: () {
                      NavRouter.push(context, const FullAlertScreen());
                    },
                    title: "Approve",
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
