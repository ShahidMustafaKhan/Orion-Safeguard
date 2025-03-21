import 'dart:core';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/repository/jobApplication/jobApplication_repository.dart';
import 'package:orion_safeguard/utils/enums.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../../core/di/service_locator.dart';
import '../../profile/model/user_model.dart';
import '../model/job_application_model.dart';
import '../model/previous_job_model.dart';

part 'job_application_state.dart';

class JobApplicationCubit extends Cubit<JobApplicationState> {
  final UserModel _userModel;
  JobApplicationRepository jobApplicationRepository = getIt();

  JobApplicationCubit(this._userModel) : super(JobApplicationState());

  void updateJobApplicationState(JobApplicationState jobApplicationState) {
    emit(jobApplicationState);
  }

  void goToStep(int step) {
    int currentStep = step.clamp(0, 10);
    emit(state.copyWith(currentStep: currentStep));
  }

  void nextStep() {
    bool validation = validate();
    if (state.currentStep < 10 && validation == true) {
      goToStep(state.currentStep + 1);
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      goToStep(state.currentStep - 1);
    }
  }

  bool validate() {
    switch (state.currentStep) {
      case 0:
        if (state.profilePicture != null) {
          emit(state.copyWith(validationStatus: ValidationStatus.validated));
          return true;
        } else {
          emit(state.copyWith(
              validationStatus: ValidationStatus.error,
              errorMessage: 'Please select a profile picture'));
          return false;
        }
      case 1:
        if (state.attachedDocument != null) {
          emit(state.copyWith(validationStatus: ValidationStatus.validated));
          return true;
        } else {
          emit(state.copyWith(
              validationStatus: ValidationStatus.error,
              errorMessage: 'Please attach a document'));
          return false;
        }

      default:
        return true;
    }
  }

  JobApplicationModel createJobApplicationModel() {
    JobApplicationModel jobApplicationModel = JobApplicationModel();
    jobApplicationModel.employee = _userModel;

    if (state.profilePicture != null) {
      jobApplicationModel.profilePicture = ParseFile(state.profilePicture);
    }

    if (state.attachedDocument != null) {
      jobApplicationModel.attachedDocument = ParseFile(state.attachedDocument);
    }
    jobApplicationModel.attachedDocumentName = state.attachedDocumentName;
    jobApplicationModel.positionAppliedFor = state.positionAppliedFor;
    jobApplicationModel.title = state.title;
    jobApplicationModel.surname = state.surname;
    jobApplicationModel.forename = state.forename;
    jobApplicationModel.surnameAtBirth = state.surnameAtBirth;

    jobApplicationModel.permanentAddress = state.permanentAddress;
    jobApplicationModel.postCode = state.postCode;
    jobApplicationModel.permanentAddressFromDate =
        state.permanentAddressFromDate;
    jobApplicationModel.permanentAddressToDate = state.permanentAddressToDate;
    jobApplicationModel.previousAddress = state.previousAddress;
    jobApplicationModel.previousAddressPostCode = state.previousAddressPostCode;
    jobApplicationModel.previousAddressFromDate = state.previousAddressFromDate;
    jobApplicationModel.previousAddressToDate = state.previousAddressToDate;
    jobApplicationModel.mobileNo = state.mobileNo;
    jobApplicationModel.email = state.email;
    jobApplicationModel.telephone = state.telephone;
    jobApplicationModel.nationality = state.nationality;
    jobApplicationModel.placeOfEntry = state.placeOfEntry;
    jobApplicationModel.dateOfEntry = state.dateOfEntry;
    jobApplicationModel.workPermit = state.workPermit;
    jobApplicationModel.niNo = state.niNo;
    jobApplicationModel.passportNo = state.passportNo;
    jobApplicationModel.siaLicenseSector = state.siaLicenseSector;
    jobApplicationModel.siaLicenseNo = state.siaLicenseNo;

    jobApplicationModel.relationshipKin = state.relationshipKin;
    jobApplicationModel.nameKin = state.nameKin;
    jobApplicationModel.telephoneKin = state.telephoneKin;
    jobApplicationModel.mobileNoKin = state.mobileNoKin;
    jobApplicationModel.addressKin = state.addressKin;
    jobApplicationModel.postCodeKin = state.postCodeKin;

    jobApplicationModel.drivingType = state.drivingType;
    jobApplicationModel.ownTransport = state.ownTransport;
    jobApplicationModel.drivingLicenseNo = state.drivingLicenseNo;
    jobApplicationModel.dvlaLicenseCheckCode = state.dvlaLicenseCheckCode;
    jobApplicationModel.disqualified = state.disqualified;
    jobApplicationModel.motoringConviction = state.motoringConviction;
    jobApplicationModel.motoringConvictionDetails =
        state.motoringConvictionDetails;

    jobApplicationModel.hasCriminalConvictionRecord =
        state.hasCriminalConvictionRecord;
    jobApplicationModel.outStandingCriminalConviction =
        state.outStandingCriminalConviction;
    jobApplicationModel.bankruptcy = state.bankruptcy;
    jobApplicationModel.courtOrders = state.courtOrders;
    jobApplicationModel.additionalOffenceDetails =
        state.additionalOffenceDetails;

    jobApplicationModel.instituteType = state.instituteType;
    jobApplicationModel.instituteName = state.instituteName;
    jobApplicationModel.instituteAddress = state.instituteAddress;
    jobApplicationModel.educationFrom = state.educationFrom;
    jobApplicationModel.educationTo = state.educationTo;
    jobApplicationModel.grades = state.grades;

    jobApplicationModel.ethnicOrigin = state.ethnicOrigin;

    jobApplicationModel.bankName = state.bankName;
    jobApplicationModel.accountHolderName = state.accountHolderName;
    jobApplicationModel.sortCode = state.sortCode;
    jobApplicationModel.accountNo = state.accountNo;

    jobApplicationModel.jobExperience = state.jobExperience;

    jobApplicationModel.applicantName = state.applicantName;
    jobApplicationModel.signature = state.signature;
    jobApplicationModel.submissionDate = state.submissionDate;

    return jobApplicationModel;
  }

  submitJobApplication() async {
    emit(state.copyWith(submissionStatus: PostApiStatus.loading));
    try {
      JobApplicationModel jobApplicationModel = createJobApplicationModel();
      await jobApplicationRepository.submitJobApplication(jobApplicationModel);
      emit(state.copyWith(submissionStatus: PostApiStatus.success));
    } catch (e) {
      emit(state.copyWith(
          submissionStatus: PostApiStatus.error, errorMessage: e.toString()));
    }
  }
}
