part of 'home_cubit.dart';

class HomeState extends Equatable {
  final ApiResponse<List<ShiftModel>> upcomingShifts;
  final ApiResponse<ShiftModel?> onGoingShifts;
  final ApiResponse<List<ShiftModel>> previousShifts;
  final bool loading;

  const HomeState({
    required this.upcomingShifts,
    required this.onGoingShifts,
    required this.previousShifts,
    this.loading = false,
  });

  HomeState copyWith(
      {ApiResponse<List<ShiftModel>>? upcomingShifts,
      ApiResponse<ShiftModel?>? onGoingShifts,
      ApiResponse<List<ShiftModel>>? previousShifts,
      bool? loading}) {
    return HomeState(
      upcomingShifts: upcomingShifts ?? this.upcomingShifts,
      onGoingShifts: onGoingShifts ?? this.onGoingShifts,
      previousShifts: previousShifts ?? this.previousShifts,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props =>
      [upcomingShifts, onGoingShifts, previousShifts, loading];
}
