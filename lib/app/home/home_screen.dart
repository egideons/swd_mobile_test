// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swd_mobile_app_test/app/home/modules/home_app_bar.dart';
import 'package:swd_mobile_app_test/app/home/modules/home_floating_action_button.dart';
import 'package:swd_mobile_app_test/app/home/modules/news_and_updates.dart';
import 'package:swd_mobile_app_test/app/home/modules/quick_actions.dart';
import 'package:swd_mobile_app_test/app/home/modules/top_section_action_buttons.dart';
import 'package:swd_mobile_app_test/app/home/modules/view_all_text_button.dart';
import 'package:swd_mobile_app_test/app/home/modules/wallet_section.dart';
import 'package:swd_mobile_app_test/src/constants/consts.dart';
import 'package:swd_mobile_app_test/src/controllers/home_controller.dart';

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
                    topSectionActionButtons(colorScheme),
                    40.toHeight,
                    Center(
                      child: Container(
                        width: 60,
                        height: 6,
                        decoration: ShapeDecoration(
                          color: Colors.grey.shade300,
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
