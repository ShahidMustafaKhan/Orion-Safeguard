import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:orion_safeguard/config/constants/constants.dart';
import 'package:orion_safeguard/modules/authentications/cubit/login/login_cubit.dart';
import 'package:orion_safeguard/modules/authentications/pages/forgetPassword/widget/forget_password_button.dart';
import 'package:orion_safeguard/modules/authentications/pages/signin/widgets/email_input_field.dart';
import 'package:orion_safeguard/utils/heights_and_widths.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/routes/nav_router.dart';
import '../../../../generated/assets.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  FocusNode emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                    ),
                    child: SvgPicture.asset(
                      Assets.svgLogo,
                      width: 250,
                      height: 150,
                    ),
                  ),
                  h2,
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Forgot Password",
                            style: AppTextStyles.robotoBold(fontSize: 20.sp)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                              "A password reset link will be sent to your email. If you don’t receive it, check your spam folder.",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.robotoMedium(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400)),
                        ),
                        h1,
                        InputEmailField(
                            emailFocusNode: emailFocusNode,
                            passwordFocusNode: null),
                        h0P5,
                        h3,
                        ForgetPasswordButton(formKey: _formKey),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Remember Password?",
                          style: AppTextStyles.robotoMedium(fontSize: 16.sp)),
                      w2,
                      InkWell(
                        onTap: () {
                          NavRouter.pop(context);
                        },
                        child: Text("Sign In",
                            style: AppTextStyles.robotoBold(
                                fontSize: 17.sp,
                                color: AppColors.primaryColor)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
