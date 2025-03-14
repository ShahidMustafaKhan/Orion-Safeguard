part of 'signup_cubit.dart';

class SignUpState extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String licenseNo;
  final String niNumber;
  final String confirmPassword;
  final bool hidePassword;
  final bool hideConfirmPassword;

  final String message;
  final PostApiStatus postApiStatus;

  const SignUpState(
      {this.email = '',
      this.firstName = '',
      this.lastName = '',
      this.confirmPassword = '',
      this.licenseNo = "",
      this.niNumber = "",
      this.password = '',
      this.hidePassword = false,
      this.hideConfirmPassword = false,
      this.message = '',
      this.postApiStatus = PostApiStatus.initial});

  SignUpState copyWith(
      {String? email,
      String? password,
      bool? hidePassword,
      bool? hideConfirmPassword,
      String? message,
      String? firstName,
      String? lastName,
      String? confirmPassword,
      String? licenseNo,
      String? niNumber,
      PostApiStatus? postApiStatus}) {
    return SignUpState(
        email: email ?? this.email,
        password: password ?? this.password,
        message: message ?? this.message,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        licenseNo: licenseNo ?? this.licenseNo,
        niNumber: niNumber ?? this.niNumber,
        hidePassword: hidePassword ?? this.hidePassword,
        hideConfirmPassword: hideConfirmPassword ?? this.hideConfirmPassword,
        postApiStatus: postApiStatus ?? this.postApiStatus);
  }

  @override
  List<Object?> get props => [
        email,
        password,
        message,
        postApiStatus,
        firstName,
        lastName,
        licenseNo,
        niNumber,
        hidePassword,
        hideConfirmPassword,
        confirmPassword
      ];
}
