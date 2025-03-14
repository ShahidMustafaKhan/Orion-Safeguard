import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/config/config.dart';
import 'package:orion_safeguard/modules/dashboard/cubits/my_shifts_cubits/my_shifts_cubit.dart';
import 'package:orion_safeguard/modules/dashboard/model/shifts_model/shifts_model.dart';
import 'package:orion_safeguard/modules/shift_details/pages/check_in_out_page.dart';
import 'package:orion_safeguard/utils/display/display_utils.dart';

import '../../../utils/enums.dart';
import '../../../utils/heights_and_widths.dart';
import '../../../utils/time_utils.dart';
import '../../screen_layout_widget/active_shift_widget.dart';

class ActiveShiftPage extends StatefulWidget {
  const ActiveShiftPage({super.key});

  @override
  State<ActiveShiftPage> createState() => _ActiveShiftPageState();
}

class _ActiveShiftPageState extends State<ActiveShiftPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<MyShiftsCubit, MyShiftsState>(
          listenWhen: (previous, next) =>
              previous.approveStatus != next.approveStatus ||
              previous.declineStatus != next.declineStatus ||
              previous.message != next.message,
          listener: (context, state) {
            if (state.approveStatus == PostApiStatus.error ||
                state.declineStatus == PostApiStatus.error) {
              DisplayUtils.showErrorToast(context, state.message);
            } else if (state.declineStatus == PostApiStatus.success) {
              DisplayUtils.showSuccessToast(context, "Declined Successfully");
            }
          },
          buildWhen: (previous, next) =>
              previous.activeShifts != next.activeShifts,
          builder: (context, state) {
            List<ShiftModel> activeShifts = state.activeShifts.data ?? [];
            return ListView.separated(
              padding:
                  const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 85),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: activeShifts.length,
              itemBuilder: (context, index) {
                return ActiveShiftWidget(
                  isApproved: activeShifts[index].shiftStatus ==
                          ShiftModel.keyShiftStatusApproved ||
                      activeShifts[index].shiftStatus ==
                          ShiftModel.keyShiftStatusOngoing,
                  shiftName: activeShifts[index].shiftName ?? '',
                  location: activeShifts[index].location ?? '',
                  status: activeShifts[index].shiftStatus ?? '',
                  date: formatDateTime(activeShifts[index].createdAt),
                  shiftStatusCallback: () => NavRouter.push(
                      context,
                      CheckInOutPage(
                        shiftsModel: activeShifts[index],
                      )),
                  approveCallback: () => context
                      .read<MyShiftsCubit>()
                      .approve(activeShifts[index]),
                  declineCallback: (String? value) => context
                      .read<MyShiftsCubit>()
                      .decline(activeShifts[index], value),
                  objectId: activeShifts[index].objectId ?? '',
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return h1P5;
              },
            );
          }),
    );
  }
}
