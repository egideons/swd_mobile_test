import 'package:flutter/material.dart';
import 'package:swd_mobile_app_test/src/constants/consts.dart';
import 'package:swd_mobile_app_test/theme/colors.dart';

viewAllTextButton() {
  return TextButton(
    onPressed: () {},
    child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "",
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: GestureDetector(
              onTap: () {},
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
                child: Text(
                  "View All",
                  style: defaultTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
