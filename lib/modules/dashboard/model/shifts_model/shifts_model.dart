import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../../profile/model/user_model.dart';

class ShiftModel extends ParseObject implements ParseCloneable {
  ShiftModel() : super(_keyTableName);
  ShiftModel.clone() : this();

  /// Mimic a clone due to Flutter not using reflection
  @override
  clone(Map<String, dynamic> map) => ShiftModel.clone()..fromJson(map);

  static const String _keyTableName = 'Shifts';
  static const String keyObjectId = 'objectId';
  static const String keyShiftName = 'name';
  static const String keyDescription = 'description';
  static const String keyLocation = 'location';
  static const String keyStartDate = 'startDate';
  static const String keyEndDate = 'endDate';
  static const String keyShiftStatus = 'status';
  static const String keyShiftStatusUpcoming = 'upcoming';
  static const String keyShiftStatusOngoing = 'ongoing';
  static const String keyShiftStatusCompleted = 'completed';
  static const String keyShiftStatusApproved = 'approved';
  static const String keyShiftStatusMissed = 'missed';
  static const String keyShiftStatusRejected = 'rejected';
  static const String keyCheckInTime = 'checkInTime';
  static const String keyCheckOutTime = 'checkOutTime';
  static const String keyCheckInProof = 'checkInProof';
  static const String keyCheckOutProof = 'checkOutProof';
  static const String keyShiftType = 'type';
  static const String keyEmployeeResponse = 'employeeResponse';
  static const String keyEmployee = 'employee';
  static const String keyCreatedAt = 'createdAt';
  static const String keyDeclineReason = 'declineReason';
  static const String keyCheckOutApproval = 'checkOutApproval';

  String? get shiftName => get<String?>(keyShiftName);

  String? get description => get<String?>(keyDescription);

  String? get location => get<String?>(keyLocation);

  DateTime? get startDate => get<DateTime?>(keyStartDate);

  DateTime? get endDate => get<DateTime?>(keyEndDate);

  String? get shiftStatus => get<String?>(keyShiftStatus);
  set shiftStatus(String? shiftStatus) =>
      set<String?>(keyShiftStatus, shiftStatus);

  DateTime? get checkInTime => get<DateTime?>(keyCheckInTime);
  set checkInTime(DateTime? checkInTime) =>
      set<DateTime?>(keyCheckInTime, checkInTime);

  DateTime? get checkOutTime => get<DateTime?>(keyCheckOutTime);
  set checkOutTime(DateTime? checkOutTime) =>
      set<DateTime?>(keyCheckOutTime, checkOutTime);

  ParseFile? get checkInProof => get<ParseFile?>(keyCheckInProof);
  set checkInProof(ParseFile? checkInProof) =>
      set<ParseFile?>(keyCheckInProof, checkInProof);

  ParseFile? get checkOutProof => get<ParseFile?>(keyCheckOutProof);
  set checkOutProof(ParseFile? checkOutProof) =>
      set<ParseFile?>(keyCheckOutProof, checkOutProof);

  String? get shiftType => get<String?>(keyShiftType);

  String? get employeeResponse => get<String?>(keyEmployeeResponse);
  set employeeResponse(String? employeeResponse) =>
      set<String?>(keyEmployeeResponse, employeeResponse);

  UserModel? get employee => get<UserModel?>(keyEmployee);

  String? get declineReason => get<String?>(keyDeclineReason);
  set declineReason(String? reason) => set<String?>(keyDeclineReason, reason);

  bool get checkOutApproval => get<bool?>(keyCheckOutApproval) ?? false;
  set checkOutApproval(bool checkOutApproval) =>
      set<bool?>(keyCheckOutApproval, checkOutApproval);
}
