import 'package:flutter/material.dart';
import 'package:orion_safeguard/utils/extensions/extended_context.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Color? titleColor;

  const CustomAppbar({
    super.key,
    required this.title,
    this.centerTitle = false,
    this.bottom,
    this.actions,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: context.textTheme.headlineLarge,
      ),
      centerTitle: centerTitle,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
