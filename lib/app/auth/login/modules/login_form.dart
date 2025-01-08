import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:swd_mobile_app_test/src/constants/consts.dart';
import 'package:swd_mobile_app_test/src/controllers/login_controller.dart';
import 'package:swd_mobile_app_test/src/utils/text_form_fields/android_textformfield.dart';
import 'package:swd_mobile_app_test/theme/colors.dart';

loginForm(ColorScheme colorScheme, LoginController controller) {
  return Obx(() {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email address",
            textAlign: TextAlign.center,
            style: defaultTextStyle(
              color: colorScheme.primary,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          10.toHeight,
          AndroidTextFormField(
            controller: controller.emailEC,
            focusNode: controller.emailFN,
            validator: controller.validateEmail,
            onChanged: controller.emailOnChanged,
            hintText: "Enter Email address",
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: .4,
                color: kBorderGreyColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 1,
                color: colorScheme.primary,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 1,
                color: colorScheme.error,
              ),
            ),
          ),
          20.toHeight,
          Text(
            "Password",
            textAlign: TextAlign.center,
            style: defaultTextStyle(
              color: colorScheme.primary,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          10.toHeight,
          AndroidTextFormField(
            controller: controller.passwordEC,
            focusNode: controller.passwordFN,
            validator: controller.validatePassword,
            onChanged: controller.passwordOnChanged,
            onFieldSubmitted: controller.onFieldSubmitted,
            obscureText: controller.passwordIsHidden.value,
            obscuringCharacter: "*",
            hintText: "Enter Password",
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.none,
            suffixIcon: IconButton(
              onPressed: controller.togglePasswordVisibility,
              icon: Icon(
                controller.passwordIsHidden.value
                    ? Iconsax.eye_slash
                    : Iconsax.eye,
                color: colorScheme.primary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: .4,
                color: kBorderGreyColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 1,
                color: colorScheme.primary,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 1,
                color: colorScheme.error,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Forgot password?",
                textAlign: TextAlign.left,
                style: defaultTextStyle(
                  color: kTextGreyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          20.toHeight,
        ],
      ),
    );
  });
}