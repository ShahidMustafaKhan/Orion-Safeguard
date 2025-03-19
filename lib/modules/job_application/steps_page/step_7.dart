import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/modules/job_application/widget/primary_form_button.dart';

import '../../../config/constants/app_text_styles.dart';
import '../../../utils/heights_and_widths.dart';
import '../common/constants/constants.dart';
import '../cubit/job_application_cubit.dart';
import '../widget/custom_date_picker.dart';
import '../widget/custom_drop_down.dart';
import '../widget/input_form_field.dart';

class Step7 extends StatefulWidget {
  const Step7({super.key});

  @override
  State<Step7> createState() => _Step7State();
}

class _Step7State extends State<Step7> {
  final formKey = GlobalKey<FormState>();

  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController grades = TextEditingController();
  String? selectInstituteType;

  FocusNode nameFocus = FocusNode();
  FocusNode addressFocus = FocusNode();
  FocusNode gradesFocus = FocusNode();
  FocusNode fromDateFocus = FocusNode();
  FocusNode toDateFocus = FocusNode();

  @override
  void initState() {
    JobApplicationCubit cubit = context.read<JobApplicationCubit>();

    selectInstituteType =
        cubit.state.instituteType == "" ? null : cubit.state.instituteType;

    fromDateController.text = cubit.state.educationFrom;
    toDateController.text = cubit.state.educationTo;
    name.text = cubit.state.instituteName;
    address.text = cubit.state.instituteAddress;
    grades.text = cubit.state.grades;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.left,
                    "Education",
                    style: AppTextStyles.robotoSemiBold(
                      fontSize: 18.0,
                    ),
                  ),
                  h0P5,
                  CustomDropdown<String>(
                    icon: const Icon(Icons.keyboard_arrow_down),
                    text: 'Type of Institute ',
                    hint: "Select type of education",
                    value: selectInstituteType,
                    nextFocusNode: nameFocus,
                    items: instituteType(),
                    onChanged: (value) {
                      setState(() {
                        selectInstituteType = value;
                      });
                    },
                  ),
                  h1,
                  InputFormField(
                    controller: name,
                    focusNode: nameFocus,
                    nextFocusNode: addressFocus,
                    label: "Enter Name of Institute ",
                    fieldTitle: "Name of Institute ",
                  ),
                  h1,
                  InputFormField(
                    controller: address,
                    focusNode: addressFocus,
                    nextFocusNode: fromDateFocus,
                    label: "Enter Address of Institute ",
                    fieldTitle: "Address of Institute ",
                  ),
                  h2,
                  Row(
                    children: [
                      Expanded(
                        child: DatePickerTextField(
                          text: 'From',
                          hintText: 'From Date',
                          focusNode: fromDateFocus,
                          nextFocusNode: toDateFocus,
                          controller: fromDateController,
                        ),
                      ),
                      w1,
                      Expanded(
                        child: DatePickerTextField(
                          text: 'To',
                          hintText: 'To Date',
                          focusNode: toDateFocus,
                          nextFocusNode: gradesFocus,
                          controller: toDateController,
                        ),
                      ),
                    ],
                  ),
                  h1,
                  InputFormField(
                    controller: grades,
                    focusNode: gradesFocus,
                    label: "Enter Grades ",
                    fieldTitle: "Grades ",
                  ),
                  h1,
                ],
              ),
            ),
          ),
        ),
        PrimaryFormButton(
          onPressed: () {
            JobApplicationCubit cubit = context.read<JobApplicationCubit>();

            cubit.updateJobApplicationState(cubit.state.copyWith(
                educationFrom: fromDateController.text,
                educationTo: toDateController.text,
                instituteAddress: address.text,
                instituteName: name.text,
                instituteType: selectInstituteType ?? '',
                grades: grades.text));
          },
          formKey: formKey,
        )
      ],
    );
  }
}
