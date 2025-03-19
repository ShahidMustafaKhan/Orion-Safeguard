import 'package:orion_safeguard/modules/profile/model/user_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ContactUsModel extends ParseObject implements ParseCloneable {
  ContactUsModel() : super(_keyTableName);
  ContactUsModel.clone() : this();

  /// Mimic a clone due to Flutter not using reflection
  @override
  clone(Map<String, dynamic> map) => ContactUsModel.clone()..fromJson(map);

  static const String _keyTableName = 'ContactUs';
  static const String keyObjectId = 'objectId';
  static const String keyShiftName = 'name';
  static const String keyEmail = 'email';
  static const String keyMessage = 'message';
  static const String keyEmployee = 'employee';

  set name(String? name) => set<String?>(keyShiftName, name);

  set email(String? email) => set<String?>(keyEmail, email);

  set message(String? message) => set<String?>(keyMessage, message);

  set employee(UserModel? employee) => set<UserModel?>(keyEmployee, employee);
}
