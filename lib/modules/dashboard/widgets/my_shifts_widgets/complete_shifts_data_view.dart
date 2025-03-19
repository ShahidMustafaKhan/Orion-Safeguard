import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/helper_widgets.dart';
import '../../../../utils/time_utils.dart';
import '../../../screen_layout_widget/completed_shifts_widget.dart';
import '../../cubits/my_shifts_cubits/my_shifts_cubit.dart';
import '../../model/shifts_model/shifts_model.dart';
import 'completed_shifts_loading_view.dart';

class CompletedShiftDataView extends StatelessWidget {
  const CompletedShiftDataView({
    super.key,
    required this.completedShifts,
  });

  final List<ShiftModel> completedShifts;

  @override
  Widget build(BuildContext context) {
    MyShiftsState state = context.read<MyShiftsCubit>().state;
    return ListView.separated(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 100),
      shrinkWrap: true,
      itemCount:
          completedShifts.length + (state.hasMoreDataCompletedShift ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == (completedShifts.length - 1) &&
            state.hasMoreDataCompletedShift) {
          context.read<MyShiftsCubit>().completedShifts(loadMore: true);
        }
        if (index == (completedShifts.length) &&
            state.hasMoreDataCompletedShift) {
          return CompletedShiftsLoadingWidget();
        }

        return CompletedShiftsWidget(
          name: completedShifts[index].shiftName,
          location: completedShifts[index].location,
          date: formatDateTimeRange(
              completedShifts[index].startDate, completedShifts[index].endDate),
          checkIn: formatTo24HourTime(completedShifts[index].checkInTime),
          checkOut: formatTo24HourTime(completedShifts[index].checkOutTime),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return customDivider(
          hPadding: 10.0,
          thickness: 1.2,
          color: Colors.grey.shade300,
        );
      },
    );
  }
}
