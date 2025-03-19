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
  bool isLoadingMore = false;

  RecordsCubit()
      : super(RecordsState(
          records: ApiResponse.loading(),
        ));

  void fetchRecords({bool loadMore = false}) async {
    if (isLoadingMore) {
      return; // Prevent multiple simultaneous requests
    }
    isLoadingMore = true;
    try {
      String? objectId = SessionController().objectId;
      final currentList = state.records.data ?? [];
      final newShifts = await shiftsRepository.getRecords(objectId,
          skip: loadMore ? currentList.length : 0);

      final hasMore = newShifts.length == 12;
      final recordsList = loadMore ? [...currentList, ...newShifts] : newShifts;

      emit(state.copyWith(
        records: ApiResponse.completed(recordsList),
        hasMoreData: hasMore,
      ));

      isLoadingMore = false;
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(records: ApiResponse.error(e.toString())));
      isLoadingMore = false;
    }
  }
}
