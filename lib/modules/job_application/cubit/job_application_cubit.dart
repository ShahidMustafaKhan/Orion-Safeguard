import 'dart:core';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/previous_job_model.dart';

part 'job_application_state.dart';

class JobApplicationCubit extends Cubit<JobApplicationState> {
  JobApplicationCubit() : super(JobApplicationState());

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
        return true;
        if (state.profilePicture != null) {
          emit(state.copyWith(validationStatus: ValidationStatus.validated));
          return true;
        } else {
          emit(state.copyWith(
              validationStatus: ValidationStatus.error,
              errorMessage: 'Please select a profile picture'));
          return false;
        }
      // case 1:
      //   if (state.attachedDocument != null) {
      //     emit(state.copyWith(validationStatus: ValidationStatus.validated));
      //     return true;
      //   } else {
      //     emit(state.copyWith(
      //         validationStatus: ValidationStatus.error,
      //         errorMessage: 'Please attach a document'));
      //     return false;
      //   }

      default:
        return true;
    }
  }
}
