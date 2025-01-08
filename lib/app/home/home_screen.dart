import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swd_mobile_app_test/app/home/modules/home_app_bar.dart';
import 'package:swd_mobile_app_test/app/home/modules/home_floating_action_button.dart';
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
                height: size.height / 3.6,
                width: size.width,
                decoration: ShapeDecoration(
                  color: colorScheme.inverseSurface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                ),
              ),
              // Expanded(
              //   child: ListView(
              //     children: [],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
