import 'package:flutter/material.dart';
import 'package:orion_safeguard/modules/screen_layout_widget/no_data_found.dart';

class RecordEmptyView extends StatelessWidget {
  const RecordEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return NoDataFound(
      title: "No records found",
    );
  }
}
