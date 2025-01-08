import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swd_mobile_app_test/src/controllers/signup_controller.dart';

class HomeScreen extends GetView<SignupController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    // var size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        body: SafeArea(
          child: ListView(
            children: [],
          ),
        ),
      ),
    );
  }
}
