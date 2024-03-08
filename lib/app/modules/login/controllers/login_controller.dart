import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test_app/app/routes/app_pages.dart';
import 'package:get_test_app/app/services/auth_services.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  var phoneController = TextEditingController();
  var key = GlobalKey<FormState>();
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
    if (key.currentState!.validate()) {
      isLoading(true);
      await AuthService.sendOtp(
          phone: phoneController.text.trim(),
          onCodeSent: () {
            isLoading(false);
            Get.toNamed(Routes.OTP);
          });
    }
  }
}
