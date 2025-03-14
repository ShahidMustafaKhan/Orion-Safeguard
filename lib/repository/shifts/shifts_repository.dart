import 'dart:io';

import '../../modules/dashboard/model/shifts_model/shifts_model.dart';

abstract class ShiftsRepository {
  Future<ShiftModel?> getOnGoingShifts(String? objectId);
  Future<List<ShiftModel>> getUpcomingShifts(String? objectId);
  Future<List<ShiftModel>> getPreviousShifts(String? objectId);

  Future<ShiftModel?> approve(ShiftModel shiftModel);
  Future<ShiftModel?> decline(ShiftModel shiftModel, String? declineReason);

  Future<ShiftModel?> checkIn(ShiftModel shiftModel, File file);
  Future<ShiftModel?> checkOut(ShiftModel shiftModel, File file);

  Future<List<ShiftModel>> getCompletedShifts(String? objectId);
  Future<List<ShiftModel>> getActiveShifts(String? objectId);

  Future<List<ShiftModel>> getRecords(String? objectId);
}
