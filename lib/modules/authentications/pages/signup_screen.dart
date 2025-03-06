import 'package:flutter/material.dart';
import 'package:orion_safeguard/constants/app_text_styles.dart';
import 'package:orion_safeguard/constants/constants.dart';
import 'package:orion_safeguard/modules/authentications/widgets/remember_me_checkbox.dart';
import 'package:orion_safeguard/modules/common_modules/custom_dialogues/select_user_dialogue.dart';
import 'package:orion_safeguard/ui/button/primary_button.dart';
import 'package:sizer/sizer.dart';

import '../../../ui/input/input_field.dart';
import '../../../utils/heights_and_widths.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Sign Up",
                    style: AppTextStyles.robotoBold(fontSize: 20.sp)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                      "Lorem ipsum dolor sit amet, elit. Ut et massa mi. Aliquam in hendrerit urna.",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.robotoMedium(
                          fontSize: 16.sp, fontWeight: FontWeight.w400)),
                ),
                h1,
                Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputField(
                      controller: TextEditingController(),
                      label: "Enter your first name",
                      borderRadius: 20.0,
                      borderColor: Colors.black,
                      boxConstraints: 12,
                      verticalPadding: 17.0,
                      fieldTitle: "First Name",
                      hintColor: Colors.grey.shade600,
                      titleSize: 15.0,
                    ),
                    h0P5,
                    InputField(
                      controller: TextEditingController(),
                      label: "Enter your last name",
                      borderRadius: 20.0,
                      borderColor: Colors.black,
                      boxConstraints: 12,
                      verticalPadding: 17.0,
                      fieldTitle: "Last Name",
                      hintColor: Colors.grey.shade600,
                      titleSize: 15.0,
                    ),
                    h0P5,
                    InputField(
                      controller: TextEditingController(),
                      label: "Enter your License no",
                      borderRadius: 20.0,
                      borderColor: Colors.black,
                      boxConstraints: 12,
                      verticalPadding: 17.0,
                      fieldTitle: "License no",
                      hintColor: Colors.grey.shade600,
                      titleSize: 15.0,
                    ),
                    h0P5,
                    InputField(
                      controller: TextEditingController(),
                      label: "Enter your NI number",
                      borderRadius: 20.0,
                      borderColor: Colors.black,
                      boxConstraints: 12,
                      verticalPadding: 17.0,
                      fieldTitle: "NI number",
                      hintColor: Colors.grey.shade600,
                      titleSize: 15.0,
                    ),
                    h0P5,
                    InputField(
                      controller: TextEditingController(),
                      label: "Enter your Email",
                      borderRadius: 20.0,
                      borderColor: Colors.black,
                      boxConstraints: 12,
                      verticalPadding: 17.0,
                      fieldTitle: "Email",
                      hintColor: Colors.grey.shade600,
                      titleSize: 15.0,
                    ),
                    h0P5,
                    InputField(
                      controller: TextEditingController(),
                      label: "Enter your Password",
                      borderRadius: 20.0,
                      borderColor: Colors.black,
                      boxConstraints: 12,
                      verticalPadding: 17.0,
                      fieldTitle: "Password",
                      hintColor: Colors.grey.shade600,
                      titleSize: 15.0,
                      obscureText: true,
                    ),
                    h0P5,
                    InputField(
                      obscureText: true,
                      controller: TextEditingController(),
                      label: "Confirm Password",
                      borderRadius: 20.0,
                      borderColor: Colors.black,
                      boxConstraints: 12,
                      verticalPadding: 17.0,
                      fieldTitle: "Enter your Password",
                      hintColor: Colors.grey.shade600,
                      titleSize: 15.0,
                    ),
                    h0P5,
                    const RememberMeCheckbox(),
                    h1,
                    PrimaryButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => const SelectUserDialogue());
                      },
                      title: "Sign Up",
                      backgroundColor: AppColors.primaryColor,
                      borderRadius: 12.0,
                      height: buttonHeight,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      hMargin: 0.0,
                    ),
                  ],
                ))
              ],
            ),
          )),
        ),
      ),
    );
  }
}
