import 'package:parse_server_sdk/parse_server_sdk.dart';

class AnnouncementModel extends ParseObject implements ParseCloneable {
  AnnouncementModel() : super(_keyTableName);
  AnnouncementModel.clone() : this();

  /// Mimic a clone due to Flutter not using reflection
  @override
  clone(Map<String, dynamic> map) => AnnouncementModel.clone()..fromJson(map);

  static const String _keyTableName = 'Announcement';
  static const String keyObjectId = 'objectId';
  static const String keyAnnouncement = 'announcement';
  static const String keyApproveList = 'approveList';
  static const String keyDeclineList = 'declineList';
  static const String keyDeclineReason = 'declineReasonsList';
  static const String keyCreatedAt = 'createdAt';

  String? get announcement => get<String?>(keyAnnouncement);

  List? get approveList => get<List?>(keyApproveList);
  set approve(String? approve) => setAddUnique(keyApproveList, approve);

  List? get declineList => get<List?>(keyDeclineList);
  set decline(String? decline) => setAddUnique(keyDeclineList, decline);

  set declineReason(Map<String, dynamic>? decline) =>
      setAddUnique(keyDeclineReason, decline);
}
