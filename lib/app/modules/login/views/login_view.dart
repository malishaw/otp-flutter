import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFE8ECF4),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      "assets/google.png",
                      height: 200,
                    ),
                  ),
                ),
                Text(
                  'Login with phone number',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: controller.key,
                  child: TextFormField(
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) => value!.isEmpty
                        ? 'Please enter phone number'
                        : value.length < 10
                            ? 'Please enter valid phone number'
                            : null,
                    decoration: InputDecoration(
                      hintText: 'Phone number',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
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
                      return CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      );
                    }
                    return Text('Send OTP',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white));
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
