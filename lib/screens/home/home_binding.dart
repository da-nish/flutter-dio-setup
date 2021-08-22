import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  HomeBinding();

  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
