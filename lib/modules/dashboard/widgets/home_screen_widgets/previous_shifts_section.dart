import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/heights_and_widths.dart';
import '../../../../utils/helper_widgets.dart';
import '../../../../utils/time_utils.dart';
import '../../../screen_layout_widget/custom_see_all_row.dart';
import '../../../screen_layout_widget/previous_shift_widget.dart';
import '../../cubits/home_cubits/home_cubit.dart';
import '../../model/shifts_model/shifts_model.dart';

class PreviousShiftsSection extends StatelessWidget {
  const PreviousShiftsSection({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().previousShift();
    return BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, next) =>
            previous.previousShifts != next.previousShifts,
        builder: (context, state) {
          List<ShiftModel> previousShifts = state.previousShifts.data ?? [];
          return Column(
            children: [
              CustomSeeAllRowWidget(
                firstTextSize: 16.0,
                secondTextSize: 12.0,
                secondText: 'See all',
                text: 'Previous shifts',
                fun: () {
                  // NavRouter.pushAndRemoveUntil(context,  AllProductsScreen());
                },
              ),
              h1,
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    itemCount:
                        previousShifts.length > 7 ? 7 : previousShifts.length,
                    itemBuilder: (context, index) {
                      return PreviousShiftWidget(
                        shiftName: previousShifts[index].shiftName ?? '',
                        location: previousShifts[index].location ?? '',
                        date: formatDateTimeRange(
                            previousShifts[index].startDate,
                            previousShifts[index].endDate),
                        status: previousShifts[index].shiftStatus ?? '',
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return customDivider(
                        vPadding: 0.0,
                        hPadding: 10.0,
                      );
                    },
                  )),
              h9,
            ],
          );
        });
  }
}
