import '../../modules/profile/model/user_model.dart';

abstract class ProfileRepository {
  Future<UserModel?> getCurrentUser(String objectId);

  Future<UserModel?> resetEmail(UserModel user, String newEmail);

  Future<UserModel?> updatePassword(UserModel user, String newPassword);

  Future<UserModel?> updateFacebook(UserModel user, String newFacebook);

  Future<UserModel?> updateInstagram(UserModel user, String newInstagram);

  Future<UserModel?> updateWhatsapp(UserModel user, String newWhatsapp);

  Future<UserModel?> updateLinkedin(UserModel user, String newLinkedin);

  Future<UserModel?> updateAlert(UserModel user, bool alert);

  Future<void> contactUs(
      {required String name,
      required String email,
      required String message,
      required UserModel? userModel});
}
