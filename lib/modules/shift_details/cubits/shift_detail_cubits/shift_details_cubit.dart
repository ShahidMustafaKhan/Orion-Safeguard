import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:orion_safeguard/core/di/service_locator.dart';
import 'package:orion_safeguard/modules/dashboard/model/shifts_model/shifts_model.dart';
import 'package:orion_safeguard/repository/shifts/shifts_repository.dart';
import 'package:orion_safeguard/utils/enums.dart';

part 'shift_details_state.dart';

class ShiftDetailCubit extends Cubit<ShiftDetailState> {
  final ShiftsRepository shiftsRepository = getIt();
  ShiftModel? shift;

  ShiftDetailCubit({required this.shift})
      : super(ShiftDetailState(shift: shift));

  void approve(ShiftModel? shiftModel) async {
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    try {
      ShiftModel? shift = await shiftsRepository.approve(shiftModel!);
      emit(state.copyWith(shift: shift));
    } catch (e) {
      emit(state.copyWith(postApiStatus: PostApiStatus.error));
    }
  }

  void decline(ShiftModel? shiftModel) async {
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    try {
      ShiftModel? shift = await shiftsRepository.decline(shiftModel!, '');
      emit(state.copyWith(shift: shift, postApiStatus: PostApiStatus.success));
    } catch (e) {
      emit(state.copyWith(postApiStatus: PostApiStatus.error));
    }
  }

  void getShiftDetail(ShiftModel? shiftModel) async {
    try {
      ShiftModel? shift = await shiftsRepository.getShiftDetail(shiftModel);
      if (shift?.objectId != null) {
        print(shift?.objectId);
        print(shift?.objectId);
        print(shift?.objectId);
        emit(state.copyWith(shift: shift));
      }
    } catch (e) {
      print("error");
      print("error");
      print("error");
      debugPrint(e.toString());
    }
  }
}
