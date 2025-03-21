import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/modules/job_application/cubit/job_application_cubit.dart';
import 'package:orion_safeguard/modules/job_application/pages/stepper_page.dart';
import 'package:orion_safeguard/modules/profile/cubit/profile_cubit/profile_cubit.dart';

import '../../profile/model/user_model.dart';

class JobApplicationView extends StatelessWidget {
  const JobApplicationView({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel? userModel = context.read<ProfileCubit>().state.userModel.data;
    return BlocProvider<JobApplicationCubit>(
      create: (BuildContext context) => JobApplicationCubit(userModel!),
      child: JobApplicationPage(),
    );
  }
}
