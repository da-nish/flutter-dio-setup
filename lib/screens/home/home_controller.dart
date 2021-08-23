import 'dart:async';
import 'package:get/get.dart';
import 'package:session_manage/data/services/user_services.dart';

class HomeController extends GetxController {
  Future<void> login() async {
    final UserServices _client = Get.find<UserServices>();
    await _client.doLogin('uatdemo@mail.com', 'Aa@12345');
    // print('login resp: $res');
  }
}
