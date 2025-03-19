import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/modules/profile/cubit/profile_cubit/profile_cubit.dart';

import '../../../config/constants/app_text_styles.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.left,
          "Notifications",
          style: AppTextStyles.robotoRegular(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20.0,
              ),
              border: Border.all(
                color: Colors.grey.shade300,
              )),
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reminders & Alerts",
                style: AppTextStyles.robotoRegular(
                  fontSize: 14.0,
                ),
              ),
              BlocBuilder<ProfileCubit, ProfileState>(
                  buildWhen: (previous, next) =>
                      previous.userModel != next.userModel,
                  builder: (context, state) {
                    return Transform.scale(
                      scale: 0.7,
                      child: Switch(
                        value: state.userModel.data?.alerts ?? true,
                        onChanged: (bool value) {
                          context.read<ProfileCubit>().updateAlert(value);
                        },
                        activeTrackColor: Colors.black,
                        activeColor: Colors.white,
                      ),
                    );
                  }),
            ],
          ),
        )
      ],
    );
  }
}
