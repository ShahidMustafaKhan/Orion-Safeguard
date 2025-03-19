import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:orion_safeguard/core/di/service_locator.dart';
import 'package:orion_safeguard/core/services/session_controller/session_controller.dart';
import 'package:orion_safeguard/repository/alerts/alerts_repository.dart';

import '../../../../core/response/api_response.dart';
import '../../../utils/enums.dart';
import '../model/announcement_model.dart';

part 'alerts_state.dart';

class AlertsCubit extends Cubit<AlertsState> {
  final AlertsRepository alertsRepository = getIt();
  bool isLoadingMore = false; // flag

  AlertsCubit()
      : super(AlertsState(
          announcements: ApiResponse.loading(),
          approveStatus: PostApiStatus.initial,
          declineStatus: PostApiStatus.initial,
          latestAnnouncement: ApiResponse.loading(),
        ));

  void fetchAlerts({bool loadMore = false}) async {
    if (isLoadingMore) {
      return;
    }
    try {
      isLoadingMore = true;

      final currentAlerts = state.announcements.data ?? [];
      final newAlerts = await alertsRepository.getAlerts(
          skip: loadMore ? currentAlerts.length : 0);

      final hasMore = newAlerts.length == 7;
      List<AnnouncementModel> announcementsList =
          loadMore ? [...currentAlerts, ...newAlerts] : newAlerts;

      emit(state.copyWith(
          announcements: ApiResponse.completed(announcementsList),
          hasMoreData: hasMore));
      isLoadingMore = false;
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(announcements: ApiResponse.error(e.toString())));
      isLoadingMore = false;
    }
  }

  void approve(AnnouncementModel? announcementModel,
      {bool selectedAlert = false}) async {
    String? objectId = SessionController().objectId;
    emit(state.copyWith(
        approveStatus: PostApiStatus.loading, approveLoadingItemId: objectId));
    try {
      AnnouncementModel model =
          await alertsRepository.approve(announcementModel!, objectId ?? '');
      emit(state.copyWith(
          approveStatus: PostApiStatus.success,
          resetApproveLoadingItemId: true,
          selectedAlert: selectedAlert ? model : null));
      fetchAlerts();
    } catch (e) {
      emit(state.copyWith(
          approveStatus: PostApiStatus.error,
          errorMessage: e.toString(),
          resetApproveLoadingItemId: true));
    }
  }

  void decline(AnnouncementModel? announcementModel, String? reason,
      {bool selectedAlert = false}) async {
    String? objectId = SessionController().objectId;
    emit(state.copyWith(
        approveStatus: PostApiStatus.loading, approveLoadingItemId: objectId));
    try {
      AnnouncementModel model =
          await alertsRepository.decline(announcementModel!, objectId, reason);
      emit(state.copyWith(
          approveStatus: PostApiStatus.success,
          resetApproveLoadingItemId: true,
          selectedAlert: selectedAlert ? model : null));
      fetchAlerts();
    } catch (e) {
      emit(state.copyWith(
          approveStatus: PostApiStatus.error,
          errorMessage: e.toString(),
          resetApproveLoadingItemId: true));
    }
  }

  void updateSelectedAlert(AnnouncementModel? announcementModel) {
    emit(state.copyWith(selectedAlert: announcementModel));
  }

  void latestAnnouncement() async {
    try {
      AnnouncementModel? announcementModel =
          await alertsRepository.latestAnnouncement();
      emit(state.copyWith(
          latestAnnouncement: ApiResponse.completed(announcementModel)));
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(latestAnnouncement: ApiResponse.error(e.toString())));
    }
  }
}
