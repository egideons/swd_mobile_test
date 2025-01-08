import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swd_mobile_app_test/src/constants/consts.dart';
import 'package:swd_mobile_app_test/src/controllers/bottom_nav_controller.dart';
import 'package:swd_mobile_app_test/theme/colors.dart';

class BottomNavView extends GetView<BottomNavController> {
  final int? currentIndex;
  const BottomNavView({super.key, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Obx(
      () => PopScope(
        onPopInvokedWithResult: controller.onPopInvokedWithResult,
        canPop: controller.canPop.value,
        child: Scaffold(
          backgroundColor: colorScheme.surface,
          body: controller
              .navScreens(colorScheme)[controller.navCurrentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.navCurrentIndex.value,
            onTap: (index) => controller.navCurrentIndex.value = index,
            items: controller.bottomNavItems(colorScheme),
            backgroundColor: colorScheme.surface,
            enableFeedback: true,
            elevation: 20,
            mouseCursor: SystemMouseCursors.click,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            selectedItemColor: colorScheme.inverseSurface,
            showUnselectedLabels: true,
            unselectedItemColor: kLightGreyColor,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedIconTheme: IconThemeData(color: colorScheme.secondary),
            selectedLabelStyle: defaultTextStyle(color: colorScheme.secondary),
          ),
        ),
      ),
    );
  }
}
