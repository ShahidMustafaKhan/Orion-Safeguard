import 'package:flutter/material.dart';
import 'package:orion_safeguard/modules/job_application/pages/stepper_view.dart';

import '../config/routes/nav_router.dart';
import '../modules/account_status/pages/disapproved_account_page.dart';
import '../modules/account_status/pages/frozen_account_page.dart';
import '../modules/account_status/pages/under_review_page.dart';
import '../modules/dashboard/pages/base_screen.dart';
import '../modules/profile/model/user_model.dart';

class NavigationHelper {
  static void handleNavigation(BuildContext context, UserModel? user) {
    switch (user?.accountStatus) {
      case UserModel.keyAccountStatusTypeApplying:
        if (user?.employmentStatus == UserModel.keyEmploymentStatusApplying) {
          NavRouter.pushAndRemoveUntil(context, const JobApplicationView());
        } else {
          NavRouter.pushAndRemoveUntil(context, const UnderReviewPage());
        }
        break;
      case UserModel.keyAccountStatusTypePending:
        NavRouter.pushAndRemoveUntil(context, const UnderReviewPage());
      case UserModel.keyAccountStatusTypeApproved:
        NavRouter.pushAndRemoveUntil(context, const BaseScreen());
        break;
      case UserModel.keyAccountStatusTypeRejected:
        NavRouter.pushAndRemoveUntil(context, const DisapprovedAccountPage());
        break;
      case UserModel.keyAccountStatusTypeFreezed:
        NavRouter.pushAndRemoveUntil(context, const FrozenAccountPage());
        break;
    }
  }
}
