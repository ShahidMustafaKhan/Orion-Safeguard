import 'package:flutter/material.dart';

import '../../../utils/heights_and_widths.dart';
import '../../screen_layout_widget/active_shift_widget.dart';

class ActiveShiftPage extends StatefulWidget {
  const ActiveShiftPage({super.key});

  @override
  State<ActiveShiftPage> createState() => _ActiveShiftPageState();
}

class _ActiveShiftPageState extends State<ActiveShiftPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ActiveShiftWidget(
            isApproved: index == 0 ? true : false,
            shiftName: 'Shift name',
            location: 'Location of the Shift',
            date: 'Nov 9, 11:00 AM',
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return h1P5;
        },
      ),
    );
  }
}
