import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:orion_safeguard/core/di/service_locator.dart';
import 'package:orion_safeguard/modules/dashboard/model/shifts_model/shifts_model.dart';
import 'package:orion_safeguard/repository/shifts/shifts_repository.dart';

import '../../../../core/response/api_response.dart';
import '../../../../core/services/session_controller/session_controller.dart';

part 'records_state.dart';

class RecordsCubit extends Cubit<RecordsState> {
  final ShiftsRepository shiftsRepository = getIt();

  RecordsCubit()
      : super(RecordsState(
          records: ApiResponse.loading(),
        ));

  void fetchRecords() async {
    try {
      String? objectId = SessionController().objectId;
      List<ShiftModel> recordsList =
          await shiftsRepository.getRecords(objectId);
      emit(state.copyWith(records: ApiResponse.completed(recordsList)));
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(records: ApiResponse.error(e.toString())));
    }
  }
}
