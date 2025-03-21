import 'package:parse_server_sdk/parse_server_sdk.dart';

class NotificationModel extends ParseObject implements ParseCloneable {
  NotificationModel() : super(keyTableName);
  NotificationModel.clone() : this();

  /// Mimic a clone due to Flutter not using reflection
  @override
  clone(Map<String, dynamic> map) => NotificationModel.clone()..fromJson(map);

  static const String keyTableName = 'Notification';
  static const String keyObjectId = 'objectId';
  static const String keyTitle = 'title';
  static const String keyDescription = 'description';
  static const String keyType = 'type';
  static const String keyTypeAnnouncement = 'announcement';
  static const String keyTypeShiftChange = 'shiftChange';
  static const String keyTypeUpComingShift = 'upComingShift';
  static const String keyStatus = 'status';
  static const String keyStatusRead = 'read';
  static const String keyStatusUnread = 'unread';
  static const String keyCreatedAt = 'createdAt';
  static const String keyMarkedReadCloudJob = 'markNotificationsRead';

  String? get title => get<String?>(keyTitle);

  String? get description => get<String?>(keyDescription);

  String? get type => get<String?>(keyType);

  String? get status => get<String?>(keyStatus);
  set status(String? status) => set<String?>(keyStatus, status);
}
