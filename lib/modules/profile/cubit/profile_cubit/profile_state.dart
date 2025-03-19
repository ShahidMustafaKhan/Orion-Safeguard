part of 'profile_cubit.dart';

enum ProfileUpdateType {
  email,
  password,
  linkedin,
  facebook,
  instagram,
  whatsapp,
  logout,
  none,
  error
}

class ProfileState extends Equatable {
  final ApiResponse<UserModel> userModel;
  final ProfileUpdateType updateType;
  final String? message;

  const ProfileState(
      {required this.userModel,
      this.updateType = ProfileUpdateType.none,
      this.message});

  ProfileState copyWith(
      {ApiResponse<UserModel>? userModel,
      ProfileUpdateType? updateType,
      String? message}) {
    return ProfileState(
      userModel: userModel ?? this.userModel,
      updateType: updateType ?? this.updateType,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [userModel, updateType, message];
}
