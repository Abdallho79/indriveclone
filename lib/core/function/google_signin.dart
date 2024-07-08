
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<Map<String, dynamic>?> signInWithGoogle() async {
  try {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final FirebaseAuth auth = FirebaseAuth.instance;

    // تسجيل خروج المستخدم الحالي من Google (إن وجد)
    await googleSignIn.signOut();

    // بدء عملية تسجيل الدخول
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      // العملية ألغيت من قبل المستخدم
      return null;
    }

    // الحصول على بيانات المستخدم
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // إنشاء بيانات الاعتماد لتسجيل الدخول إلى Firebase
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // تسجيل الدخول إلى Firebase باستخدام بيانات الاعتماد
    UserCredential userCredential = await auth.signInWithCredential(credential);
    User? user = userCredential.user;

    if (user != null) {
      // إنشاء خريطة تحتوي على بيانات المستخدم
      final Map<String, dynamic> userData = {
        'name': user.displayName,
        'email': user.email,
        'uid': user.uid,
        'photoUrl': user.photoURL,
        'accessToken': googleAuth.accessToken,
        'idToken': googleAuth.idToken,
      };

      return userData;
    }

    return null;
  } catch (e) {
    return null;
  }
}
