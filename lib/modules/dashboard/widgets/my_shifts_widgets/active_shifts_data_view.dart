import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/nav_router.dart';
import '../../../../utils/heights_and_widths.dart';
import '../../../../utils/time_utils.dart';
import '../../../screen_layout_widget/active_shift_widget.dart';
import '../../../shift_details/pages/check_in_out_page.dart';
import '../../cubits/my_shifts_cubits/my_shifts_cubit.dart';
import '../../model/shifts_model/shifts_model.dart';
import 'active_shifts_loading_view.dart';

class ActiveShiftsDataView extends StatelessWidget {
  const ActiveShiftsDataView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MyShiftsState state = context.read<MyShiftsCubit>().state;
    List<ShiftModel> activeShifts = state.activeShifts.data ?? [];
    return ListView.separated(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 85),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: activeShifts.length + (state.hasMoreDataActiveShift ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == (activeShifts.length - 1) &&
            state.hasMoreDataActiveShift) {
          context.read<MyShiftsCubit>().activeShifts(loadMore: true);
        }
        if (index == (activeShifts.length) && state.hasMoreDataActiveShift) {
          return ActiveShiftLoadingWidget();
        }
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
          approveCallback: () =>
              context.read<MyShiftsCubit>().approve(activeShifts[index]),
          declineCallback: (String? value) =>
              context.read<MyShiftsCubit>().decline(activeShifts[index], value),
          objectId: activeShifts[index].objectId ?? '',
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return h1P5;
      },
    );
  }
}
