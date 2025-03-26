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

  static const String keyTableName = '_User';
  static const String keyObjectId = 'objectId';
  static const String keyUserName = 'username';
  static const String keyFirstName = 'firstName';
  static const String keyLastName = 'lastName';
  static const String keyProfileImage = 'image';
  static const String keyEmail = 'email';
  static const String keyPassword = 'password';
  static const String keyLicenseNo = 'licenseNo';
  static const String keyNlNumber = 'nlNumber';
  static const String keyDateBirth = 'dateBirth';
  static const String keyLinkedin = 'linkedin';
  static const String keyFacebook = 'facebook';
  static const String keyInstagram = 'instagram';
  static const String keyWhatsapp = 'whatsapp';
  static const String keyAlerts = 'alerts';
  static const String keyAccountStatus = 'accountStatus';
  static const String keyAccountStatusTypePending = 'pending';
  static const String keyAccountStatusTypeApproved = 'approved';
  static const String keyAccountStatusTypeRejected = 'rejected';
  static const String keyAccountStatusTypeApplying = 'applying';
  static const String keyAccountStatusTypeFreezed = 'freezed';
  static const String keyEmploymentStatus = 'employmentStatus';
  static const String keyEmploymentStatusExisting = 'existing';
  static const String keyEmploymentStatusApplying = 'applying';
  static const String keyDeviceToken = 'deviceToken';
  static const String keyNotificationEnabled = 'isNotificationDisabled';

  String? get firstName => get<String>(keyFirstName);
  set firstName(String? name) => set<String?>(keyFirstName, name);

  String? get lastName => get<String>(keyLastName);
  set lastName(String? name) => set<String?>(keyLastName, name);

  ParseFile? get image => get<ParseFile>(keyProfileImage);
  set image(ParseFile? image) => set<ParseFile?>(keyProfileImage, image);

  String? get name => '$firstName $lastName';

  String? get email => get<String>(keyEmail);
  set email(String? email) => set<String?>(keyEmail, email);

  String? get licenseNo => get<String>(keyLicenseNo);
  set licenseNo(String? licenseNo) => set<String?>(keyLicenseNo, licenseNo);

  String? get nlNumber => get<String>(keyNlNumber);
  set nlNumber(String? nlNumber) => set<String?>(keyNlNumber, nlNumber);

  String? get dateBirth => get<String>(keyDateBirth);
  set dateBirth(String? dateBirth) => set<String?>(keyDateBirth, dateBirth);

  String? get linkedin => get<String>(keyLinkedin);
  set linkedin(String? linkedin) => set<String?>(keyLinkedin, linkedin);

  String? get facebook => get<String>(keyFacebook);
  set facebook(String? facebook) => set<String?>(keyFacebook, facebook);

  String? get instagram => get<String>(keyInstagram);
  set instagram(String? instagram) => set<String?>(keyInstagram, instagram);

  String? get whatsapp => get<String>(keyWhatsapp);
  set whatsapp(String? whatsapp) => set<String?>(keyWhatsapp, whatsapp);

  bool get alerts => get<bool>(keyAlerts) ?? true;
  set alerts(bool alerts) => set<bool>(keyAlerts, alerts);

  String? get accountStatus => get<String>(keyAccountStatus);
  set accountStatus(String? accountStatus) =>
      set<String?>(keyAccountStatus, accountStatus);

  String? get employmentStatus => get<String>(keyEmploymentStatus);
  set employmentStatus(String? employmentStatus) =>
      set<String?>(keyEmploymentStatus, employmentStatus);

  set deviceToken(String? deviceToken) =>
      set<String?>(keyDeviceToken, deviceToken);
}
