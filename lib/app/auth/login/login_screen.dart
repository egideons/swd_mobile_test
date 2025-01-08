import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swd_mobile_app_test/app/auth/login/modules/login_form.dart';
import 'package:swd_mobile_app_test/src/constants/assets.dart';
import 'package:swd_mobile_app_test/src/constants/consts.dart';
import 'package:swd_mobile_app_test/src/controllers/login_controller.dart';
import 'package:swd_mobile_app_test/src/utils/background.dart';
import 'package:swd_mobile_app_test/src/utils/buttons/android_elevated_button.dart';
import 'package:swd_mobile_app_test/theme/colors.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
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
                    80.toHeight,
                    Center(
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800, // Placeholder background
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          Assets.memojiPng,
                        ),
                      ),
                    ),
                    20.toHeight,
                    Text(
                      "Welcome back 👋🏾",
                      textAlign: TextAlign.center,
                      style: defaultTextStyle(
                        color: colorScheme.inverseSurface,
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    60.toHeight,
                    loginForm(colorScheme, controller),
                    Obx(() {
                      return AndroidElevatedButton(
                        title: "Sign in",
                        isLoading: controller.isLoading.value,
                        onPressed: controller.login,
                      );
                    }),
                    10.toHeight,
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "I don't have an account, ",
                        style: defaultTextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            style: defaultTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            child: GestureDetector(
                              onTap: controller.goToSignup,
                              child: ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                  colors: [
                                    kPrimarySolidColor,
                                    kPrimarySolidColor2,
                                  ],
                                ).createShader(
                                  Rect.fromLTWH(
                                    0,
                                    0,
                                    bounds.width,
                                    bounds.height,
                                  ),
                                ),
                                child: Text("Create account"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
