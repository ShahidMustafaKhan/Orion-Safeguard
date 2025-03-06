import 'package:flutter/material.dart';
import 'package:orion_safeguard/utils/helper_widgets.dart';

import '../../screen_layout_widget/completed_shifts_widget.dart';

class CompletedShiftPage extends StatefulWidget {
  const CompletedShiftPage({super.key});

  @override
  State<CompletedShiftPage> createState() => _CompletedShiftPageState();
}

class _CompletedShiftPageState extends State<CompletedShiftPage> {
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
          return const CompletedShiftsWidget();
        },
        separatorBuilder: (BuildContext context, int index) {
          return customDivider(
            hPadding: 10.0,
            thickness: 1.2,
            color: Colors.grey.shade300,
          );
        },
      ),
    );
  }
}
