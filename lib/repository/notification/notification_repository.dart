import '../../modules/notification/model/notification_model.dart';

abstract class NotificationRepository {
  Future<List<NotificationModel>> getNotifications(String objectId);

  Future<void> markNotificationsRead(String userId);
}
