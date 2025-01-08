import 'dart:developer';

import 'package:get/get.dart';
import 'package:swd_mobile_app_test/main.dart';
import 'package:swd_mobile_app_test/src/constants/assets.dart';

class HomeController extends GetxController {
  static HomeController get instance {
    return Get.find<HomeController>();
  }

  var firstName = prefs.getString("firstName");

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
