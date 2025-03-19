import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../config/constants/app_text_styles.dart';
import '../../../utils/helper_widgets.dart';
import '../../screen_layout_widget/custom_shimmer_widget.dart';

class NotificationLoadingView extends StatefulWidget {
  const NotificationLoadingView({super.key});

  @override
  State<NotificationLoadingView> createState() =>
      _NotificationLoadingViewState();
}

class _NotificationLoadingViewState extends State<NotificationLoadingView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return AnnouncementLoadingCard();
        },
        separatorBuilder: (BuildContext context, int index) {
          return customDivider(
            hPadding: 0.0,
            thickness: 1.2,
            color: Colors.grey.shade300,
          );
        },
      ),
    );
  }
}

class AnnouncementLoadingCard extends StatelessWidget {
  const AnnouncementLoadingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomShimmerWidget(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Bone.button(
                height: 30.sp,
                width: 30.sp,
                borderRadius: BorderRadius.circular(
                  14.0,
                ),
              ),
            ),
            Expanded(
              flex: 12,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Announcement admin",
                        style: AppTextStyles.robotoSemiBold(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      width: 70.sp,
                      child: Text(
                          overflow: TextOverflow.ellipsis,
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
                          maxLines: 4,
                          style: AppTextStyles.robotoRegular(
                            fontSize: 14.0,
                            color: Colors.grey.shade600,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topRight,
                child: Text("1 days",
                    style: AppTextStyles.robotoRegular(
                      fontSize: 12.0,
                      color: Colors.grey.shade600,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
