import 'package:parse_server_sdk/parse_server_sdk.dart';

class CompanyDetailsModel extends ParseObject implements ParseCloneable {
  CompanyDetailsModel() : super(keyTableName);
  CompanyDetailsModel.clone() : this();

  /// Mimic a clone due to Flutter not using reflection
  @override
  clone(Map<String, dynamic> map) => CompanyDetailsModel.clone()..fromJson(map);

  static const String keyTableName = 'CompanyDetails';
  static const String keyObjectId = 'objectId';
  static const String keyPhone = 'phone';
  static const String keyEmail = 'email';
  static const String keyAddress = 'address';
  static const String keyFacebook = 'facebook';
  static const String keyInstagram = 'instagram';
  static const String keyLinkedin = 'linkedin';
  static const String keyWhatsapp = 'whatsapp';

  set phone(String? phone) => set<String?>(keyPhone, phone);
  String? get phone => get<String?>(keyPhone);

  set email(String? email) => set<String?>(keyEmail, email);
  String? get email => get<String?>(keyEmail);

  set address(String? address) => set<String?>(keyAddress, address);
  String? get address => get<String?>(keyAddress);

  set facebook(String? facebook) => set<String?>(keyFacebook, facebook);
  String? get facebook => get<String?>(keyFacebook);

  set instagram(String? instagram) => set<String?>(keyInstagram, instagram);
  String? get instagram => get<String?>(keyInstagram);

  set linkedin(String? linkedin) => set<String?>(keyLinkedin, linkedin);
  String? get linkedin => get<String?>(keyLinkedin);

  set whatsapp(String? whatsapp) => set<String?>(keyWhatsapp, whatsapp);
  String? get whatsapp => get<String?>(keyWhatsapp);
}
