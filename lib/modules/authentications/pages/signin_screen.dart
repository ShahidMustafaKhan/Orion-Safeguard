import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/constants/app_text_styles.dart';
import 'package:orion_safeguard/constants/constants.dart';
import 'package:orion_safeguard/modules/authentications/pages/signup_screen.dart';
import 'package:orion_safeguard/modules/authentications/widgets/remember_me_checkbox.dart';
import 'package:orion_safeguard/modules/dashboard/pages/base_screen.dart';
import 'package:orion_safeguard/ui/button/primary_button.dart';
import 'package:orion_safeguard/ui/input/input_field.dart';
import 'package:orion_safeguard/utils/heights_and_widths.dart';
import 'package:sizer/sizer.dart';

import '../../../config/routes/nav_router.dart';
import '../../../generated/assets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: InputField(
                            titleSize: 15.0,
                            controller: _emailController,
                            label: "Enter your email",
                            borderRadius: 20.0,
                            borderColor: Colors.black,
                            boxConstraints: 12,
                            verticalPadding: 17.0,
                            fieldTitle: "Email",
                            hintColor: Colors.grey.shade600,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an email';
                              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                          ),
                        ),
                        h0P5,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: InputField(
                            controller: _passwordController,
                            label: "Enter your password",
                            borderRadius: 20.0,
                            borderColor: Colors.black,
                            boxConstraints: 12,
                            verticalPadding: 17.0,
                            fieldTitle: "Password",
                            hintColor: Colors.grey.shade600,
                            titleSize: 15.0,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 16.0,
                          ),
                          child: PrimaryButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                NavRouter.push(context, const BaseScreen());
                              }
                            },
                            title: "Sign in",
                            backgroundColor: AppColors.primaryColor,
                            borderRadius: 12.0,
                            height: buttonHeight,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            hMargin: 0.0,
                          ),
                        ),
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
