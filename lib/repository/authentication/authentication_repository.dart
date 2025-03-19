import '../../modules/profile/model/user_model.dart';

abstract class AuthenticationRepository {
  Future<UserModel?> login(String email, String password);
  Future<UserModel?> signup(
      String email,
      String password,
      String firstName,
      String lastName,
      String licenseNo,
      String niNumber,
      String employmentType);
  Future<void> logout(UserModel? userModel);

  Future<void> forgetPassword(String? email);

  Future<UserModel?> currentUserFromServer(String sessionToken);
}
