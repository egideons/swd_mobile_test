// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:swd_mobile_app_test/app/home/modules/home_app_bar.dart';
import 'package:swd_mobile_app_test/app/home/modules/home_floating_action_button.dart';
import 'package:swd_mobile_app_test/app/home/modules/news_and_updates.dart';
import 'package:swd_mobile_app_test/app/home/modules/quick_actions.dart';
import 'package:swd_mobile_app_test/app/home/modules/view_all_text_button.dart';
import 'package:swd_mobile_app_test/app/home/modules/wallet_section.dart';
import 'package:swd_mobile_app_test/src/constants/assets.dart';
import 'package:swd_mobile_app_test/src/constants/consts.dart';
import 'package:swd_mobile_app_test/src/controllers/home_controller.dart';
import 'package:swd_mobile_app_test/theme/colors.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: Scaffold(
        primary: true,
        appBar: homeAppBar(colorScheme, controller),
        floatingActionButton: homeFloatingActionButton(),
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                width: size.width,
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: colorScheme.inverseSurface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    walletSection(size, colorScheme, controller),
                    20.toHeight,
                    Row(
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
                    ),
                    40.toHeight,
                    Center(
                      child: Container(
                        width: 40,
                        height: 6,
                        decoration: ShapeDecoration(
                          color: kLightGreyColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              20.toHeight,
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quick Actions",
                      style: defaultTextStyle(
                        fontSize: 18,
                        color: colorScheme.inverseSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    10.toHeight,
                    quickActionsSection(context, colorScheme, controller),
                    26.toHeight,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "News & Updates",
                          style: defaultTextStyle(
                            fontSize: 18,
                            color: colorScheme.inverseSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        viewAllTextButton(),
                      ],
                    ),
                    10.toHeight,
                    newsAndUpdatesSection(size, controller),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
