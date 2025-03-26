import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:orion_safeguard/modules/authentications/pages/signup/widgets/input_confrim_password.dart';
import 'package:orion_safeguard/modules/authentications/pages/signup/widgets/input_date_birth_field.dart';
import 'package:orion_safeguard/modules/authentications/pages/signup/widgets/input_email_field.dart';
import 'package:orion_safeguard/modules/authentications/pages/signup/widgets/input_first_Name_field.dart';
import 'package:orion_safeguard/modules/authentications/pages/signup/widgets/input_last_Name_field.dart';
import 'package:orion_safeguard/modules/authentications/pages/signup/widgets/input_license_number_field.dart';
import 'package:orion_safeguard/modules/authentications/pages/signup/widgets/input_ni_number_field.dart';
import 'package:orion_safeguard/modules/authentications/pages/signup/widgets/input_password_field.dart';
import 'package:orion_safeguard/modules/authentications/pages/signup/widgets/sign_up_button.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/heights_and_widths.dart';
import '../../cubit/signup/signup_cubit.dart';
import '../../widgets/remember_me_checkbox.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final key = GlobalKey<FormState>();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode licenseNoFocusNode = FocusNode();
  FocusNode niNumberFocusNode = FocusNode();
  FocusNode dateBirthFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: BlocProvider<SignUpCubit>(
              create: (BuildContext context) => SignUpCubit(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Sign Up",
                      style: AppTextStyles.robotoBold(fontSize: 20.sp)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                        "Create an account to stay connected, get updates, and manage duties.",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.robotoMedium(
                            fontSize: 16.sp, fontWeight: FontWeight.w400)),
                  ),
                  h1,
                  Form(
                      key: key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputFirstName(
                              firstNameFocusNode: firstNameFocusNode,
                              lastNameFocusNode: lastNameFocusNode),
                          h0P5,
                          InputLastName(
                              lastNameFocusNode: lastNameFocusNode,
                              licenseNoFocusNode: licenseNoFocusNode),
                          h0P5,
                          InputLicenseNo(
                              licenseNoFocusNode: licenseNoFocusNode,
                              niNumberFocusNode: niNumberFocusNode),
                          h0P5,
                          InputNiNumber(
                              niNumberFocusNode: niNumberFocusNode,
                              dateBirthFocusNode: dateBirthFocusNode),
                          h0P5,
                          InputDateBirth(
                              dateBirthFocusNode: dateBirthFocusNode,
                              emailFocusNode: emailFocusNode),
                          h0P5,
                          InputEmail(
                              emailFocusNode: emailFocusNode,
                              passwordFocusNode: passwordFocusNode),
                          h0P5,
                          InputPassword(
                              passwordFocusNode: passwordFocusNode,
                              confirmPasswordFocusNode:
                                  confirmPasswordFocusNode),
                          h0P5,
                          InputConfirmPassword(
                              confirmPasswordFocusNode:
                                  confirmPasswordFocusNode),
                          h0P5,
                          const RememberMeCheckbox(),
                          h1,
                          SignUpButton(
                            globalKey: key,
                          ),
                        ],
                      ))
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
