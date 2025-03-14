import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/modules/shift_details/pages/check_in_out_page.dart';
import 'package:sizer/sizer.dart';

import '../../../../../config/constants/app_colors.dart';
import '../../../../../config/constants/app_text_styles.dart';
import '../../../../../config/routes/nav_router.dart';
import '../../../../../generated/assets.dart';
import '../../../../../utils/heights_and_widths.dart';
import '../../../../../utils/helper_widgets.dart';
import '../../../../../utils/time_utils.dart';
import '../../../../screen_layout_widget/custom_see_all_row.dart';
import '../../../cubits/home_cubits/home_cubit.dart';
import '../../../model/shifts_model/shifts_model.dart';

class OngoingShiftsSection extends StatelessWidget {
  const OngoingShiftsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().ongoingShift();
    return Container(
        // height: 300,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, next) =>
                previous.onGoingShifts != next.onGoingShifts,
            builder: (context, state) {
              ShiftModel? onGoingShifts = state.onGoingShifts.data;
              return InkWell(
                onTap: () => NavRouter.push(
                    context,
                    CheckInOutPage(
                      shiftsModel: onGoingShifts,
                    )),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.sp, vertical: 13.sp),
                  child: Column(
                    children: [
                      CustomSeeAllRowWidget(
                        text: 'On Going Shift',
                        firstTextSize: 16.0,
                        secondText: 'CheckIn',
                        secondTextSize: 12.0,
                        textColor: AppColors.primaryColor,
                        fun: () {},
                      ),
                      customDivider(
                        vPadding: 4.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  onGoingShifts?.shiftName ?? '',
                                  style: AppTextStyles.robotoMedium(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  onGoingShifts?.location ?? '',
                                  style: AppTextStyles.robotoRegular(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                h2,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.svgCalender,
                                      height: 16.0,
                                      width: 16.0,
                                    ),
                                    w1,
                                    Text(
                                        formatDateTime(
                                            onGoingShifts?.createdAt),
                                        style: AppTextStyles.robotoRegular(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: TimerWidget(onGoingShifts: onGoingShifts))
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    super.key,
    required this.onGoingShifts,
  });

  final ShiftModel? onGoingShifts;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Timer',
          style: AppTextStyles.robotoMedium(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade500,
          ),
        ),
        Text(
          timeDifferenceTillNow(widget.onGoingShifts?.endDate, _now,
              showSeconds: true),
          textAlign: TextAlign.center,
          style: AppTextStyles.robotoMedium(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        ),
        Text(
          'Remaining',
          style: AppTextStyles.robotoMedium(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}
