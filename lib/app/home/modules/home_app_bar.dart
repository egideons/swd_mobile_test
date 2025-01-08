import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:swd_mobile_app_test/src/constants/consts.dart';
import 'package:swd_mobile_app_test/src/controllers/home_controller.dart';
import 'package:swd_mobile_app_test/theme/colors.dart';

homeAppBar(ColorScheme colorScheme, HomeController controller) {
  return AppBar(
    backgroundColor: kLightBackgroundColor,
    toolbarHeight: 80,
    leadingWidth: 80,
    centerTitle: true,
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: colorScheme.inverseSurface,
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: kGreyColor),
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(Iconsax.user, color: kGreyColor),
        ),
      ),
    ),
    title: Text(
      "Welcome, ${controller.firstName} 👋🏾",
      style: defaultTextStyle(
        color: colorScheme.surface,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontFamily: "Aeonik Trials",
      ),
    ),
    actions: [
      Container(
        height: 50,
        width: 50,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: colorScheme.inverseSurface,
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: kGreyColor),
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(Iconsax.notification, color: kGreyColor),
        ),
      ),
    ],
  );
}
