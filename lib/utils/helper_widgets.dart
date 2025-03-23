import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/di/service_locator.dart';
import '../core/services/storage_service/storage_service.dart';
import '../modules/dashboard/model/shifts_model/shifts_model.dart';

var storageService = StorageService(sharedPreferences: getIt());

Widget customDivider(
    {double? vPadding, double? hPadding, double? thickness, Color? color}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: vPadding ?? 12.0,
      horizontal: hPadding ?? 2.0,
    ),
    child: Divider(
      thickness: thickness ?? 0.6,
      color: color ?? Colors.grey.shade400,
    ),
  );
}

Widget customVerticalDivider({
  double? height = 20,
  double? thickness = 1,
  Color? color = Colors.grey,
}) {
  return Container(
    height: height,
    width: thickness,
    color: color,
  );
}

Future<void> openSocialMedia(String platform, String url) async {
  try {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Fallback to the browser if the app is not available
      throw 'Could not open $platform';
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}

String shiftStatus(String status,
    {bool removeWordShift = false, bool includeApproveKeyword = false}) {
  if (status == ShiftModel.keyShiftStatusCompleted) {
    return 'Completed ${removeWordShift ? '' : 'Shift'}';
  } else if (status == ShiftModel.keyShiftStatusRejected) {
    return 'Rejected';
  } else if (status == ShiftModel.keyShiftStatusMissed) {
    return 'Missed';
  } else if (status == ShiftModel.keyShiftStatusOngoing) {
    return 'Ongoing ${removeWordShift ? '' : 'Shift'}';
  } else if (status == ShiftModel.keyShiftStatusApproved) {
    return '${includeApproveKeyword ? 'Approved' : 'Up Coming'} ${removeWordShift ? '' : 'Shift'}';
  } else if (status == ShiftModel.keyShiftStatusUpcoming) {
    return 'Up Coming ${removeWordShift ? '' : 'Shift'}';
  } else {
    return '';
  }
}
