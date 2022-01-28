import 'package:esolutions/viewmodel/repo/remote/auth_api.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<AuthApi>(() =>AuthApi());
  }
}
