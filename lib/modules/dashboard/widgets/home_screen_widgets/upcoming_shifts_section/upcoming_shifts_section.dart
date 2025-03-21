import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/modules/dashboard/widgets/home_screen_widgets/upcoming_shifts_section/upcoming_shifts_loading_view.dart';

import '../../../../../config/routes/nav_router.dart';
import '../../../../../utils/enums.dart';
import '../../../../../utils/heights_and_widths.dart';
import '../../../../../utils/time_utils.dart';
import '../../../../screen_layout_widget/custom_see_all_row.dart';
import '../../../../screen_layout_widget/shift_name_widget.dart';
import '../../../../shift_details/pages/upcoming_shift_details_page.dart';
import '../../../cubits/dashboard_cubits/dashboard_cubit.dart';
import '../../../cubits/home_cubits/home_cubit.dart';
import '../../../model/shifts_model/shifts_model.dart';

class UpComingShiftsSection extends StatelessWidget {
  const UpComingShiftsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, next) =>
            previous.upcomingShifts != next.upcomingShifts,
        builder: (context, state) {
          List<ShiftModel> upcomingShifts = state.upcomingShifts.data ?? [];

          if (state.upcomingShifts.status == Status.error) {
            return SizedBox();
          }

          return Column(
            children: [
              CustomSeeAllRowWidget(
                secondText: 'See all',
                text: 'Up Coming Shifts',
                firstTextSize: 16.0,
                secondTextSize: 12.0,
                fun: () {
                  context.read<DashboardCubit>().changePage(1);
                },
              ),
              if (state.upcomingShifts.status == Status.loading)
                UpcomingShiftsLoadingView()
              else
                SizedBox(
                  height: 130,
                  child: ListView.separated(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return UpComingShiftWidget(
                          shiftName: upcomingShifts[index].shiftName ?? '',
                          location: upcomingShifts[index].location ?? '',
                          date: formatDateTime(upcomingShifts[index].createdAt),
                          onDetailView: () {
                            NavRouter.push(
                                context,
                                UpcomingShiftDetailsPage(
                                    shiftModel: upcomingShifts[index]));
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return w2P5;
                      },
                      itemCount: upcomingShifts.length),
                ),
              h1,
            ],
          );
        });
  }
}
