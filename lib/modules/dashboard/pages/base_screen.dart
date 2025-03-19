import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/modules/alerts_announcements/pages/alerts_page.dart';
import 'package:orion_safeguard/modules/records/pages/record_screen.dart';

import '../../screen_layout_widget/navbar.dart';
import '../cubits/dashboard_cubits/dashboard_cubit.dart';
import '../cubits/dashboard_cubits/dashboard_state.dart';
import 'home_screen.dart';
import 'my_shifts_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          bottomNavigationBar: BottomAppBar(
            child: Navbar(
              tabs: state.tabs,
              onChanged: (index) {
                context.read<DashboardCubit>().changePage(index);
              },
            ),
          ),
          body: PageView(
            controller: context.read<DashboardCubit>().pageController,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: const [
              HomeScreen(),
              MyShiftsScreen(),
              RecordScreen(),
              AlertsPage(),
            ],
          ),
        );
      },
    );
  }
}
