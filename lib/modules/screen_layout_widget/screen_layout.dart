import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orion_safeguard/constants/app_colors.dart';
import 'package:orion_safeguard/constants/app_text_styles.dart';

import '../../generated/assets.dart';

class OrionLayout extends StatefulWidget {
  const OrionLayout(
      {super.key,
      required this.pageTitle,
      required this.child,
      this.appBarLeading});

  final String pageTitle;
  final Widget child;
  final Widget? appBarLeading;

  @override
  State<OrionLayout> createState() => _OrionLayoutState();
}

class _OrionLayoutState extends State<OrionLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        24.0,
                      ),
                      bottomRight: Radius.circular(
                        24.0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -40,
                  left: -90,
                  child: SvgPicture.asset(Assets.svgLoop),
                ),
                Positioned(
                  bottom: -70,
                  right: -90,
                  child: SvgPicture.asset(Assets.svgLoop),
                ),
                Positioned(
                  bottom: 15,
                  left: 0,
                  right: 0,
                  child: AppBar(
                    leading: widget.appBarLeading,
                    backgroundColor: Colors.transparent,
                    iconTheme: const IconThemeData(color: Colors.white),
                    titleTextStyle: AppTextStyles.robotoMedium(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    title: Text(
                      widget.pageTitle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: widget.child,
          )
        ],
      ),
    );
  }
}
