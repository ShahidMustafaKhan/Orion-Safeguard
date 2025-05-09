import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/modules/alerts_announcements/pages/alerts_page.dart';
import 'package:orion_safeguard/modules/records/pages/record_screen.dart';

import '../../../config/routes/nav_router.dart';
import '../../account_status/cubits/subscription_cubit.dart';
import '../../account_status/pages/frozen_account_page.dart';
import '../../profile/cubit/profile_cubit/profile_cubit.dart';
import '../../profile/model/user_model.dart';
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
  void initState() {
    context.read<ProfileCubit>().addDeviceToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SubscriptionCubit>(
      create: (BuildContext context) =>
          SubscriptionCubit()..subscribeToUserStatus(),
      child: BlocListener<SubscriptionCubit, SubscriptionState>(
        listener: (context, state) {
          if (state is SubscriptionUpdated) {
            if (state.status == UserModel.keyAccountStatusTypeRejected ||
                state.status == UserModel.keyAccountStatusTypeFreezed) {
              NavRouter.pushAndRemoveUntil(context, const FrozenAccountPage());
            }
          }
        },
        child: BlocBuilder<DashboardCubit, DashboardState>(
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
        ),
      ),
    );
  }
}
