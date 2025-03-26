import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/validators/validators.dart';
import '../../../../job_application/widget/custom_date_picker.dart';
import '../../../cubit/signup/signup_cubit.dart';

class InputDateBirth extends StatefulWidget {
  const InputDateBirth({
    super.key,
    required this.dateBirthFocusNode,
    required this.emailFocusNode,
  });

  final FocusNode dateBirthFocusNode;
  final FocusNode emailFocusNode;

  @override
  State<InputDateBirth> createState() => _InputDateBirthState();
}

class _InputDateBirthState extends State<InputDateBirth> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(() {
      context.read<SignUpCubit>().onDateBirthChanged(controller.text);
    });
    super.initState();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, next) => previous.dateBirth != next.dateBirth,
        builder: (context, state) {
          return DatePickerTextField(
            hintText: "Enter your Date of Birth",
            firstDate: 1940,
            controller: controller,
            text: "Date of Birth",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your Date of Birth';
              } else if (Validators.isEighteenOrOlder(value) == false) {
                return "You must be at least 18 years old.";
              }
              return null;
            },
            borderRadius: 20.0,
            borderColor: Colors.black,
            verticalPadding: 17.0,
            titleSize: 15.0,
            focusNode: widget.dateBirthFocusNode,
            nextFocusNode: widget.emailFocusNode,
            fieldTitle: "Date of Birth",
            fillColor: Colors.transparent,
            iconColor: Colors.black,
          );
        });
  }
}
