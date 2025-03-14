import 'package:flutter/material.dart';

import '../../../../../config/constants/app_colors.dart';
import '../../../../../config/routes/nav_router.dart';
import '../../../../../ui/button/primary_button.dart';
import '../../../../shift_details/pages/check_in_out_page.dart';
import '../../../model/shifts_model/shifts_model.dart';

class CheckOutButton extends StatelessWidget {
  final ShiftModel? shiftsModel;
  const CheckOutButton({
    super.key,
    required this.shiftsModel,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      height: 50,
      hMargin: 0,
      backgroundColor: AppColors.green,
      borderRadius: 16.0,
      onPressed: () {
        NavRouter.push(
            context,
            CheckInOutPage(
              shiftsModel: shiftsModel,
            ));
      },
      title: "Check-Out",
    );
  }
}
