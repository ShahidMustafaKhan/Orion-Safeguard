import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:orion_safeguard/modules/job_application/widget/input_form_field.dart';
import 'package:sizer/sizer.dart';

import '../../../generated/assets.dart';
import '../../../utils/display/display_utils.dart';
import '../../../utils/heights_and_widths.dart';
import '../cubit/job_application_cubit.dart';
import '../widget/primary_form_button.dart';

class Step2 extends StatefulWidget {
  const Step2({super.key});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  final formKey = GlobalKey<FormState>();
  late JobApplicationCubit jobApplicationCubit;

  late TextEditingController positionAppliedForController;
  late TextEditingController titleController;
  late TextEditingController surnameController;
  late TextEditingController forenameController;
  late TextEditingController surnameAtBirthController;

  FocusNode positionAppliedForFocusNode = FocusNode();
  FocusNode attachedDocumentFocusNode = FocusNode();
  FocusNode titleFocusNode = FocusNode();
  FocusNode surnameFocusNode = FocusNode();
  FocusNode forenameFocusNode = FocusNode();
  FocusNode surnameAtBirthFocusNode = FocusNode();

  @override
  void initState() {
    jobApplicationCubit = context.read<JobApplicationCubit>();

    positionAppliedForController = TextEditingController(
        text: jobApplicationCubit.state.positionAppliedFor);
    titleController =
        TextEditingController(text: jobApplicationCubit.state.title);
    surnameController =
        TextEditingController(text: jobApplicationCubit.state.surname);
    forenameController =
        TextEditingController(text: jobApplicationCubit.state.forename);
    surnameAtBirthController =
        TextEditingController(text: jobApplicationCubit.state.surnameAtBirth);

    attachedDocumentFocusNode.addListener(() {
      if (attachedDocumentFocusNode.hasFocus) {
        pickFile();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<JobApplicationCubit, JobApplicationState>(
      listenWhen: (previous, next) =>
          previous.validationStatus != next.validationStatus ||
          previous.errorValidationMessage != next.errorValidationMessage,
      listener: (context, state) {
        if (state.validationStatus == ValidationStatus.error) {
          DisplayUtils.showErrorToast(context, state.errorValidationMessage);
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding:
                    EdgeInsets.symmetric(horizontal: 12.sp, vertical: 3.sp),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Form",
                        style: AppTextStyles.robotoBold(
                          fontSize: 24.0,
                        ),
                      ),
                      h0P2,
                      Text(
                        "Fill up your job application",
                        style: AppTextStyles.robotoRegular(
                          fontSize: 16.0,
                        ),
                      ),
                      h1,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputFormField(
                            controller: positionAppliedForController,
                            fieldTitle: "Position Applied for",
                            label: "Enter Position",
                            focusNode: positionAppliedForFocusNode,
                            nextFocusNode: attachedDocumentFocusNode,
                          ),
                          h1,
                          BlocBuilder<JobApplicationCubit, JobApplicationState>(
                              buildWhen: (previous, next) => true,
                              builder: (context, state) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () => pickFile(),
                                      child: InputFormField(
                                        readOnly: true,
                                        horizontalPadding: 90,
                                        controller: TextEditingController(
                                            text: state.attachedDocumentName),
                                        focusNode: attachedDocumentFocusNode,
                                        nextFocusNode: titleFocusNode,
                                        fieldTitle: "Attached Document",
                                        label: "Select Document",
                                        suffixIcon: SvgPicture.asset(
                                          Assets.svgClip,
                                        ),
                                      ),
                                    ),
                                    if (state
                                        .attachedDocumentName.isNotEmpty) ...[
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Selected: ${state.attachedDocumentName}",
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black87,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.close,
                                                color: Colors.red),
                                            onPressed: () => removeFile(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ],
                                );
                              }),
                          h1,
                          Text(
                            textAlign: TextAlign.left,
                            "Personal information",
                            style: AppTextStyles.robotoRegular(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          h0P5,
                          InputFormField(
                            controller: titleController,
                            label: "Enter Your title",
                            focusNode: titleFocusNode,
                            nextFocusNode: surnameFocusNode,
                            fieldTitle: "Title",
                          ),
                          h1,
                          InputFormField(
                            controller: surnameController,
                            focusNode: surnameFocusNode,
                            nextFocusNode: forenameFocusNode,
                            label: "Enter your surname",
                            fieldTitle: "Surname",
                          ),
                          h1,
                          InputFormField(
                            controller: forenameController,
                            focusNode: forenameFocusNode,
                            nextFocusNode: surnameAtBirthFocusNode,
                            label: "Enter your forename",
                            fieldTitle: "Forename",
                          ),
                          h1,
                          InputFormField(
                            controller: surnameAtBirthController,
                            focusNode: surnameAtBirthFocusNode,
                            label: "Enter your Surname at Birth",
                            fieldTitle: "Surname at Birth",
                          ),
                        ],
                      ),
                      h1,
                    ],
                  ),
                ),
              ),
            ),
            PrimaryFormButton(
              onPressed: () {
                jobApplicationCubit.updateJobApplicationState(
                  jobApplicationCubit.state.copyWith(
                    positionAppliedFor: positionAppliedForController.text,
                    title: titleController.text,
                    surname: surnameController.text,
                    forename: forenameController.text,
                    surnameAtBirth: surnameAtBirthController.text,
                  ),
                );
              },
              formKey: formKey,
            ),
          ],
        ),
      ),
    );
  }

  void removeFile() {
    jobApplicationCubit.updateJobApplicationState(jobApplicationCubit.state
        .copyWith(attachedDocument: null, attachedDocumentName: ""));
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
    );

    if (result != null && result.files.isNotEmpty) {
      jobApplicationCubit.updateJobApplicationState(jobApplicationCubit.state
          .copyWith(
              attachedDocument: File(result.files.single.path ?? ''),
              attachedDocumentName: result.files.single.name));
    }
  }
}
