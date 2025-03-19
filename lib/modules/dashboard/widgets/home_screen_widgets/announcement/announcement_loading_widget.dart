import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnnouncementLoadingWidget extends StatelessWidget {
  const AnnouncementLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Padding(
        padding: EdgeInsets.only(top: 1.h),
        child: Bone.button(
          height: 150,
          width: double.infinity,
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
    );
  }
}
