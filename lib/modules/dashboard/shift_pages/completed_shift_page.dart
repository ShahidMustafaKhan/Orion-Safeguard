import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/modules/dashboard/model/shifts_model/shifts_model.dart';

import '../../../utils/enums.dart';
import '../cubits/my_shifts_cubits/my_shifts_cubit.dart';
import '../widgets/my_shifts_widgets/active_shifts_empty_view.dart';
import '../widgets/my_shifts_widgets/complete_shifts_data_view.dart';
import '../widgets/my_shifts_widgets/completed_shifts_loading_view.dart';

class CompletedShiftPage extends StatefulWidget {
  const CompletedShiftPage({super.key});

  @override
  State<CompletedShiftPage> createState() => _CompletedShiftPageState();
}

class _CompletedShiftPageState extends State<CompletedShiftPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyShiftsCubit, MyShiftsState>(
        buildWhen: (previous, next) =>
            previous.completedShifts != next.completedShifts,
        builder: (context, state) {
          List<ShiftModel> completedShifts = state.completedShifts.data ?? [];

          if (state.completedShifts.status == Status.loading) {
            return CompletedShiftsLoadingView();
          }

          if (state.completedShifts.status == Status.error ||
              completedShifts.isEmpty) {
            return ShiftsEmptyView();
          }

          return CompletedShiftDataView(completedShifts: completedShifts);
        });
  }
}
