import 'package:flutter/material.dart';

import '../config/routes/nav_router.dart';
import '../modules/dashboard/pages/base_screen.dart';
import '../modules/job_application/pages/stepper_page.dart';
import '../modules/profile/model/user_model.dart';

class NavigationHelper {
  static void handleNavigation(BuildContext context, UserModel? user) {
    switch (user?.accountStatus) {
      case UserModel.keyAccountStatusTypeApplying:
        if (user?.employmentStatus == UserModel.keyEmploymentStatusApplying) {
          NavRouter.pushAndRemoveUntil(context, const JobApplicationPage());
        } else {
          NavRouter.pushAndRemoveUntil(context, const JobApplicationPage());
        }
        break;
      case UserModel.keyAccountStatusTypePending:
        NavRouter.pushAndRemoveUntil(context, const BaseScreen());
      case UserModel.keyAccountStatusTypeApproved:
        NavRouter.pushAndRemoveUntil(context, const BaseScreen());
        break;
      case UserModel.keyAccountStatusTypeRejected:
        NavRouter.pushAndRemoveUntil(context, const BaseScreen());
        break;
      case UserModel.keyAccountStatusTypeFreezed:
        NavRouter.pushAndRemoveUntil(context, const BaseScreen());
        break;
    }
  }
}
