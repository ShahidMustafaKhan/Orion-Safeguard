import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:orion_safeguard/modules/job_application/cubit/job_application_cubit.dart';
import 'package:orion_safeguard/modules/job_application/model/previous_job_model.dart';
import 'package:orion_safeguard/modules/job_application/widget/input_form_field.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/heights_and_widths.dart';
import '../widget/custom_date_picker.dart';
import '../widget/primary_form_button.dart';

class Step10 extends StatefulWidget {
  const Step10({super.key});

  @override
  State<Step10> createState() => _Step10State();
}

class _Step10State extends State<Step10> {
  final formKey = GlobalKey<FormState>();
  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();

  List<Map<String, dynamic>> experienceList = [
    {
      "nameInstitute": TextEditingController(),
      "location": TextEditingController(),
      "sortCode": TextEditingController(),
      "postCode": TextEditingController(),
      "telephoneNo": TextEditingController(),
      "managerName": TextEditingController(),
      "salary": TextEditingController(),
      "fromDate": TextEditingController(),
      "toDate": TextEditingController(),
      "reasonForLeaving": TextEditingController(),
      "position": TextEditingController()
    },
  ];

  List<Map<String, dynamic>> focusNodeList = [
    {
      "nameInstitute": FocusNode(),
      "location": FocusNode(),
      "sortCode": FocusNode(),
      "postCode": FocusNode(),
      "telephoneNo": FocusNode(),
      "managerName": FocusNode(),
      "salary": FocusNode(),
      "fromDate": FocusNode(),
      "toDate": FocusNode(),
      "reasonForLeaving": FocusNode(),
      "position": FocusNode()
    },
  ];

  // Method to add another experience field set
  void _addExperience() {
    if (experienceList.length < 5) {
      setState(() {
        experienceList.add({
          "nameInstitute": TextEditingController(),
          "location": TextEditingController(),
          "sortCode": TextEditingController(),
          "postCode": TextEditingController(),
          "telephoneNo": TextEditingController(),
          "managerName": TextEditingController(),
          "salary": TextEditingController(),
          "fromDate": TextEditingController(),
          "toDate": TextEditingController(),
          "reasonForLeaving": TextEditingController(),
          "position": TextEditingController()
        });
        focusNodeList.add({
          "nameInstitute": FocusNode(),
          "location": FocusNode(),
          "sortCode": FocusNode(),
          "postCode": FocusNode(),
          "telephoneNo": FocusNode(),
          "managerName": FocusNode(),
          "salary": FocusNode(),
          "fromDate": FocusNode(),
          "toDate": FocusNode(),
          "reasonForLeaving": FocusNode(),
          "position": FocusNode()
        });
      });
    }
  }

  @override
  void initState() {
    JobApplicationCubit cubit = context.read<JobApplicationCubit>();
    List<JobExperience> jobExperienceList = cubit.state.jobExperience;

    if (jobExperienceList.isNotEmpty) {
      experienceList = [];
      focusNodeList = [];
      for (var element in jobExperienceList) {
        experienceList.add({
          "nameInstitute":
              TextEditingController(text: element.previousInstituteName),
          "location":
              TextEditingController(text: element.previousInstituteLocation),
          "sortCode":
              TextEditingController(text: element.previousInstituteSortCode),
          "postCode":
              TextEditingController(text: element.previousInstitutePostCode),
          "telephoneNo":
              TextEditingController(text: element.previousInstituteTelephoneNo),
          "managerName": TextEditingController(text: element.managerName),
          "salary": TextEditingController(text: element.salary),
          "fromDate": TextEditingController(text: element.startDate),
          "toDate": TextEditingController(text: element.endDate),
          "reasonForLeaving":
              TextEditingController(text: element.reasonForLeaving),
          "position":
              TextEditingController(text: element.previousInstitutePosition)
        });
        focusNodeList.add({
          "nameInstitute": FocusNode(),
          "location": FocusNode(),
          "sortCode": FocusNode(),
          "postCode": FocusNode(),
          "telephoneNo": FocusNode(),
          "managerName": FocusNode(),
          "salary": FocusNode(),
          "fromDate": FocusNode(),
          "toDate": FocusNode(),
          "reasonForLeaving": FocusNode(),
          "position": FocusNode()
        });
      }
    }
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
                    "Previous Employment",
                    style: AppTextStyles.robotoSemiBold(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    "State all periods of employment, unemployment and self-employment for the last 5 years or since leaving school. For any periods of unemployment, state the address of the Unemployment Benefit Office at which you reported. Start with present situation.",
                    style: AppTextStyles.robotoRegular(
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    "Employment Details",
                    style: AppTextStyles.robotoSemiBold(
                      fontSize: 16.0,
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(experienceList.length, (index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputFormField(
                              controller: experienceList[index]
                                  ["nameInstitute"],
                              focusNode: focusNodeList[index]["nameInstitute"],
                              nextFocusNode: focusNodeList[index]["location"],
                              label: "Enter Name of Institute ",
                              fieldTitle: "Name",
                            ),
                            h1,
                            InputFormField(
                              controller: experienceList[index]["location"],
                              focusNode: focusNodeList[index]["location"],
                              nextFocusNode: focusNodeList[index]["sortCode"],
                              label: "Enter Location of Institute",
                              fieldTitle: "Location",
                            ),
                            h1,
                            InputFormField(
                              controller: experienceList[index]["sortCode"],
                              focusNode: focusNodeList[index]["sortCode"],
                              nextFocusNode: focusNodeList[index]["postCode"],
                              label: "Enter Sort Code",
                              fieldTitle: "Sort Code",
                            ),
                            h1,
                            InputFormField(
                              controller: experienceList[index]["postCode"],
                              focusNode: focusNodeList[index]["postCode"],
                              nextFocusNode: focusNodeList[index]
                                  ["telephoneNo"],
                              label: "Enter Post Code",
                              fieldTitle: "Post Code",
                            ),
                            h1,
                            InputFormField(
                              controller: experienceList[index]["telephoneNo"],
                              focusNode: focusNodeList[index]["telephoneNo"],
                              nextFocusNode: focusNodeList[index]["position"],
                              label: "Enter Telephone no",
                              fieldTitle: "Telephone no",
                            ),
                            h1,
                            InputFormField(
                              controller: experienceList[index]["position"],
                              focusNode: focusNodeList[index]["position"],
                              nextFocusNode: focusNodeList[index]
                                  ["managerName"],
                              label: "Enter Position",
                              fieldTitle: "Position",
                            ),
                            h1,
                            InputFormField(
                              controller: experienceList[index]["managerName"],
                              focusNode: focusNodeList[index]["managerName"],
                              nextFocusNode: focusNodeList[index]["salary"],
                              label: "Enter Manager Name",
                              fieldTitle: "Manager name",
                            ),
                            h1,
                            InputFormField(
                              controller: experienceList[index]["salary"],
                              focusNode: focusNodeList[index]["salary"],
                              nextFocusNode: focusNodeList[index]["fromDate"],
                              label: "Enter Salary",
                              fieldTitle: "Salary",
                            ),
                            h1,
                            Row(
                              children: [
                                Expanded(
                                  child: DatePickerTextField(
                                    text: 'From',
                                    hintText: 'From Date',
                                    focusNode: focusNodeList[index]["fromDate"],
                                    nextFocusNode: focusNodeList[index]
                                        ["toDate"],
                                    controller: experienceList[index]
                                        ["fromDate"],
                                  ),
                                ),
                                w1,
                                Expanded(
                                  child: DatePickerTextField(
                                    text: 'To',
                                    hintText: 'To Date',
                                    focusNode: focusNodeList[index]["toDate"],
                                    nextFocusNode: focusNodeList[index]
                                        ["reasonForLeaving"],
                                    controller: experienceList[index]["toDate"],
                                  ),
                                ),
                              ],
                            ),
                            h1,
                            InputFormField(
                              controller: experienceList[index]
                                  ["reasonForLeaving"],
                              label: "Enter text here",
                              focusNode: focusNodeList[index]
                                  ["reasonForLeaving"],
                              nextFocusNode: index < focusNodeList.length - 1
                                  ? focusNodeList[index + 1]["nameInstitute"]
                                  : null,
                              fieldTitle: "Reason for Leaving",
                            ),
                            h1,
                          ],
                        );
                      }),
                    ),
                  ),
                  // h1,
                  if (experienceList.length <
                      5) // Show the "Add another experience" button if there are less than 5 experiences
                    GestureDetector(
                      onTap: _addExperience,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Add another experience',
                            style: AppTextStyles.robotoSemiBold(fontSize: 14),
                          ),
                          const Spacer(), // This will push the "+" icon to the right
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
          PrimaryFormButton(
            onPressed: () {
              JobApplicationCubit cubit = context.read<JobApplicationCubit>();

              List<JobExperience> jobExperienceList = [];

              for (var element in experienceList) {
                JobExperience experience = JobExperience(
                  previousInstituteName: element["nameInstitute"].text,
                  previousInstituteLocation: element["location"].text,
                  previousInstituteSortCode: element["sortCode"].text,
                  previousInstitutePostCode: element["postCode"].text,
                  previousInstituteTelephoneNo: element["telephoneNo"].text,
                  previousInstitutePosition: element["position"].text,
                  managerName: element["managerName"].text,
                  salary: element["salary"].text,
                  startDate: element["fromDate"].text,
                  endDate: element["toDate"].text,
                  reasonForLeaving: element["reasonForLeaving"].text,
                );
                jobExperienceList.add(experience);
              }

              cubit.updateJobApplicationState(cubit.state.copyWith(
                jobExperience: jobExperienceList,
              ));
            },
            formKey: formKey,
          )
        ],
      ),
    );
  }
}
