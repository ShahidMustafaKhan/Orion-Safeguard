import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:orion_safeguard/core/di/service_locator.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../../../core/services/session_controller/session_controller.dart';
import '../../../../repository/authentication/authentication_repository.dart';
import '../../../../utils/enums.dart';
import '../../../profile/model/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository authenticationRepository = getIt();

  LoginCubit() : super(const LoginState());

  void onEmailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  void onPasswordVisibilityChanged() {
    emit(state.copyWith(hidePassword: !state.hidePassword));
  }

  Future<void> onSubmitButtonClicked() async {
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    try {
      UserModel? userModel =
          await authenticationRepository.login(state.email, state.password);
      ParseResponse response = await ParseSession().save();
      SessionController().savedUserInPreference(
          userModel?.objectId ?? '', response.result?.sessionToken ?? '');
      SessionController().getUserFromPreference();
      emit(state.copyWith(postApiStatus: PostApiStatus.success));
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(
          postApiStatus: PostApiStatus.error, message: e.toString()));
    }
  }

  Future<void> forgetPassword() async {
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    try {
      await authenticationRepository.forgetPassword(state.email);
      emit(state.copyWith(postApiStatus: PostApiStatus.success));
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(
          postApiStatus: PostApiStatus.error, message: e.toString()));
    }
  }
}
