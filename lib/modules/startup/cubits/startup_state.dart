part of 'startup_cubit.dart';

enum Status {
  none,
  authenticated,
  unauthenticated,
}

class StartupState extends Equatable {
  final Status status;
  final UserModel? user;

  const StartupState({required this.status, this.user});

  factory StartupState.initial() {
    return const StartupState(
      status: Status.none,
      user: null,
    );
  }

  StartupState copyWith({Status? status, UserModel? user}) {
    return StartupState(status: status ?? this.status, user: user ?? this.user);
  }

  @override
  List<Object?> get props => [status, user];
}
