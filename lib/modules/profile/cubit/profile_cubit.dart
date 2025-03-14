import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:orion_safeguard/core/di/service_locator.dart';

import '../../../core/response/api_response.dart';
import '../../../core/services/session_controller/session_controller.dart';
import '../../../repository/profile/profile_repository.dart';
import '../model/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository = getIt();

  ProfileCubit() : super(ProfileState(userModel: ApiResponse.loading()));

  void updateUserModel(UserModel? currentUser) {
    emit(state.copyWith(
        userModel: currentUser == null
            ? ApiResponse.loading()
            : ApiResponse.completed(currentUser)));
  }

  getCurrentUser() async {
    try {
      String? objectId = SessionController().objectId;
      UserModel? userModel =
          await profileRepository.getCurrentUser(objectId ?? '');
      emit(state.copyWith(userModel: ApiResponse.completed(userModel)));
    } catch (e) {
      emit(state.copyWith(userModel: ApiResponse.error(e.toString())));
    }
  }
}
