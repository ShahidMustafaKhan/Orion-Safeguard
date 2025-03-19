import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomShimmerWidget extends StatelessWidget {
  final Widget child;
  const CustomShimmerWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(enabled: true, child: child);
  }
}
