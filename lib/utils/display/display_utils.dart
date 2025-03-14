import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

// import 'package:fluttertoast/fluttertoast.dart';

import '../../ui/widgets/loading_indicator.dart';

class DisplayUtils {
  static void showSnackBar(BuildContext context, String title) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(title)),
      );
  }

  static void showErrorToast(BuildContext context, String? title) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(8),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.red,
          title: "Error",
          messageText: Text(title ?? "Something went wrong"),
          positionOffset: 20,
          icon: const Icon(Icons.error, size: 28, color: Colors.white),
        )..show(context));
  }

  static void showSuccessToast(BuildContext context, String title) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(8),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.green,
          title: "Success",
          messageText: Text(title),
          positionOffset: 20,
        )..show(context));
  }

  static void showLoader() {
    BotToast.showCustomLoading(toastBuilder: (_) => const LoadingIndicator());
  }

  static void removeLoader() {
    BotToast.closeAllLoading();
  }
}
