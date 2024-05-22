import 'package:flutter_base/app/widgets/my_custom_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopupDialog {
  // SuccessDialog
  static void showSuccessDialog(String message) {
    // ThemeData theme = Theme.of(Get.context!);
    var snackBar = SnackBar(
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      width: 300,
      backgroundColor: Theme.of(Get.context!).primaryColorLight,
      content: MyCustomText(message),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  // error messase
  static void showErrorMessage(String message) {
    // ThemeData theme = Theme.of(Get.context!);
    var snackBar = SnackBar(
      width: 300,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.up,
      backgroundColor: Colors.red,
      content: Text(message),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
  // Loading Dialog

  static showLoadingDialog() {
    ThemeData theme = Theme.of(Get.context!);
    return showDialog<void>(
      // Context
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Column(
          // for horizontal minHeight
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // for ertical minWidth
            Center(
              child: SizedBox(
                // dialog width
                width: 80,
                height: 80,
                child: Material(
                  elevation: 2,
                  // dialog color
                  shadowColor: Colors.black12,
                  // backgraund color
                  color: Colors.transparent,
                  // border radius
                  borderRadius: BorderRadius.circular(8),
                  // main body
                  /// DoubleBounce
                  /// SpinningLines
                  child: SpinKitSpinningLines(
                    color: theme.primaryColor,
                    size: 43, // You can customize the size
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // close dialog
  static void closeLoadingDialog() {
    Get.back();
  }
}
