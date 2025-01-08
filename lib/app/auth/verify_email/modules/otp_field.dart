import 'package:flutter/material.dart';
import 'package:swd_mobile_app_test/src/controllers/verify_email_controller.dart';
import 'package:swd_mobile_app_test/src/utils/text_form_fields/android_textformfield.dart';
import 'package:swd_mobile_app_test/theme/colors.dart';

buildOTPField(
    ColorScheme colorScheme, int index, VerifyEmailController controller) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 2.0),
    width: 48,
    height: 48,
    decoration: BoxDecoration(),
    child: Center(
      child: AndroidTextFormField(
        onTap: controller.onTap,
        controller: controller.controllers[index],
        focusNode: controller.focusNodes[index],
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        textCapitalization: TextCapitalization.none,
        textInputAction: TextInputAction.done,
        counterText: "",
        onChanged: (value) => controller.onTextChanged(index, value),
        validator: (value) {
          return null;
        },
        onFieldSubmitted: (value) {
          controller.onFieldSubmitted(value, index);
        },
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
            color: colorScheme.inverseSurface,
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
    ),
  );
}
