import 'package:orion_safeguard/core/services/session_controller/session_controller.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../core/exceptions/app_exceptions.dart';
import '../../modules/alerts_announcements/model/announcement_model.dart';
import '../../modules/profile/model/user_model.dart';
import 'alerts_repository.dart';

class AlertsHttpRepository implements AlertsRepository {
  @override
  Future<List<AnnouncementModel>> getAlerts({int skip = 0}) async {
    final queryBuilder = QueryBuilder<AnnouncementModel>(AnnouncementModel())
      ..setAmountToSkip(skip)
      ..setLimit(7)
      ..orderByDescending(AnnouncementModel.keyCreatedAt);

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      return response.results!
          .map((json) => json as AnnouncementModel)
          .toList();
    } else {
      throw AppException(response.error?.message ?? 'Failed to fetch alerts');
    }
  }

  @override
  Future<AnnouncementModel> approve(
      AnnouncementModel announcementModel, String objectId) async {
    announcementModel.approve = objectId;
    ParseResponse parseResponse = await announcementModel.save();
    if (parseResponse.success && parseResponse.results != null) {
      return parseResponse.results!.first as AnnouncementModel;
    } else {
      throw AppException(parseResponse.error?.message ?? 'Failed to approve');
    }
  }

  @override
  Future<AnnouncementModel> decline(AnnouncementModel announcementModel,
      String? objectId, String? reason) async {
    Map<String, dynamic> decline = {
      'reason': reason ?? '',
      UserModel.keyObjectId: objectId ?? '',
    };
    announcementModel.declineReason = decline;
    announcementModel.decline = objectId;
    ParseResponse parseResponse = await announcementModel.save();
    if (parseResponse.success && parseResponse.results != null) {
      return parseResponse.results!.first as AnnouncementModel;
    } else {
      throw AppException(parseResponse.error?.message ?? 'Failed to approve');
    }
  }

  @override
  Future<AnnouncementModel?> latestAnnouncement() async {
    final queryBuilder = QueryBuilder<AnnouncementModel>(AnnouncementModel())
      ..orderByDescending(AnnouncementModel.keyCreatedAt)
      ..whereNotEqualTo(
          AnnouncementModel.keyApproveList, SessionController().objectId)
      ..whereNotEqualTo(
          AnnouncementModel.keyDeclineList, SessionController().objectId)
      ..setLimit(1);

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      return response.results!.first as AnnouncementModel;
    } else {
      throw AppException(
          response.error?.message ?? 'Failed to fetch latest announcement');
    }
  }
}
