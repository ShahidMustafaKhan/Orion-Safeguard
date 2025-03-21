import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../core/exceptions/app_exceptions.dart';
import '../../modules/profile/model/contact_us_model.dart';
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

  @override
  Future<UserModel?> resetEmail(UserModel user, String newEmail) async {
    user.email = newEmail;
    user.username = newEmail;
    ParseResponse response = await user.save();
    if (response.success && response.result != null) {
      return response.result as UserModel;
    } else {
      throw AppException(response.error?.message ?? "Something went wrong");
    }
  }

  @override
  Future<UserModel?> updatePassword(UserModel user, String newPassword) async {
    user.password = newPassword;
    ParseResponse response = await user.save();
    if (response.success && response.result != null) {
      return response.result as UserModel;
    } else {
      throw AppException(response.error?.message ?? "Something went wrong");
    }
  }

  @override
  Future<UserModel?> updateFacebook(UserModel user, String newFacebook) async {
    user.facebook = newFacebook;
    ParseResponse response = await user.save();
    if (response.success && response.result != null) {
      return response.result as UserModel;
    } else {
      throw AppException(response.error?.message ?? "Something went wrong");
    }
  }

  @override
  Future<UserModel?> updateInstagram(
      UserModel user, String newInstagram) async {
    user.instagram = newInstagram;
    ParseResponse response = await user.save();
    if (response.success && response.result != null) {
      return response.result as UserModel;
    } else {
      throw AppException(response.error?.message ?? "Something went wrong");
    }
  }

  @override
  Future<UserModel?> updateLinkedin(UserModel user, String newLinkedin) async {
    user.linkedin = newLinkedin;
    ParseResponse response = await user.save();
    if (response.success && response.result != null) {
      return response.result as UserModel;
    } else {
      throw AppException(response.error?.message ?? "Something went wrong");
    }
  }

  @override
  Future<UserModel?> updateWhatsapp(UserModel user, String newWhatsapp) async {
    user.whatsapp = newWhatsapp;
    ParseResponse response = await user.save();
    if (response.success && response.result != null) {
      return response.result as UserModel;
    } else {
      throw AppException(response.error?.message ?? "Something went wrong");
    }
  }

  @override
  Future<UserModel?> updateAlert(UserModel user, bool alert) async {
    user.alerts = alert;
    ParseResponse response = await user.save();
    if (response.success && response.result != null) {
      return response.result as UserModel;
    } else {
      throw AppException(response.error?.message ?? "Something went wrong");
    }
  }

  @override
  Future<void> contactUs(
      {required String name,
      required String email,
      required String message,
      required UserModel? userModel}) async {
    ContactUsModel contactUsModel = ContactUsModel();
    contactUsModel.name = name;
    contactUsModel.email = email;
    contactUsModel.message = message;
    contactUsModel.employee = userModel;
    ParseResponse response = await contactUsModel.create();
    if (response.success && response.result != null) {
      return;
    } else {
      throw AppException(response.error?.message ?? "Something went wrong");
    }
  }

  @override
  Future<UserModel?> saveUser(UserModel user) async {
    ParseResponse response = await user.save();
    if (response.success && response.result != null) {
      return response.result as UserModel;
    } else {
      throw AppException(response.error?.message ?? "Something went wrong");
    }
  }
}
