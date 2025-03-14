import 'package:parse_server_sdk/parse_server_sdk.dart';

class UserModel extends ParseUser implements ParseCloneable {
  UserModel(super.username, super.password, super.emailAddress);

  UserModel.clone() : this(null, null, null);

  UserModel.forQuery() : super(null, null, null);

  @override
  clone(Map map) => UserModel.clone()..fromJson(map as Map<String, dynamic>);

  static Future<UserModel> getUserResult() async {
    UserModel? user = await ParseUser.currentUser();
    user = UserModel.clone()..fromJson(user as Map<String, dynamic>);

    return user;
  }

  static const String keyObjectId = 'objectId';
  static const String keyUserName = 'username';
  static const String keyFirstName = 'firstName';
  static const String keyLastName = 'lastName';
  static const String keyProfileImage = 'image';
  static const String keyEmail = 'email';
  static const String keyPassword = 'password';
  static const String keyLicenseNo = 'licenseNo';
  static const String keyNlNumber = 'nlNumber';

  String? get firstName => get<String>(keyFirstName);
  set firstName(String? name) => set<String?>(keyFirstName, name);

  String? get lastName => get<String>(keyLastName);
  set lastName(String? name) => set<String?>(keyLastName, name);

  ParseFile? get image => get<ParseFile>(keyProfileImage);
  set image(ParseFile? image) => set<ParseFile?>(keyProfileImage, image);

  String? get name => '$firstName $lastName';

  String? get email => get<String>(keyEmail);
  set email(String? email) => set<String?>(keyEmail, email);

  int? get licenseNo => get<int>(keyLicenseNo);
  set licenseNo(int? licenseNo) => set<int?>(keyLicenseNo, licenseNo);

  int? get nlNumber => get<int>(keyNlNumber);
  set nlNumber(int? nlNumber) => set<int?>(keyNlNumber, nlNumber);
}
