import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static String verificationId = '';
  static Future sendOtp(
      {required String phone, required Function onCodeSent}) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // await _auth.signInWithCredential(credential);
        return;
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String vId, int? resendToken) async {
        print('Code sent');
        verificationId = vId;
        onCodeSent();
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print('Time out');
      },
    );
  }

  static Future signInWithOtp({required String smsCode}) async {
    log(smsCode);
    log(verificationId);
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(phoneAuthCredential);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
