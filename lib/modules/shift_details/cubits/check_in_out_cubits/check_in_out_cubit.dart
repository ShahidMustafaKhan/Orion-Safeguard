import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:orion_safeguard/core/di/service_locator.dart';
import 'package:orion_safeguard/core/exceptions/app_exceptions.dart';
import 'package:orion_safeguard/modules/dashboard/model/shifts_model/shifts_model.dart';
import 'package:orion_safeguard/repository/shifts/shifts_repository.dart';
import 'package:orion_safeguard/utils/enums.dart';

import '../../../../utils/time_utils.dart';

part 'check_in_out_state.dart';

class CheckInOutCubit extends Cubit<CheckInOutState> {
  final ShiftsRepository shiftsRepository = getIt();
  ShiftModel? shift;
  Timer? _timer;

  CheckInOutCubit({required this.shift})
      : super(CheckInOutState(shift: shift, now: DateTime.now()));

  Future<ShiftModel?> checkInApi(ShiftModel? shiftModel) async {
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    try {
      ShiftModel? shift =
          await shiftsRepository.checkIn(shiftModel!, state.file!);
      return shift;
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  Future<ShiftModel?> checkOutApi(ShiftModel? shiftModel) async {
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    try {
      ShiftModel? shift =
          await shiftsRepository.checkOut(shiftModel!, state.file!);
      return shift;
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  void uploadSelfie(File file) {
    emit(state.copyWith(file: file));
  }

  Future<void> checkInFunc() async {
    if (isDatePassed(state.shift?.startDate) == true) {
      if (isDatePassedNotReached(state.shift?.endDate) == true) {
        if (state.file != null) {
          await checkInApi(state.shift!).then((value) {
            emit(state.copyWith(
              file: null,
              resetFile: true,
              shift: value,
            ));
            startTimer();
          }).onError((error, stacktrace) {
            emit(state.copyWith(
                postApiStatus: PostApiStatus.error,
                errorMessage: error.toString()));
          });
        } else {
          emit(state.copyWith(
              postApiStatus: PostApiStatus.error,
              errorMessage: "Please upload selfie"));
        }
      } else {
        emit(state.copyWith(
            postApiStatus: PostApiStatus.error,
            errorMessage: "Shift has ended"));
      }
    } else {
      emit(state.copyWith(
          postApiStatus: PostApiStatus.error,
          errorMessage:
              "You can’t perform this action. The shift hasn’t started yet."));
    }
  }

  Future<void> checkOutFunc(Function() earlyCheckOutRequest) async {
    if (state.file != null) {
      if (isDatePassed(state.shift?.endDate) == true) {
        await checkOutApi(state.shift!).then((value) {
          emit(state.copyWith(
              file: null, shift: value, postApiStatus: PostApiStatus.success));
        }).onError((error, stacktrace) {
          emit(state.copyWith(
              postApiStatus: PostApiStatus.error,
              errorMessage: error.toString()));
        });
      } else {
        earlyCheckOutRequest();
      }
    } else {
      emit(state.copyWith(
          postApiStatus: PostApiStatus.error,
          errorMessage: "Please upload a selfie"));
    }
  }

  Future<void> checkOutApproval(ShiftModel? shiftModel) async {
    try {
      await shiftsRepository.checkOutApproval(shiftModel!, state.file!);
      emit(state.copyWith(
        approvalPostStatus: PostApiStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
          approvalPostStatus: PostApiStatus.error,
          errorMessage: "Request for approval failed"));
    }
  }

  void resetApprovalPostStatus() {
    emit(state.copyWith(approvalPostStatus: PostApiStatus.initial));
  }

  void resetPostStatus() {
    emit(state.copyWith(
        approvalPostStatus: PostApiStatus.initial,
        postApiStatus: PostApiStatus.initial));
  }

  void startTimer() {
    if (_timer != null) _timer!.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      emit(state.copyWith(now: DateTime.now()));
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  @override
  Future<void> close() {
    if (state.shift?.shiftStatus == ShiftModel.keyShiftStatusOngoing) {
      _timer?.cancel();
    }
    return super.close();
  }
}
