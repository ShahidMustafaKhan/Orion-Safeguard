// import 'package:flutter/material.dart';
// import 'package:orion_safeguard/constants/constants.dart';
// import 'package:orion_safeguard/utils/heights_and_widths.dart';
// import 'package:sizer/sizer.dart';
//
// class CustomRadioButtonGroup extends StatelessWidget {
//   final String title; // Title of the group
//   final String selectedValue; // The currently selected value
//   final List<String> options; // List of options (e.g., ["Yes", "No"])
//   final ValueChanged<String> onChanged; // Callback when the value changes
//
//   const CustomRadioButtonGroup({
//     Key? key,
//     required this.title,
//     required this.selectedValue,
//     required this.options,
//     required this.onChanged,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             color: Colors.black,
//             // fontSize: 16.0,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         h1,
//         Row(
//           children: options.map((option) {
//             return Expanded(
//               child: GestureDetector(
//                 onTap: () => onChanged(option),
//                 child: Container(
//                   padding: EdgeInsets.only(
//                       top: 4, bottom: 4, left: 13.sp, right: 6.sp),
//                   margin: const EdgeInsets.symmetric(
//                     horizontal: 4,
//                   ),
//                   decoration: BoxDecoration(
//                     color: AppColors.grey,
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(
//                       color: Colors.grey,
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(option),
//                       Radio<String>(
//                         value: option,
//                         groupValue: selectedValue,
//                         onChanged: (value) {
//                           if (value != null) onChanged(value);
//                         },
//                         activeColor: Colors.black,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:orion_safeguard/constants/constants.dart';
import 'package:orion_safeguard/utils/heights_and_widths.dart';
import 'package:sizer/sizer.dart';

class CustomRadioButtonGroup extends StatelessWidget {
  final String title; // Title of the group
  final String selectedValue; // The currently selected value
  final List<String> options; // List of options (e.g., ["Yes", "No"])
  final ValueChanged<String> onChanged; // Callback when the value changes

  const CustomRadioButtonGroup({
    Key? key,
    required this.title,
    required this.selectedValue,
    required this.options,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        h1,
        Row(
          children: options.map((option) {
            return Expanded(
              child: GestureDetector(
                onTap: () => onChanged(option),
                child: Container(
                  padding: EdgeInsets.only(
                      top: 4, bottom: 4, left: 13.sp, right: 6.sp),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(
                      14.0,
                    ),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(option),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Icon(
                          selectedValue == option
                              ? Icons
                                  .check_circle // Display check icon when selected
                              : Icons.radio_button_unchecked,
                          // Default icon when not selected
                          color: selectedValue == option
                              ? Colors.black // Color when selected
                              : Colors.grey, // Color when not selected
                          size: 24, // Icon size
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
