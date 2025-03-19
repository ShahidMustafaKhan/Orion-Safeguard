import 'package:orion_safeguard/modules/alerts_announcements/model/announcement_model.dart';

abstract class AlertsRepository {
  Future<List<AnnouncementModel>> getAlerts({int skip = 0});
  Future<AnnouncementModel> approve(
      AnnouncementModel announcementModel, String objectId);
  Future<AnnouncementModel> decline(
      AnnouncementModel announcementModel, String? objectId, String? reason);
  Future<AnnouncementModel?> latestAnnouncement();
}
