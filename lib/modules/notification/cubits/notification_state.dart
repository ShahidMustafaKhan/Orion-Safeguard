part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  final ApiResponse<List<NotificationModel>>
      notifications; // Track which item is loading

  const NotificationState({
    required this.notifications,
  });

  NotificationState copyWith({
    ApiResponse<List<NotificationModel>>? notifications,
  }) {
    return NotificationState(
        notifications: notifications ?? this.notifications);
  }

  @override
  List<Object?> get props => [
        notifications,
      ];
}
