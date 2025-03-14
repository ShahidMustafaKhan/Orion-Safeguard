part of 'shift_details_cubit.dart';

class ShiftDetailState extends Equatable {
  final ShiftModel? shift;
  final PostApiStatus? postApiStatus;
  final String? errorMessage;

  const ShiftDetailState({this.shift, this.postApiStatus, this.errorMessage});

  ShiftDetailState copyWith(
      {ShiftModel? shift, PostApiStatus? postApiStatus, String? errorMessage}) {
    return ShiftDetailState(
      shift: shift ?? this.shift,
      postApiStatus: postApiStatus ?? this.postApiStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [shift, postApiStatus, errorMessage];
}
