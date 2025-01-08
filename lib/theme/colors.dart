// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

Color kLightBackgroundColor = const Color(0xFFFFFFFF);
Color kDarkBackgroundSolidColor = const Color(0xFF000000);
const kPrimarySolidColor = Color(0xFFEF5757);
const kPrimarySolidColor2 = Color(0xFFEF9258);
const kPrimaryColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFFEF5757),
    Color(0xFFEF9258),
  ],
);
var kBackgroundColor = RadialGradient(
  colors: [
    Color(0xFFFFFFFF).withOpacity(.4),
    Color(0xFFEF5757).withOpacity(.4),
    Color(0xFFEF9258).withOpacity(.6),
    Color(0xFFFFFFFF),
    kDarkBackgroundSolidColor,
  ],
  stops: [.2, .4, .6, .8, 1.0],
  radius: .44,
  center: Alignment.topRight,
);

Color kAccentColor = const Color(0xFF41B696);
Color kSecondaryColor = const Color(0xFF41B696);
Color kTextWhiteColor = const Color(0xFFFFFFFF);

Color kStarColor = Colors.amber;
Color kSuccessColor = const Color(0xFF41B696);
Color kGreyColor = Colors.grey.shade900;
Color kLightGreyColor = Colors.grey.shade400;
Color kTextFieldFillColor = Colors.grey.shade900;
Color kBorderGreyColor = Colors.grey.shade500;
Color kTextGreyColor = Colors.grey.shade700;

Color kTransparentColor = const Color(0x00000000);

Color kErrorColor = Colors.red;
Color kWarningColor = Colors.amber;
Color kFormFieldTextColor = kTextGreyColor;
