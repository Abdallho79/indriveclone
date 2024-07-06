// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// Future<Map<String, dynamic>?> signInWithFacebook() async {
//   try {
//     print("==============1=====================");
//     // Trigger the sign-in flow
//     final LoginResult loginResult = await FacebookAuth.instance.login();
//     print("==============2=====================");

//     if (loginResult.status == LoginStatus.success) {
//       // Get the user data
//       final userData = await FacebookAuth.instance.getUserData();
//       return userData;
//     } else {
//       print('Failed to log in: ${loginResult.message}');
//       return null;
//     }
//   } catch (e) {
//     print('Error during Facebook sign in: $e');
//     return null;
//   }
// }
