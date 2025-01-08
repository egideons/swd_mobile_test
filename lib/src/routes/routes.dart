import 'package:get/get.dart';
import 'package:swd_mobile_app_test/app/auth/login/login_screen.dart';
import 'package:swd_mobile_app_test/app/auth/signup/signup_screen.dart';
import 'package:swd_mobile_app_test/app/auth/verify_email/verify_email_screen.dart';
import 'package:swd_mobile_app_test/app/home/home_screen.dart';
import 'package:swd_mobile_app_test/src/controllers/home_controller.dart';
import 'package:swd_mobile_app_test/src/controllers/login_controller.dart';
import 'package:swd_mobile_app_test/src/controllers/signup_controller.dart';
import 'package:swd_mobile_app_test/src/controllers/verify_email_controller.dart';

class Routes {
  //Splash screens
  static const login = "/login";
  static const signup = "/signup";
  static const verifyEmail = "/verify-email";
  static const home = "/home";

  //========================= GET PAGES ==========================\\
  static final getPages = [
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      binding: BindingsBuilder(() => Get.lazyPut<LoginController>(
            () => LoginController(),
          )),
    ),
    GetPage(
      name: signup,
      page: () => const SignupScreen(),
      binding: BindingsBuilder(() => Get.lazyPut<SignupController>(
            () => SignupController(),
          )),
    ),
    GetPage(
      name: verifyEmail,
      page: () => const VerifyEmailScreen(),
      binding: BindingsBuilder(() => Get.lazyPut<VerifyEmailController>(
            () => VerifyEmailController(),
          )),
    ),
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      binding: BindingsBuilder(() => Get.lazyPut<HomeController>(
            () => HomeController(),
          )),
    ),
  ];
}
