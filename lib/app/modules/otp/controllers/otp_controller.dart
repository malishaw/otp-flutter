import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test_app/app/routes/app_pages.dart';
import 'package:get_test_app/app/services/auth_services.dart';

class OtpController extends GetxController {
  //TODO: Implement OtpController

  var codeController = TextEditingController();
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  validate() async {
    isLoading(true);
    await AuthService.signInWithOtp(smsCode: codeController.text.trim())
        .then((value) {
      isLoading(false);
      if (value) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar('Error', 'Invalid OTP');
      }
    });
  }
}
