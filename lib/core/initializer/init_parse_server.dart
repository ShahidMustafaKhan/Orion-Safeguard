import 'package:orion_safeguard/modules/alerts_announcements/model/announcement_model.dart';
import 'package:orion_safeguard/modules/job_application/model/job_application_model.dart';
import 'package:orion_safeguard/modules/profile/model/contact_us_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../config/constants/parse_server_keys.dart';
import '../../modules/dashboard/model/shifts_model/shifts_model.dart';
import '../../modules/notification/model/notification_model.dart';
import '../../modules/profile/model/user_model.dart';

Future<void> initParseServer() async {
  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyParseClientKey, // Required for some setups
      debug: true, // When enabled, prints logs to console
      liveQueryUrl: keyLiveQueryUrl, // Required if using LiveQuery
      connectivityProvider: CustomParseConnectivityProvider(),
      registeredSubClassMap: subClassMap,
      autoSendSessionId: true,
      parseUserConstructor: (username, password, email,
              {client, debug, sessionToken}) =>
          UserModel(
              username, password, email), // Required for authentication and ACL
      coreStore:
          CoreStoreMemoryImp()); // Non persistent mode (default): Sdk will store everything in memory instead of using Sembast as an internal DB.
}

class CustomParseConnectivityProvider extends ParseConnectivityProvider {
  @override
  Future<ParseConnectivityResult> checkConnectivity() =>
      Future.value(ParseConnectivityResult.wifi);

  @override
  Stream<ParseConnectivityResult> get connectivityStream =>
      Stream<ParseConnectivityResult>.empty();
}

Map<String, ParseObjectConstructor> subClassMap =
    <String, ParseObjectConstructor>{
  UserModel.keyTableName: () => UserModel(null, null, null),
  ShiftModel.keyTableName: () => ShiftModel(),
  AnnouncementModel.keyTableName: () => AnnouncementModel(),
  NotificationModel.keyTableName: () => NotificationModel(),
  JobApplicationModel.keyTableName: () => JobApplicationModel(),
  ContactUsModel.keyTableName: () => ContactUsModel(),
};
