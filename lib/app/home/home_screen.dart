import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:swd_mobile_app_test/app/home/modules/home_app_bar.dart';
import 'package:swd_mobile_app_test/app/home/modules/home_floating_action_button.dart';
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
                height: size.height / 4,
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
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: List.generate(controller.quickActions.length,
                          (index) {
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
                    ),
                    26.toHeight,
                    Row(
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
                        TextButton(
                          onPressed: () {},
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "",
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: ShaderMask(
                                      shaderCallback: (bounds) =>
                                          LinearGradient(
                                        colors: [
                                          kPrimarySolidColor,
                                          kPrimarySolidColor2,
                                        ],
                                      ).createShader(
                                        Rect.fromLTWH(
                                          0,
                                          0,
                                          bounds.width,
                                          bounds.height,
                                        ),
                                      ),
                                      child: Text(
                                        "View All",
                                        style: defaultTextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    10.toHeight,
                    ListView.separated(
                      separatorBuilder: (context, index) => 20.toWidth,
                      itemCount: controller.newsAndUpdatesImages.length,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ),
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
