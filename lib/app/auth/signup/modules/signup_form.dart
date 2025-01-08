import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:swd_mobile_app_test/src/constants/consts.dart';
import 'package:swd_mobile_app_test/src/controllers/signup_controller.dart';
import 'package:swd_mobile_app_test/src/utils/text_form_fields/android_textformfield.dart';
import 'package:swd_mobile_app_test/theme/colors.dart';

signupForm(SignupController controller, ColorScheme colorScheme) {
  return Obx(() {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "First Name",
                      textAlign: TextAlign.center,
                      style: defaultTextStyle(
                        color: colorScheme.inverseSurface,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    10.toHeight,
                    AndroidTextFormField(
                      controller: controller.firstNameEC,
                      focusNode: controller.firstNameFN,
                      validator: controller.validateFirstName,
                      hintText: "First name",
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
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
                    20.toHeight,
                  ],
                ),
              ),
              10.toWidth,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Last Name",
                      textAlign: TextAlign.center,
                      style: defaultTextStyle(
                        color: colorScheme.inverseSurface,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    10.toHeight,
                    AndroidTextFormField(
                      controller: controller.lastNameEC,
                      focusNode: controller.lastNameFN,
                      validator: controller.validateLastName,
                      hintText: "Last name",
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
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
                    20.toHeight,
                  ],
                ),
              ),
            ],
          ),
          Text(
            "Phone number",
            textAlign: TextAlign.center,
            style: defaultTextStyle(
              color: colorScheme.inverseSurface,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          10.toHeight,
          AndroidTextFormField(
            controller: controller.phoneNumberEC,
            focusNode: controller.phoneNumberFN,
            validator: controller.validatePhone,
            hintText: "Enter phone number",
            keyboardType: TextInputType.phone,
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
          20.toHeight,
          Text(
            "Email address",
            textAlign: TextAlign.center,
            style: defaultTextStyle(
              color: colorScheme.inverseSurface,
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
          20.toHeight,
          Text(
            "Create Password",
            textAlign: TextAlign.center,
            style: defaultTextStyle(
              color: colorScheme.inverseSurface,
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
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            suffixIcon: IconButton(
              onPressed: controller.togglePasswordVisibility,
              icon: Icon(
                controller.passwordIsHidden.value
                    ? Iconsax.eye_slash
                    : Iconsax.eye,
                color: colorScheme.inverseSurface,
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
          20.toHeight,
          Text(
            "Referral Code (Optional)",
            textAlign: TextAlign.center,
            style: defaultTextStyle(
              color: colorScheme.inverseSurface,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          10.toHeight,
          AndroidTextFormField(
            controller: controller.referralCodeEC,
            focusNode: controller.referralCodeFN,
            validator: (value) {
              return null;
            },
            hintText: "Enter Referral Code",
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.none,
            onFieldSubmitted: controller.onFieldSubmitted,
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
          20.toHeight,
        ],
      ),
    );
  });
}
