import 'package:flutter/material.dart';

void customAlertDialog({
  required BuildContext context,
  required Widget child,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    transitionDuration: const Duration(milliseconds: 150),
    pageBuilder: (context, anim1, anim2) {
      return const SizedBox();
    },
    transitionBuilder: (context, anim1, anim2, _) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.5, end: 1).animate(anim1),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0.5, end: 1).animate(anim1),
          child: AlertDialog(
            backgroundColor: Colors.white,
            titlePadding:
                const EdgeInsets.only(left: 0, top: 32, right: 0, bottom: 16),
            contentPadding:
                const EdgeInsets.only(left: 16, top: 26, right: 16, bottom: 16),
            content: child,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none),
          ),
        ),
      );
    },
  );
}
