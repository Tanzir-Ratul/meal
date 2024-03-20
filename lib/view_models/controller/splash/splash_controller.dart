import 'dart:async';

import 'package:get/get.dart';

import '../../../res/routes/routes_name.dart';


class SplashController extends GetxController{

  navigateToBaseScreen() {
    Get.offAndToNamed(Routes.home);
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  startTime() async {
    var duration = const Duration(seconds: 1);
    return Timer(duration, navigateToBaseScreen);
  }





  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}