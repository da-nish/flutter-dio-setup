import 'dart:async';

import 'package:get/get.dart';
import 'package:session_manage/data/services/user_services.dart';

class ProfileController extends GetxController {
  late Timer refreshTokenTimer;
  final UserServices _client = Get.find<UserServices>();
  @override
  void onInit() {
    super.onInit();

    // print('app is initialized');
    // refreshTokenTimer = Timer.periodic(
    //     Duration(seconds: 10), (Timer t) => print('app is running'));
    // refreshTokenTimer.cancel();
  }

  Future<void> callAPI() async {
    await _client.callAPI();
  }

  void onClose() {
    super.onClose();
    // refreshToken.cancel();
  }
}
