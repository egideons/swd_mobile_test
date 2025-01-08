import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swd_mobile_app_test/src/constants/consts.dart';
import 'package:swd_mobile_app_test/theme/colors.dart';

myAppBar(ColorScheme colorScheme,
    {List<Widget>? actions,
    double? leadingWidth,
    bool? automaticallyImplyLeading,
    Color? backgroundColor}) {
  return AppBar(
    backgroundColor: backgroundColor ?? kTransparentColor,
    automaticallyImplyLeading: automaticallyImplyLeading ?? true,
    leadingWidth: leadingWidth ?? 100,
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Row(
        children: [
          Icon(
            Icons.chevron_left,
            color: kLightGreyColor,
          ),
          10.toWidth,
          Text(
            "Back",
            style: defaultTextStyle(
              color: kLightGreyColor,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
    actions: actions ?? [],
  );
}
