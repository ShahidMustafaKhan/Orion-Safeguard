import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orion_safeguard/modules/dashboard/model/shifts_model/shifts_model.dart';
import 'package:orion_safeguard/modules/records/cubit/records_cubit.dart';
import 'package:orion_safeguard/modules/screen_layout_widget/base_view_layout.dart';
import 'package:orion_safeguard/utils/heights_and_widths.dart';
import 'package:orion_safeguard/utils/helper_widgets.dart';
import 'package:orion_safeguard/utils/time_utils.dart';
import 'package:sizer/sizer.dart';

import '../../../config/constants/app_text_styles.dart';
import '../../../generated/assets.dart';
import '../widgets/record_widget.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<RecordsCubit>().fetchRecords();
    return Scaffold(
      body: BaseViewLayout(
        pageTitle: 'Records',
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textAlign: TextAlign.left,
                    "Records",
                    style: AppTextStyles.robotoRegular(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        textAlign: TextAlign.left,
                        "Filters",
                        style: AppTextStyles.robotoRegular(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      ),
                      w1,
                      SvgPicture.asset(
                        Assets.svgFilter,
                        height: 12,
                        width: 12,
                      ),
                    ],
                  )
                ],
              ),
              h0P5,
              Expanded(
                child: BlocBuilder<RecordsCubit, RecordsState>(
                    buildWhen: (previous, next) =>
                        previous.records != next.records,
                    builder: (context, state) {
                      List<ShiftModel> records = state.records.data ?? [];
                      return ListView.separated(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8.0,
                          ),
                          itemBuilder: (context, index) {
                            int divisor =
                                index; // Ensure the divisor is a valid number
                            bool isCompleted =
                                divisor != 0 && 2 % divisor == 0; // Safe check

                            return RecordWidget(
                              name: records[index].shiftName,
                              location: records[index].location,
                              date: formatDateTimeRange(
                                  records[index].startDate,
                                  records[index].startDate),
                              isCompleted: records[index].shiftStatus ==
                                      ShiftModel.keyShiftStatusCompleted
                                  ? true
                                  : false,
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return customDivider(thickness: 1.2);
                          },
                          itemCount: records.length);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
