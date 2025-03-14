import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../core/exceptions/app_exceptions.dart';
import '../../modules/profile/model/user_model.dart';
import 'profile_repository.dart';

class ProfileHttpRepository implements ProfileRepository {
  @override
  Future<UserModel?> getCurrentUser(String objectId) async {
    final QueryBuilder<UserModel> queryBuilder =
        QueryBuilder<UserModel>(UserModel.forQuery())
          ..whereEqualTo(
              UserModel.keyObjectId, objectId); // Replace with actual objectId

    final ParseResponse response = await queryBuilder.query();

    if (response.success &&
        response.results != null &&
        response.results!.isNotEmpty) {
      return response.results!.first as UserModel;
    } else {
      throw AppException(response.error?.message ?? "User not found");
    }
  }
}
