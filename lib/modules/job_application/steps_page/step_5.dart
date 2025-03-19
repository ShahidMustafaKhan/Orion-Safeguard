import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:orion_safeguard/modules/job_application/cubit/job_application_cubit.dart';
import 'package:orion_safeguard/modules/job_application/widget/input_form_field.dart';
import 'package:orion_safeguard/modules/job_application/widget/primary_form_button.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/heights_and_widths.dart';
import '../widget/custom_radio_button.dart';

class Step5 extends StatefulWidget {
  const Step5({super.key});

  @override
  State<Step5> createState() => _Step5State();
}

class _Step5State extends State<Step5> {
  final key = GlobalKey<FormState>();

  String selectTransport = "No";
  String selectDisQualified = "No";
  String selectConviction = "No";

  TextEditingController drivingLicenseType = TextEditingController();
  TextEditingController drivingLicenseNo = TextEditingController();
  TextEditingController dvlaLicense = TextEditingController();
  TextEditingController offenseDescription = TextEditingController();

  FocusNode drivingLicenseTypeFocus = FocusNode();
  FocusNode drivingLicenseNoFocus = FocusNode();
  FocusNode dvlaLicenseFocus = FocusNode();
  FocusNode offenseDescriptionFocus = FocusNode();
  FocusNode selectTransportFocus = FocusNode();
  FocusNode selectDisQualifiedFocus = FocusNode();
  FocusNode selectConvictionFocus = FocusNode();

  @override
  void initState() {
    JobApplicationCubit jobApplicationCubit =
        context.read<JobApplicationCubit>();

    drivingLicenseType.text = jobApplicationCubit.state.drivingType;
    drivingLicenseNo.text = jobApplicationCubit.state.drivingLicenseNo;
    dvlaLicense.text = jobApplicationCubit.state.dvlaLicenseCheckCode;
    offenseDescription.text =
        jobApplicationCubit.state.motoringConvictionDetails;
    selectTransport = jobApplicationCubit.state.ownTransport ? "Yes" : "No";
    selectDisQualified = jobApplicationCubit.state.disqualified ? "Yes" : "No";
    selectConviction =
        jobApplicationCubit.state.motoringConviction ? "Yes" : "No";

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Driving",
                    style: AppTextStyles.robotoSemiBold(
                      fontSize: 16.0,
                    ),
                  ),
                  Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputFormField(
                          controller: drivingLicenseType,
                          focusNode: drivingLicenseTypeFocus,
                          nextFocusNode: selectTransportFocus,
                          label: "Enter Driving License Type",
                          fieldTitle: "Driving License Type",
                        ),
                        h1,
                        CustomRadioButtonGroup(
                          title: "Own Transport",
                          selectedValue: selectTransport,
                          focusNode: selectTransportFocus,
                          nextFocusNode: drivingLicenseNoFocus,
                          options: const ["Yes", "No"],
                          onChanged: (value) {
                            setState(() {
                              selectTransport =
                                  value; // Update the selected value
                            });
                          },
                        ),
                        h1,
                        InputFormField(
                          controller: drivingLicenseNo,
                          focusNode: drivingLicenseNoFocus,
                          nextFocusNode: dvlaLicenseFocus,
                          label: "Enter Driving License Number",
                          fieldTitle: "Driving License Number",
                        ),
                        h1,
                        InputFormField(
                          controller: dvlaLicense,
                          focusNode: dvlaLicenseFocus,
                          nextFocusNode: selectDisQualifiedFocus,
                          label: "Enter DVLA License Check Code",
                          fieldTitle: "DVLA License Check Code",
                        ),
                        h1,
                        CustomRadioButtonGroup(
                          title: "Have you ever been disqualified?",
                          selectedValue: selectDisQualified,
                          options: const ["Yes", "No"],
                          focusNode: selectDisQualifiedFocus,
                          nextFocusNode: selectConvictionFocus,
                          onChanged: (value) {
                            setState(() {
                              selectDisQualified =
                                  value; // Update the selected value
                            });
                          },
                        ),
                        h1,
                        CustomRadioButtonGroup(
                          title: "Any Motoring offences/convictions?",
                          selectedValue: selectConviction,
                          focusNode: selectConvictionFocus,
                          nextFocusNode: offenseDescriptionFocus,
                          options: const ["Yes", "No"],
                          onChanged: (value) {
                            setState(() {
                              selectConviction =
                                  value; // Update the selected value
                            });
                          },
                        ),
                        h1,
                        InputFormField(
                          controller: offenseDescription,
                          focusNode: offenseDescriptionFocus,
                          label: "Enter text here",
                          maxLines: 3,
                          fieldTitle:
                              "If yes, please provide description of your offence/s below if no then leave it empty",
                        ),
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
                drivingType: drivingLicenseType.text,
                drivingLicenseNo: drivingLicenseNo.text,
                dvlaLicenseCheckCode: dvlaLicense.text,
                motoringConvictionDetails: offenseDescription.text,
                ownTransport: selectTransport == "Yes" ? true : false,
                disqualified: selectDisQualified == "Yes" ? true : false,
                motoringConviction: selectConviction == "Yes" ? true : false,
              ));
            },
            formKey: key,
          ),
        ],
      ),
    );
  }
}
