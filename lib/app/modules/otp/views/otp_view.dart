import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_test_app/app/data/themes.dart';
import 'package:pinput/pinput.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Enter OTP',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Pinput(
              controller: controller.codeController,
              length: 6,
              defaultPinTheme: AppThemes.defaultPinTheme,
              focusedPinTheme: AppThemes.focusedPinTheme,
              submittedPinTheme: AppThemes.submittedPinTheme,
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => print(pin),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                minimumSize: MaterialStateProperty.all(Size(Get.width, 50)),
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: () {
                controller.validate();
              },
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  );
                }
                return Text('Submit',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
