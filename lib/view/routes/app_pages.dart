import 'package:esolutions/main.dart';
import 'package:esolutions/view/create_account_page.dart';
import 'package:esolutions/view/home_page.dart';
import 'package:esolutions/viewmodel/auth_bindings.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      fullscreenDialog: true,
      binding: InitialBindings(),
    ),
    GetPage(
      name: AppRoutes.CRETE_ACCOUNT,
      page: () => CreateAccountPage(),
      fullscreenDialog: true,
      binding: InitialBindings(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      fullscreenDialog: true,
      binding: InitialBindings(),
    )
  ];
}