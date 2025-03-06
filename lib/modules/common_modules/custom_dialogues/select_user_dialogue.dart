import 'package:flutter/material.dart';
import 'package:orion_safeguard/constants/app_text_styles.dart';
import 'package:orion_safeguard/constants/constants.dart';
import 'package:orion_safeguard/modules/common_modules/custom_dialogues/apply_for_account_approval_dialogue.dart';
import 'package:orion_safeguard/ui/button/primary_button.dart';
import 'package:orion_safeguard/utils/heights_and_widths.dart';
import 'package:sizer/sizer.dart';

import '../../../config/routes/nav_router.dart';
import '../../../generated/assets.dart';
import '../../job_application/pages/stepper_page.dart';

class SelectUserDialogue extends StatelessWidget {
  const SelectUserDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Assets.pngQuestionMark,
              height: buttonHeight,
              width: 60.0,
            ),
            h0P4,
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Select between the two option are you an existing employee or New Applying for the job?",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: AppTextStyles.robotoMedium(
                      fontSize: 16.sp, fontWeight: FontWeight.w400)),
            ),
            h2,
            PrimaryButton(
              onPressed: () {
                NavRouter.pop(context);
                showDialog(
                    context: context,
                    builder: (context) =>
                        const ApplyForAccountApprovalDialogue());
              },
              title: "Existing Employee",
              hMargin: 0,
              borderRadius: 14.0,
              height: buttonHeight,
              backgroundColor: AppColors.primaryColor,
            ),
            PrimaryButton(
              vMargin: 0,
              onPressed: () {
                NavRouter.pop(context);
                NavRouter.push(context, const JobApplicationPage());
              },
              title: "Applying for the employment",
              hMargin: 0,
              borderRadius: 14.0,
              height: buttonHeight,
            ),
          ],
        ),
      ),
    );
  }
}
