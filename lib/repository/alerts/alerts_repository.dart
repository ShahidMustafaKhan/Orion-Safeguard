import 'package:orion_safeguard/modules/alerts_announcements/model/announcement_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../modules/profile/model/user_model.dart';

abstract class AlertsRepository {
  Future<List<AnnouncementModel>> getAlerts(
      {int skip = 0, UserModel? userModel});
  Future<AnnouncementModel> approve(
      AnnouncementModel announcementModel, String objectId);
  Future<AnnouncementModel> decline(
      AnnouncementModel announcementModel, String? objectId, String? reason);
  Future<AnnouncementModel?> latestAnnouncement(UserModel? userModel);
  QueryBuilder latestAnnouncementQuery(UserModel? userModel);
}
