import 'package:orion_safeguard/core/services/session_controller/session_controller.dart';

bool isApproved(List list) {
  String? objectId = SessionController().objectId;
  return objectId != null && list.contains(objectId);
}

bool isDeclined(List list) {
  String? objectId = SessionController().objectId;
  return objectId != null && list.contains(objectId);
}
