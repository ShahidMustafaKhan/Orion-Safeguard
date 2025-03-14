import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orion_safeguard/config/constants/app_colors.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:orion_safeguard/modules/screen_layout_widget/screen_layout.dart';
import 'package:orion_safeguard/ui/button/primary_button.dart';
import 'package:orion_safeguard/utils/display/display_utils.dart';
import 'package:orion_safeguard/utils/image_picker.dart';

import '../../../generated/assets.dart';
import '../../../utils/enums.dart';
import '../../../utils/heights_and_widths.dart';
import '../../dashboard/model/shifts_model/shifts_model.dart';
import '../cubits/check_in_out_cubits/check_in_out_cubit.dart';
import '../widgets/check_in_out_widgets/shift_time_box.dart';

class CheckInOutPage extends StatelessWidget {
  final ShiftModel? shiftsModel;
  const CheckInOutPage({super.key, required this.shiftsModel});

  @override
  Widget build(BuildContext context) {
    CheckInOutCubit checkInOutCubit = CheckInOutCubit(shift: shiftsModel);
    return BlocProvider<CheckInOutCubit>(
      create: (BuildContext context) => checkInOutCubit,
      child: BlocConsumer<CheckInOutCubit, CheckInOutState>(
          listenWhen: (previous, next) =>
              previous.errorMessage != next.errorMessage,
          listener: (context, state) {
            if (state.postApiStatus == PostApiStatus.error) {
              DisplayUtils.showErrorToast(
                  context, state.errorMessage ?? 'Something went wrong');
            }
          },
          buildWhen: (previous, next) =>
              previous.now != next.now || previous.now == next.now,
          builder: (context, state) {
            return OrionLayout(
                pageTitle:
                    state.shift?.shiftStatus == ShiftModel.keyShiftStatusOngoing
                        ? "Check Out"
                        : "Check In",
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ShiftTimeBox(
                          shiftsModel: shiftsModel,
                        ),
                      ),
                      h1,
                      Expanded(
                          flex: 6,
                          child: InkWell(
                            onTap: () async {
                              File? selfie = await ImagePickerService()
                                  .pickImageFromCamera();
                              if (selfie != null) {
                                context
                                    .read<CheckInOutCubit>()
                                    .uploadSelfie(selfie);
                              }
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(
                                    state.file != null ? 0 : 22.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xfff3dcdf),
                                    borderRadius: BorderRadius.circular(
                                      100.0,
                                    ),
                                    border: Border.all(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  child: state.file != null
                                      ? CircleAvatar(
                                          radius: 55,
                                          backgroundImage:
                                              FileImage(state.file!),
                                        )
                                      : SvgPicture.asset(
                                          Assets.svgCamera,
                                          height: 72,
                                          width: 72,
                                        ),
                                ),
                                h1,
                                Text(
                                  "Click on the camera to take a selfie",
                                  style: AppTextStyles.robotoRegular(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      PrimaryButton(
                        height: 50,
                        hMargin: 0,
                        backgroundColor: AppColors.primaryColor,
                        borderRadius: 16.0,
                        onPressed: () async {
                          if (state.shift?.shiftStatus ==
                              ShiftModel.keyShiftStatusOngoing) {
                            context.read<CheckInOutCubit>().checkOutFunc();
                          } else {
                            context.read<CheckInOutCubit>().checkInFunc();
                          }
                        },
                        title: state.shift?.shiftStatus ==
                                ShiftModel.keyShiftStatusOngoing
                            ? "Check-Out"
                            : "Check-In",
                      ),
                    ],
                  ),
                ));
          }),
    );
  }
}
