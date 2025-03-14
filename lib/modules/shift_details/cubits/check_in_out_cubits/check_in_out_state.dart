part of 'check_in_out_cubit.dart';

class CheckInOutState extends Equatable {
  final ShiftModel? shift;
  final PostApiStatus? postApiStatus;
  final String? errorMessage;
  final File? file;
  final DateTime now;

  const CheckInOutState(
      {this.shift,
      this.postApiStatus,
      this.errorMessage,
      this.file,
      required this.now});

  CheckInOutState copyWith(
      {ShiftModel? shift,
      PostApiStatus? postApiStatus,
      String? errorMessage,
      File? file,
      bool resetFile = false,
      DateTime? now}) {
    return CheckInOutState(
      shift: shift ?? this.shift,
      postApiStatus: postApiStatus ?? this.postApiStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      file:
          resetFile ? null : (file ?? this.file), // Reset file if flag is true
      now: now ?? this.now,
    );
  }

  @override
  List<Object?> get props => [shift, postApiStatus, errorMessage, file, now];
}
