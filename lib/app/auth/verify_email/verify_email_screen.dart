import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swd_mobile_app_test/app/auth/verify_email/modules/otp_field.dart';
import 'package:swd_mobile_app_test/src/constants/consts.dart';
import 'package:swd_mobile_app_test/src/controllers/verify_email_controller.dart';
import 'package:swd_mobile_app_test/src/utils/appbar/my_app_bar.dart';
import 'package:swd_mobile_app_test/src/utils/background.dart';
import 'package:swd_mobile_app_test/src/utils/buttons/android_elevated_button.dart';
import 'package:swd_mobile_app_test/theme/colors.dart';

class VerifyEmailScreen extends GetView<VerifyEmailController> {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: Scaffold(
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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  children: [
                    Text(
                      "Verify your email",
                      textAlign: TextAlign.start,
                      style: defaultTextStyle(
                        color: colorScheme.inverseSurface,
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    20.toHeight,
                    Text(
                      "Please enter the OTP sent to",
                      textAlign: TextAlign.start,
                      style: defaultTextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    10.toHeight,
                    Text(
                      controller.email,
                      textAlign: TextAlign.start,
                      style: defaultTextStyle(
                        color: colorScheme.inverseSurface,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    10.toHeight,
                    // Obx(() {
                    //   return
                    Form(
                      key: controller.formKey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          7,
                          (index) {
                            if (index == 3) {
                              // Add the dash between fields
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    color: kLightBackgroundColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              );
                            }
                            return buildOTPField(
                              colorScheme,
                              index > 3 ? index - 1 : index,
                              controller,
                            );
                          },
                        ),
                      ),
                    ),

                    // ;
                    // }),
                    SizedBox(
                      height: size.height / 2.6,
                    ),
                    Obx(() {
                      return AndroidElevatedButton(
                        title: "Verify email",
                        onPressed: controller.verifyEmail,
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
                              color: kLightBackgroundColor,
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
                        "Email Verification",
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
