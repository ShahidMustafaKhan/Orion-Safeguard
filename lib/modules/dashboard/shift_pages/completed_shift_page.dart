import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/modules/dashboard/model/shifts_model/shifts_model.dart';
import 'package:orion_safeguard/utils/helper_widgets.dart';

import '../../../utils/time_utils.dart';
import '../../screen_layout_widget/completed_shifts_widget.dart';
import '../cubits/my_shifts_cubits/my_shifts_cubit.dart';

class CompletedShiftPage extends StatefulWidget {
  const CompletedShiftPage({super.key});

  @override
  State<CompletedShiftPage> createState() => _CompletedShiftPageState();
}

class _CompletedShiftPageState extends State<CompletedShiftPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<MyShiftsCubit, MyShiftsState>(
          buildWhen: (previous, next) =>
              previous.completedShifts != next.completedShifts,
          builder: (context, state) {
            List<ShiftModel> completedShifts = state.completedShifts.data ?? [];
            return ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: completedShifts.length,
              itemBuilder: (context, index) {
                return CompletedShiftsWidget(
                  name: completedShifts[index].shiftName,
                  location: completedShifts[index].location,
                  date: formatDateTimeRange(completedShifts[index].startDate,
                      completedShifts[index].endDate),
                  checkIn:
                      formatTo24HourTime(completedShifts[index].checkInTime),
                  checkOut:
                      formatTo24HourTime(completedShifts[index].checkOutTime),
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
          }),
    );
  }
}
