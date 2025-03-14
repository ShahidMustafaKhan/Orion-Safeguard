import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../config/constants/parse_server_keys.dart';
import '../../modules/profile/model/user_model.dart';

Future<void> initParseServer() async {
  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyParseClientKey, // Required for some setups
      debug: true, // When enabled, prints logs to console
      liveQueryUrl: keyLiveQueryUrl, // Required if using LiveQuery
      registeredSubClassMap: subClassMap,
      autoSendSessionId: true,
      parseUserConstructor: (username, password, email,
              {client, debug, sessionToken}) =>
          UserModel(
              username, password, email), // Required for authentication and ACL
      coreStore:
          CoreStoreMemoryImp()); // Non persistent mode (default): Sdk will store everything in memory instead of using Sembast as an internal DB.
}

Map<String, ParseObjectConstructor> subClassMap =
    <String, ParseObjectConstructor>{};
