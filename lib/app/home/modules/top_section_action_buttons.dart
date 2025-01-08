import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swd_mobile_app_test/src/constants/assets.dart';
import 'package:swd_mobile_app_test/src/constants/consts.dart';
import 'package:swd_mobile_app_test/theme/colors.dart';

topSectionActionButtons(ColorScheme colorScheme) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            tooltip: "Add funds",
            padding: const EdgeInsets.all(0),
            style: IconButton.styleFrom(
              padding: const EdgeInsets.all(0),
            ),
            icon: SvgPicture.asset(
              Assets.topupSvg,
              height: 26,
            ),
          ),
          Text(
            "Top up",
            style: defaultTextStyle(
              fontSize: 14,
              color: colorScheme.surface,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      26.toWidth,
      Container(
        width: 1,
        height: 20,
        color: kLightGreyColor,
      ),
      26.toWidth,
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            tooltip: "Transfer funds",
            padding: const EdgeInsets.all(0),
            style: IconButton.styleFrom(
              padding: const EdgeInsets.all(0),
            ),
            icon: SvgPicture.asset(
              Assets.sendSvg,
              height: 26,
            ),
          ),
          Text(
            "Transfer",
            style: defaultTextStyle(
              fontSize: 14,
              color: colorScheme.surface,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      26.toWidth,
      Container(
        width: 1,
        height: 20,
        color: kLightGreyColor,
      ),
      26.toWidth,
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            tooltip: "Transaction History",
            padding: const EdgeInsets.all(0),
            style: IconButton.styleFrom(
              padding: const EdgeInsets.all(0),
            ),
            icon: SvgPicture.asset(
              Assets.historySvg,
              height: 26,
            ),
          ),
          Text(
            "History",
            style: defaultTextStyle(
              fontSize: 14,
              color: colorScheme.surface,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ],
  );
}
