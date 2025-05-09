import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:orion_safeguard/modules/job_application/widget/primary_form_button.dart';
import 'package:sizer/sizer.dart';

import '../../../config/constants/constants.dart';
import '../../../utils/heights_and_widths.dart';
import '../common/constants/constants.dart';
import '../cubit/job_application_cubit.dart';
import '../widget/custom_date_picker.dart';
import '../widget/custom_drop_down.dart';
import '../widget/custom_radio_button.dart';
import '../widget/input_form_field.dart';

class Step3 extends StatefulWidget {
  const Step3({super.key});

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  String _selectedOption = "No"; // Default value

  final formKey = GlobalKey<FormState>();
  String? selectedPlace;

  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  TextEditingController fromDatePreviousAddressController =
      TextEditingController();
  TextEditingController toDatePreviousAddressController =
      TextEditingController();

  TextEditingController entryDateController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();
  TextEditingController previousAddressController = TextEditingController();
  TextEditingController previousAddressPostalCodeController =
      TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();

  TextEditingController nicController = TextEditingController();
  TextEditingController passportNoController = TextEditingController();
  TextEditingController siaSectorController = TextEditingController();
  TextEditingController siaNoController = TextEditingController();
  TextEditingController siaLicenseExpiryController = TextEditingController();

  FocusNode addressFocusNode = FocusNode();
  FocusNode postCodeFocusNode = FocusNode();
  FocusNode fromDateFocusNode = FocusNode();
  FocusNode toDateFocusNode = FocusNode();

  FocusNode previousAddressFocusNode = FocusNode();
  FocusNode previousAddressPostalCodeFocusNode = FocusNode();
  FocusNode fromPreviousADateFocusNode = FocusNode();
  FocusNode toPreviousADateFocusNode = FocusNode();

  FocusNode emailFocusNode = FocusNode();
  FocusNode mobileNoFocusNode = FocusNode();
  FocusNode telephoneFocusNode = FocusNode();
  FocusNode nationalityFocusNode = FocusNode();

  FocusNode dateEntryFocusNode = FocusNode();
  FocusNode placeEntryFocusNode = FocusNode();
  FocusNode workPermitFocusNode = FocusNode();
  FocusNode nicFocusNode = FocusNode();
  FocusNode passportNoFocusNode = FocusNode();
  FocusNode siaNoFocusNode = FocusNode();
  FocusNode siaSectorFocusNode = FocusNode();
  FocusNode siaLicenseExpiryFocusNode = FocusNode();

  @override
  void initState() {
    JobApplicationCubit jobApplicationCubit =
        context.read<JobApplicationCubit>();

    addressController.text = jobApplicationCubit.state.permanentAddress;
    postCodeController.text = jobApplicationCubit.state.postCode;
    toDateController.text = jobApplicationCubit.state.permanentAddressToDate;
    fromDateController.text =
        jobApplicationCubit.state.permanentAddressFromDate;

    previousAddressController.text = jobApplicationCubit.state.previousAddress;
    previousAddressPostalCodeController.text =
        jobApplicationCubit.state.previousAddressPostCode;
    fromDatePreviousAddressController.text =
        jobApplicationCubit.state.previousAddressFromDate;
    toDatePreviousAddressController.text =
        jobApplicationCubit.state.previousAddressToDate;

    emailController.text = jobApplicationCubit.state.email;
    mobileNoController.text = jobApplicationCubit.state.mobileNo;
    telephoneController.text = jobApplicationCubit.state.telephone;
    nationalityController.text = jobApplicationCubit.state.nationality;

    entryDateController.text = jobApplicationCubit.state.dateOfEntry;
    selectedPlace = jobApplicationCubit.state.placeOfEntry.isNotEmpty
        ? jobApplicationCubit.state.placeOfEntry
        : null;

    _selectedOption = jobApplicationCubit.state.workPermit ? "Yes" : "No";
    nicController.text = jobApplicationCubit.state.niNo;
    passportNoController.text = jobApplicationCubit.state.passportNo;
    siaSectorController.text = jobApplicationCubit.state.siaLicenseSector;
    siaNoController.text = jobApplicationCubit.state.siaLicenseNo;
    siaLicenseExpiryController.text =
        jobApplicationCubit.state.siaLicenseExpiry?.toString() ?? '';

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
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Previous last 5 year Address history",
                      style: AppTextStyles.robotoSemiBold(
                        fontSize: 16.0,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputFormField(
                          label: "Enter Your address",
                          fieldTitle: "Permanent Address ",
                          controller: addressController,
                          focusNode: addressFocusNode,
                          nextFocusNode: postCodeFocusNode,
                        ),
                        h1,
                        InputFormField(
                          label: "Enter Your postal code",
                          fieldTitle: "Post Code",
                          controller: postCodeController,
                          focusNode: postCodeFocusNode,
                          nextFocusNode: fromDateFocusNode,
                        ),
                        h1,
                        Row(
                          children: [
                            Expanded(
                              child: DatePickerTextField(
                                text: 'From',
                                hintText: 'From Date',
                                controller: fromDateController,
                                nextFocusNode: toDateFocusNode,
                                focusNode: fromDateFocusNode,
                              ),
                            ),
                            w1,
                            Expanded(
                              child: DatePickerTextField(
                                text: 'To',
                                hintText: 'To Date',
                                controller: toDateController,
                                focusNode: toDateFocusNode,
                                nextFocusNode: previousAddressFocusNode,
                              ),
                            ),
                          ],
                        ),
                        h1,
                        InputFormField(
                          label: "Enter Your address",
                          fieldTitle: "Previous Address",
                          controller: previousAddressController,
                          focusNode: previousAddressFocusNode,
                          nextFocusNode: previousAddressPostalCodeFocusNode,
                        ),
                        h1,
                        InputFormField(
                          label: "Enter Your postal code",
                          fieldTitle: "Post Code",
                          controller: previousAddressPostalCodeController,
                          focusNode: previousAddressPostalCodeFocusNode,
                          nextFocusNode: fromPreviousADateFocusNode,
                        ),
                        h1,
                        Row(
                          children: [
                            Expanded(
                              child: DatePickerTextField(
                                text: 'From',
                                hintText: 'From Date',
                                controller: fromDatePreviousAddressController,
                                focusNode: fromPreviousADateFocusNode,
                                nextFocusNode: toPreviousADateFocusNode,
                              ),
                            ),
                            w1,
                            Expanded(
                              child: DatePickerTextField(
                                text: 'To',
                                hintText: 'To Date',
                                controller: toDatePreviousAddressController,
                                focusNode: toPreviousADateFocusNode,
                                nextFocusNode: emailFocusNode,
                              ),
                            ),
                          ],
                        ),
                        h1,
                        InputFormField(
                          label: "Enter Your Email",
                          fieldTitle: "Email",
                          controller: emailController,
                          focusNode: emailFocusNode,
                          nextFocusNode: mobileNoFocusNode,
                        ),
                        h1,
                        InputFormField(
                          label: "Enter Your Mobile no",
                          fieldTitle: "Mobile no",
                          controller: mobileNoController,
                          focusNode: mobileNoFocusNode,
                          nextFocusNode: telephoneFocusNode,
                        ),
                        h1,
                        InputFormField(
                          label: "Enter Your Telephone no",
                          fieldTitle: "Telephone",
                          controller: telephoneController,
                          focusNode: telephoneFocusNode,
                          nextFocusNode: nationalityFocusNode,
                        ),
                        h1,
                        InputFormField(
                          label: "Enter Your Nationality",
                          fieldTitle: "Nationality",
                          controller: nationalityController,
                          focusNode: nationalityFocusNode,
                          nextFocusNode: dateEntryFocusNode,
                        ),
                        h1,
                        Text(
                          'Date and Place of entry into UK:',
                          style: AppTextStyles.robotoSemiBold(
                            fontSize: 16.0,
                          ),
                        ),
                        h1,
                        Row(
                          children: [
                            Expanded(
                              child: DatePickerTextField(
                                text: 'Date',
                                hintText: 'From Date',
                                controller: entryDateController,
                                focusNode: dateEntryFocusNode,
                                nextFocusNode: placeEntryFocusNode,
                              ),
                            ),
                            w1,
                            Expanded(
                              child: CustomDropdown<String>(
                                icon: SvgPicture.asset(AssetPaths.dropDownIcon,
                                    color: AppColors.black),
                                text: 'Place',
                                hint: "Select place",
                                borderRadius: 18,
                                value: selectedPlace,
                                focusNode: placeEntryFocusNode,
                                nextFocusNode: workPermitFocusNode,
                                items: placeOfEntryInUK(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedPlace = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        h1,
                        CustomRadioButtonGroup(
                          focusNode: workPermitFocusNode,
                          nextFocusNode: nicFocusNode,
                          title: "Work Permit",
                          selectedValue: _selectedOption,
                          options: const ["Yes", "No"],
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value;
                            });
                          },
                        ),
                        h1,
                        InputFormField(
                          label: "Enter Your Insurance Number:",
                          fieldTitle: "National Insurance Number",
                          controller: nicController,
                          focusNode: nicFocusNode,
                          nextFocusNode: passportNoFocusNode,
                        ),
                        h1,
                        InputFormField(
                          label: "Enter Your Passport Number",
                          fieldTitle: "Passport Number",
                          controller: passportNoController,
                          focusNode: passportNoFocusNode,
                          nextFocusNode: siaSectorFocusNode,
                        ),
                        h1,
                        InputFormField(
                          label: "Enter Your SIA License Sector",
                          fieldTitle: "SIA License Sector",
                          controller: siaSectorController,
                          focusNode: siaSectorFocusNode,
                          nextFocusNode: siaNoFocusNode,
                        ),
                        h1,
                        InputFormField(
                          label: "Enter Your SIA License Number",
                          fieldTitle: "SIA License Number",
                          controller: siaNoController,
                          focusNode: siaNoFocusNode,
                          nextFocusNode: siaLicenseExpiryFocusNode,
                        ),
                        h1,
                        DatePickerTextField(
                          text: 'SIA License Expiration',
                          hintText: 'Enter Expiration Date',
                          controller: siaLicenseExpiryController,
                        ),
                      ],
                    ),
                    h1,
                  ],
                ),
              ),
            ),
          ),
          BlocBuilder<JobApplicationCubit, JobApplicationState>(
              buildWhen: (previous, next) => false,
              builder: (context, state) {
                return PrimaryFormButton(
                  onPressed: () {
                    context
                        .read<JobApplicationCubit>()
                        .updateJobApplicationState(state.copyWith(
                          permanentAddress: addressController.text,
                          postCode: postCodeController.text,
                          permanentAddressFromDate: fromDateController.text,
                          permanentAddressToDate: toDateController.text,
                          previousAddress: previousAddressController.text,
                          previousAddressPostCode:
                              previousAddressPostalCodeController.text,
                          previousAddressFromDate:
                              fromDatePreviousAddressController.text,
                          previousAddressToDate:
                              toDatePreviousAddressController.text,
                          email: emailController.text,
                          mobileNo: mobileNoController.text,
                          telephone: telephoneController.text,
                          nationality: nationalityController.text,
                          placeOfEntry: selectedPlace,
                          dateOfEntry: entryDateController.text,
                          workPermit: _selectedOption == "Yes" ? true : false,
                          niNo: nicController.text,
                          passportNo: passportNoController.text,
                          siaLicenseSector: siaSectorController.text,
                          siaLicenseNo: siaNoController.text,
                          siaLicenseExpiry:
                              DateTime.parse(siaLicenseExpiryController.text),
                        ));
                  },
                  formKey: formKey,
                );
              })
        ],
      ),
    );
  }
}
