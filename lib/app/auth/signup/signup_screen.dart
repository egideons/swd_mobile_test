import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swd_mobile_app_test/app/auth/signup/modules/signup_form.dart';
import 'package:swd_mobile_app_test/src/constants/consts.dart';
import 'package:swd_mobile_app_test/src/controllers/signup_controller.dart';
import 'package:swd_mobile_app_test/src/utils/appbar/my_app_bar.dart';
import 'package:swd_mobile_app_test/src/utils/background.dart';
import 'package:swd_mobile_app_test/src/utils/buttons/android_elevated_button.dart';
import 'package:swd_mobile_app_test/theme/colors.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    // var size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: myAppBar(colorScheme),
        body: SafeArea(
          child: Stack(
            children: [
              background(),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 200,
                  sigmaY: 200,
                ),
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    Text(
                      "Create an account",
                      textAlign: TextAlign.center,
                      style: defaultTextStyle(
                        color: colorScheme.primary,
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    20.toHeight,
                    signupForm(controller, colorScheme),
                    Obx(() {
                      return AndroidElevatedButton(
                        title: "Next",
                        onPressed: controller.signup,
                        isLoading: controller.isLoading.value,
                      );
                    }),
                    20.toHeight,
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 4,
                            decoration: ShapeDecoration(
                              color: kLightBackgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        4.toWidth,
                        Expanded(
                          child: Container(
                            height: 4,
                            decoration: ShapeDecoration(
                              color: kGreyColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    10.toHeight,
                    Center(
                      child: Text(
                        "Account information",
                        textAlign: TextAlign.center,
                        style: defaultTextStyle(
                          color: kTextGreyColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    20.toHeight,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
