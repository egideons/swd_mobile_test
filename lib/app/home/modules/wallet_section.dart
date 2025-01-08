// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:swd_mobile_app_test/src/constants/consts.dart';
import 'package:swd_mobile_app_test/src/controllers/home_controller.dart';
import 'package:swd_mobile_app_test/theme/colors.dart';

walletSection(Size size, ColorScheme colorScheme, HomeController controller) {
  return Obx(() {
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(14),
      decoration: ShapeDecoration(
        gradient: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
      ),
      child: IntrinsicHeight(
        // Ensures children in the Row take the same height
        child: Row(
          children: [
            SizedBox(
              width: size.width / 2.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wallet Balance".toUpperCase(),
                    style: defaultTextStyle(
                      fontSize: 12,
                      color: colorScheme.inverseSurface,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.40,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        controller.walletBalanceIsHidden.value
                            ? "NGN *******"
                            : "NGN ${FormatToType.doubleFormattedText(50000)}"
                                .toUpperCase(),
                        style: defaultTextStyle(
                          fontSize: 16,
                          color: colorScheme.inverseSurface,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.40,
                        ),
                      ),
                      IconButton(
                        onPressed: controller.toggleWalletBalanceVisibility,
                        tooltip: controller.walletBalanceIsHidden.value
                            ? "Show balance"
                            : "Hide balance",
                        padding: const EdgeInsets.all(0),
                        style: IconButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                        ),
                        icon: Icon(
                          controller.walletBalanceIsHidden.value
                              ? Iconsax.eye
                              : Iconsax.eye_slash,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: "Cashback ",
                        style: defaultTextStyle(
                          color: colorScheme.surface,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.40,
                        ),
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
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
                                controller.walletBalanceIsHidden.value
                                    ? "N*****"
                                    : "N${FormatToType.doubleFormattedTextWithDecimal(342.51)}",
                                style: defaultTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            10.toWidth,
            Container(
              width: 2,
              color: kPrimarySolidColor,
            ),
            10.toWidth,
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Moniepoint".toUpperCase(),
                      style: defaultTextStyle(
                        fontSize: 12,
                        color: colorScheme.inverseSurface,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.40,
                      ),
                    ),
                    4.toHeight,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.accountNumber.value,
                          style: defaultTextStyle(
                            fontSize: 18,
                            color: colorScheme.inverseSurface,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.40,
                          ),
                        ),
                        InkWell(
                          onTap: controller.copyAccountNumber,
                          borderRadius: BorderRadius.circular(32),
                          child: Icon(
                            Iconsax.copy,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                    4.toHeight,
                    Text(
                      "Deposit Fee: 20",
                      style: defaultTextStyle(
                        fontSize: 14,
                        color: colorScheme.inverseSurface,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        letterSpacing: -0.40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  });
}
