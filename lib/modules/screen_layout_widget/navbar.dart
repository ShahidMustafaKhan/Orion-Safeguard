import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orion_safeguard/ui/widgets/on_click.dart';
import 'package:orion_safeguard/utils/extensions/extended_context.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';
import '../dashboard/model/dashboard_model.dart';

class Navbar extends StatelessWidget {
  final List<BottomNavModel> tabs;
  final Function(int) onChanged;

  const Navbar({super.key, required this.tabs, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            tabs.length,
            (index) => OnClick(
                  onTap: () => onChanged(index),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        tabs[index].isSelected
                            ? tabs[index].selectedIcon
                            : tabs[index].unSelectedIcon,
                        color: tabs[index].isSelected
                            ? AppColors.primaryColor
                            : AppColors.black,
                        height: 24.0,
                        width: 24.0,
                      ),
                      Text(
                        tabs[index].title,
                        style: context.textTheme.bodySmall?.copyWith(
                          fontSize: 15.sp,
                          color: tabs[index].isSelected
                              ? AppColors.primaryColor
                              : AppColors.black,
                          fontWeight: tabs[index].isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}
