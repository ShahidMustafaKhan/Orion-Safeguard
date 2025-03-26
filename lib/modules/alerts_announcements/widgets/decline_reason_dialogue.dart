import 'package:flutter/material.dart';
import 'package:orion_safeguard/config/constants/app_colors.dart';
import 'package:orion_safeguard/ui/button/primary_button.dart';

import '../../../config/routes/nav_router.dart';
import '../../../ui/input/input_field.dart';
import '../../../utils/heights_and_widths.dart';

class InputReasonDialogue extends StatelessWidget {
  final String? fieldTitle;
  const InputReasonDialogue({super.key, this.fieldTitle});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    TextEditingController controller = TextEditingController();

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: key,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InputField(
                titleWeight: FontWeight.bold,
                titleSize: 14.0,
                maxLines: 4,
                controller: controller,
                label: "Enter text here...",
                borderRadius: 20.0,
                borderColor: Colors.black,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a reason";
                  }
                  return null;
                },
                boxConstraints: 12,
                verticalPadding: 22.0,
                fieldTitle: fieldTitle ?? "Reason of declining",
                hintColor: Colors.grey.shade600,
              ),
              h1,
              PrimaryButton(
                backgroundColor: AppColors.primaryColor,
                height: 50.0,
                borderRadius: 16.0,
                onPressed: () {
                  if (key.currentState!.validate()) {
                    NavRouter.pop(context,
                        {"reason": controller.text, "status": "submitted"});
                  }
                },
                title: "Submit",
              )
            ],
          ),
        ),
      ),
    );
  }
}
