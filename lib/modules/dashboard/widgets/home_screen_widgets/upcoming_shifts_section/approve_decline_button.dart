import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/modules/shift_details/cubits/shift_detail_cubits/shift_details_cubit.dart';

import '../../../../../config/constants/app_colors.dart';
import '../../../../../config/routes/nav_router.dart';
import '../../../../../ui/button/primary_button.dart';
import '../../../../../utils/dialogs/confirmation_dialog.dart';
import '../../../../../utils/heights_and_widths.dart';
import '../../../model/shifts_model/shifts_model.dart';

class ApproveDeclineButton extends StatelessWidget {
  const ApproveDeclineButton({
    super.key,
    required this.shiftModel,
  });

  final ShiftModel? shiftModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
          height: 50,
          hMargin: 0,
          backgroundColor: AppColors.primaryColor,
          borderRadius: 16.0,
          onPressed: () {
            context.read<ShiftDetailCubit>().approve(shiftModel);
          },
          title: "Approve",
        ),
        h0P5,
        PrimaryOutlineButton(
          height: 50,
          borderRadius: 16.0,
          titleColor: AppColors.primaryColor,
          borderColor: AppColors.primaryColor,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => const ConfirmationDialog(
                      title: 'Confirmation',
                      message: 'Are you sure you want to decline this shift?',
                    )).then((value) {
              if (value == true) {
                NavRouter.pop(context);
              }
            });
          },
          title: "Decline",
        )
      ],
    );
  }
}
