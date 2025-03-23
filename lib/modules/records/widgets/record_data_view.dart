import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/modules/records/cubit/records_cubit.dart';
import 'package:orion_safeguard/modules/records/widgets/record_loading_view.dart';
import 'package:orion_safeguard/modules/records/widgets/record_widget.dart';

import '../../../utils/helper_widgets.dart';
import '../../../utils/time_utils.dart';
import '../../dashboard/model/shifts_model/shifts_model.dart';

class RecordDataView extends StatelessWidget {
  const RecordDataView({
    super.key,
    required this.records,
  });

  final List<ShiftModel> records;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordsCubit, RecordsState>(
        buildWhen: (previous, next) => previous.hasMoreData != next.hasMoreData,
        builder: (context, state) {
          return ListView.separated(
              padding: const EdgeInsets.only(
                  left: 12.0, right: 12, top: 8.0, bottom: 75),
              itemBuilder: (context, index) {
                if (index == (records.length - 1) && state.hasMoreData) {
                  context.read<RecordsCubit>().fetchRecords(loadMore: true);
                }
                if (index == (records.length) && state.hasMoreData) {
                  return RecordLoadingWidget();
                }

                return RecordWidget(
                  name: records[index].shiftName,
                  location: records[index].location,
                  date: formatDateTimeRange(
                      records[index].startDate, records[index].endDate),
                  isCompleted: records[index].shiftStatus ==
                          ShiftModel.keyShiftStatusCompleted
                      ? true
                      : false,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return customDivider(thickness: 1.2);
              },
              itemCount: records.length + (state.hasMoreData ? 1 : 0));
        });
  }
}
