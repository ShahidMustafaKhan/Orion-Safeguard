import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/heights_and_widths.dart';
import '../../../screen_layout_widget/no_data_found.dart';
import 'announcement/announcement_widget.dart';

class HomeEmptyView extends StatelessWidget {
  const HomeEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp),
      child: Stack(
        children: [
          Column(
            children: [
              const AnnouncementWidget(),
              h1,
            ],
          ),
          Align(child: NoDataFound())
        ],
      ),
    );
  }
}
