import 'package:get/get.dart';
import 'package:swd_mobile_app_test/main.dart';

class HomeController extends GetxController {
  static HomeController get instance {
    return Get.find<HomeController>();
  }

  var firstName = prefs.getString("firstName");
}
