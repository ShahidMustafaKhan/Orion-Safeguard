import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:orion_safeguard/core/exceptions/app_exceptions.dart';
import 'package:orion_safeguard/modules/dashboard/model/shifts_model/shifts_model.dart';
import 'package:orion_safeguard/repository/shifts/shifts_repository.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../utils/time_utils.dart';

class ShiftsHttpRepository implements ShiftsRepository {
  @override
  Future<ShiftModel?> getOnGoingShifts(String? objectId) async {
    final queryBuilder = QueryBuilder<ShiftModel>(ShiftModel())
      ..whereEqualTo('employee', {
        '__type': 'Pointer',
        'className': '_User',
        'objectId': objectId,
      })
      ..whereEqualTo(
          ShiftModel.keyShiftStatus, ShiftModel.keyShiftStatusOngoing)
      ..whereGreaterThan(ShiftModel.keyEndDate, currentTime())
      ..whereValueExists(ShiftModel.keyCheckInTime, true)
      ..whereValueExists(ShiftModel.keyCheckInProof, true)
      ..orderByDescending(ShiftModel.keyCreatedAt)
      ..includeObject([
        ShiftModel.keyEmployee,
      ]);

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      debugPrint("ongoing shift success${response.results!.first}");
      return response.results!.first as ShiftModel;
    } else {
      debugPrint("ongoing shift${response.error?.message}");
      throw AppException(response.error?.message ?? 'Failed to fetch shifts');
    }
  }

  @override
  Future<List<ShiftModel>> getUpcomingShifts(String? objectId) async {
    final queryBuilder = QueryBuilder<ShiftModel>(ShiftModel())
      ..whereEqualTo('employee', {
        '__type': 'Pointer',
        'className': '_User',
        'objectId': objectId,
      })
      ..whereContainedIn(
        ShiftModel.keyShiftStatus,
        [
          ShiftModel.keyShiftStatusUpcoming,
          ShiftModel.keyShiftStatusApproved,
        ],
      )
      ..whereGreaterThan(ShiftModel.keyEndDate, currentTime())
      ..includeObject([
        ShiftModel.keyEmployee,
      ]);

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      return response.results!.map((json) => json as ShiftModel).toList();
    } else {
      throw AppException(response.error?.message ?? 'Failed to fetch shifts');
    }
  }

  @override
  Future<List<ShiftModel>> getPreviousShifts(String? objectId) async {
    final queryBuilder = QueryBuilder<ShiftModel>(ShiftModel())
      ..whereEqualTo('employee', {
        '__type': 'Pointer',
        'className': '_User',
        'objectId': objectId,
      })
      ..whereContainedIn(
        ShiftModel.keyShiftStatus,
        [
          ShiftModel.keyShiftStatusRejected,
          ShiftModel.keyShiftStatusCompleted,
          ShiftModel.keyShiftStatusMissed,
        ],
      )
      ..includeObject([
        ShiftModel.keyEmployee,
      ]);

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      return response.results!.map((json) => json as ShiftModel).toList();
    } else {
      throw AppException(response.error?.message ?? 'Failed to fetch shifts');
    }
  }

  @override
  Future<ShiftModel?> approve(ShiftModel shiftModel) async {
    shiftModel.shiftStatus = ShiftModel.keyShiftStatusApproved;
    final response = await shiftModel.save();
    if (response.success && response.results != null) {
      return response.results!.first as ShiftModel;
    } else {
      throw AppException(response.error?.message ?? 'Something went wrong');
    }
  }

  @override
  Future<ShiftModel?> decline(
      ShiftModel shiftModel, String? declineReason) async {
    shiftModel.shiftStatus = ShiftModel.keyShiftStatusRejected;
    shiftModel.declineReason = declineReason;
    final response = await shiftModel.save();
    if (response.success && response.results != null) {
      return response.results!.first as ShiftModel;
    } else {
      throw AppException(response.error?.message ?? 'Something went wrong');
    }
  }

  @override
  Future<ShiftModel?> checkIn(ShiftModel shiftModel, File file) async {
    shiftModel.shiftStatus = ShiftModel.keyShiftStatusOngoing;
    shiftModel.checkInTime = currentTime();
    shiftModel.checkInProof = ParseFile(file);
    final response = await shiftModel.save();
    if (response.success && response.results != null) {
      return response.results!.first as ShiftModel;
    } else {
      throw AppException(response.error?.message ?? 'Something went wrong');
    }
  }

  @override
  Future<ShiftModel?> checkOut(ShiftModel shiftModel, File file) async {
    shiftModel.shiftStatus = ShiftModel.keyShiftStatusCompleted;
    shiftModel.checkOutTime = currentTime();
    shiftModel.checkOutProof = ParseFile(file);
    final response = await shiftModel.save();
    if (response.success && response.results != null) {
      return response.results!.first as ShiftModel;
    } else {
      throw AppException(response.error?.message ?? 'Something went wrong');
    }
  }

  @override
  Future<List<ShiftModel>> getCompletedShifts(String? objectId) async {
    final queryBuilder = QueryBuilder<ShiftModel>(ShiftModel())
      ..whereEqualTo('employee', {
        '__type': 'Pointer',
        'className': '_User',
        'objectId': objectId,
      })
      ..whereEqualTo(
          ShiftModel.keyShiftStatus, ShiftModel.keyShiftStatusCompleted)
      ..whereValueExists(ShiftModel.keyCheckInTime, true)
      ..whereValueExists(ShiftModel.keyCheckOutTime, true)
      ..orderByDescending(ShiftModel.keyCreatedAt)
      ..includeObject([
        ShiftModel.keyEmployee,
      ]);

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      return response.results!.map((json) => json as ShiftModel).toList();
    } else {
      throw AppException(response.error?.message ?? 'Failed to fetch shifts');
    }
  }

  @override
  Future<List<ShiftModel>> getActiveShifts(String? objectId) async {
    final queryBuilder = QueryBuilder<ShiftModel>(ShiftModel())
      ..whereEqualTo('employee', {
        '__type': 'Pointer',
        'className': '_User',
        'objectId': objectId,
      })
      ..whereContainedIn(ShiftModel.keyShiftStatus, [
        ShiftModel.keyShiftStatusApproved,
        ShiftModel.keyShiftStatusUpcoming,
        ShiftModel.keyShiftStatusOngoing,
      ])
      ..orderByDescending(ShiftModel.keyCreatedAt)
      ..includeObject([
        ShiftModel.keyEmployee,
      ]);

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      return response.results!.map((json) => json as ShiftModel).toList();
    } else {
      throw AppException(response.error?.message ?? 'Failed to fetch shifts');
    }
  }

  @override
  Future<List<ShiftModel>> getRecords(String? objectId) async {
    final queryBuilder = QueryBuilder<ShiftModel>(ShiftModel())
      ..whereEqualTo('employee', {
        '__type': 'Pointer',
        'className': '_User',
        'objectId': objectId,
      })
      ..whereContainedIn(
        ShiftModel.keyShiftStatus,
        [
          ShiftModel.keyShiftStatusRejected,
          ShiftModel.keyShiftStatusCompleted,
          ShiftModel.keyShiftStatusMissed,
        ],
      )
      ..includeObject([
        ShiftModel.keyEmployee,
      ]);

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      return response.results!.map((json) => json as ShiftModel).toList();
    } else {
      throw AppException(response.error?.message ?? 'Failed to fetch shifts');
    }
  }
}
