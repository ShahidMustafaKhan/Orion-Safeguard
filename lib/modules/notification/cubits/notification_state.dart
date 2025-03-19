part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  final ApiResponse<List<NotificationModel>> notifications;
  final bool hasMoreData; // Track which item is loading

  const NotificationState({
    required this.notifications,
    this.hasMoreData = false,
  });

  NotificationState copyWith({
    ApiResponse<List<NotificationModel>>? notifications,
    bool? hasMoreData,
  }) {
    return NotificationState(
        notifications: notifications ?? this.notifications,
        hasMoreData: hasMoreData ?? this.hasMoreData);
  }

  @override
  List<Object?> get props => [
        notifications,
        hasMoreData,
      ];
}
