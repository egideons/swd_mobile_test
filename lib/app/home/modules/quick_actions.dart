import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swd_mobile_app_test/src/constants/consts.dart';
import 'package:swd_mobile_app_test/src/controllers/home_controller.dart';
import 'package:swd_mobile_app_test/theme/colors.dart';

quickActionsSection(
    BuildContext context, ColorScheme colorScheme, HomeController controller) {
  return Wrap(
    spacing: 4,
    runSpacing: 4,
    children: List.generate(controller.quickActions.length, (index) {
      var quickActions = controller.quickActions[index];
      return InkWell(
        onTap: quickActions["onPressed"] as VoidCallback,
        child: Container(
          width: MediaQuery.of(context).size.width / 4 - 8,
          height: 100,
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            color: kGreyColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              10.toHeight,
              SvgPicture.asset(
                quickActions["icon"] as String,
                height: 30,
              ),
              4.toHeight,
              Text(
                quickActions["name"] as String,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: defaultTextStyle(
                  fontSize: 14,
                  color: colorScheme.inverseSurface,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.8,
                ),
              ),
            ],
          ),
        ),
      );
    }),
  );
}
