import 'package:dio/dio.dart';
import 'package:flutter_base/app/routes/app_pages.dart';
import 'package:flutter_base/app/services/controller/base_controller.dart';
import 'package:flutter_base/app/utils/logger.dart';
import 'package:flutter_base/app/utils/urls.dart';
import 'package:flutter_base/app/widgets/popup_dialogs.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  RxString password = "".obs;
  RxInt passwordLength = 6.obs;
  List<String> numberList = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "*",
    "0",
    "*",
  ];
  // **** Login *****
  void login() async {
    if (password.value.length == passwordLength.value) {
      Map<String, dynamic> data = {"auth_pin": password.value};
      try {
        PopupDialog.showLoadingDialog();
        // var res = await BaseController.to.apiService
        //     .makePostRequest("${URLS.baseURL}${URLS.login}", data);
        var res = await Dio()
            .post(URLS.login, data: data);
        // kLogger.d(res.data);
        // PopupDialog.closeLoadingDialog();
        if (res.statusCode == 200 || res.statusCode == 201) {
          Get.offAllNamed(Routes.ENTRY_POINT);
          PopupDialog.showSuccessDialog("Login success");
        } else {
          PopupDialog.showErrorMessage("password is not valid");
        }
        kLogger.e(res.data);
      } catch (e) {
        kLogger.e('Error from %%%% login %%%% => $e');
        PopupDialog.closeLoadingDialog();
      }
    } else {
      PopupDialog.showErrorMessage("The password should be 6 character");
    }
  }

  removePassword() {
    if (password.value.isNotEmpty) {
      password.value = password.value.substring(0, password.value.length - 1);
    }
  }

  addPassword(String characterToAdd) {
    if (password.value.length < 6) {
      password.value += characterToAdd;
      // kLogger.e(password.value);
    }
  }
}
