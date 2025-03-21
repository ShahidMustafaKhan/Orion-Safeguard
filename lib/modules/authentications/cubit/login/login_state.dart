part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final String message;
  final bool hidePassword;
  final UserModel? userModel;
  final PostApiStatus postApiStatus;

  const LoginState(
      {this.email = '',
      this.password = '',
      this.message = '',
      this.hidePassword = true,
      this.userModel,
      this.postApiStatus = PostApiStatus.initial});

  LoginState copyWith(
      {String? email,
      String? password,
      String? message,
      bool? hidePassword,
      UserModel? userModel,
      PostApiStatus? postApiStatus}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        message: message ?? this.message,
        hidePassword: hidePassword ?? this.hidePassword,
        userModel: userModel ?? this.userModel,
        postApiStatus: postApiStatus ?? this.postApiStatus);
  }

  @override
  List<Object?> get props =>
      [email, password, message, postApiStatus, userModel, hidePassword];
}
