import '../../modules/profile/model/user_model.dart';

abstract class ProfileRepository {
  Future<UserModel?> getCurrentUser(String objectId);
}
