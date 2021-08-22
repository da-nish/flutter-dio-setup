import 'dart:async';
import 'package:get/get.dart';
import 'package:session_manage/data/services/user_services.dart';

class HomeController extends GetxController {
  late Timer refreshToken;
  @override
  void onInit() {
    super.onInit();
    print('app is initialized');
    refreshToken = Timer.periodic(
        Duration(seconds: 10), (Timer t) => print('app is running'));
    // refreshToken.cancel();
  }

  Future<void> login() async {
    final UserServices _client = Get.find<UserServices>();
    await _client.doLogin('eve.holt@reqres.in', 'cityslicka');
    // print('login resp: $res');
  }

  void onClose() {
    super.onClose();
    refreshToken.cancel();
  }
}
