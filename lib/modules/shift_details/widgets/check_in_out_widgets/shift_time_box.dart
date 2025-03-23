import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_text_styles.dart';
import '../../../../utils/heights_and_widths.dart';
import '../../../../utils/time_utils.dart';
import '../../../dashboard/model/shifts_model/shifts_model.dart';
import '../../cubits/check_in_out_cubits/check_in_out_cubit.dart';

class ShiftTimeBox extends StatelessWidget {
  final ShiftModel? shiftsModel;
  const ShiftTimeBox({super.key, required this.shiftsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xfff3dcdf),
        borderRadius: BorderRadius.circular(
          18.0,
        ),
      ),
      child: BlocBuilder<CheckInOutCubit, CheckInOutState>(
          buildWhen: (previous, next) => previous.now != next.now,
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  shiftsModel?.shiftStatus == ShiftModel.keyShiftStatusCompleted
                      ? 'Shift Completed'
                      : "Your Shift ${shiftsModel?.shiftStatus == ShiftModel.keyShiftStatusOngoing ? "ends" : "starts"} in",
                  style: AppTextStyles.robotoBold(
                    fontSize: 15.sp,
                  ),
                ),
                if (shiftsModel?.shiftStatus !=
                    ShiftModel.keyShiftStatusCompleted)
                  Text(
                    shiftsModel?.shiftStatus == ShiftModel.keyShiftStatusOngoing
                        ? timeDifferenceTillNow(shiftsModel?.endDate, state.now)
                        : timeLeftUntil(shiftsModel!.startDate!, state.now,
                            showAsClockFormat: false),
                    style: AppTextStyles.robotoSemiBold(
                      fontSize: 15.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                h1,
                Text(
                  shiftsModel?.shiftStatus ==
                              ShiftModel.keyShiftStatusOngoing ||
                          shiftsModel?.shiftStatus ==
                              ShiftModel.keyShiftStatusCompleted
                      ? timeAddedToNow(shiftsModel!.checkInTime!, state.now,
                          showAsClockFormat: true)
                      : "00:00:00",
                  style: AppTextStyles.robotoSemiBold(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  shiftsModel?.shiftStatus == ShiftModel.keyShiftStatusOngoing
                      ? "You can’t check-out before ${formatDateTimeIn12HourFormat(shiftsModel?.endDate)}"
                      : shiftsModel?.shiftStatus ==
                              ShiftModel.keyShiftStatusCompleted
                          ? "You have checked out of this shift"
                          : "You can’t check-in before ${formatDateTimeIn12HourFormat(shiftsModel?.startDate)}",
                  style: AppTextStyles.robotoSemiBold(
                    fontSize: 15.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
