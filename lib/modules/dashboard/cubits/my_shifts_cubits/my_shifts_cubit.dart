import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:orion_safeguard/core/di/service_locator.dart';
import 'package:orion_safeguard/modules/dashboard/model/shifts_model/shifts_model.dart';
import 'package:orion_safeguard/repository/shifts/shifts_repository.dart';
import 'package:orion_safeguard/utils/enums.dart';

import '../../../../core/response/api_response.dart';
import '../../../../core/services/session_controller/session_controller.dart';

part 'my_shifts_state.dart';

class MyShiftsCubit extends Cubit<MyShiftsState> {
  final ShiftsRepository shiftsRepository = getIt();
  bool isLoadingMoreActiveShift = false; //flag
  bool isLoadingMoreCompletedShift = false;

  MyShiftsCubit()
      : super(MyShiftsState(
          activeShifts: ApiResponse.loading(),
          completedShifts: ApiResponse.loading(),
          approveStatus: PostApiStatus.initial,
          declineStatus: PostApiStatus.initial,
        ));

  void activeShifts({bool loadMore = false}) async {
    if (isLoadingMoreActiveShift) {
      return;
    }
    try {
      String? objectId = SessionController().objectId;

      isLoadingMoreActiveShift = true;

      final currentList = state.activeShifts.data ?? [];
      final newShifts = await shiftsRepository.getActiveShifts(objectId,
          skip: loadMore ? currentList.length : 0);

      final hasMore = newShifts.length == 7; // Assuming 7 is the fetch limit

      isLoadingMoreActiveShift = false;
      emit(state.copyWith(
        activeShifts: ApiResponse.completed(
            loadMore ? [...currentList, ...newShifts] : newShifts),
        hasMoreDataActiveShift: hasMore,
      ));
    } catch (e) {
      debugPrint(e.toString());
      isLoadingMoreActiveShift = false;
      emit(state.copyWith(
        activeShifts: ApiResponse.error(e.toString()),
      ));
    }
  }

  void completedShifts({bool loadMore = false}) async {
    if (isLoadingMoreCompletedShift) {
      return;
    }
    try {
      String? objectId = SessionController().objectId;

      isLoadingMoreCompletedShift = true;

      final currentList = state.completedShifts.data ?? [];
      final newShifts = await shiftsRepository.getCompletedShifts(objectId,
          skip: loadMore ? currentList.length : 0);

      final hasMore = newShifts.length == 7; // Assuming 7 is the fetch limit

      isLoadingMoreCompletedShift = false;
      emit(state.copyWith(
        completedShifts: ApiResponse.completed(
            loadMore ? [...currentList, ...newShifts] : newShifts),
        hasMoreDataCompletedShift: hasMore,
      ));
    } catch (e) {
      debugPrint(e.toString());
      isLoadingMoreCompletedShift = false;
      emit(state.copyWith(
        completedShifts: ApiResponse.error(e.toString()),
      ));
    }
  }

  void approve(ShiftModel? shiftModel) async {
    emit(state.copyWith(
        approveStatus: PostApiStatus.loading,
        approveLoadingItemId: shiftModel!.objectId));
    try {
      await shiftsRepository.approve(shiftModel);
      activeShifts();
      emit(state.copyWith(
          approveStatus: PostApiStatus.success,
          resetApproveLoadingItemId: true));
    } catch (e) {
      emit(state.copyWith(
          approveStatus: PostApiStatus.error,
          message: e.toString(),
          resetApproveLoadingItemId: true));
    }
  }

  void decline(ShiftModel? shiftModel, String? declineReason) async {
    emit(state.copyWith(
        declineStatus: PostApiStatus.loading,
        declineLoadingItemId: shiftModel!.objectId));
    try {
      await shiftsRepository.decline(shiftModel, declineReason);
      activeShifts();
      emit(state.copyWith(
          declineStatus: PostApiStatus.success,
          resetDeclineLoadingItemId: true));
    } catch (e) {
      emit(state.copyWith(
          declineStatus: PostApiStatus.error,
          message: e.toString(),
          resetDeclineLoadingItemId: true));
    }
  }
}
