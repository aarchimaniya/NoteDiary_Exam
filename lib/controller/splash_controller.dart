import 'package:get/get.dart';
import 'dart:async';
import '../view/screens/home_page/home_page.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Start a timer to transition after 3 seconds
    Timer(Duration(seconds: 3), () {
      // Navigate to HomePage and remove SplashScreen from backstack
      Get.off(() => HomePage());
    });
  }
}
