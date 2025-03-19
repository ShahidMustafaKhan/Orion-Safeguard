part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final String message;
  final bool hidePassword;
  final PostApiStatus postApiStatus;

  const LoginState(
      {this.email = '',
      this.password = '',
      this.message = '',
      this.hidePassword = true,
      this.postApiStatus = PostApiStatus.initial});

  LoginState copyWith(
      {String? email,
      String? password,
      String? message,
      bool? hidePassword,
      PostApiStatus? postApiStatus}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        message: message ?? this.message,
        hidePassword: hidePassword ?? this.hidePassword,
        postApiStatus: postApiStatus ?? this.postApiStatus);
  }

  @override
  List<Object?> get props =>
      [email, password, message, postApiStatus, hidePassword];
}
