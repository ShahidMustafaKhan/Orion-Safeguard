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

  NotificationCubit()
      : super(NotificationState(
          notifications: ApiResponse.loading(),
        ));

  void fetchNotifications() async {
    try {
      String? objectId = SessionController().objectId;
      List<NotificationModel> notificationsList =
          await notificationRepository.getNotifications(objectId ?? '');
      emit(state.copyWith(
          notifications: ApiResponse.completed(notificationsList)));
    } catch (e) {
      debugPrint(e.toString());
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
