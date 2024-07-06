// ignore_for_file: empty_catches

import 'package:firebase_auth/firebase_auth.dart';

String? verfid;
void phoneNumberSignUp(String phoneNumber) async {
  // print("==========${countrykey}" + "${phoneNumber}+++++++++");
  await FirebaseAuth.instance.verifyPhoneNumber(
    // timeout: Duration(seconds: 50),
    phoneNumber: phoneNumber,
    verificationCompleted: (PhoneAuthCredential credential) {},
    verificationFailed: (FirebaseAuthException e) {
      // print(e);
    },
    codeSent: (String verificationId, int? resendToken) async {
      verfid = verificationId;
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
  );
}

sendCodeOTP(String smsCodeUser, Function function) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    String smsCode = smsCodeUser;
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verfid!, smsCode: smsCode);
    await auth.signInWithCredential(credential).then((onValue) {
      if (onValue.user != null) {
        function();
      }
    });
  } catch (e) {}
}
