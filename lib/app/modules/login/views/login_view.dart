import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth_services.dart';
import '../controllers/login_controller.dart';

// class LoginView extends GetView<LoginController> {
//   const LoginView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: true,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: 100,),
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: const Color(0xFFE8ECF4),
//                   ),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Image.asset(
//                     "assets/logo.jpg",
//                     height: 200,
//                   ),
//                 ),
//               ),
//               Text(
//                 'Login with phone number',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//
//               // Obx(() => Container(
//               //   padding: EdgeInsets.only(left: 20),
//               //   decoration: BoxDecoration(
//               //     border: Border.all(
//               //       color: Colors.blue, // Border color
//               //       width: 2.0, // Border width
//               //     ),
//               //     borderRadius: BorderRadius.circular(10.0), // Border roundness
//               //   ),
//               //   child: Row(
//               //     children: [
//               //       DropdownButton<String>(
//               //         value: controller.selectedCountryCode.value,
//               //         onChanged: (String? value) {
//               //           controller.updateCountryCode(value!);
//               //         },
//               //         items: <String>['+94', '+91', '+44', '+86', '+355', '+213'] // Add more country codes as needed
//               //             .map<DropdownMenuItem<String>>((String value) {
//               //           return DropdownMenuItem<String>(
//               //             value: value,
//               //             child: Text(value),
//               //           );
//               //         }).toList(),
//               //       ),
//               //       Expanded(
//               //         child: TextFormField(
//               //           controller: controller.phoneController,
//               //           keyboardType: TextInputType.phone,
//               //           validator: (value) {
//               //             if (value == null || value.isEmpty) {
//               //               return 'Please enter phone number';
//               //             } else if (value.length < 10) {
//               //               return 'Please enter valid phone number';
//               //             }
//               //             return null;
//               //           },
//               //           decoration: InputDecoration(
//               //             hintText: 'Phone number',
//               //             hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
//               //             focusedBorder: OutlineInputBorder(
//               //               borderRadius: BorderRadius.circular(10.0),
//               //               borderSide: BorderSide(color: Colors.transparent, width: 1.0),
//               //             ),
//               //             enabledBorder: OutlineInputBorder(
//               //               borderRadius: BorderRadius.circular(10.0),
//               //               borderSide: BorderSide(color: Colors.transparent, width: 1.0),
//               //             ),
//               //           ),
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // )),
//               // Form(
//               //   key: controller.key,
//               //   child: IntlPhoneField(
//               //     decoration: InputDecoration(
//               //       labelText: 'Phone Number',
//               //       border: OutlineInputBorder(
//               //         borderSide: BorderSide(),
//               //       ),
//               //     ),
//               //     initialCountryCode: 'LK',
//               //     onChanged: (phone) {
//               //        controller.phoneController = phone.completeNumber,
//               //       print(phone.completeNumber);
//               //     },
//               //   ),
//               // ),
//
//
//               Form(
//                 key: controller.key,
//                 child: TextFormField(
//
//                   controller: controller.phoneController,
//                   keyboardType: TextInputType.phone,
//                   validator: (value) => value!.isEmpty
//                       ? 'Please enter phone number'
//                       : value.length < 10
//                           ? 'Please enter valid phone number'
//                           : null,
//                   decoration: InputDecoration(
//
//                     hintText: 'Phone number',
//                     hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: BorderSide(color: Colors.blue, width: 2.0),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: BorderSide(color: Colors.black, width: 2.0),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                 style: ButtonStyle(
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                   padding: MaterialStateProperty.all(EdgeInsets.all(15)),
//                   minimumSize: MaterialStateProperty.all(Size(Get.width, 50)),
//                   backgroundColor: MaterialStateProperty.all(Colors.blue),
//                 ),
//                 onPressed: () {
//                   controller.validate();
//                 },
//                 child: Obx(() {
//                   if (controller.isLoading.value) {
//                     return CircularProgressIndicator(
//                       valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                     );
//                   }
//                   return Text('Send OTP',
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white));
//                 }),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var selectedCountryCode = '+94'; // Default country code
  var phoneController = TextEditingController();
  var key = GlobalKey<FormState>();
  var isLoading = false;

  sendOtp(String phone, context) async {

    try{
      await AuthService.sendOtp(
          phone: phone,
          onCodeSent: () {
            isLoading= false;
            Get.toNamed(Routes.OTP);
          });
    }catch(e){
      print(e);
      setState(() {
        isLoading= false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Something went wrong! Error:$e'),
          duration: Duration(seconds: 2),
        ),
      );
    }

    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
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
                    "assets/logo.jpg",
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

           Container(
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue, // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(10.0), // Border roundness
                ),
                child: Row(
                  children: [
                    DropdownButton<String>(
                      value: selectedCountryCode,
                      onChanged: (String? value) {
                        setState(() {
                          selectedCountryCode = value!;
                        });
                      },
                      items: <String>['+94', '+91', '+44', '+86', '+355', '+213'] // Add more country codes as needed
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter phone number';
                          } else if (value.length < 10) {
                            return 'Please enter valid phone number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Phone number',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Form(
              //   key: controller.key,
              //   child: IntlPhoneField(
              //     decoration: InputDecoration(
              //       labelText: 'Phone Number',
              //       border: OutlineInputBorder(
              //         borderSide: BorderSide(),
              //       ),
              //     ),
              //     initialCountryCode: 'LK',
              //     onChanged: (phone) {
              //        controller.phoneController = phone.completeNumber,
              //       print(phone.completeNumber);
              //     },
              //   ),
              // ),

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
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    isLoading= true;
                  });
                  print('${selectedCountryCode+phoneController.text.trim()}');

                    sendOtp('${selectedCountryCode+phoneController.text.trim()}', context);


                },
                child:isLoading ?CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white))

                  : Text('Send OTP',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))

              ),
            ],
          ),
        ),
      ),
    );
  }
}