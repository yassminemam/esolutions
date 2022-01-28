import 'package:esolutions/model/user.dart';
import 'package:esolutions/view/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthApi {
  // OnBoarding Apis
  Future firebaseLoginUser({required AppUser userInfo}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: userInfo.email!, password: userInfo.password!)
          .whenComplete(() {
        Get.offAllNamed(AppRoutes.HOME);
      });
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future firebaseSignUpUser({required AppUser userInfo}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: userInfo.email!, password: userInfo.password!)
          .whenComplete(() {
        Get.back();
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future sgnInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential).whenComplete(() => Get.offAllNamed(AppRoutes.HOME));
  }
}
