import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/modules/job_application/widget/input_form_field.dart';
import 'package:orion_safeguard/modules/job_application/widget/primary_form_button.dart';
import 'package:sizer/sizer.dart';

import '../../../config/constants/app_text_styles.dart';
import '../../../utils/heights_and_widths.dart';
import '../cubit/job_application_cubit.dart';

class Step9 extends StatefulWidget {
  const Step9({super.key});

  @override
  State<Step9> createState() => _Step9State();
}

class _Step9State extends State<Step9> {
  final formKey = GlobalKey<FormState>();
  late JobApplicationCubit cubit;

  TextEditingController bankName = TextEditingController();
  TextEditingController accountHolderName = TextEditingController();
  TextEditingController sortCode = TextEditingController();
  TextEditingController accountNo = TextEditingController();

  FocusNode bankNameFocusNode = FocusNode();
  FocusNode accountHolderNameFocusNode = FocusNode();
  FocusNode sortCodeFocusNode = FocusNode();
  FocusNode accountNoFocusNode = FocusNode();

  @override
  void initState() {
    cubit = context.read<JobApplicationCubit>();

    bankName.text = cubit.state.bankName;
    accountHolderName.text = cubit.state.accountHolderName;
    sortCode.text = cubit.state.sortCode;
    accountNo.text = cubit.state.accountNo;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 8.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.left,
                  "Bank Details",
                  style: AppTextStyles.robotoSemiBold(
                    fontSize: 16.0,
                  ),
                ),
                h0P5,
                InputFormField(
                  controller: bankName,
                  label: "Enter Bank Name",
                  fieldTitle: "Bank Name",
                  focusNode: bankNameFocusNode,
                  nextFocusNode: accountHolderNameFocusNode,
                ),
                h1,
                InputFormField(
                  controller: accountHolderName,
                  label: "Enter Account Holder Name",
                  fieldTitle: "Account Holder Name",
                  focusNode: accountHolderNameFocusNode,
                  nextFocusNode: sortCodeFocusNode,
                ),
                h1,
                InputFormField(
                  controller: sortCode,
                  label: "Enter Sort Code",
                  fieldTitle: "Sort Code",
                  focusNode: sortCodeFocusNode,
                  nextFocusNode: accountNoFocusNode,
                ),
                h1,
                InputFormField(
                  controller: accountNo,
                  label: "Enter Account Number",
                  fieldTitle: "Account Number",
                  focusNode: accountNoFocusNode,
                ),
                h1,
              ],
            ),
          ),
        ),
        PrimaryFormButton(
          onPressed: () {
            cubit.updateJobApplicationState(
              cubit.state.copyWith(
                bankName: bankName.text,
                accountHolderName: accountHolderName.text,
                sortCode: sortCode.text,
                accountNo: accountNo.text,
              ),
            );
          },
          formKey: formKey,
        )
      ],
    );
  }
}
