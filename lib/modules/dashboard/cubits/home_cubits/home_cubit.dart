import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:orion_safeguard/core/di/service_locator.dart';
import 'package:orion_safeguard/modules/dashboard/model/shifts_model/shifts_model.dart';
import 'package:orion_safeguard/repository/shifts/shifts_repository.dart';

import '../../../../core/response/api_response.dart';
import '../../../../core/services/session_controller/session_controller.dart';
import '../../../../utils/enums.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ShiftsRepository shiftsRepository = getIt();

  HomeCubit()
      : super(HomeState(
            upcomingShifts: ApiResponse.loading(),
            onGoingShifts: ApiResponse.loading(),
            previousShifts: ApiResponse.loading()));

  void upcomingShift() async {
    try {
      String? objectId = SessionController().objectId;
      List<ShiftModel> upcomingShiftsList =
          await shiftsRepository.getUpcomingShifts(objectId);
      emit(state.copyWith(
          upcomingShifts: ApiResponse.completed(upcomingShiftsList)));
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(upcomingShifts: ApiResponse.error(e.toString())));
    }
  }

  void ongoingShift() async {
    try {
      String? objectId = SessionController().objectId;
      ShiftModel? ongoingShiftsList =
          await shiftsRepository.getOnGoingShifts(objectId);
      emit(state.copyWith(
          onGoingShifts: ApiResponse.completed(ongoingShiftsList)));
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(onGoingShifts: ApiResponse.error(e.toString())));
    }
  }

  void previousShift() async {
    try {
      String? objectId = SessionController().objectId;
      List<ShiftModel> previousShiftsList =
          await shiftsRepository.getPreviousShifts(objectId);
      emit(state.copyWith(
          previousShifts: ApiResponse.completed(previousShiftsList)));
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(previousShifts: ApiResponse.error(e.toString())));
    }
  }

  bool noShiftsFound() {
    if (state.upcomingShifts.status == Status.error &&
        state.previousShifts.status == Status.error &&
        state.onGoingShifts.status == Status.error) {
      return true;
    } else {
      return false;
    }
  }
}
