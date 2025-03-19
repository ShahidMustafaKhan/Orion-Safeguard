import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/modules/shift_details/cubits/shift_detail_cubits/shift_details_cubit.dart';

import '../../../../../config/constants/app_colors.dart';
import '../../../../../config/routes/nav_router.dart';
import '../../../../../ui/button/primary_button.dart';
import '../../../../shift_details/pages/check_in_out_page.dart';
import '../../../model/shifts_model/shifts_model.dart';

class CheckInButton extends StatelessWidget {
  final ShiftModel? shiftsModel;
  const CheckInButton({
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
            )).then((value) {
          context.read<ShiftDetailCubit>().getShiftDetail(shiftsModel);
        });
      },
      title: "Check-In",
    );
  }
}
