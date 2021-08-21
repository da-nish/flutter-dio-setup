import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:session_manage/services/api_service.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ApiService());
    Get.put(HomeController());
  }
}
