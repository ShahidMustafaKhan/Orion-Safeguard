import 'package:flutter/material.dart';

import '../../../screen_layout_widget/no_data_found.dart';

class ShiftsEmptyView extends StatefulWidget {
  const ShiftsEmptyView({super.key});

  @override
  State<ShiftsEmptyView> createState() => _ShiftsEmptyViewState();
}

class _ShiftsEmptyViewState extends State<ShiftsEmptyView> {
  @override
  Widget build(BuildContext context) {
    return NoDataFound();
  }
}
