import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:orion_safeguard/config/constants/constants.dart';
import 'package:orion_safeguard/modules/authentications/cubit/login/login_cubit.dart';
import 'package:orion_safeguard/modules/authentications/pages/signin/widgets/email_input_field.dart';
import 'package:orion_safeguard/modules/authentications/pages/signin/widgets/login_button.dart';
import 'package:orion_safeguard/modules/authentications/pages/signin/widgets/password_input_field.dart';
import 'package:orion_safeguard/modules/authentications/pages/signup/signup_screen.dart';
import 'package:orion_safeguard/modules/authentications/widgets/remember_me_checkbox.dart';
import 'package:orion_safeguard/utils/heights_and_widths.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/routes/nav_router.dart';
import '../../../../generated/assets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

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
                        Text("Sign in",
                            style: AppTextStyles.robotoBold(fontSize: 20.sp)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                              "Lorem ipsum dolor sit amet, elit. Ut et massa mi. Aliquam in hendrerit urna.",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.robotoMedium(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400)),
                        ),
                        h1,
                        InputEmailField(
                            emailFocusNode: emailFocusNode,
                            passwordFocusNode: passwordFocusNode),
                        h0P5,
                        InputPasswordField(
                            passwordFocusNode: passwordFocusNode),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 4.0, right: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const RememberMeCheckbox(),
                              Text("Forgot Password?",
                                  overflow: TextOverflow.visible,
                                  maxLines: 10,
                                  style: AppTextStyles.robotoMedium(
                                      fontSize: 15.sp)),
                            ],
                          ),
                        ),
                        h3,
                        LoginButton(formKey: _formKey),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("New User?",
                          style: AppTextStyles.robotoMedium(fontSize: 16.sp)),
                      w2,
                      InkWell(
                        onTap: () {
                          //  if (_formKey.currentState!.validate()) {

                          NavRouter.push(context, const SignupScreen());
                          //  }
                        },
                        child: Text("Sign Up",
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
