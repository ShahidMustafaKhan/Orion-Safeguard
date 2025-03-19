import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:orion_safeguard/core/di/service_locator.dart';
import 'package:orion_safeguard/repository/notification/notification_repository.dart';

import '../../../../core/response/api_response.dart';
import '../../../../core/services/session_controller/session_controller.dart';
import '../model/notification_model.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository notificationRepository = getIt();
  bool isLoadingMore = false; // flag

  NotificationCubit()
      : super(NotificationState(
          notifications: ApiResponse.loading(),
        ));

  void fetchNotifications({bool loadMore = false}) async {
    if (isLoadingMore) return;
    try {
      isLoadingMore = true;
      String? objectId = SessionController().objectId;

      final currentList = state.notifications.data ?? [];
      final newList = await notificationRepository.getNotifications(
          objectId ?? '',
          skip: loadMore ? currentList.length : 0);

      final hasMore = newList.length == 9;

      List<NotificationModel> notificationsList =
          loadMore ? [...currentList, ...newList] : newList;

      isLoadingMore = false;
      emit(state.copyWith(
          notifications: ApiResponse.completed(notificationsList),
          hasMoreData: hasMore));
    } catch (e) {
      debugPrint(e.toString());
      isLoadingMore = false;
      emit(state.copyWith(notifications: ApiResponse.error(e.toString())));
    }
  }

  markNotificationsRead() async {
    try {
      String? objectId = SessionController().objectId;
      await notificationRepository.markNotificationsRead(objectId ?? '');
      fetchNotifications();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
