import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/modules/alerts_announcements/cubits/alerts_cubit.dart';
import 'package:orion_safeguard/modules/dashboard/cubits/my_shifts_cubits/my_shifts_cubit.dart';
import 'package:orion_safeguard/modules/records/cubit/records_cubit.dart';

import '../../../core/di/service_locator.dart';
import '../../modules/dashboard/cubits/dashboard_cubits/dashboard_cubit.dart';
import '../../modules/dashboard/cubits/home_cubits/home_cubit.dart';
import '../../modules/profile/cubit/profile_cubit/profile_cubit.dart';
import '../cubit/app_cubit.dart';

class BlocDI extends StatelessWidget {
  const BlocDI({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(getIt())..init(),
        ),
        BlocProvider<DashboardCubit>(
          create: (context) => DashboardCubit(),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
        BlocProvider<MyShiftsCubit>(
          create: (context) => MyShiftsCubit(),
        ),
        BlocProvider<RecordsCubit>(
          create: (context) => RecordsCubit(),
        ),
        BlocProvider<AlertsCubit>(
          create: (context) => AlertsCubit(),
        ),
      ],
      child: child,
    );
  }
}
