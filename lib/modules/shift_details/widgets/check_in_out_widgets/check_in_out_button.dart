import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../ui/button/primary_button.dart';
import '../../../../utils/display/display_utils.dart';
import '../../../common_modules/custom_dialogues/check_out_approval_dialogue.dart';
import '../../../dashboard/cubits/dashboard_cubits/dashboard_cubit.dart';
import '../../../dashboard/cubits/home_cubits/home_cubit.dart';
import '../../../dashboard/model/shifts_model/shifts_model.dart';
import '../../cubits/check_in_out_cubits/check_in_out_cubit.dart';

class CheckInOutButton extends StatelessWidget {
  final ShiftModel? shift;
  const CheckInOutButton({
    super.key,
    this.shift,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return PrimaryButton(
        height: 50,
        hMargin: 0,
        backgroundColor:
            shift?.shiftStatus == ShiftModel.keyShiftStatusCompleted
                ? AppColors.green
                : AppColors.primaryColor,
        borderRadius: 16.0,
        onPressed: () async {
          if (shift?.shiftStatus == ShiftModel.keyShiftStatusOngoing) {
            context.read<CheckInOutCubit>().checkOutFunc(() => showDialog(
                        context: context,
                        builder: (context) => const CheckoutApprovalDialogue())
                    .then((value) {
                  if (value == true) {
                    context.read<CheckInOutCubit>().checkOutApproval(shift);
                  }
                }));
          } else if (shift?.shiftStatus == ShiftModel.keyShiftStatusCompleted) {
            context.read<DashboardCubit>().changePage(0);
            Navigator.popUntil(context, (route) => route.isFirst);
          } else {
            if (context.read<HomeCubit>().state.onGoingShifts.data?.objectId ==
                null) {
              context.read<CheckInOutCubit>().checkInFunc();
            } else {
              DisplayUtils.showErrorToast(context, "You have an ongoing shift");
            }
          }
        },
        title: shift?.shiftStatus == ShiftModel.keyShiftStatusCompleted
            ? "Go to HomePage"
            : shift?.shiftStatus == ShiftModel.keyShiftStatusOngoing
                ? "Check-Out"
                : "Check-In",
      );
    });
  }
}
