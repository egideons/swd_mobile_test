import 'package:flutter/material.dart';
import 'package:swd_mobile_app_test/src/constants/consts.dart';
import 'package:swd_mobile_app_test/src/controllers/home_controller.dart';
import 'package:swd_mobile_app_test/theme/colors.dart';

newsAndUpdatesSection(Size size, HomeController controller) {
  return SizedBox(
    height: 120,
    child: ListView.separated(
      separatorBuilder: (context, index) => 20.toWidth,
      itemCount: controller.newsAndUpdatesImages.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var newsAndUpdatesImage = controller.newsAndUpdatesImages[index];
        return Container(
          width: size.width / 1.6,
          decoration: ShapeDecoration(
            color: kGreyColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            image: DecorationImage(
              image: AssetImage(newsAndUpdatesImage),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    ),
  );
}
