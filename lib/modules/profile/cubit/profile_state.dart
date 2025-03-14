part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final ApiResponse<UserModel> userModel;

  const ProfileState({required this.userModel});

  ProfileState copyWith({ApiResponse<UserModel>? userModel}) {
    return ProfileState(
      userModel: userModel ?? this.userModel,
    );
  }

  @override
  List<Object?> get props => [userModel];
}
