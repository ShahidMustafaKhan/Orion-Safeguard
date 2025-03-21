part of 'signup_cubit.dart';

enum EmploymentStatus { none, applying, existing }

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
  final EmploymentStatus employmentStatus;
  final UserModel? userModel;

  const SignUpState(
      {this.email = '',
      this.firstName = '',
      this.lastName = '',
      this.confirmPassword = '',
      this.licenseNo = "",
      this.niNumber = "",
      this.password = '',
      this.hidePassword = true,
      this.hideConfirmPassword = true,
      this.message = '',
      this.postApiStatus = PostApiStatus.initial,
      this.employmentStatus = EmploymentStatus.none,
      this.userModel});

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
      PostApiStatus? postApiStatus,
      EmploymentStatus? employmentStatus,
      UserModel? userModel}) {
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
        postApiStatus: postApiStatus ?? this.postApiStatus,
        employmentStatus: employmentStatus ?? this.employmentStatus,
        userModel: userModel ?? this.userModel);
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
        confirmPassword,
        employmentStatus,
        userModel
      ];
}
