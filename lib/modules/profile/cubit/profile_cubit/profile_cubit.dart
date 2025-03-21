import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:orion_safeguard/core/di/service_locator.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../../../core/response/api_response.dart';
import '../../../../core/services/session_controller/session_controller.dart';
import '../../../../core/services/storage_service/storage_service.dart';
import '../../../../repository/authentication/authentication_repository.dart';
import '../../../../repository/profile/profile_repository.dart';
import '../../model/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository = getIt();
  final AuthenticationRepository authenticationRepository = getIt();
  final StorageService _localStorage =
      StorageService(sharedPreferences: getIt());

  ProfileCubit() : super(ProfileState(userModel: ApiResponse.loading()));

  void updateUserModel(UserModel? currentUser) {
    emit(state.copyWith(
        userModel: currentUser == null
            ? ApiResponse.loading()
            : ApiResponse.completed(currentUser),
        updateType: ProfileUpdateType.none));
  }

  getCurrentUser() async {
    try {
      String? objectId = SessionController().objectId;
      UserModel? userModel =
          await profileRepository.getCurrentUser(objectId ?? '');
      emit(state.copyWith(
          userModel: ApiResponse.completed(userModel),
          updateType: ProfileUpdateType.none));
    } catch (e) {
      emit(state.copyWith(userModel: ApiResponse.error(e.toString())));
    }
  }

  changeAccountStatusToPending(File? image, String? nl) async {
    UserModel userModel = state.userModel.data!;
    userModel.accountStatus = UserModel.keyAccountStatusTypePending;
    if (image != null) {
      userModel.image = ParseFile(image);
    }
    if (nl != null) {
      userModel.nlNumber = nl;
    }
    profileRepository.saveUser(state.userModel.data!).then((value) {
      emit(state.copyWith(userModel: ApiResponse.completed(value)));
    });
  }

  resetEmail(String newEmail) async {
    try {
      UserModel? userModel =
          await profileRepository.resetEmail(state.userModel.data!, newEmail);
      emit(state.copyWith(
          userModel: ApiResponse.completed(userModel),
          updateType: ProfileUpdateType.email));
    } catch (e) {
      emit(state.copyWith(
          message: e.toString(), updateType: ProfileUpdateType.error));
    }
  }

  updatePassword(String newPassword) async {
    try {
      UserModel? userModel = await profileRepository.updatePassword(
          state.userModel.data!, newPassword);
      emit(state.copyWith(
          userModel: ApiResponse.completed(userModel),
          updateType: ProfileUpdateType.password));
    } catch (e) {
      emit(state.copyWith(
          message: e.toString(), updateType: ProfileUpdateType.error));
    }
  }

  addFacebookLink(String facebookLink) async {
    try {
      UserModel? userModel = await profileRepository.updateFacebook(
          state.userModel.data!, facebookLink);
      emit(state.copyWith(
          userModel: ApiResponse.completed(userModel),
          updateType: ProfileUpdateType.facebook));
      getCurrentUser();
    } catch (e) {
      emit(state.copyWith(
          message: e.toString(), updateType: ProfileUpdateType.error));
    }
  }

  addInstagramLink(String instagramLink) async {
    try {
      UserModel? userModel = await profileRepository.updateInstagram(
          state.userModel.data!, instagramLink);
      emit(state.copyWith(
          userModel: ApiResponse.completed(userModel),
          updateType: ProfileUpdateType.instagram));
      getCurrentUser();
    } catch (e) {
      emit(state.copyWith(
          message: e.toString(), updateType: ProfileUpdateType.error));
    }
  }

  addLinkedinLink(String linkedinLink) async {
    try {
      UserModel? userModel = await profileRepository.updateLinkedin(
          state.userModel.data!, linkedinLink);
      emit(state.copyWith(
          userModel: ApiResponse.completed(userModel),
          updateType: ProfileUpdateType.linkedin));
      getCurrentUser();
    } catch (e) {
      emit(state.copyWith(
          message: e.toString(), updateType: ProfileUpdateType.error));
    }
  }

  addWhatsappNumber(String whatsappNumber) async {
    try {
      UserModel? userModel = await profileRepository.updateWhatsapp(
          state.userModel.data!, whatsappNumber);
      emit(state.copyWith(
          userModel: ApiResponse.completed(userModel),
          updateType: ProfileUpdateType.whatsapp));
      getCurrentUser();
    } catch (e) {
      emit(state.copyWith(
          message: e.toString(), updateType: ProfileUpdateType.error));
    }
  }

  updateAlert(bool alert) async {
    try {
      UserModel? userModel =
          await profileRepository.updateAlert(state.userModel.data!, alert);
      emit(state.copyWith(
          userModel: ApiResponse.completed(userModel),
          updateType: ProfileUpdateType.none));
      getCurrentUser();
    } catch (e) {
      emit(state.copyWith(
          message: e.toString(), updateType: ProfileUpdateType.error));
    }
  }

  addDeviceToken() async {
    try {
      String? deviceToken = _localStorage.getString(UserModel.keyDeviceToken);
      UserModel userModel = state.userModel.data!;
      userModel.deviceToken = deviceToken;
      await profileRepository.saveUser(userModel);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  logout() async {
    try {
      await authenticationRepository.logout(state.userModel.data);
      await SessionController().clearPreference();
      emit(state.copyWith(updateType: ProfileUpdateType.logout));
    } catch (e) {
      emit(state.copyWith(
          message: e.toString(), updateType: ProfileUpdateType.error));
    }
  }
}
