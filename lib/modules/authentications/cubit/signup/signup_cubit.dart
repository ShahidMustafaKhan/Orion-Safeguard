import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:orion_safeguard/core/di/service_locator.dart';
import 'package:orion_safeguard/core/services/session_controller/session_controller.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../../../repository/authentication/authentication_repository.dart';
import '../../../../utils/enums.dart';
import '../../../profile/model/user_model.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthenticationRepository authenticationRepository = getIt();

  SignUpCubit() : super(const SignUpState());

  void onEmailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  void onFirstNameChanged(String firstName) {
    emit(state.copyWith(firstName: firstName));
  }

  void onLastNameChanged(String lastName) {
    emit(state.copyWith(lastName: lastName));
  }

  void onLicenseNoChanged(String licenseNo) {
    emit(state.copyWith(licenseNo: licenseNo));
  }

  void onNiNumberChanged(String niNumber) {
    emit(state.copyWith(niNumber: niNumber));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  void onConfirmPasswordChanged(String confirmPassword) {
    emit(state.copyWith(confirmPassword: confirmPassword));
  }

  void onConfirmPasswordVisibilityChanged() {
    emit(state.copyWith(hideConfirmPassword: !state.hideConfirmPassword));
  }

  void onPasswordVisibilityChanged() {
    emit(state.copyWith(hidePassword: !state.hidePassword));
  }

  Future<void> onSignUpButtonClicked() async {
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    try {
      UserModel? userModel = await authenticationRepository.signup(
          state.email,
          state.password,
          state.firstName,
          state.lastName,
          state.licenseNo,
          state.niNumber);
      ParseResponse response = await ParseSession().save();
      SessionController().savedUserInPreference(
          userModel?.objectId ?? '', response.result?.sessionToken ?? '');
      SessionController().getUserFromPreference();
      emit(state.copyWith(postApiStatus: PostApiStatus.success));
    } catch (e) {
      emit(state.copyWith(
          postApiStatus: PostApiStatus.error, message: e.toString()));
    }
  }
}
