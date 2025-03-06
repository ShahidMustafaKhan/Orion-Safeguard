import 'package:flutter/material.dart';
import 'package:orion_safeguard/constants/app_colors.dart';
import 'package:orion_safeguard/ui/button/primary_button.dart';

import '../../../config/routes/nav_router.dart';
import '../../../ui/input/input_field.dart';
import '../../../utils/heights_and_widths.dart';

class DeclineReasonDialogue extends StatelessWidget {
  const DeclineReasonDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InputField(
              titleWeight: FontWeight.bold,
              titleSize: 14.0,
              maxLines: 4,
              controller: TextEditingController(),
              label: "Enter text here...",
              borderRadius: 20.0,
              borderColor: Colors.black,
              boxConstraints: 12,
              verticalPadding: 22.0,
              fieldTitle: "Reason of declining",
              hintColor: Colors.grey.shade600,
            ),
            h1,
            PrimaryButton(
              backgroundColor: AppColors.primaryColor,
              height: 50.0,
              borderRadius: 16.0,
              onPressed: () {
                NavRouter.pop(context);
              },
              title: "Submit",
            )
          ],
        ),
      ),
    );
  }
}
