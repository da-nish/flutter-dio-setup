import 'dart:async';

import 'package:get/get.dart';

class HomeController extends GetxController {
  var count = 0.obs;
  late Timer timer;
  @override
  void onInit() {
    super.onInit();
    print('app is initialized');
    timer = Timer.periodic(
        Duration(seconds: 10), (Timer t) => print('app is running'));
  }

  increment() {
    count++;
  }

  void onClose() {
    super.onClose();
    timer.cancel();
  }
}
