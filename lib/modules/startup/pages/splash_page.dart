import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orion_safeguard/modules/authentications/pages/signin_screen.dart';
import 'package:orion_safeguard/modules/startup/cubits/startup_cubit.dart';

import '../../../config/routes/nav_router.dart';
import '../../../constants/app_colors.dart';
import '../../../generated/assets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StartupCubit()..init(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: BlocConsumer<StartupCubit, StartupState>(
          listener: (context, state) {
            if (state.status == Status.success) {
              NavRouter.pushAndRemoveUntil(context, const LoginScreen());
            }
          },
          builder: (context, state) {
            return Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      child: SvgPicture.asset(
                        Assets.svgSplashLogo,
                        width: 250,
                        height: 200,
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
