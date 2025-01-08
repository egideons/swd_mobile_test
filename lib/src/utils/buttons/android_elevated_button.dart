// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swd_mobile_app_test/src/constants/consts.dart';
import 'package:swd_mobile_app_test/theme/colors.dart';

class AndroidElevatedButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final bool isLoading;
  final bool disable;
  final String? fontFamily;
  final double? buttonElevation, borderRadius, fontSize, buttonIconSize;

  final IconData? buttonIcon;
  final Color? disabledBackgroundColor,
      buttonColor,
      indicatorColor,
      textColor,
      buttonIconColor;

  final FontWeight? fontWeight;

  const AndroidElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.disable = false,
    this.fontFamily,
    this.fontSize,
    this.buttonElevation,
    this.buttonIcon,
    this.buttonIconColor,
    this.buttonIconSize,
    this.buttonColor,
    this.borderRadius,
    this.indicatorColor,
    this.textColor,
    this.fontWeight,
    this.disabledBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: disable
          ? null
          : isLoading
              ? null
              : onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        disabledBackgroundColor:
            disabledBackgroundColor ?? colorScheme.primary.withOpacity(.6),
        backgroundColor: buttonColor ?? colorScheme.primary,
        elevation: buttonElevation ?? 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10)),
        minimumSize: Size(media.width, 50),
      ).copyWith(
        backgroundColor: WidgetStateProperty.all(
            Colors.transparent), // Make the background transparent
        shadowColor: WidgetStateProperty.all(
            Colors.transparent), // Remove shadow to focus on the gradient
      ),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: RadialGradient(
            colors: [
              Color(0xFFEF9258).withOpacity(.9),
              Color(0xFFEF5757).withOpacity(.9),
            ],
            stops: [.4, .8],
            radius: 3.6,
            center: Alignment.bottomRight,
          ),
        ),
        child: isLoading
            ? CupertinoActivityIndicator(color: colorScheme.inverseSurface)
            : Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: defaultTextStyle(
                    color: textColor ?? kTextWhiteColor,
                    fontSize: fontSize ?? 16.0,
                    fontFamily: fontFamily,
                    fontWeight: fontWeight ?? FontWeight.w500,
                  ),
                ),
              ),
      ),
    );
  }
}
