import 'package:flutter/cupertino.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../core/exceptions/app_exceptions.dart';
import '../../modules/profile/model/user_model.dart';
import 'authentication_repository.dart';

class AuthenticationHttpRepository implements AuthenticationRepository {
  @override
  Future<UserModel?> login(String email, String password) async {
    var user = UserModel(email, password, email);
    var response = await user.login();

    if (response.success && response.result != null) {
      var userData = response.result as UserModel;

      return userData;
    } else {
      throw AppException(response.error?.message ?? "Login failed");
    }
  }

  @override
  Future<UserModel?> signup(
      String email,
      String password,
      String firstName,
      String lastName,
      String licenseNo,
      String dateBirth,
      String niNumber,
      String employmentType,
      String accountStatus) async {
    var user = UserModel(email, password, email);
    user.firstName = firstName;
    user.lastName = lastName;
    user.licenseNo = licenseNo;
    user.dateBirth = dateBirth;
    user.nlNumber = niNumber;
    user.email = email;
    user.password = password;
    user.accountStatus = accountStatus;
    user.employmentStatus = employmentType;

    ParseACL acl = ParseACL();
    acl.setPublicReadAccess(allowed: true);
    user.setACL(acl);

    var response =
        await user.signUp(); // Assuming `signup()` exists in `UserModel`

    if (response.success && response.result != null) {
      var userData = response.result as UserModel;
      return userData;
    } else {
      throw AppException(response.error?.message ?? "Signup failed");
    }
  }

  @override
  Future<void> signUpAsExistingEmployee(
      String email,
      String password,
      String firstName,
      String lastName,
      String licenseNo,
      String dateBirth,
      String niNumber,
      String employmentType,
      String accountStatus) async {
    final ParseCloudFunction function =
        ParseCloudFunction('signupAndCheckEmployee');

    final Map<String, dynamic> data = {
      "username": email,
      "email": email,
      "password": password,
      "firstName": firstName,
      "lastName": lastName,
      "licenseNo": licenseNo,
      "dateBirth": dateBirth,
      "niNumber": niNumber,
      "accountStatus": "pending",
      "employmentType": "existing",
    };

    final ParseResponse response = await function.execute(parameters: data);

    if (response.success && response.result != null) {
      debugPrint("✅ User signed up");
      return;
    } else {
      debugPrint("❌ Error: ${response.error?.message}");
      throw AppException(response.error?.message ?? "Signup failed");
    }
  }

  @override
  Future<UserModel?> currentUserFromServer(String sessionToken) async {
    ParseResponse? response =
        await ParseUser.getCurrentUserFromServer(sessionToken);

    if (response != null && response.success && response.result != null) {
      UserModel? user = response.result as UserModel;
      return user;
    } else {
      throw AppException(response?.error?.message ?? "Login failed");
    }
  }

  @override
  Future<void> logout(UserModel? userModel) async {
    if (userModel == null) {
      throw Exception("User not found");
    }
    ParseResponse response = await userModel.logout();
    if (response.success) {
      return;
    } else {
      throw AppException(response.error?.message ?? "Logout failed");
    }
  }

  @override
  Future<void> forgetPassword(String? email) async {
    var user = ParseUser(email, null, email);
    ParseResponse response = await user.requestPasswordReset();
    if (response.success) {
      return;
    } else {
      throw AppException(response.error?.message ?? "Password reset failed");
    }
  }
}
