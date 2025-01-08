import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swd_mobile_app_test/src/constants/assets.dart';

homeFloatingActionButton() {
  return FloatingActionButton(
    onPressed: () {},
    tooltip: "Chat",
    shape: CircleBorder(),
    child: Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color(0xFFEF5757),
            Color(0xFFEF9258),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          Assets.chatSvg,
        ),
      ),
    ),
  );
}
