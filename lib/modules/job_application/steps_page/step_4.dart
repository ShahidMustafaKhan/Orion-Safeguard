import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:orion_safeguard/modules/job_application/cubit/job_application_cubit.dart';
import 'package:orion_safeguard/modules/job_application/widget/primary_form_button.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/heights_and_widths.dart';
import '../common/constants/constants.dart';
import '../widget/custom_drop_down.dart';
import '../widget/input_form_field.dart';

class Step4 extends StatefulWidget {
  const Step4({super.key});

  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  final formKey = GlobalKey<FormState>();

  String? selectedRelation;
  TextEditingController name = TextEditingController();
  TextEditingController tPhone = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController postalCode = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode tPhoneFocus = FocusNode();
  FocusNode mobileNoFocus = FocusNode();
  FocusNode addressFocus = FocusNode();
  FocusNode postalCodeFocus = FocusNode();

  @override
  void initState() {
    JobApplicationCubit cubit = context.read<JobApplicationCubit>();

    selectedRelation =
        cubit.state.relationshipKin == "" ? null : cubit.state.relationshipKin;
    name.text = cubit.state.nameKin;
    tPhone.text = cubit.state.telephoneKin;
    mobileNo.text = cubit.state.mobileNoKin;
    address.text = cubit.state.addressKin;
    postalCode.text = cubit.state.postCodeKin;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 3.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Person to contact in case of emergency/Next of kin",
                    style: AppTextStyles.robotoSemiBold(
                      fontSize: 16.0,
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDropdown<String>(
                          icon: const Icon(Icons.keyboard_arrow_down),
                          text: 'Relationship to next of kin:',
                          hint: "Select relationship",
                          value: selectedRelation,
                          nextFocusNode: nameFocus,
                          items: relationship(),
                          onChanged: (value) {
                            setState(() {
                              selectedRelation = value;
                            });
                          },
                        ),
                        InputFormField(
                          controller: name,
                          focusNode: nameFocus,
                          nextFocusNode: tPhoneFocus,
                          label: "Enter name of kin",
                          fieldTitle: "Name",
                        ),
                        h1,
                        InputFormField(
                          controller: tPhone,
                          label: "Enter telephone no",
                          fieldTitle: "Telephone no",
                          focusNode: tPhoneFocus,
                          nextFocusNode: mobileNoFocus,
                        ),
                        h1,
                        InputFormField(
                          controller: mobileNo,
                          focusNode: mobileNoFocus,
                          nextFocusNode: addressFocus,
                          label: "Enter mobile number",
                          fieldTitle: "Mobile no",
                        ),
                        h1,
                        InputFormField(
                          controller: address,
                          focusNode: addressFocus,
                          nextFocusNode: postalCodeFocus,
                          label: "Enter Kin address",
                          fieldTitle: "Address",
                        ),
                        h1,
                        InputFormField(
                          controller: postalCode,
                          focusNode: postalCodeFocus,
                          label: "Enter Kin post code",
                          fieldTitle: "Post code",
                        )
                      ],
                    ),
                  ),
                  h1,
                ],
              ),
            ),
          ),
          PrimaryFormButton(
            onPressed: () {
              JobApplicationCubit cubit = context.read<JobApplicationCubit>();
              cubit.updateJobApplicationState(cubit.state.copyWith(
                relationshipKin: selectedRelation,
                nameKin: name.text,
                telephoneKin: tPhone.text,
                mobileNoKin: mobileNo.text,
                addressKin: address.text,
                postCodeKin: postalCode.text,
              ));
            },
            formKey: formKey,
          ),
        ],
      ),
    );
  }
}
