import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../config/routes/nav_router.dart';
import '../../config/themes/light_theme.dart';
import '../../modules/startup/pages/splash_page.dart';
import '../core/di/service_locator.dart';
import 'cubit/app_cubit.dart';

class OrionSafeguard extends StatelessWidget {
  const OrionSafeguard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit(getIt())..init(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return Sizer(builder: (context, orientation, deviceType) {
            return MaterialApp(
              navigatorKey: NavRouter.navigationKey,
              title: 'Orion Safeguard',
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              themeMode: ThemeMode.light,
              builder: (BuildContext context, Widget? child) {
                child = BotToastInit()(context, child);
                return child;
              },
              navigatorObservers: [
                BotToastNavigatorObserver(),
              ],
              home: const SplashPage(),
            );
          });
        },
      ),
    );
  }
}
