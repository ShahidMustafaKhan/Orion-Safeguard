import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/config/constants/app_colors.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:orion_safeguard/modules/dashboard/shift_pages/active_shift_page.dart';
import 'package:orion_safeguard/modules/dashboard/shift_pages/completed_shift_page.dart';

import '../../../utils/heights_and_widths.dart';
import '../../screen_layout_widget/base_view_layout.dart';
import '../cubits/my_shifts_cubits/my_shifts_cubit.dart';

class MyShiftsScreen extends StatefulWidget {
  const MyShiftsScreen({super.key});

  @override
  State<MyShiftsScreen> createState() => _MyShiftsScreenState();
}

class _MyShiftsScreenState extends State<MyShiftsScreen> {
  @override
  void initState() {
    context.read<MyShiftsCubit>().activeShifts();
    context.read<MyShiftsCubit>().completedShifts();
    context.read<MyShiftsCubit>().subscribeToActiveShifts();
    super.initState();
  }

  @override
  void dispose() {
    debugPrint('canceling subscription');
    context.read<MyShiftsCubit>().cancelSubscription();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseViewLayout(
      pageTitle: 'My Shifts',
      child: DefaultTabController(
        length: 2, // Updated to match the number of tabs
        child: Column(
          children: [
            h1,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(
                    16.0,
                  ),
                ),
                child: TabBar(
                  padding: const EdgeInsets.all(
                    12.0,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),
                  ),
                  dividerHeight: 0,
                  // indicatorColor: Colors.transparent,
                  // labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  unselectedLabelStyle: AppTextStyles.robotoRegular(
                    color: AppColors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.0,
                  ),
                  labelStyle: AppTextStyles.robotoBold(
                    color: AppColors.primaryColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: const [
                    Tab(
                      child: Text("Active Shift"),
                    ),
                    Tab(
                      child: Text("Completed Shifts"),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  ActiveShiftPage(),
                  CompletedShiftPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
