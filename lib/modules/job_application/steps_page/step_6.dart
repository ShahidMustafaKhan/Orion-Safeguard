import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:orion_safeguard/modules/job_application/widget/input_form_field.dart';
import 'package:orion_safeguard/modules/job_application/widget/primary_form_button.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/heights_and_widths.dart';
import '../cubit/job_application_cubit.dart';
import '../widget/custom_radio_button.dart';

class Step6 extends StatefulWidget {
  const Step6({super.key});

  @override
  State<Step6> createState() => _Step6State();
}

class _Step6State extends State<Step6> {
  String selectConviction1 = "No";
  String selectConviction2 = "No";
  String selectConviction3 = "No";
  String selectConviction4 = "No";

  TextEditingController offenseDescription = TextEditingController();

  @override
  void initState() {
    JobApplicationCubit cubit = context.read<JobApplicationCubit>();

    selectConviction1 = cubit.state.hasCriminalConvictionRecord ? "Yes" : "No";
    selectConviction2 =
        cubit.state.outStandingCriminalConviction ? "Yes" : "No";
    selectConviction3 = cubit.state.bankruptcy ? "Yes" : "No";
    selectConviction4 = cubit.state.courtOrders ? "Yes" : "No";
    offenseDescription.text = cubit.state.additionalOffenceDetails;

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
                    "Criminal Convictions",
                    style: AppTextStyles.robotoSemiBold(
                      fontSize: 16.0,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      h1,
                      CustomRadioButtonGroup(
                        title:
                            "Have you, ever been fined, cautioned, sentenced to imprisonment or placed on probation for a criminalact (subject to the Rehabilitation of Offenders Act)?",
                        selectedValue: selectConviction1,
                        options: const ["Yes", "No"],
                        onChanged: (value) {
                          setState(() {
                            selectConviction1 =
                                value; // Update the selected value
                          });
                        },
                      ),
                      h1,
                      CustomRadioButtonGroup(
                        title:
                            "Are there any alleged offences outstanding against you?",
                        selectedValue: selectConviction2,
                        options: const ["Yes", "No"],
                        onChanged: (value) {
                          setState(() {
                            selectConviction2 =
                                value; // Update the selected value
                          });
                        },
                      ),
                      h1,
                      CustomRadioButtonGroup(
                        title:
                            "Have you, ever been made bankrupt or have any Court Judgements against you, whether satisfied ornot, within the last 6 years?",
                        selectedValue: selectConviction3,
                        options: const ["Yes", "No"],
                        onChanged: (value) {
                          setState(() {
                            selectConviction3 =
                                value; // Update the selected value
                          });
                        },
                      ),
                      h1,
                      CustomRadioButtonGroup(
                        title:
                            "Has any order been made against you by a Civil or Military Court or Public Authority?",
                        selectedValue: selectConviction4,
                        options: const ["Yes", "No"],
                        onChanged: (value) {
                          setState(() {
                            selectConviction4 =
                                value; // Update the selected value
                          });
                        },
                      ),
                      h1,
                      InputFormField(
                        maxLines: 3,
                        controller: offenseDescription,
                        label: "Enter text here",
                        fieldTitle:
                            "If yes, please provide description of your offence/s below if no then leave it empty",
                      )
                    ],
                  ),
                  h1,
                ],
              ),
            ),
          ),
          PrimaryFormButton(onPressed: () {
            JobApplicationCubit cubit = context.read<JobApplicationCubit>();

            cubit.updateJobApplicationState(cubit.state.copyWith(
              hasCriminalConvictionRecord:
                  selectConviction1 == "Yes" ? true : false,
              outStandingCriminalConviction:
                  selectConviction2 == "Yes" ? true : false,
              bankruptcy: selectConviction3 == "Yes" ? true : false,
              courtOrders: selectConviction4 == "Yes" ? true : false,
              additionalOffenceDetails: offenseDescription.text,
            ));
          })
        ],
      ),
    );
  }
}
