part of 'my_shifts_cubit.dart';

class MyShiftsState extends Equatable {
  final ApiResponse<List<ShiftModel>> activeShifts;
  final ApiResponse<List<ShiftModel>> completedShifts;
  final PostApiStatus approveStatus;
  final PostApiStatus declineStatus;
  final String? message;
  final String? approveLoadingItemId; // Track which item is loading
  final String? declineLoadingItemId; // Track which item is loading

  const MyShiftsState({
    required this.activeShifts,
    required this.completedShifts,
    required this.approveStatus,
    required this.declineStatus,
    this.message,
    this.approveLoadingItemId,
    this.declineLoadingItemId,
  });

  MyShiftsState copyWith({
    ApiResponse<List<ShiftModel>>? activeShifts,
    ApiResponse<List<ShiftModel>>? completedShifts,
    PostApiStatus? approveStatus,
    PostApiStatus? declineStatus,
    String? message,
    bool resetApproveLoadingItemId = false,
    String? approveLoadingItemId,
    bool resetDeclineLoadingItemId = false,
    String? declineLoadingItemId,
  }) {
    return MyShiftsState(
      activeShifts: activeShifts ?? this.activeShifts,
      completedShifts: completedShifts ?? this.completedShifts,
      approveStatus: approveStatus ?? this.approveStatus,
      declineStatus: declineStatus ?? this.declineStatus,
      message: message ?? this.message,
      approveLoadingItemId: resetApproveLoadingItemId
          ? null
          : (approveLoadingItemId ?? this.approveLoadingItemId),
    );
  }

  @override
  List<Object?> get props => [
        activeShifts,
        completedShifts,
        approveStatus,
        declineStatus,
        message,
        approveLoadingItemId,
        declineLoadingItemId
      ];
}
