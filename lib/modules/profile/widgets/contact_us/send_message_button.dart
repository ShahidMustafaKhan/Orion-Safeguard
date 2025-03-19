import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/modules/profile/cubit/profile_cubit/profile_cubit.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../ui/button/primary_button.dart';
import '../../../../utils/display/display_utils.dart';
import '../../../../utils/enums.dart';
import '../../cubit/contact_us/contact_us_cubit.dart';

class SendMessageButton extends StatelessWidget {
  final formKey;
  const SendMessageButton({
    super.key,
    this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactUsCubit, ContactUsState>(
        listenWhen: (previous, next) => previous.status != next.status,
        listener: (context, state) {
          if (state.status == PostApiStatus.success) {
            DisplayUtils.showSuccessToast(context, 'Message sent successfully');
          }
          if (state.status == PostApiStatus.error) {
            DisplayUtils.showErrorToast(
                context, state.errorMessage ?? 'Something went wrong');
          }
        },
        buildWhen: (previous, next) => previous.status != next.status,
        builder: (context, state) {
          return PrimaryButton(
            fontSize: 16.0,
            height: 50,
            hMargin: 0,
            backgroundColor: AppColors.primaryColor,
            borderRadius: 16.0,
            loading: state.status == PostApiStatus.loading,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<ContactUsCubit>().sendContactUsMessage(
                    context.read<ProfileCubit>().state.userModel.data);
              }
            },
            title: "Send",
          );
        });
  }
}
