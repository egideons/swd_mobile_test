import 'package:delightful_toast/delight_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swd_mobile_app_test/src/constants/consts.dart';
import 'package:swd_mobile_app_test/src/routes/routes.dart';
import 'package:swd_mobile_app_test/src/utils/containers/toast/message_alert_toast.dart';
import 'package:swd_mobile_app_test/theme/colors.dart';

class SignupController extends GetxController {
  static SignupController get instance {
    return Get.find<SignupController>();
  }

  @override
  void onClose() {
    emailEC.dispose();
    passwordEC.dispose();
    emailFN.dispose();
    passwordFN.dispose();
    firstNameFN.dispose();
    lastNameFN.dispose();
    referralCodeFN.dispose();
    super.onClose();
  }

  //=========== Keys =============\\
  final formKey = GlobalKey<FormState>();

  //=========== Variables =============\\

  //=========== Booleans =============\\
  var isLoading = false.obs;
  var passwordIsHidden = true.obs;

  //=========== Controllers =============\\
  var firstNameEC = TextEditingController();
  var lastNameEC = TextEditingController();
  var phoneNumberEC = TextEditingController();
  var emailEC = TextEditingController();
  var passwordEC = TextEditingController();
  var referralCodeEC = TextEditingController();

  //=========== Focus Nodes =============\\
  var firstNameFN = FocusNode();
  var lastNameFN = FocusNode();
  var phoneNumberFN = FocusNode();
  var emailFN = FocusNode();
  var passwordFN = FocusNode();
  var referralCodeFN = FocusNode();

  //=========== Functions =============\\

  String? validateFirstName(dynamic value) {
    if (value == null || value.isEmpty) {
      return "First name is required";
    } else if (value.length < 3) {
      return "Name cannot be less than 3 characters";
    }
    return null;
  }

  String? validateLastName(dynamic value) {
    if (value == null || value.isEmpty) {
      return "Last name is required";
    } else if (value.length < 3) {
      return "Name cannot be less than 3 characters";
    }
    return null;
  }

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
    } else if (value.length < 8) {
      return "Password must be at least 8 characters";
    } else if (!GetUtils.hasMatch(
        value, r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$')) {
      return "Password must contain uppercase, lowercase, and a number";
    }
    return null;
  }

  String? validatePhone(dynamic value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    } else if (!GetUtils.hasMatch(value, RegexPatterns.mobilePattern)) {
      return "Enter a valid phone number";
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
    signup();
  }

  signup() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      isLoading.value = true;

      await Future.delayed(const Duration(seconds: 2));
      DelightToastBar(
          autoDismiss: true,
          builder: (context) {
            return MessageAlertToast(
              title: "Success",
              message: "Signup Successful",
              appLogo: "",
              isSuccess: true,
              color: kSuccessColor,
            );
          }).show(Get.context!);

      isLoading.value = false;
      await Future.delayed(const Duration(milliseconds: 800));
      Get.toNamed(
        Routes.verifyEmail,
        arguments: {
          "email": emailEC.text,
          "firstName": firstNameEC.text,
          "lastName": lastNameEC.text,
          "password": passwordEC.text,
          "phoneNumber": phoneNumberEC.text,
          "referralCode": referralCodeEC.text,
        },
      );
    }
  }
}
