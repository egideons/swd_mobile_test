// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:swd_mobile_app_test/app/home/home_screen.dart';
import 'package:swd_mobile_app_test/src/constants/assets.dart';
import 'package:swd_mobile_app_test/src/constants/consts.dart';
import 'package:swd_mobile_app_test/theme/colors.dart';

import '../../../main.dart';

class BottomNavController extends GetxController {
  static BottomNavController get instance {
    return Get.find<BottomNavController>();
  }

  var isLoading = false.obs;
  var navCurrentIndex = 0.obs;
  var canPop = false.obs;
  var userHasViewedWalletIntro = prefs.getBool("hasViewedWalletIntro") ?? false;

  // Method to handle back navigation
  onPopInvokedWithResult(isPopped, value) async {
    if (navCurrentIndex.value != 0) {
      // Navigate back to the first tab if not on the first tab
      navCurrentIndex.value = 0;
      canPop.value = false; // Prevent further popping
      return false; // Prevent app from closing
    }
    canPop.value = true; // Allow app to close if already on the first tab
    return true;
  }

  //=============== LANDLORD SCREENS ================\\
  navScreens(ColorScheme colorScheme) => [
        const HomeScreen(),
        screen(colorScheme, "Services"),
        screen(colorScheme, "Statistics"),
        screen(colorScheme, "Referrals"),
        screen(colorScheme, "Settings"),
      ];

  screen(ColorScheme colorScheme, String title) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            title,
            style: defaultTextStyle(
              color: colorScheme.inverseSurface,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  //=============== BOTTOMNAV ITEMS ================\\
  bottomNavItems(ColorScheme colorScheme) => [
        BottomNavigationBarItem(
          label: "Home",
          tooltip: "Home",
          icon: SvgPicture.asset(
            Assets.homeSvg,
            color: kGreyColor,
            fit: BoxFit.cover,
          ),
          activeIcon: SvgPicture.asset(
            Assets.homeSvg,
            color: colorScheme.inverseSurface,
            fit: BoxFit.cover,
          ),
        ),
        BottomNavigationBarItem(
          label: "Services",
          tooltip: "Services",
          icon: SvgPicture.asset(
            Assets.servicesSvg,
            fit: BoxFit.cover,
          ),
          activeIcon: SvgPicture.asset(
            color: colorScheme.inverseSurface,
            Assets.servicesSvg,
            fit: BoxFit.cover,
          ),
        ),
        BottomNavigationBarItem(
          label: "Statistics",
          tooltip: "Statistics",
          icon: SvgPicture.asset(
            Assets.statisticsSvg,
            fit: BoxFit.cover,
          ),
          activeIcon: SvgPicture.asset(
            Assets.statisticsSvg,
            color: colorScheme.inverseSurface,
            fit: BoxFit.cover,
          ),
        ),
        BottomNavigationBarItem(
          label: "Referrals",
          tooltip: "Referrals",
          icon: SvgPicture.asset(
            Assets.referralsSvg,
            fit: BoxFit.cover,
          ),
          activeIcon: SvgPicture.asset(
            Assets.referralsSvg,
            color: colorScheme.inverseSurface,
            fit: BoxFit.cover,
          ),
        ),
        BottomNavigationBarItem(
          label: "Settings",
          tooltip: "Settings",
          icon: SvgPicture.asset(
            Assets.settingsSvg,
            fit: BoxFit.cover,
          ),
          activeIcon: SvgPicture.asset(
            Assets.settingsSvg,
            color: colorScheme.inverseSurface,
            fit: BoxFit.cover,
          ),
        ),
      ];
}
