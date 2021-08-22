import 'package:get/get.dart';
import 'package:session_manage/screens/details/details_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailController());
  }
}
