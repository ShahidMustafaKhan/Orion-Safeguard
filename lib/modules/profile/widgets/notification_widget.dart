import 'package:flutter/material.dart';

import '../../../config/constants/app_text_styles.dart';

class NotificationsWidget extends StatefulWidget {
  NotificationsWidget({super.key});

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  bool _isSwitched = true;

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
              Transform.scale(
                scale: 0.7,
                child: Switch(
                  value: _isSwitched,
                  onChanged: (bool value) {
                    setState(() {
                      _isSwitched = value;
                    });
                  },
                  activeTrackColor: Colors.black,
                  activeColor: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
