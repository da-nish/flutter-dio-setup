import 'package:get/get.dart';
import 'package:session_manage/data/services/user_services.dart';

class ProfileController extends GetxController {
  Future<void> callAPI() async {
    final UserServices _client = Get.find<UserServices>();
    await _client.callAPI();
  }
}
