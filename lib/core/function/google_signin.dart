import 'package:google_sign_in/google_sign_in.dart';

Future<Map<String, dynamic>?> signInWithGoogle() async {
  try {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    // تسجيل خروج المستخدم الحالي من Google (إن وجد)
    await googleSignIn.signOut();

    // بدء عملية تسجيل الدخول
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      // العملية ألغيت من قبل المستخدم
      print("=======google null===========");
      return null;
    }

    // الحصول على بيانات المستخدم
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // إنشاء بيانات المستخدم
    final Map<String, dynamic> userData = {
      'name': googleUser.displayName,
      'email': googleUser.email,
      'uid': googleUser.id,
      'photoUrl': googleUser.photoUrl,
      'accessToken': googleAuth.accessToken,
      'idToken': googleAuth.idToken,
    };
    print("============================");
    print(googleUser.photoUrl);
    print("============================");

    return userData;
  } catch (e) {
    print("=======google error===========");

    return null;
  }
}
