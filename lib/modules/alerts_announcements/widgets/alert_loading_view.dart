import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/modules/screen_layout_widget/custom_shimmer_widget.dart';

import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_text_styles.dart';
import '../../../generated/assets.dart';
import '../../../ui/button/primary_button.dart';
import '../../../utils/heights_and_widths.dart';

class AlertLoadingView extends StatefulWidget {
  const AlertLoadingView({super.key});

  @override
  State<AlertLoadingView> createState() => _AlertLoadingViewState();
}

class _AlertLoadingViewState extends State<AlertLoadingView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return AlertLoadingWidget();
        },
        itemCount: 12);
  }
}

class AlertLoadingWidget extends StatelessWidget {
  const AlertLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerWidget(
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Admin",
                              style: AppTextStyles.robotoRegular(
                                fontSize: 14.0,
                              ),
                            ),
                            Text("Approved",
                                style: AppTextStyles.robotoMedium(
                                  fontSize: 14.0,
                                  color: AppColors.primaryColor,
                                )),
                          ],
                        ),
                        Text(
                          "1 days",
                          style: AppTextStyles.robotoRegular(
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              h1,
              Text(
                'Lorem ipsum dolor sit amet consectetur. dolor justo erat vulputate arcu leo proin. Fermentum vestibulum dui erat tempor porta. Tellus nullam commodo amet turpis. ',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.robotoRegular(
                  fontSize: 14.0,
                ),
              ),
              h1,
              Row(
                children: [
                  Expanded(
                      child: PrimaryButton(
                    height: 40,
                    borderRadius: 16.0,
                    hMargin: 0,
                    onPressed: () {},
                    title: "Reject",
                  )),
                  w2,
                  Expanded(
                      child: PrimaryButton(
                    height: 40,
                    hMargin: 0,
                    borderRadius: 16.0,
                    onPressed: () {},
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
