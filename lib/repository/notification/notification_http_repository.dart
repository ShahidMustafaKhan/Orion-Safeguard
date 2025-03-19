import 'package:orion_safeguard/modules/notification/model/notification_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../core/exceptions/app_exceptions.dart';
import '../../modules/dashboard/model/shifts_model/shifts_model.dart';
import 'notification_repository.dart';

class NotificationHttpRepository implements NotificationRepository {
  @override
  Future<void> markNotificationsRead(String userId) async {
    final ParseCloudFunction function =
        ParseCloudFunction(NotificationModel.keyMarkedReadCloudJob);
    final ParseResponse response =
        await function.execute(parameters: {'objectId': userId});

    if (response.success) {
      return;
    } else {
      throw AppException("${response.error?.message}");
    }
  }

  @override
  Future<List<NotificationModel>> getNotifications(String objectId,
      {int? skip}) async {
    final queryBuilder = QueryBuilder<NotificationModel>(NotificationModel())
      ..whereEqualTo('employee', {
        '__type': 'Pointer',
        'className': '_User',
        'objectId': objectId,
      })
      ..orderByDescending(NotificationModel.keyCreatedAt)
      ..setLimit(9)
      ..setAmountToSkip(skip ?? 0)
      ..includeObject([
        ShiftModel.keyEmployee,
      ]);

    final response = await queryBuilder.query();

    if (response.success &&
        response.results != null &&
        response.results!.isNotEmpty) {
      return response.results!
          .map((json) => json as NotificationModel)
          .toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      throw AppException(
          response.error?.message ?? 'Failed to fetch notification');
    }
  }
}
