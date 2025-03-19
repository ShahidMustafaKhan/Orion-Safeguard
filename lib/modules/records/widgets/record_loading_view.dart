import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../config/constants/app_text_styles.dart';
import '../../../utils/heights_and_widths.dart';
import '../../../utils/helper_widgets.dart';
import '../../screen_layout_widget/custom_shimmer_widget.dart';

class RecordLoadingView extends StatefulWidget {
  const RecordLoadingView({super.key});

  @override
  State<RecordLoadingView> createState() => _RecordLoadingViewState();
}

class _RecordLoadingViewState extends State<RecordLoadingView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        itemBuilder: (context, index) {
          return RecordLoadingWidget();
        },
        separatorBuilder: (BuildContext context, int index) {
          return customDivider(thickness: 1.2);
        },
        itemCount: 12);
  }
}

class RecordLoadingWidget extends StatelessWidget {
  const RecordLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomShimmerWidget(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                textAlign: TextAlign.left,
                "Shift Name",
                style: AppTextStyles.robotoRegular(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  // color: Colors.grey,
                ),
              ),
              Text(
                textAlign: TextAlign.left,
                "Missed/Rejected",
                style: AppTextStyles.robotoRegular(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                textAlign: TextAlign.left,
                "Location of the shift",
                style: AppTextStyles.robotoRegular(
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                  // color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  Bone.circle(),
                  w2,
                  Text(
                    textAlign: TextAlign.left,
                    "Mar 13, 07:30 - 07:30",
                    style: AppTextStyles.robotoRegular(
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
