import 'dart:developer';

import 'package:delightful_toast/delight_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swd_mobile_app_test/main.dart';
import 'package:swd_mobile_app_test/src/routes/routes.dart';
import 'package:swd_mobile_app_test/src/utils/containers/toast/message_alert_toast.dart';
import 'package:swd_mobile_app_test/theme/colors.dart';

class LoginController extends GetxController {
  static LoginController get instance {
    return Get.find<LoginController>();
  }

  @override
  void onClose() {
    emailEC.dispose();
    passwordEC.dispose();
    emailFN.dispose();
    passwordFN.dispose();
    super.onClose();
  }

  //=========== Keys =============\\
  final formKey = GlobalKey<FormState>();

  //=========== Variables =============\\
  var email = prefs.getString("email") ?? "";
  var password = prefs.getString("password") ?? "";

  //=========== Booleans =============\\
  var isLoading = false.obs;
  var passwordIsHidden = true.obs;

  //=========== Controllers =============\\
  var emailEC = TextEditingController();
  var passwordEC = TextEditingController();

  //=========== Focus Nodes =============\\
  var emailFN = FocusNode();
  var passwordFN = FocusNode();

  //=========== Functions =============\\

  String? validateEmail(dynamic value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    } else if (!GetUtils.isEmail(value)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  String? validatePassword(dynamic value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    return null;
  }

  togglePasswordVisibility() {
    passwordIsHidden.value = !passwordIsHidden.value;
  }

  emailOnChanged(String value) {
    if (value.isEmpty) {
    } else {}
  }

  passwordOnChanged(String value) {
    if (value.isEmpty) {
    } else {}
  }

  onFieldSubmitted(String value) {
    login();
  }

  login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      log("User details: Email: $email, Password: $password");
      if (email.isEmpty) {
        DelightToastBar(
            autoDismiss: true,
            builder: (context) {
              return MessageAlertToast(
                title: "Alert",
                message: "Please create an account",
                appLogo: "",
                color: kErrorColor,
              );
            }).show(Get.context!);
        return "Please create an account";
      } else {
        if (emailEC.text != email) {
          DelightToastBar(
              autoDismiss: true,
              builder: (context) {
                return MessageAlertToast(
                  title: "Error",
                  message: "Invalid Email",
                  appLogo: "",
                  color: kErrorColor,
                );
              }).show(Get.context!);
          return "Invalid email";
        } else if (passwordEC.text != password) {
          DelightToastBar(
              autoDismiss: true,
              builder: (context) {
                return MessageAlertToast(
                  title: "Error",
                  message: "Invalid Password",
                  appLogo: "",
                  color: kErrorColor,
                );
              }).show(Get.context!);
          return "Invalid password";
        } else {
          isLoading.value = true;

          await Future.delayed(const Duration(seconds: 3));
          DelightToastBar(
              autoDismiss: true,
              builder: (context) {
                return MessageAlertToast(
                  title: "Success",
                  message: "Login Successful",
                  appLogo: "",
                  color: kSuccessColor,
                );
              }).show(Get.context!);

          Get.offAllNamed(
            Routes.home,
          );

          isLoading.value = false;
        }
      }
    }
  }

  goToSignup() {
    log("Go to Sign up");
    Get.toNamed(Routes.signup);
  }
}
