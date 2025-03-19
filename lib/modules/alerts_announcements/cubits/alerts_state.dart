part of 'alerts_cubit.dart';

class AlertsState extends Equatable {
  final ApiResponse<AnnouncementModel?> latestAnnouncement;
  final ApiResponse<List<AnnouncementModel>> announcements;
  final AnnouncementModel? selectedAlert;
  final PostApiStatus approveStatus;
  final PostApiStatus declineStatus;
  final String? errorMessage;
  final String? approveLoadingItemId; // Track which item is loading
  final String? declineLoadingItemId;
  final bool hasMoreData; // Track which item is loading

  const AlertsState({
    required this.announcements,
    required this.latestAnnouncement,
    this.selectedAlert,
    required this.approveStatus,
    required this.declineStatus,
    this.errorMessage,
    this.approveLoadingItemId,
    this.declineLoadingItemId,
    this.hasMoreData = false,
  });

  AlertsState copyWith(
      {ApiResponse<List<AnnouncementModel>>? announcements,
      ApiResponse<AnnouncementModel?>? latestAnnouncement,
      AnnouncementModel? selectedAlert,
      PostApiStatus? approveStatus,
      PostApiStatus? declineStatus,
      String? errorMessage,
      bool resetApproveLoadingItemId = false,
      String? approveLoadingItemId,
      bool resetDeclineLoadingItemId = false,
      String? declineLoadingItemId,
      bool? hasMoreData}) {
    return AlertsState(
        announcements: announcements ?? this.announcements,
        selectedAlert: selectedAlert ?? this.selectedAlert,
        approveStatus: approveStatus ?? this.approveStatus,
        declineStatus: declineStatus ?? this.declineStatus,
        errorMessage: errorMessage ?? this.errorMessage,
        approveLoadingItemId: resetApproveLoadingItemId
            ? null
            : (approveLoadingItemId ?? this.approveLoadingItemId),
        declineLoadingItemId: resetDeclineLoadingItemId
            ? null
            : (declineLoadingItemId ?? this.declineLoadingItemId),
        latestAnnouncement: latestAnnouncement ?? this.latestAnnouncement,
        hasMoreData: hasMoreData ?? this.hasMoreData);
  }

  @override
  List<Object?> get props => [
        announcements,
        selectedAlert,
        approveStatus,
        declineStatus,
        errorMessage,
        approveLoadingItemId,
        declineLoadingItemId,
        latestAnnouncement,
        hasMoreData
      ];
}
