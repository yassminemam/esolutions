import 'package:esolutions/model/user.dart';
import 'package:esolutions/viewmodel/repo/remote/auth_api.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  AuthApi _authApi = Get.find<AuthApi>();
  RxString password = "".obs;
  RxString email = "".obs;

  void loginUser({required AppUser userInfo}) async {
    await _authApi.firebaseLoginUser(userInfo: userInfo);
  }
  void signupUser({required AppUser userInfo}) async {
    await _authApi.firebaseSignUpUser(userInfo: userInfo);
  }

  void loginWithGoogle() async {
    await _authApi.sgnInWithGoogle();
  }
}
