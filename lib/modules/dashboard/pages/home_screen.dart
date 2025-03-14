import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/modules/dashboard/widgets/announcement_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../config/constants/app_colors.dart';
import '../../../generated/assets.dart';
import '../../../utils/heights_and_widths.dart';
import '../../profile/cubit/profile_cubit.dart';
import '../../screen_layout_widget/base_view_layout.dart';
import '../widgets/home_screen_widgets/ongoing_shifts_section/ongoing_shifts_section.dart';
import '../widgets/home_screen_widgets/previous_shifts_section.dart';
import '../widgets/home_screen_widgets/upcoming_shifts_section/upcoming_shifts_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().getCurrentUser();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            child: SvgPicture.asset(
              Assets.svgCalendarTick,
              color: AppColors.white,
            ),
            onPressed: () {}),
        body: BaseViewLayout(
          pageTitle: 'Welcome back',
          isHome: true,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Column(
              children: [
                h1,
                const AnnouncementWidget(),
                h2,
                OngoingShiftsSection(),
                h1,
                UpComingShiftsSection(),
                h1,
                PreviousShiftsSection(),
              ],
            ),
          ),
        ));
  }
}
