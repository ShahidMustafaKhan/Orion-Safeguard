import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/modules/dashboard/widgets/home_screen_widgets/home_empty_view.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/heights_and_widths.dart';
import '../../profile/cubit/profile_cubit/profile_cubit.dart';
import '../../screen_layout_widget/base_view_layout.dart';
import '../cubits/home_cubits/home_cubit.dart';
import '../widgets/home_screen_widgets/announcement/announcement_widget.dart';
import '../widgets/home_screen_widgets/ongoing_shifts_section/ongoing_shifts_section.dart';
import '../widgets/home_screen_widgets/previous_shift_section/previous_shifts_section.dart';
import '../widgets/home_screen_widgets/upcoming_shifts_section/upcoming_shifts_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit homeCubit;

  @override
  void initState() {
    homeCubit = context.read<HomeCubit>();
    context.read<ProfileCubit>().getCurrentUser();
    homeCubit.ongoingShift();
    homeCubit.upcomingShift();
    homeCubit.previousShift();
    homeCubit.subscribeToShifts();
    super.initState();
  }

  @override
  void dispose() {
    homeCubit.cancelSubscription();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, next) => previous != next,
            builder: (context, state) {
              return BaseViewLayout(
                pageTitle: 'Welcome back',
                isHome: true,
                child: context.read<HomeCubit>().noShiftsFound()
                    ? HomeEmptyView()
                    : SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 15.sp),
                        child: Column(
                          children: [
                            const AnnouncementWidget(),
                            h1,
                            OngoingShiftsSection(),
                            h1,
                            UpComingShiftsSection(),
                            h1,
                            PreviousShiftsSection(),
                          ],
                        ),
                      ),
              );
            }));
  }
}
