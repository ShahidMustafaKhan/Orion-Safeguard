import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../config/constants/app_colors.dart';
import '../../../../../config/constants/app_text_styles.dart';
import '../../../../../utils/time_utils.dart';
import '../../../model/shifts_model/shifts_model.dart';

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
