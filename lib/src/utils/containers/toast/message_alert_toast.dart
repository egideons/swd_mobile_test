import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:swd_mobile_app_test/src/constants/consts.dart';

import '../../../../theme/colors.dart';

class MessageAlertToast extends StatelessWidget {
  final String title, message, appLogo;
  final Color color;
  final bool isError, isWarning, isSuccess;
  const MessageAlertToast({
    super.key,
    this.isWarning = false,
    required this.isSuccess,
    this.isError = false,
    required this.title,
    required this.message,
    required this.appLogo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return ToastCard(
      color: kGreyColor,
      leading: appLogo.isEmpty
          ? isSuccess
              ? Icon(Iconsax.tick_circle, color: color)
              : isError
                  ? Icon(Iconsax.close_circle, color: color)
                  : isWarning
                      ? Icon(Iconsax.warning_2, color: color)
                      : null
          : Image.asset(appLogo, color: kPrimarySolidColor),
      title: title.isEmpty
          ? Text("")
          : Text(
              title,
              style: defaultTextStyle(
                color: color,
                fontWeight: FontWeight.w900,
                fontSize: 14,
              ),
            ),
      subtitle: Text(
        message,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: defaultTextStyle(
          fontWeight: FontWeight.w600,
          color: colorScheme.inverseSurface,
          fontSize: 14,
        ),
      ),
    );
  }
}
