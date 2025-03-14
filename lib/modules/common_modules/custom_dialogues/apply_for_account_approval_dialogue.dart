import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/config/constants/constants.dart';
import 'package:sizer/sizer.dart';

import '../../../config/constants/app_text_styles.dart';
import '../../../config/routes/nav_router.dart';
import '../../../ui/button/primary_button.dart';
import '../../../utils/heights_and_widths.dart';
import '../../authentications/cubit/signup/signup_cubit.dart';

class ApplyForAccountApprovalDialogue extends StatefulWidget {
  const ApplyForAccountApprovalDialogue({super.key});

  @override
  State<ApplyForAccountApprovalDialogue> createState() =>
      _ApplyForAccountApprovalDialogueState();
}

class _ApplyForAccountApprovalDialogueState
    extends State<ApplyForAccountApprovalDialogue>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _lineAnimation;
  late Animation<double> _dotAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _lineAnimation = Tween<double>(begin: -20, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _dotAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller, curve: Interval(0.6, 1.0, curve: Curves.easeIn)),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            h1,
            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return ScaleTransition(
                      scale: _scaleAnimation,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Transform.translate(
                          offset: Offset(0, _lineAnimation.value),
                          child: Container(
                            width: 6,
                            height: 20,
                            color: Colors.white,
                          ),
                        ),
                        h0P5,
                        Opacity(
                          opacity: _dotAnimation.value,
                          child: Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
            h1,
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: Text(
                "Select between the two options: Are you an existing employee or applying for a new job?",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: AppTextStyles.robotoMedium(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            BlocProvider<SignUpCubit>(
              create: (BuildContext context) => SignUpCubit(),
              child: BlocBuilder<SignUpCubit, SignUpState>(
                  buildWhen: (_, state) => false,
                  builder: (context, state) {
                    return PrimaryButton(
                      onPressed: () {
                        context.read<SignUpCubit>().onSignUpButtonClicked();
                        NavRouter.pop(context);
                      },
                      title: "Yes Apply",
                      hMargin: 0,
                      borderRadius: 14.0,
                      height: buttonHeight,
                      backgroundColor: AppColors.primaryColor,
                    );
                  }),
            ),
            PrimaryOutlineButton(
              onPressed: () {
                NavRouter.pop(context);
              },
              title: "Cancel",
              titleColor: AppColors.primaryColor,
              borderColor: AppColors.primaryColor,
              hMargin: 0,
              borderRadius: 14.0,
              height: buttonHeight,
            ),
          ],
        ),
      ),
    );
  }
}
