import 'dart:developer';

import 'package:delightful_toast/delight_toast.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:swd_mobile_app_test/main.dart';
import 'package:swd_mobile_app_test/src/constants/assets.dart';
import 'package:swd_mobile_app_test/src/utils/containers/toast/message_alert_toast.dart';
import 'package:swd_mobile_app_test/theme/colors.dart';

class HomeController extends GetxController {
  static HomeController get instance {
    return Get.find<HomeController>();
  }

  @override
  void onInit() {
    super.onInit();
    loadVisibilityState();
  }

  var firstName = prefs.getString("firstName");
  var walletBalanceIsHidden = false.obs;
  var accountNumber = "8192017482".obs;

  //================= Wallet ====================\\
  toggleWalletBalanceVisibility() {
    saveVisibilityState(!walletBalanceIsHidden.value);
    walletBalanceIsHidden.value = !walletBalanceIsHidden.value;
  }

  Future<void> loadVisibilityState() async {
    walletBalanceIsHidden.value =
        prefs.getBool('walletBalanceIsHidden') ?? walletBalanceIsHidden.value;
    update();
  }

  // Save visibility state to SharedPreferences
  Future<void> saveVisibilityState(bool value) async {
    await prefs.setBool('walletBalanceIsHidden', value);
  }

  copyAccountNumber() {
    Clipboard.setData(ClipboardData(text: accountNumber.value));
    if (accountNumber.value.isNotEmpty) {
      DelightToastBar(
          autoDismiss: true,
          builder: (context) {
            return MessageAlertToast(
              title: "Text Copied",
              message: "${accountNumber.value} copied to clipboard",
              appLogo: "",
              isSuccess: true,
              color: kSuccessColor,
            );
          }).show(Get.context!);
    }
  }

  var quickActions = [
    {
      "name": "Data",
      "icon": Assets.dataSvg,
      "onPressed": () {
        log("Data pressed");
      },
    },
    {
      "name": "Airtime",
      "icon": Assets.airtimeSvg,
      "onPressed": () {
        log("Airtime pressed");
      },
    },
    {
      "name": "Showmax",
      "icon": Assets.showmaxSvg,
      "onPressed": () {
        log("Showmax pressed");
      },
    },
    {
      "name": "Giftcards",
      "icon": Assets.giftcardsSvg,
      "onPressed": () {
        log("Giftcards pressed");
      },
    },
    {
      "name": "Betting",
      "icon": Assets.bettingSvg,
      "onPressed": () {
        log("Betting pressed");
      },
    },
    {
      "name": "Electricity",
      "icon": Assets.electricitySvg,
      "onPressed": () {
        log("Electricity pressed");
      },
    },
    {
      "name": "TV/Cable",
      "icon": Assets.tvcableSvg,
      "onPressed": () {
        log("TV/Cable pressed");
      },
    },
    {
      "name": "E-Pin",
      "icon": Assets.epinSvg,
      "onPressed": () {
        log("E-Pin pressed");
      },
    },
  ];

  var newsAndUpdatesImages = [
    Assets.news1Png,
    Assets.news2Png,
  ];
}
