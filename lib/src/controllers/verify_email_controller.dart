import 'dart:developer';

import 'package:delightful_toast/delight_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:swd_mobile_app_test/main.dart';
import 'package:swd_mobile_app_test/src/routes/routes.dart';
import 'package:swd_mobile_app_test/src/utils/containers/toast/message_alert_toast.dart';
import 'package:swd_mobile_app_test/theme/colors.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance {
    return Get.find<VerifyEmailController>();
  }

  @override
  void onInit() {
    super.onInit();

    focusNodes[0].requestFocus();
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  //=========== Keys =============\\
  final formKey = GlobalKey<FormState>();

  //=========== Variables =============\\

  var firstName = Get.arguments?["firstName"] ?? "";
  var lastName = Get.arguments?["lastName"] ?? "";
  var phoneNumber = Get.arguments?["phoneNumber"] ?? "";
  var password = Get.arguments?["password"] ?? "";
  var email = Get.arguments?["email"] ?? "";
  var referralCode = Get.arguments?["referralCode"] ?? "";

  //=========== Booleans =============\\
  var isLoading = false.obs;

  final List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  // Handle text change
  void onTextChanged(int index, String value) {
    if (value.isNotEmpty && index < focusNodes.length - 1) {
      focusNodes[index + 1].requestFocus(); // Move to the next field
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus(); // Move to the previous field
    }
    // Check if all fields are filled
    bool allFieldsFilled =
        controllers.every((controller) => controller.text.isNotEmpty);

    if (allFieldsFilled) {
      FocusManager.instance.primaryFocus?.unfocus();
      verifyEmail();
    }
  }

  // Handle pasted text
  void onPaste(String pastedText) {
    if (pastedText.length == 6) {
      for (int i = 0; i < 6; i++) {
        controllers[i].text = pastedText[i];
      }
      focusNodes[5].unfocus(); // Unfocus after pasting
    }
  }

  onFieldSubmitted(String value, int index) {
    // Check if the current field is empty
    if (value.isEmpty) {
      if (index > 0) {
        focusNodes[index - 1].requestFocus();
      }
      DelightToastBar(
          autoDismiss: true,
          builder: (context) {
            return MessageAlertToast(
              title: "Error",
              message: "Field at position ${index + 1} cannot be empty",
              appLogo: "",
              color: kErrorColor,
              isSuccess: false,
              isError: true,
            );
          }).show(Get.context!);
      return;
    }

    // Check if all fields are empty
    bool allFieldsEmpty =
        controllers.every((controller) => controller.text.isEmpty);
    if (allFieldsEmpty) {
      DelightToastBar(
          autoDismiss: true,
          builder: (context) {
            return MessageAlertToast(
              title: "Error",
              message: "Fields cannot be empty",
              appLogo: "",
              color: kErrorColor,
              isSuccess: false,
              isError: true,
            );
          }).show(Get.context!);
      return;
    }

    // If no issues, proceed to verify
    if (index == controllers.length - 1) {
      verifyEmail();
    }
  }

  onTap() async {
    ClipboardData? clipboardData = await Clipboard.getData('text/plain');
    if (clipboardData != null && clipboardData.text != null) {
      onPaste(clipboardData.text!);
    }
  }

  verifyEmail() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      prefs.setString("firstName", firstName);
      prefs.setString("lastName", lastName);
      prefs.setString("email", email);
      prefs.setString("password", password);
      prefs.setString("phoneNumber", phoneNumber);
      prefs.setString("referralCode", referralCode);

      log(
        "User's details: First Name: $firstName, Last Name: $email, Email: $email, Password: $password, Phone Number: $phoneNumber, Referral Code: $referralCode",
      );

      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));

      DelightToastBar(
          autoDismiss: true,
          builder: (context) {
            return MessageAlertToast(
              title: "Success",
              message: "Verification Successful",
              appLogo: "",
              color: kSuccessColor,
              isSuccess: true,
            );
          }).show(Get.context!);

      Get.offAllNamed(Routes.bottomNavView);
      isLoading.value = false;
    }
  }
}
