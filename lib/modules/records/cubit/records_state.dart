part of 'records_cubit.dart';

class RecordsState extends Equatable {
  final ApiResponse<List<ShiftModel>> records;
  final bool hasMoreData; // Track which item is loading

  const RecordsState({
    required this.records,
    this.hasMoreData = false,
  });

  RecordsState copyWith({
    ApiResponse<List<ShiftModel>>? records,
    bool? loadMore,
    bool? hasMoreData,
  }) {
    return RecordsState(
        records: records ?? this.records,
        hasMoreData: hasMoreData ?? this.hasMoreData);
  }

  @override
  List<Object?> get props => [
        records,
        hasMoreData,
      ];
}
